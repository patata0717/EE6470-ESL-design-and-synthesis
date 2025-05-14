#ifndef GAUSSIAN_FILTER_H_
#define GAUSSIAN_FILTER_H_
#include <systemc>
using namespace sc_core;
using namespace sc_dt;

#ifndef NATIVE_SYSTEMC
#include <cynw_p2p.h>
#endif

#include "filter_def.h"

class GaussianFilter : public sc_module {
public:
  sc_in_clk i_clk;
  sc_in<bool> i_rst;
#ifndef NATIVE_SYSTEMC
  cynw_p2p<unsigned char>::in i_intensity;
  cynw_p2p<int>::out o_gaussian_result;
#else
  sc_fifo_in<unsigned char> i_intensity;
  sc_fifo_out<int> o_gaussian_result;
#endif
  SC_HAS_PROCESS(GaussianFilter);
  GaussianFilter(sc_module_name n);
  ~GaussianFilter() = default;

private:
  void do_filter();
  sc_uint<20> val;
};
#endif
