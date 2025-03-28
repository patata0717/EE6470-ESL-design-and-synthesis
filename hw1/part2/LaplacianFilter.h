#ifndef LAPLACIAN_FILTER_H_
#define LAPLACIAN_FILTER_H_
#include <systemc>
using namespace sc_core;

#include "filter_def.h"

class LaplacianFilter : public sc_module {
public:
  sc_in_clk i_clk;
  sc_in<bool> i_rst;
  sc_fifo_in<int> i_gaussian_result;
  sc_fifo_out<int> o_result;

  SC_HAS_PROCESS(LaplacianFilter);
  LaplacianFilter(sc_module_name n);
  ~LaplacianFilter() = default;

private:
  void do_filter();
  int val;
};
#endif

