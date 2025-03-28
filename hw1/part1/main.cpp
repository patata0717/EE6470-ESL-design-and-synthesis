#include <iostream>
#include <string>
using namespace std;

// Wall Clock Time Measurement
#include <sys/time.h>

#include "GaussianFilter.h"
#include "LaplacianFilter.h"
#include "Testbench.h"

// TIMEVAL STRUCT IS Defined ctime
// use start_time and end_time variables to capture
// start of simulation and end of simulation
struct timeval start_time, end_time;

// int main(int argc, char *argv[])
int sc_main(int argc, char **argv) {
  if ((argc < 3) || (argc > 4)) {
    cout << "No arguments for the executable : " << argv[0] << endl;
    cout << "Usage : >" << argv[0] << " in_image_file_name out_image_file_name"
         << endl;
    return 0;
  }

  //Create modules and signals
  Testbench tb("tb");
  GaussianFilter gaussian_filter("gaussian_filter");
  LaplacianFilter laplacian_filter("laplacian_filter");
  sc_clock clk("clk", CLOCK_PERIOD, SC_NS);
  sc_signal<bool> rst("rst");

  //Create FIFO channels
  sc_fifo<unsigned char> intensity;
  sc_fifo<int> gaussian_result;
  sc_fifo<int> result;

  //Connect FIFO channels with modules
  tb.i_clk(clk);
  tb.o_rst(rst);
  gaussian_filter.i_clk(clk);
  gaussian_filter.i_rst(rst);
  laplacian_filter.i_clk(clk);
  laplacian_filter.i_rst(rst);
  tb.o_intensity(intensity);
  tb.i_result(result);
  gaussian_filter.i_intensity(intensity);
  gaussian_filter.o_gaussian_result(gaussian_result);
  laplacian_filter.i_gaussian_result(gaussian_result);
  laplacian_filter.o_result(result);

  tb.read_bmp(argv[1]);
  sc_start();
  std::cout << "Simulated time == " << sc_core::sc_time_stamp() << std::endl;
  tb.write_bmp(argv[2]);

  return 0;
}
