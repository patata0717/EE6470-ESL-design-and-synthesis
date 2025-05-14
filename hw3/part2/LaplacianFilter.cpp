// HW3
#include <cmath>
#ifndef NATIVE_SYSTEMC
#include "stratus_hls.h"
#endif

#include "LaplacianFilter.h"

LaplacianFilter::LaplacianFilter(sc_module_name n) : sc_module(n) {
#ifndef NATIVE_SYSTEMC
	HLS_FLATTEN_ARRAY(val);
#endif
  SC_THREAD(do_filter);
  sensitive << i_clk.pos();
  dont_initialize();
  reset_signal_is(i_rst, false);

#ifndef NATIVE_SYSTEMC
  i_gaussian_result.clk_rst(i_clk, i_rst);
  o_result.clk_rst(i_clk, i_rst);
#endif
}

// Laplacian mask
const int mask[MASK_X][MASK_Y] = {
     {0, -1, 0},
     {-1, 5, -1},
     {0, -1, 0} 
};

// 2 by 3 buffer
sc_uint<8> buffer[MASK_X - 1][MASK_Y];

void LaplacianFilter::do_filter() {
  {
#ifndef NATIVE_SYSTEMC
	HLS_DEFINE_PROTOCOL("main_reset");
	i_gaussian_result.reset();
	o_result.reset();
#endif
  wait();
  }
  int buffer[MASK_X][MASK_Y];
#ifndef NATIVE_SYSTEMC
  HLS_FLATTEN_ARRAY(buffer);
#endif
  bool write_flag;
  unsigned char result;
  int count = 0;
  int count_x = 0;
  int count_y = 0;
  int temp;
  sc_uint<12> gaussian;

  // (6+3*256)*256
  while (true) {
    // wait fot data
    if (verbal_laplacian) {std::cout << "[L]: Waiting   at " << sc_time_stamp() << std::endl;}
#ifndef NATIVE_SYSTEMC
{
    HLS_DEFINE_PROTOCOL("input");
    gaussian = i_gaussian_result.get();
    if (verbal_laplacian) {std::cout << "[L]: Reading " << gaussian << " at " << sc_time_stamp() << " count = " << count << " count_x = " << count_x << std::endl;}
}
#else
    gaussian = i_gaussian_result.read(); // Store the value
    if (verbal_laplacian) {std::cout << "[L]: Reading " << gaussian << " at " << sc_time_stamp() << " count = " << count << " count_x = " << count_x << std::endl;}
#endif
    // process data
    if (count_x == 0) {
      switch (count) {
        case 0:
          HLS_CONSTRAIN_LATENCY(0, 1, "lat01");
          val += gaussian * mask[1][0];
          buffer[0][0] = gaussian;
          write_flag = false;
          break;
        case 1:
          HLS_CONSTRAIN_LATENCY(0, 1, "lat01");
          val += gaussian * mask[1][1];
          buffer[0][1] = gaussian;
          write_flag = false;
          break;
        case 2:
          HLS_CONSTRAIN_LATENCY(0, 1, "lat01");
          val += gaussian * mask[1][2];
          buffer[0][2] = gaussian;
          write_flag = false;
          break;
        case 3:
          HLS_CONSTRAIN_LATENCY(0, 1, "lat01");
          val += gaussian * mask[2][0];
          buffer[1][0] = gaussian;
          write_flag = false;
          break;
        case 4:
          HLS_CONSTRAIN_LATENCY(0, 1, "lat01");
          val += gaussian * mask[2][1];
          buffer[1][1] = gaussian;
          write_flag = false;
          break;
        case 5:
          HLS_CONSTRAIN_LATENCY(0, 1, "lat01");
          val += gaussian * mask[2][2];
          buffer[1][2] = gaussian;
          write_flag = true;
          break;
        default:
          break;
      }
    } else { // count_x 0 to 255
      switch (count) {
        case 0:
          HLS_CONSTRAIN_LATENCY(0, 1, "lat01");
          val += buffer[0][0] * mask[0][0];
          val += buffer[0][1] * mask[0][1];
          val += buffer[0][2] * mask[0][2];
          val += buffer[1][0] * mask[1][0];
          val += buffer[1][1] * mask[1][1];
          val += buffer[1][2] * mask[1][2];
          val += gaussian * mask[2][0];
          buffer[0][0] = gaussian;
          write_flag = false;
          break;
        case 1:
          HLS_CONSTRAIN_LATENCY(0, 1, "lat01");
          val += gaussian * mask[2][1];
          buffer[0][1] = gaussian;
          write_flag = false;
          break;
        case 2:
          HLS_CONSTRAIN_LATENCY(0, 1, "lat01");
          val += gaussian * mask[2][2];
          buffer[0][2] = gaussian;
          write_flag = true;
          break;
        default:
          break;
      }
    }


    if (val > 255) {
      result = 255;
    } else if (val < 0) {
      result = 0;
    } else {
      result = val;
    }
    if (write_flag == true) {
      HLS_CONSTRAIN_LATENCY(0, 1, "lat01");
#ifndef NATIVE_SYSTEMC
{
      HLS_DEFINE_PROTOCOL("output");
      o_result.put(result);
      // wait();
}
#else
      o_result.write(result);
#endif
      if (verbal_laplacian) {
        std::cout << "[L]: Writing " << result 
                  << " at " << sc_time_stamp() << std::endl;
      }
      HLS_CONSTRAIN_LATENCY(0, 1, "lat00");
      val = 0;
    }

    // deternmine next state
    // next y
    if (count == 2 && count_x == width - 1) {
      count_y++;
      count_x = 0;
      count = 0;
      // reset buffer
      buffer[0][0] = 0; buffer[1][0] = 0;
      buffer[0][1] = 0; buffer[1][1] = 0;
      buffer[0][2] = 0; buffer[1][2] = 0;
    // next x when x is 1 to 254
    } else if (count_x != width - 1 && count_x != 0 && count == 2) {
      count_x++;
      count = 0;
      for (int i = 0; i <= 2; i++) {
        temp = buffer[0][i];
        buffer[0][i] = buffer[1][i];
        buffer[1][i] = temp;
      }
    // next x when x is 0 
    } else if (count_x == 0 && count == 5) {
      count_x++;
      count = 0;
    // next count
    } else {
      count++;
    }
  }
}
