#ifndef LoG_FILTER_H_
#define LoG_FILTER_H_
#include <systemc>
using namespace sc_core;

#include "filter_def.h"
#include "tlm"
#include "tlm_utils/simple_target_socket.h"

class LoGFilter : public sc_module {
public:
  tlm_utils::simple_target_socket<LoGFilter> t_skt;
  sc_fifo<unsigned char> i_intensity;
  sc_fifo<int> o_result;

  SC_HAS_PROCESS(LoGFilter);
  LoGFilter(sc_module_name n);
  ~LoGFilter() = default;

private:
  void do_filter_Gaussian();
  void do_filter_Laplacian();
  sc_fifo<int> gaussian_to_laplacian;
  int val_g = 0;
  int val_l = 0;
  unsigned int base_offset;
  void blocking_transport(tlm::tlm_generic_payload &payload, sc_core::sc_time &delay);
};

#endif