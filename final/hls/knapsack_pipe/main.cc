#include <systemc.h>            	// SystemC definitions
#include "system.h"             	// Top-level System module header file

static system_top * m_system = NULL;	// The pointer that holds the top-level system module instance.

void esc_elaborate()			// This function is required by Stratus to support
{					// SystemC-Verilog co-simulation. This is where an instance of the
    m_system = new system_top( "m_system" );	// top-level module should be created.
}

void esc_cleanup()			// This function is called at the end of simulation by the
{					// Stratus co-simulation hub. It should delete the top-level
    delete m_system;			// module instance.
}

int sc_main( int argc, char ** argv )	// This function is called by the SystemC kernel for pure SystemC simulations
{
    esc_initialize( argc, argv );	// esc_initialize() passes in the cmd-line args. This initializes the Stratus simulation 
					// environment (such as opening report files for later logging and analysis).

    esc_elaborate();			// esc_elaborate() (defined above) creates the top-level module instance. In a SystemC-Verilog 
					// co-simulation, this is called during cosim initialization rather than from sc_main.

    sc_start();				// Starts the simulation. Returns when a module calls esc_stop(), which finishes the simulation. 
    					// esc_cleanup() (defined above) is automatically called before sc_start() returns.

    return 0;				// Returns the status of the simulation. Required by most C compilers.
}
