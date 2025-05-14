#ifndef SYSTEM_H_
#define SYSTEM_H_
#include <systemc>
using namespace sc_core;

#include "Testbench.h"
#ifndef NATIVE_SYSTEMC
#include "GaussianFilter_wrap.h"
#include "LaplacianFilter_wrap.h"
#else
#include "GaussianFilter.h"
#include "LaplacianFilter.h"
#endif

class System: public sc_module
{
public:
	SC_HAS_PROCESS( System );
	System( sc_module_name n, std::string input_bmp, std::string output_bmp );
	~System();
private:
  Testbench tb;
#ifndef NATIVE_SYSTEMC
	GaussianFilter_wrapper gaussian_filter;
	LaplacianFilter_wrapper laplacian_filter;
#else
	GaussianFilter gaussian_filter;
	LaplacianFilter laplacian_filter;
#endif
	sc_clock clk;
	sc_signal<bool> rst;
#ifndef NATIVE_SYSTEMC
	cynw_p2p<unsigned char> intensity;
	cynw_p2p<unsigned char> result;
#else
    sc_fifo_out<unsigned char> intensity;
    sc_fifo_in<unsigned char> result;
#endif

#ifndef NATIVE_SYSTEMC
  cynw_p2p<int> gaussian_result;
#else
  sc_fifo<int> gaussian_result;
#endif

	std::string _output_bmp;
};
#endif
