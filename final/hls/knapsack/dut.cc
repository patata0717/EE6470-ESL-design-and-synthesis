#include "dut.h"

//-----------------------------------------------------------------------------
// 1) Hardware-friendly unsigned divide: 16-bit dividend ÷ 8-bit divisor.
//    Restoring-division, fixed 16 iterations, returns floor(dividend/divisor).
//-----------------------------------------------------------------------------
static sc_uint<16> div_u16_u8(sc_uint<16> dividend, sc_uint<8> divisor) {
    sc_uint<16> quotient  = 0;
    sc_uint<16> remainder = 0;

div_loop:
    for (int bit = 15; bit >= 0; --bit) {
#if defined(PIPE_OPTION)
    HLS_PIPELINE_LOOP(PIPE_OPTION, II, "div loop");
#endif
        // Shift remainder left by 1, bring in next dividend bit
        remainder = (remainder << 1) | ((dividend >> bit) & 1);
        // Compare and subtract if possible
        if (remainder >= divisor) {
            remainder = remainder - divisor;
            quotient |= (sc_uint<16>(1) << bit);
        }
    }
    return quotient;
}

//-----------------------------------------------------------------------------
// 2) bounds_kernel using the above hardware divider for the “fractional” step.
//      • items_V[i] = value[i]
//      • items_W[i] = weight[i]
//      • currV      = sum of already-taken values
//      • currW      = sum of already-taken weights
//      • depth      = index of first “undecided” item
//      • UB, LB     = outputs (16-bit accumulators)
//-----------------------------------------------------------------------------
void bounds_kernel(
    const sc_uint<8>  items_V[MAX_ITEMS],
    const sc_uint<8>  items_W[MAX_ITEMS],
    const sc_uint<16> currV,
    const sc_uint<16> currW,
    const sc_uint<8>  depth,
    const sc_uint<16> num_items,   
    const sc_uint<16> weight_limit,
          sc_uint<16> &UB,
          sc_uint<16> &LB
) {
    // Local accumulators
    sc_uint<16> v_ub   = currV;
    sc_uint<16> v_lb   = currV;
    sc_uint<16>  w_used = currW;

    // 1) If already over capacity, prune to zero
    if (w_used > weight_limit) {
        UB = 0;
        LB = 0;
        return;
    }

    // Remaining capacity
    sc_uint<16> rem = (sc_uint<16>)(weight_limit - w_used);
    sc_uint<8> i = depth;
pack_loop:
    for (; i < (sc_uint<8>)num_items; ++i) {
#if defined(PIPE_OPTION)
    HLS_PIPELINE_LOOP(PIPE_OPTION, II, "pack loop");
#endif
        sc_uint<8> w_i = items_W[i];
        if (w_i > rem) {
            break;
        }
        rem    = rem - w_i;
        v_ub   = v_ub + items_V[i];
        v_lb   = v_lb + items_V[i];
    }

    // 3) Fractional “ratio‐cut” for UB if i < num_items
    if ((i < (sc_uint<8>)num_items) && (rem != 0)) {
        sc_uint<8>  w_i   = items_W[i];
        sc_uint<8>  v_i   = items_V[i];
        sc_uint<16> prod  = (sc_uint<16>)rem * (sc_uint<16>)v_i;
        sc_uint<16> frac  = div_u16_u8(prod, w_i);
        v_ub = v_ub + frac;
    }

    // 4) Done
    UB = v_ub;
    LB = v_lb;
}

void dut::thread1()
{
    input_t tmp;

    {
        HLS_DEFINE_PROTOCOL( "reset" );
        din.reset();
        dout.reset();
        wait();
    }

    // 1) Read header
    tmp = din.get(); 
    wait();
    sc_uint<8>  num_items    = tmp.range(39, 32);
    sc_uint<16> weight_limit = tmp.range(31, 16);

    // 2) Read exactly “num_items” (weight,value) pairs into the arrays
    sc_uint<8> items_V[MAX_ITEMS];
    sc_uint<8> items_W[MAX_ITEMS];
read_loop:
    for ( int i = 0; i < (int)num_items; ++i ) {
#if defined(PIPE_OPTION)
    HLS_PIPELINE_LOOP(PIPE_OPTION, II, "read loop");
#endif
{
        HLS_DEFINE_PROTOCOL( "read_item" );
        tmp = din.get();                    // get the next value
        items_V[i] = tmp.range( 47, 40 ); // get the value
        items_W[i] = tmp.range( 55, 48 ); // get the weight
        wait();
}
    }

    // 3) Now service branch-and-bound node requests forever
while_1:
    while (true) {
#if defined(PIPE_OPTION)
    HLS_PIPELINE_LOOP(PIPE_OPTION, II, "while_1");
#endif
        sc_uint<16> currV;
        sc_uint<16> currW;
        sc_uint<8>  depth;
{
        HLS_DEFINE_PROTOCOL( "main read" );
        tmp = din.get(); 
        currV = tmp.range(15, 0);
        currW = tmp.range(31, 16);
        depth = tmp.range(39, 32);
        wait();
}

        sc_uint<16> UB_val, LB_val;
        bounds_kernel(items_V, items_W,
                      currV, currW, depth,
                      (sc_uint<16>)num_items,
                      (sc_uint<16>)weight_limit,
                      UB_val, LB_val);
{
        HLS_DEFINE_PROTOCOL("main write");
        output_t out_val = 0;
        out_val.range(31, 16) = LB_val;
        out_val.range(15,  0) = UB_val;
        dout.put(out_val);
        wait();
}
    }
}
