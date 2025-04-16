#include "LoGFilter.h"

LoGFilter::LoGFilter(sc_module_name n) : sc_module(n) {
  SC_THREAD(do_filter_Gaussian);
  sensitive << i_clk.pos();
  dont_initialize();
  reset_signal_is(i_rst, false);

  SC_THREAD(do_filter_Laplacian);
  sensitive << i_clk.pos();
  dont_initialize();
  reset_signal_is(i_rst, false);
}
