#ifndef LAPLACIAN_FILTER_H_
#define LAPLACIAN_FILTER_H_
#include <systemc>
using namespace sc_core;
using namespace sc_dt;

#ifndef NATIVE_SYSTEMC
#include <cynw_p2p.h>
#endif

#include "filter_def.h"

class LaplacianFilter : public sc_module {
public:
  sc_in_clk i_clk;
  sc_in<bool> i_rst;
#ifndef NATIVE_SYSTEMC
  cynw_p2p<int>::in i_gaussian_result;
  cynw_p2p<unsigned char>::out o_result;
#else
  sc_fifo_in<int> i_gaussian_result;
  sc_fifo_out<unsigned char> o_result;
#endif
  SC_HAS_PROCESS(LaplacianFilter);
  LaplacianFilter(sc_module_name n);
  ~LaplacianFilter() = default;

private:
  void do_filter();
  int val;
};
#endif

