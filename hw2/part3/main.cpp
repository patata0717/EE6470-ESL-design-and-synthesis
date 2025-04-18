#include <iostream>
#include <string>
using namespace std;

// Wall Clock Time Measurement
#include <sys/time.h>

#include "SimpleBus.h"
#include "LoGFilter.h"
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
  SimpleBus<1, 1> bus("bus");
  bus.set_clock_period(sc_time(CLOCK_PERIOD, SC_NS));
  LoGFilter log_filter("log_filter");
  tb.initiator.i_skt(bus.t_skt[0]);
  bus.setDecode(0, LOG_MM_BASE, LOG_MM_BASE + LOG_MM_SIZE - 1);
  bus.i_skt[0](log_filter.t_skt);

  tb.read_bmp(argv[1]);
  sc_start();
  std::cout << "Simulated time == " << sc_core::sc_time_stamp() << std::endl;
  std::cout << "the number of read observerved in the transaction functions of TLM bus : " << bus.read_transaction_num << std::endl;
  std::cout << "the number of write observerved in the transaction functions of TLM bus : " << bus.write_transaction_num << std::endl;
  tb.write_bmp(argv[2]);

  return 0;
}
