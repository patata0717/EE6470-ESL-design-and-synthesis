#include "string"
#include "string.h"
#include "cassert"
#include "stdio.h"
#include "stdlib.h"
#include "stdint.h"
#include <iostream>

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
    8,    0,       // bit per pixel
    0,    0, 0, 0, // compression
    0,    0, 0, 0, // data size
    0,    0, 0, 0, // h resolution
    0,    0, 0, 0, // v resolution
    0,    0, 0, 0, // used colors
    0,    0, 0, 0  // important colors
};

union word {
  int sint;
  unsigned int uint;
  unsigned char uc[4];
};

unsigned int input_rgb_raw_data_offset;
const unsigned int output_rgb_raw_data_offset=1078;
int width;
int height;
unsigned int width_bytes;
unsigned char bits_per_pixel;
unsigned short bytes_per_pixel;
unsigned char *source_bitmap;
unsigned char *target_bitmap;
const int WHITE = 255;
const int BLACK = 0;
const int THRESHOLD = 90;

// LoG Filter ACC
static char* const LOGFILTER_START_ADDR = reinterpret_cast<char* const>(0x73000000);
static char* const LOGFILTER_READ_ADDR  = reinterpret_cast<char* const>(0x73000004);

// DMA 
static volatile uint32_t * const DMA_SRC_ADDR  = (uint32_t * const)0x70000000;
static volatile uint32_t * const DMA_DST_ADDR  = (uint32_t * const)0x70000004;
static volatile uint32_t * const DMA_LEN_ADDR  = (uint32_t * const)0x70000008;
static volatile uint32_t * const DMA_OP_ADDR   = (uint32_t * const)0x7000000C;
static volatile uint32_t * const DMA_STAT_ADDR = (uint32_t * const)0x70000010;
static const uint32_t DMA_OP_MEMCPY = 1;

bool _is_using_dma = false;
int read_bmp(std::string infile_name) {
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

  assert(fread(source_bitmap, sizeof(unsigned char),
               (size_t)(long)width * height * bytes_per_pixel, fp_s));
  fclose(fp_s);

  unsigned int file_size; // file size
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

  return 0;
}

int write_bmp(std::string outfile_name) {
  FILE *fp_t = NULL; // target file handler

  fp_t = fopen(outfile_name.c_str(), "wb");
  if (fp_t == NULL) {
    printf("fopen %s error\n", outfile_name.c_str());
    return -1;
  }

  // write header
  fwrite(header, sizeof(unsigned char), output_rgb_raw_data_offset, fp_t);

  // write image
  fwrite(target_bitmap, sizeof(unsigned char),
         (size_t)(long)width * height * bytes_per_pixel, fp_t);

  fclose(fp_t);
  return 0;
}

static unsigned char fake_acc_buf[4];

void write_data_to_ACC(char* ADDR, unsigned char* buffer, int len){
  if(_is_using_dma){  
    // Using DMA 
    *DMA_SRC_ADDR = (uint32_t)(buffer);
    *DMA_DST_ADDR = (uint32_t)(ADDR);
    *DMA_LEN_ADDR = len;
    *DMA_OP_ADDR  = DMA_OP_MEMCPY;
  }else{
    // Directly Send
    memcpy(fake_acc_buf, buffer, sizeof(unsigned char)*len);
  }
}
void read_data_from_ACC(char* ADDR, unsigned char* buffer, int len){
  if(_is_using_dma){
    // Using DMA 
    *DMA_SRC_ADDR = (uint32_t)(ADDR);
    *DMA_DST_ADDR = (uint32_t)(buffer);
    *DMA_LEN_ADDR = len;
    *DMA_OP_ADDR  = DMA_OP_MEMCPY;
  }else{
    // Directly Read
    memcpy(buffer, fake_acc_buf, sizeof(unsigned char)*len);
  }
}

int main(int argc, char *argv[]) {

  read_bmp("lena_std_short.bmp");
  printf("======================================\n");
  printf("\t  Reading from array\n");
  printf("======================================\n");
	printf(" input_rgb_raw_data_offset\t= %d\n", input_rgb_raw_data_offset);
	printf(" width\t\t\t\t= %d\n", width);
	printf(" height\t\t\t\t= %d\n", height);
	printf(" bytes_per_pixel\t\t= %d\n",bytes_per_pixel);
  printf("======================================\n");

  unsigned char  buffer[4] = {0};
  word data;
  int total;
  printf("Start processing...(%d, %d)\n", width, height);

 /* nine new samples the sliding 5×5 window needs every pixel */
  static const int kNine[9][2] = {
      { 0,-2},{ 1,-2},{ 2,-2},
      { 2,-1},{ 2, 0},{ 2, 1},
      { 0, 2},{ 1, 2},{ 2, 2}
  };

  for (int i = 0; i < width;  ++i) {
    for (int j = 0; j < height; ++j) {
      std::cout << "pixel (" << i << ", " << j << "); \n";
      // first 15 samples when i==0 to prime the 5×5 window
      if (i == 0) {
        for (int v = -1; v <= 1; ++v) {
          for (int u = -2; u <= 2; ++u) {
            int sx = i + u, sy = j + v;
            unsigned char inten =
              (sx < 0 || sx >= width || sy < 0 || sy >= height)
              ? 0
              : *(source_bitmap + bytes_per_pixel * (sy * width + sx));
            buffer[0] = inten;
            buffer[1] = 0;
            buffer[2] = 0;
            buffer[3] = 0;
            write_data_to_ACC(LOGFILTER_START_ADDR, buffer, 4);
          }
        }
        // remaining 9 samples
        for (int k = 0; k < 9; ++k) {
          int sx = i + kNine[k][0];
          int sy = j + kNine[k][1];
          unsigned char inten =
            (sx < 0 || sx >= width || sy < 0 || sy >= height)
            ? 0
            : *(source_bitmap + bytes_per_pixel * (sy * width + sx));
          buffer[0] = inten;
          buffer[1] = 0;
          buffer[2] = 0;
          buffer[3] = 0;
          write_data_to_ACC(LOGFILTER_START_ADDR, buffer, 4);
        }
      } else {  
        // for i>0, only 9 new samples per pixel
        for (int k = 0; k < 9; ++k) {
          int sx = i + kNine[k][0];
          int sy = j + kNine[k][1];
          unsigned char inten =
            (sx < 0 || sx >= width || sy < 0 || sy >= height)
            ? 0
            : *(source_bitmap + bytes_per_pixel * (sy * width + sx));
          buffer[0] = inten;
          buffer[1] = buffer[2] = buffer[0];
          buffer[3] = 0;
          write_data_to_ACC(LOGFILTER_START_ADDR, buffer, 4);
        }
      }

      // read back the 32-bit LoG result
      read_data_from_ACC(LOGFILTER_READ_ADDR, buffer, 4);
      memcpy(data.uc, buffer, 4);
      total = data.sint;  // already in 0…255
      target_bitmap[ j*width + i ] = (unsigned char)total;
      if (i == 0 && j < 5) {
        printf("LoG(0,%d) = %d\n", j, total);
      }
    }
  }
  write_bmp("lena_color_256.bmp");

  return 0;
}

