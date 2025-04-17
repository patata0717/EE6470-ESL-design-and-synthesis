#ifndef FILTER_DEF_H_
#define FILTER_DEF_H_

// input image size
const int width = 512;
const int height = 512;

// mask size
const int MASK_N = 1;
const int MASK_X = 3;
const int MASK_Y = 3;

// verbal
const bool verbal_tb = 0;
const bool verbal_gaussian = 0;
const bool verbal_laplacian = 0;

const int LOG_FILTER_R_ADDR = 0x00000000;
const int LOG_FILTER_RESULT_ADDR = 0x00000004;
const int LOG_FILTER_CHECK_ADDR = 0x00000008;

union word {
  int sint;
  unsigned int uint;
  unsigned char uc[4];
};

#endif

