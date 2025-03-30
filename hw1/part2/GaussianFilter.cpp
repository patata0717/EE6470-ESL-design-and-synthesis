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


// count: 20 + 9 + 9 + ... +
void GaussianFilter::do_filter() {
  int buffer[MASK_X][MASK_Y];
  bool write_flag;
  int gaussian_result;
  int count = 0;
  int count_x = -1; // start from -1 because needs 1 stage to prepare
  int count_y = 0;
  int temp;

  // (15+9*256)*256
  while (true) {
    // wait fot data
    if (verbal_gaussian) {std::cout << "[G]: Waiting   at " << sc_time_stamp() << std::endl;}
    if (i_intensity.num_available() == 0) wait(i_intensity.data_written_event());
    unsigned char grey = i_intensity.read();
    if (verbal_gaussian) {std::cout << "[G]: Reading " << (int)grey << " at " << sc_time_stamp() << std::endl;}

    // process data
    if (count_x == -1) {
      switch (count) {
        case 0:
          if (count_y != 0) val += grey * mask[0][0];
          write_flag = false;
          break;
        case 1:
          if (count_y != 0) val += grey * mask[1][0];
          write_flag = false;
          break;
        case 2:
          if (count_y != 0) val += grey * mask[2][0];
          write_flag = false;
          break;
        case 3:
          if (count_y != 0) val += grey * mask[0][1];
          buffer[0][0] = grey;
          write_flag = false;
          break;
        case 4:
          if (count_y != 0) val += grey * mask[1][1];
          buffer[1][0] = grey;
          write_flag = false;
          break;
        case 5:
          if (count_y != 0) val += grey * mask[2][1];
          buffer[2][0] = grey;
          write_flag = false;
          break;
        case 6:
          if (count_y != 0) val += grey * mask[0][2];
          buffer[0][1] = grey;
          write_flag = false;
          break;
        case 7:
          if (count_y != 0) val += grey * mask[1][2];
          buffer[1][1] = grey;
          write_flag = false;
          break;
        case 8:
          if (count_y != 0) val += grey * mask[2][2];
          buffer[2][1] = grey;
          write_flag = true;
          break;
        case 9:
          val += buffer[0][0] * mask[0][0];
          val += buffer[1][0] * mask[1][0];
          val += buffer[2][0] * mask[2][0];
          val += buffer[0][1] * mask[0][1];
          val += buffer[1][1] * mask[1][1];
          val += buffer[2][1] * mask[2][1];
          val += grey * mask[0][2];
          buffer[0][2] = grey;
          write_flag = false;
          break;
        case 10:
          val += grey * mask[1][2];
          buffer[1][2] = grey;
          write_flag = false;
          break;
        case 11:
          val += grey * mask[2][2];
          buffer[2][2] = grey;
          write_flag = true;
          break;
        case 12:
          if (count_y != height - 1) {
            val += buffer[0][1] * mask[0][0];
            val += buffer[1][1] * mask[1][0];
            val += buffer[2][1] * mask[2][0];
            val += buffer[0][2] * mask[0][1];
            val += buffer[1][2] * mask[1][1];
            val += buffer[2][2] * mask[2][1];
            val += grey * mask[0][2];
          }
          write_flag = false;
          break;
        case 13:
          if (count_y != height - 1) val += grey * mask[1][2];
          write_flag = false;
          break;
        case 14:
          if (count_y != height - 1) val += grey * mask[2][2];
          write_flag = true;
          break;
        default:
          break;
      }
    } else if (count_x == width - 1) { // count_x 0 to 255
      switch (count) {
        case 0:
          write_flag = false;
          break;
        case 1:
          write_flag = false;
          break;
        case 2: 
          write_flag = false;
          break;
        case 3:
          write_flag = false;
          break;
        case 4:
          write_flag = true;
          break;
        case 5: 
          write_flag = true;
          break;
        case 6:
          write_flag = false;
          break;
        case 7:
          write_flag = false;
          break;
        case 8: 
          write_flag = true;
          break;
      }
    } else {
      switch (count) {
        case 0:
          if (count_y != 0) {
            val += buffer[1][0] * mask[0][1];
            val += buffer[2][0] * mask[1][1];
            val += buffer[1][1] * mask[0][2];
            val += buffer[2][1] * mask[1][2];
            val += grey * mask[0][0];
          }
          write_flag = false;
          break;
        case 1:
          if (count_y != 0) val += grey * mask[1][0];
          write_flag = false;
          break;
        case 2:
          if (count_y != 0) val += grey * mask[2][0];
          write_flag = false;
          break;
        case 3:
          if (count_y != 0) val += grey * mask[2][1];
          buffer[0][0] = grey;
          write_flag = false;
          break;
        case 4:
          if (count_y != 0) val += grey * mask[2][2];
          buffer[0][1] = grey;
          write_flag = true;
          break;
        case 5:
            val += buffer[1][0] * mask[0][0];
            val += buffer[1][1] * mask[0][1];
            val += buffer[1][2] * mask[0][2];
            val += buffer[2][0] * mask[1][0];
            val += buffer[2][1] * mask[1][1];
            val += buffer[2][2] * mask[1][2];
            val += buffer[0][0] * mask[2][0];
            val += buffer[0][1] * mask[2][1];
            val += grey * mask[2][2];
          buffer[0][2] = grey;
          write_flag = true;
          break;
        case 6:
          if (count_y != height - 1) {
            val += buffer[1][1] * mask[0][0];
            val += buffer[1][2] * mask[0][1];
            val += buffer[2][1] * mask[1][0];
            val += buffer[2][2] * mask[1][1];
            val += buffer[0][1] * mask[2][0];
            val += buffer[0][2] * mask[2][1];
            val += grey * mask[0][2];
          }
          write_flag = false;
          break;
        case 7:
          if (count_y != height - 1) val += grey * mask[1][2];
          write_flag = false;
          break;
        case 8:
          if (count_y != height - 1) val += grey * mask[2][2];
          write_flag = true;
          break;
        default:
          break;
      }
    }

    // write data
//     std::cout << "val" << val << std::endl;
//     std::cout << "buffer[0][0] = " << buffer[0][0] << " buffer[1][0] = " << buffer[1][0] << " buffer[2][0] = " << buffer[2][0] << std::endl;
//     std::cout << "buffer[0][1] = " << buffer[0][1] << " buffer[1][1] = " << buffer[1][1] << " buffer[2][1] = " << buffer[2][1] << std::endl;
//     std::cout << "buffer[0][2] = " << buffer[0][2] << " buffer[1][2] = " << buffer[1][2] << " buffer[2][2] = " << buffer[2][2] << std::endl;
    if (write_flag == true) {
      gaussian_result = (val + 8) / 16;
      o_gaussian_result.write(gaussian_result);
      if (verbal_gaussian) {
        std::cout << "[G]: Writing " << gaussian_result 
                  << " at " << sc_time_stamp() << " count = " << count << " count_x = " << count_x << std::endl;
      }
      val = 0;
    }

    // deternmine next state
    // next y
    if (count == 8 && count_x == width - 1) {
      count_y++;
      count_x = -1;
      count = 0;
      // reset buffer
      buffer[0][0] = 0; buffer[0][1] = 0; buffer[0][2] = 0;
      buffer[1][0] = 0; buffer[1][1] = 0; buffer[1][2] = 0;
      buffer[2][0] = 0; buffer[2][1] = 0; buffer[2][2] = 0;
    // next x when x is 0 to 254
    } else if (count_x != width - 1 && count_x != -1 && count == 8) {
      count_x++;
      count = 0;
      // Shift buffer
      for (int i = 0; i <= 2; i++) {
        temp = buffer[0][i];
        buffer[0][i] = buffer[1][i];
        buffer[1][i] = buffer[2][i];
        buffer[2][i] = temp;
      }
    // next x when x is 0 
    } else if (count_x == -1 && count == 14) {
      count_x++;
      count = 0;
    // next count
    } else {
      count++;
    }
  }
  wait(10);
}
