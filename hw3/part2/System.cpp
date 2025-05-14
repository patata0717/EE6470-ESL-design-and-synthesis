#include "System.h"
System::System( sc_module_name n, string input_bmp, string output_bmp ): sc_module( n ), tb("tb"), gaussian_filter("gaussian_filter"), laplacian_filter("laplacian_filter"), clk("clk", CLOCK_PERIOD, SC_NS), rst("rst"), _output_bmp(output_bmp)
{
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

  tb.read_bmp(input_bmp);
}

System::~System() {
  tb.write_bmp(_output_bmp);
}
