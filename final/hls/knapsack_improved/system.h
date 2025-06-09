#ifndef SYSTEM_H
#define SYSTEM_H

/* This file defines the module "system_top", which is the top-level
   module in the simulation. See the file main.cc, which shows how a
   SystemC simulation is created and run. */

/* Include some required files. */

#include <systemc.h>  /* SystemC definitions. */
#include <esc.h>      /* Cadence ESC functions and utilities. */
#include <stratus_hls.h>  /* Cadence Stratus definitions. */
#include <cynw_p2p.h> /* The cynw_p2p communication channel. */

/* Include the local header files that define the modules to be instantiated. */

#include "tb.h"       /* The testbench module. */
#include "dut_wrap.h" /* The DUT module. Need dut_wrap.h, not dut.h. */


SC_MODULE( system_top )
{
public:

    /* Instantiated sub-modules. We instantiate the dut_wrapper module,
       rather than the dut module directly. This is because the dut
       module can exist in multiple versions (such as behavioral and
       synthesized RTL), and the wrapper module automatically selects
       between the versions based on the simulation configuration. */

    dut_wrapper DUT {"DUT"};
    tb TB {"TB"};

    sc_clock clk_sig {"clk_sig", CLOCK_PERIOD, SC_NS, 0.5, 0, SC_NS, true};
    sc_signal < bool > rst_sig {"rst_sig"};

    cynw_p2p< input_t > chan1  {"chan1"}; /* TB to DUT, using struct input_t. */
    cynw_p2p< output_t > chan2  {"chan2"}; /* DUT to TB, using type output_t. */


    SC_CTOR( system_top )
/*        : clk_sig( "clk_sig", CLOCK_PERIOD, SC_NS )
        , rst_sig( "rst_sig" )
        , TB( "TB" )
        , chan1( "chan1" )
        , DUT( "DUT" )
        , chan2( "chan2" ) */
    {
        TB.clk( clk_sig );
        TB.rst_out( rst_sig );

        DUT.clk( clk_sig );
        DUT.rst( rst_sig );

        TB.dout( chan1 );

        DUT.din( chan1 );
        DUT.dout( chan2 );

        TB.din( chan2 );
    }

};

#endif /* SYSTEM_H */
