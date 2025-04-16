#include "LoGFilter.h"
#include <iomanip>

LoGFilter::LoGFilter(sc_module_name n) : sc_module(n), t_skt("t_skt"), base_offset(0) {
  SC_THREAD(do_filter_Gaussian);
  SC_THREAD(do_filter_Laplacian);

  t_skt.register_b_transport(this, &LoGFilter::blocking_transport);
}

void LoGFilter::blocking_transport(tlm::tlm_generic_payload &payload, sc_core::sc_time &delay) {
  sc_dt::uint64 addr = payload.get_address();
  addr = addr - base_offset;
  unsigned char *mask_ptr = payload.get_byte_enable_ptr();
  unsigned char *data_ptr = payload.get_data_ptr();
  word buffer;
  switch (payload.get_command()) {
  case tlm::TLM_READ_COMMAND:
    switch (addr) {
    case LOG_FILTER_RESULT_ADDR:
      buffer.uint = o_result.read();
      break;
    case LOG_FILTER_CHECK_ADDR:
      buffer.uint = o_result.num_available();
      break;
    default:
      std::cerr << "Error! LoGFilter::blocking_transport: address 0x"
                << std::setfill('0') << std::setw(8) << std::hex << addr
                << std::dec << " is not valid" << std::endl;
      break;
    }
    data_ptr[0] = buffer.uc[0];
    delay = sc_time(5, SC_NS);
    break;

  case tlm::TLM_WRITE_COMMAND:
    switch (addr) {
    case LOG_FILTER_R_ADDR:
      if (mask_ptr[0] == 0xff) {
        i_intensity.write(data_ptr[0]);
      }
      delay = sc_time(10, SC_NS);
      break;

    default:
      std::cerr << "Error! LoGFilter::blocking_transport: address 0x"
                << std::setfill('0') << std::setw(8) << std::hex << addr
                << std::dec << " is not valid" << std::endl;
      break;
    }
    break;

  case tlm::TLM_IGNORE_COMMAND:
    payload.set_response_status(tlm::TLM_GENERIC_ERROR_RESPONSE);
    return;
  default:
    payload.set_response_status(tlm::TLM_GENERIC_ERROR_RESPONSE);
    return;
  }
  payload.set_response_status(tlm::TLM_OK_RESPONSE); // Always OK
}