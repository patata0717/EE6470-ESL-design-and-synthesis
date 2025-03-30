#include <cmath>

#include "LaplacianFilter.h"

LaplacianFilter::LaplacianFilter(sc_module_name n) : sc_module(n) {
  SC_THREAD(do_filter);
  sensitive << i_clk.pos();
  dont_initialize();
  reset_signal_is(i_rst, false);
}

// Laplacian mask
const int mask[MASK_X][MASK_Y] = {
     {0, -1, 0},
     {-1, 5, -1},
     {0, -1, 0} 
};

void LaplacianFilter::do_filter() {
  while (true) {
    val = 0;
    for (unsigned int v = 0; v < MASK_Y; ++v) {
      for (unsigned int u = 0; u < MASK_X; ++u) {

        unsigned char gaussian;

        if (verbal_laplacian) {std::cout << "[L]: Waiting   at " << sc_time_stamp() << std::endl;}
        if (i_gaussian_result.num_available() == 0) wait(i_gaussian_result.data_written_event());

        gaussian = i_gaussian_result.read(); // Store the value
        if (verbal_laplacian) {std::cout << "[L]: Reading " << (int)gaussian << " at " << sc_time_stamp() << std::endl;}
        val += gaussian * mask[u][v];
      }
    }
    int result = val;
    
    if (verbal_laplacian) {
      std::cout << "[L]: Writing " << result 
                << " at " << sc_time_stamp() << std::endl;
    }
    o_result.write(result);
  }
  wait(10);
}
