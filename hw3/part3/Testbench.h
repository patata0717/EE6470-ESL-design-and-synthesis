#ifndef TESTBENCH_H_
#define TESTBENCH_H_

#include <string>
using namespace std;

#include <systemc>
// #include <cynw_fixed.h>
using namespace sc_core;

#ifndef NATIVE_SYSTEMC
#include <cynw_p2p.h>
#endif

#include "filter_def.h"

#define WHITE = 255;
#define BLACK = 0;
#define THRESHOLD = 90;

class Testbench : public sc_module {
public:
  sc_in_clk i_clk;
  sc_out<bool> o_rst;
#ifndef NATIVE_SYSTEMC
	cynw_p2p<unsigned char>::base_out o_intensity;
	cynw_p2p<unsigned char>::base_in i_result;
#else
  sc_fifo_out<unsigned char> o_intensity;
  sc_fifo_in<unsigned char> i_result;
#endif

  SC_HAS_PROCESS(Testbench);

  Testbench(sc_module_name n);
  ~Testbench();

  int read_bmp(string infile_name);
  int write_bmp(string outfile_name);

  unsigned int get_width() { return width; }

  unsigned int get_height() { return height; }

  unsigned int get_width_bytes() { return width_bytes; }

  unsigned int get_bytes_per_pixel() { return bytes_per_pixel; }

  unsigned char *get_source_image() { return source_bitmap; }
  unsigned char *get_target_image() { return target_bitmap; }

private:
  unsigned int input_rgb_raw_data_offset;
  const unsigned int output_rgb_raw_data_offset;
  unsigned int width;
  unsigned int height;
  unsigned int width_bytes;
  unsigned char bits_per_pixel;
  unsigned short bytes_per_pixel;
  unsigned char *source_bitmap;
  unsigned char *target_bitmap;

  unsigned int n_txn;
	sc_time max_txn_time;
	sc_time min_txn_time;
	sc_time total_txn_time;
	sc_time total_start_time;
	sc_time total_run_time;
  sc_time latency_time;
  sc_time latency;
  sc_time sent_time;

  void feed_intensity();
	void fetch_result();
};
#endif
