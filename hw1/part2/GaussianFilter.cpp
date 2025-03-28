#include <cmath>

#include "GaussianFilter.h"

GaussianFilter::GaussianFilter(sc_module_name n) : sc_module(n) {
  SC_THREAD(do_filter);
  sensitive << i_clk.pos();
  dont_initialize();
  reset_signal_is(i_rst, false);
}

// Gaussian mask
const int mask[MASK_X][MASK_Y] = {
     {1, 2, 1},
     {2, 4, 2},
     {1, 2, 1} 
};

void GaussianFilter::do_filter() {
  while (true) {
    val = 0;
    for (unsigned int v = 0; v < MASK_Y; ++v) {
      for (unsigned int u = 0; u < MASK_X; ++u) {
        if (verbal_gaussian) {std::cout << "[G]: Waiting   at " << sc_time_stamp() << std::endl;}
        if (i_intensity.num_available() == 0) wait(i_intensity.data_written_event());
        unsigned char grey = i_intensity.read();
        if (verbal_gaussian) {std::cout << "[G]: Reading " << (int)grey << " at " << sc_time_stamp() << std::endl;}
        val += grey * mask[u][v];
      }
    }
    int gaussian_result = (val + 8) / 16;
    
    o_gaussian_result.write(gaussian_result);
    if (verbal_gaussian) {
      std::cout << "[G]: Writing " << gaussian_result 
                << " at " << sc_time_stamp() << std::endl;
    }
  }
  wait(10);
}
