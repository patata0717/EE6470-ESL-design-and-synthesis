#include <cassert>
#include <cstdio>
#include <cstdlib>
using namespace std;

#include "Testbench.h"

unsigned char header[1078] = {
    0x42,          // identity : B
    0x4d,          // identity : M
    0,    0, 0, 0, // file size
    0,    0,       // reserved1
    0,    0,       // reserved2
    54,   4, 0, 0, // RGB data offset
    40,   0, 0, 0, // struct BITMAPINFOHEADER size
    0,    0, 0, 0, // bmp width
    0,    0, 0, 0, // bmp height
    1,    0,       // planes
    8,    0,       // bit per pixel(gray)
    0,    0, 0, 0, // compression
    0,    0, 0, 0, // data size
    0,    0, 0, 0, // h resolution
    0,    0, 0, 0, // v resolution
    0,    0, 0, 0, // used colors
    0,    0, 0, 0  // important colors
};



Testbench::Testbench(sc_module_name n)
    : sc_module(n), output_rgb_raw_data_offset(1078) {
// ** Add grayscale color palette (256 entries) **
for (int i = 0; i < 256; i++) {
    header[54 + i * 4] = i;   // Red
    header[55 + i * 4] = i;   // Green
    header[56 + i * 4] = i;   // Blue
    header[57 + i * 4] = 0;   // Reserved (always 0)
}
  SC_THREAD(do_LoG);
  sensitive << i_clk.pos();
  dont_initialize();
}

int Testbench::read_bmp(string infile_name) {
  FILE *fp_s = NULL; // source file handler
  fp_s = fopen(infile_name.c_str(), "rb");
  if (fp_s == NULL) {
    printf("fopen %s error\n", infile_name.c_str());
    return -1;
  }
  // move offset to 10 to find rgb raw data offset
  fseek(fp_s, 10, SEEK_SET);
  assert(fread(&input_rgb_raw_data_offset, sizeof(unsigned int), 1, fp_s));

  // move offset to 18 to get width & height;
  fseek(fp_s, 18, SEEK_SET);
  assert(fread(&width, sizeof(unsigned int), 1, fp_s));
  assert(fread(&height, sizeof(unsigned int), 1, fp_s));

  // get bit per pixel
  fseek(fp_s, 28, SEEK_SET);
  assert(fread(&bits_per_pixel, sizeof(unsigned short), 1, fp_s));
  bytes_per_pixel = bits_per_pixel / 8;

  // move offset to input_rgb_raw_data_offset to get RGB raw data
  fseek(fp_s, input_rgb_raw_data_offset, SEEK_SET);

  source_bitmap =
      (unsigned char *)malloc((size_t)width * height * bytes_per_pixel);
  if (source_bitmap == NULL) {
    printf("malloc images_s error\n");
    return -1;
  }

  target_bitmap =
      (unsigned char *)malloc((size_t)width * height * bytes_per_pixel);
  if (target_bitmap == NULL) {
    printf("malloc target_bitmap error\n");
    return -1;
  }

  printf("Image width=%d, height=%d\n", width, height);
  assert(fread(source_bitmap, sizeof(unsigned char),
               (size_t)(long)width * height * bytes_per_pixel, fp_s));
  fclose(fp_s);
  return 0;
}

int Testbench::write_bmp(string outfile_name) {
  FILE *fp_t = NULL;      // target file handler
  unsigned int file_size; // file size

  fp_t = fopen(outfile_name.c_str(), "wb");
  if (fp_t == NULL) {
    printf("fopen %s error\n", outfile_name.c_str());
    return -1;
  }

  // file size
  file_size = width * height * bytes_per_pixel + output_rgb_raw_data_offset;
  header[2] = (unsigned char)(file_size & 0x000000ff);
  header[3] = (file_size >> 8) & 0x000000ff;
  header[4] = (file_size >> 16) & 0x000000ff;
  header[5] = (file_size >> 24) & 0x000000ff;

  // width
  header[18] = width & 0x000000ff;
  header[19] = (width >> 8) & 0x000000ff;
  header[20] = (width >> 16) & 0x000000ff;
  header[21] = (width >> 24) & 0x000000ff;

  // height
  header[22] = height & 0x000000ff;
  header[23] = (height >> 8) & 0x000000ff;
  header[24] = (height >> 16) & 0x000000ff;
  header[25] = (height >> 24) & 0x000000ff;

  // bit per pixel
  header[28] = bits_per_pixel;

  // write header
  fwrite(header, sizeof(unsigned char), output_rgb_raw_data_offset, fp_t);

  // write image
  fwrite(target_bitmap, sizeof(unsigned char),
         (size_t)(long)width * height * bytes_per_pixel, fp_t);

  fclose(fp_t);
  return 0;
}

void Testbench::do_LoG() {
  int i, j, x, y, v, u;        // for loop counter
  unsigned char INTENSITY;
  double total;

  o_rst.write(false);
  o_rst.write(true);
  for (y = 0; y != height; ++y) {
    for (x = 0; x != width; ++x) {
      // Process a 3x3 block
      for (i = -1; i <= 1; ++i) {
        for (j = -1; j <= 1; ++j) {
          // Process each 3x3 region in the 5x5 block
          for (v = -1; v <= 1; ++v) {
            for (u = -1; u <= 1; ++u) {
              int yi = y + i + v;
              int xi = x + j + u;
              if (((x == 0)          && (j == -1)) ||
                  ((x == width - 1)  && (j ==  1)) ||
                  ((y == 0)          && (i == -1)) ||
                  ((y == height - 1) && (i ==  1))  ) {
                INTENSITY = 0;
              } else if (xi >= 0 && xi < width && yi >= 0 && yi < height) {
                INTENSITY = *(source_bitmap + width * yi + xi);
              } else {
                INTENSITY = 0;
              }
              o_intensity.write(INTENSITY);
              if (verbal_tb) {
                std::cout << "[T]: Writing " << "xi: " << xi
                                             << " yi: " << yi
                                             << " x: " << x
                                             << " y: " << y
                                             << " i: " << i
                                             << " j: " << j
                                             << " v: " << v
                                             << " u: " << u
                << " " << (int)INTENSITY << " at " << sc_time_stamp() << std::endl;
              }
              wait(1); // emulate channel delay
            }
          }
        }
      }

      if (verbal_tb) {std::cout << "[T]: Waiting " << (int)total << " at " << sc_time_stamp() << std::endl;}
      if(i_result.num_available()==0) wait(i_result.data_written_event());
      total = i_result.read();
      if (verbal_tb) {std::cout << "[T]: Reading " << (int)total << " at " << sc_time_stamp() << std::endl;}
      //cout << "Now at " << sc_time_stamp() << endl; //print current sc_time


      if (total > 255) {
        *(target_bitmap + bytes_per_pixel * (width * y + x)) = 255;
      } else if (total < 0) {
        *(target_bitmap + bytes_per_pixel * (width * y + x)) = 0;
      } else {
        *(target_bitmap + bytes_per_pixel * (width * y + x)) = total;
      }
    }
  }
  sc_stop();
}
