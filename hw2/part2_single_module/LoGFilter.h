#ifndef LoG_FILTER_H_
#define LoG_FILTER_H_
#include <systemc>
using namespace sc_core;

#include "filter_def.h"

class LoGFilter : public sc_module {
public:
  sc_in_clk i_clk;
  sc_in<bool> i_rst;
  sc_fifo_in<unsigned char> i_intensity;
  sc_fifo_out<int> o_result;

  SC_HAS_PROCESS(LoGFilter);
  LoGFilter(sc_module_name n);
  ~LoGFilter() = default;

private:
  void do_filter_Gaussian();
  void do_filter_Laplacian();
  sc_fifo<int> gaussian_to_laplacian;
  int val_g = 0;
  int val_l = 0;
};

#endif