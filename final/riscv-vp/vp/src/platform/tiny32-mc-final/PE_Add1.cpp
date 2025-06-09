/* PE_Addstatic 1.cpp ---------------------------------------------------------*/
#include "PE_Add1.h"
#include <cstring>

PE_Add1::PE_Add1(sc_core::sc_module_name nm, uint32_t irq_no)
    : sc_core::sc_module(nm), tsock("tsock"), irq(irq_no)
{
    tsock.register_b_transport(this, &PE_Add1::b_transport);
    SC_THREAD(run);
}

/* ------ TLM register access ---------------------------------------- */
void PE_Add1::b_transport(tlm::tlm_generic_payload& tr, sc_core::sc_time& delay)
{
    wait(delay);                       // respect annotated delay
    uint32_t off  = tr.get_address() & 0xF;      // 16-byte window
    auto*    dp   = reinterpret_cast<uint32_t*>(tr.get_data_ptr());

    if (tr.is_write()) {
        switch (off) {
            case 0x0:  input_reg = *dp; break;               /* INPUT */
            case 0x8:  busy = 1; cmd_event.notify(); break;  /* CMD   */
        }
    } else { // READ
        switch (off) {
            case 0x4:  *dp = result_reg; break;              /* RESULT */
            case 0xC:  *dp = busy;       break;              /* STAT   */
        }
    }
    tr.set_response_status(tlm::TLM_OK_RESPONSE);
}

/* ------ worker thread ---------------------------------------------- */
void PE_Add1::run()
{
    for (;;) {
        cout << "[PE_Add1::run] Waiting for CMD write..." << endl;
        wait(cmd_event);            // CMD register written
        cout << "[PE_Add1::run] CMD write received." << endl;
        result_reg = input_reg + 1; // “compute”
        if (plic) plic->gateway_trigger_interrupt(irq);
        busy = 0;
    }
}
