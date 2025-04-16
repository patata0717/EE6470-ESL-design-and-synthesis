#include <cmath>
#include "LoGFilter.h"

// Laplacian mask
const int Laplacian_mask[MASK_X][MASK_Y] = {
     {0, -1, 0},
     {-1, 5, -1},
     {0, -1, 0} 
};

// 2 by 3 buffer
int buffer[MASK_X - 1][MASK_Y];

void LoGFilter::do_filter_Laplacian() {
  int buffer[MASK_X][MASK_Y];
  bool write_flag;
  int result;
  int count = 0;
  int count_x = 0;
  int count_y = 0;
  int temp;

  // (6+3*256)*256
  while (true) {
    // wait fot data
    unsigned char gaussian;
    if (verbal_laplacian) {std::cout << "[L]: Waiting   at " << sc_time_stamp() << std::endl;}
    if (gaussian_to_laplacian.num_available() == 0) wait(gaussian_to_laplacian.data_written_event());
    gaussian = gaussian_to_laplacian.read(); 
    if (verbal_laplacian) {std::cout << "[L]: Reading " << (int)gaussian << " at " << sc_time_stamp() << " count = " << count << " count_x = " << count_x << std::endl;}

    // process data
    if (count_x == 0) {
      switch (count) {
        case 0:
          val_l += gaussian * Laplacian_mask[1][0];
          buffer[0][0] = gaussian;
          write_flag = false;
          break;
        case 1:
          val_l += gaussian * Laplacian_mask[1][1];
          buffer[0][1] = gaussian;
          write_flag = false;
          break;
        case 2:
          val_l += gaussian * Laplacian_mask[1][2];
          buffer[0][2] = gaussian;
          write_flag = false;
          break;
        case 3:
          val_l += gaussian * Laplacian_mask[2][0];
          buffer[1][0] = gaussian;
          write_flag = false;
          break;
        case 4:
          val_l += gaussian * Laplacian_mask[2][1];
          buffer[1][1] = gaussian;
          write_flag = false;
          break;
        case 5:
          val_l += gaussian * Laplacian_mask[2][2];
          buffer[1][2] = gaussian;
          write_flag = true;
          break;
        default:
          break;
      }
    } else { // count_x 0 to 255
      switch (count) {
        case 0:
          val_l += buffer[0][0] * Laplacian_mask[0][0];
          val_l += buffer[0][1] * Laplacian_mask[0][1];
          val_l += buffer[0][2] * Laplacian_mask[0][2];
          val_l += buffer[1][0] * Laplacian_mask[1][0];
          val_l += buffer[1][1] * Laplacian_mask[1][1];
          val_l += buffer[1][2] * Laplacian_mask[1][2];
          val_l += gaussian * Laplacian_mask[2][0];
          buffer[0][0] = gaussian;
          write_flag = false;
          break;
        case 1:
          val_l += gaussian * Laplacian_mask[2][1];
          buffer[0][1] = gaussian;
          write_flag = false;
          break;
        case 2:
          val_l += gaussian * Laplacian_mask[2][2];
          buffer[0][2] = gaussian;
          write_flag = true;
          break;
        default:
          break;
      }
    }

    // write data
//     std::cout << "buffer[1][0] = " << buffer[0][0] << " buffer[1][0] = " << buffer[1][0] << " buffer[2][0] = " << buffer[2][0] << std::endl;
//     std::cout << "buffer[0][1] = " << buffer[0][1] << " buffer[1][1] = " << buffer[1][1] << " buffer[2][1] = " << buffer[2][1] << std::endl;
//     std::cout << "buffer[0][2] = " << buffer[0][2] << " buffer[1][2] = " << buffer[1][2] << " buffer[2][2] = " << buffer[2][2] << std::endl;
    if (write_flag == true) {
      if (val_l > 255) {
        result = 255;
      } else if (val_l < 0) {
        result = 0;
      } else {
        result = val_l;
      }
      o_result.write(result);
      if (verbal_laplacian) std::cout << "[L]: Writing " << result << " at " << sc_time_stamp() << std::endl;
      val_l = 0;
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
  // wait(10);
}
