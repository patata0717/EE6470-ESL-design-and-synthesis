/* PE_Add1.h -----------------------------------------------------------*/
#ifndef PE_ADD1_H
#define PE_ADD1_H

#include <systemc>
#include <tlm_utils/simple_target_socket.h>
#include "core/common/irq_if.h"

struct PE_Add1 : sc_core::sc_module
{
    tlm_utils::simple_target_socket<PE_Add1> tsock;

    interrupt_gateway* plic = nullptr;   // wired in sc_main
    uint32_t           irq  = 0;         // unique IRQ number

    SC_HAS_PROCESS(PE_Add1);
    PE_Add1(sc_core::sc_module_name nm, uint32_t irq_no);

  private:
    /* register file */
    uint32_t input_reg  = 0;   // 0x0  (W)
    uint32_t result_reg = 0;   // 0x4  (R)
    uint32_t busy       = 0;   // 0xC  (R)

    sc_core::sc_event process_event;  
    sc_core::sc_event filltable_event;
    sc_core::sc_event header_event;

    /* TLM target callback */
    void b_transport(tlm::tlm_generic_payload&, sc_core::sc_time&);

    /* worker thread */
    void run();
};

#endif
