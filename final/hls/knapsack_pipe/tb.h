#ifndef _TB_H_
#define _TB_H_

#include <cynw_p2p.h> // This also includes systemc.h etc
#include "defines.h"  // The type definitions for the input and output

SC_MODULE( tb )
{
public:
    // Declare clock and reset ports
    sc_in_clk clk {"clk"};
    sc_out < bool > rst_out  {"rst_out"};    // The source thread drives rst_out.
    sc_in < bool > rst_in  {"rst_in"};      // For sink thread. Connected to rst_out.

    // Declare modular interface ports
    cynw_p2p < input_t >::out dout {"dout"}; // data going in to the design
    cynw_p2p < output_t >::in din  {"din"};  // data going out of the design

    SC_CTOR( tb )
/*        : clk( "clk" )
        , rst_out( "rst_out" )
        , rst_in( "rst_in" )
        , din( "din" )
        , dout( "dout" )*/
    {
        // Declare the source thread. Since it drives the reset signal,
        // no reset_signal_is() is needed for the source thread
        SC_CTHREAD( source, clk.pos() );

        // Connect the rst_in port to the rst_out port
        rst_in( rst_out );

        // connect clk/rst to cynw_p2p ports
        din.clk_rst(clk, rst_in);
        dout.clk_rst(clk, rst_in);
    }
private:
    void source();

    ifstream stim_file;         // File stream for reading the stimulus
    ofstream resp_file;         // File stream for writing the responses

    // Utility functions for managing the stimulus file
    void open_stimulus_file( const char * _name = NULL );
    input_t read_stimulus_value();
    input_t read_stimulus_value_header();
    void close_stimulus_file();

    // Utility to convert a time in simulation time units to clock cycles
    int clock_cycle( sc_time time );
};

#endif // _TB_H_
