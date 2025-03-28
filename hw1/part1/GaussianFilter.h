#ifndef GAUSSIAN_FILTER_H_
#define GAUSSIAN_FILTER_H_
#include <systemc>
using namespace sc_core;

#include "filter_def.h"

class GaussianFilter : public sc_module {
public:
  sc_in_clk i_clk;
  sc_in<bool> i_rst;
  sc_fifo_in<unsigned char> i_intensity;
  sc_fifo_out<int> o_gaussian_result;

  SC_HAS_PROCESS(GaussianFilter);
  GaussianFilter(sc_module_name n);
  ~GaussianFilter() = default;

private:
  void do_filter();
  int val;
};
#endif
