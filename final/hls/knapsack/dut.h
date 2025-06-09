#ifndef _DUT_H_
#define _DUT_H_

#include <cynw_p2p.h>
#include "defines.h"

SC_MODULE( dut )
{
    // Declare the clock and reset ports
    sc_in_clk clk  {"clk"};
    sc_in < bool > rst  {"rst"};

    // Declare the input port and the output port.
    // The template specializations <input_t or output_t> configure the
    // modular interfaces to carry the desired datatypes.
    cynw_p2p < input_t >::in din  {"din"}; // The input port
    cynw_p2p < output_t >::out dout  {"dout"}; // The output port

    SC_CTOR( dut )
/*        : clk( "clk" )
        , rst( "rst" )
        , din( "din" )
        , dout( "dout" ) */
    {
        SC_CTHREAD( thread1, clk.pos() );
        reset_signal_is( rst, 0 );

        // Connect the clk and rst signals to the modular interface ports
        din.clk_rst( clk, rst );
        dout.clk_rst( clk, rst );
    }
    void thread1(); // the thread function
};

#endif // _DUT_H_
