// dut.cc — bounds-kernel fully inlined and loop-unrolled so that the
// outer while_1 can stay pipelined with II = 1.
// Build with:  -DPIPE_OPTION=SOFT_STALL  -DII=1
// No nested loops remain under while_1 ⇒ Stratus will not raise ERROR 01160.

#include "dut.h"

// 1) Pure-combinational 16-bit ÷ 8-bit unsigned divide (restoring)
//    fully unrolled → single timing stage.
static inline sc_uint<16> div_u16_u8(sc_uint<16> dividend,
                                     sc_uint<8>  divisor)
{
    sc_uint<16> q = 0;
    sc_uint<16> r = 0;

#pragma HLS UNROLL
    for (int bit = 15; bit >= 0; --bit) {
        r = (r << 1) | ((dividend >> bit) & 1);
        if (r >= divisor) {
            r -= divisor;
            q |= sc_uint<16>(1) << bit;
        }
    }
    return q;
}

// 2) Top-level thread
void dut::thread1()
{
    input_t tmp;

    // reset
    {
        HLS_DEFINE_PROTOCOL("reset");
        din.reset();
        dout.reset();
        wait();
    }

    // read header
    tmp = din.get();
    wait();
    const sc_uint<8>  num_items    = tmp.range(39, 32);
    const sc_uint<16> weight_limit = tmp.range(31, 16);

    // read table
    sc_uint<8> items_V[MAX_ITEMS];
    sc_uint<8> items_W[MAX_ITEMS];
read_table:
    for (int i = 0; i < num_items; ++i) {
        HLS_DEFINE_PROTOCOL("read_item");
        tmp        = din.get();
        items_V[i] = tmp.range(15, 8);
        items_W[i] = tmp.range(7, 0);
        wait();
    }

while_1:
    while (true) {
#if defined(PIPE_OPTION)
    HLS_PIPELINE_LOOP(PIPE_OPTION, II, "while_1"); // II = 1, no nested loops
#endif
        // handshake IN
        sc_uint<16> currV, currW;
        sc_uint<8>  depth;
        {
            HLS_DEFINE_PROTOCOL("read_req");
            tmp   = din.get();
            currV = tmp.range(15, 0);
            currW = tmp.range(31, 16);
            depth = tmp.range(39, 32);
            wait();
        }

        // inlined unrolled bounds-kernel
        sc_uint<16> v_ub = currV;
        sc_uint<16> v_lb = currV;

        if (currW <= weight_limit) {
            sc_uint<16> rem        = weight_limit - currW;
            sc_uint<8>  next_v     = 0;
            sc_uint<8>  next_w     = 1; // guard against div0
            bool        found_next = false;

        unrolled_pack:
#pragma HLS UNROLL
            for (int idx = 0; idx < MAX_ITEMS; ++idx) {
                bool in_range = (idx >= depth) && (idx < num_items);
                sc_uint<8> w_i = items_W[idx];
                sc_uint<8> v_i = items_V[idx];

                bool fits = in_range && (w_i <= rem);

                if (fits) {
                    v_lb += v_i;
                    v_ub += v_i;
                    rem   -= w_i;
                }

                // remember very first item that does *not* fit
                if (in_range && !fits && !found_next) {
                    next_v     = v_i;
                    next_w     = w_i;
                    found_next = true;
                }
            }
            // fractional value for UB (ratio cut)
            if (found_next && (rem != 0)) {
                v_ub += div_u16_u8(rem * next_v, next_w);
            }
        } else {
            v_ub = 0;
            v_lb = 0;
        }

        // handshake OUT
        {
            HLS_DEFINE_PROTOCOL("write_resp");
            output_t out_val = 0;
            out_val.range(31,16) = v_lb;
            out_val.range(15, 0)  = v_ub;
            dout.put(out_val);
            wait();
        }
    }
}
