// tiny32_3core
#include "PE_Add1.h"
#include <cstring>
#include <iostream>
#include <systemc>
#include <stdint.h>

#define CMD_PROCESS   0x1
#define CMD_FILLTABLE 0x2
#define CMD_HEADER    0x3

uint32_t num_of_items;
uint32_t weight_limit;

typedef struct {
    uint32_t value  : 12;  // LSB  0–11
    uint32_t weight : 12;  //     12–23
    uint32_t depth  :  8;  //     24–31 (MSB)
} v_w_d;

typedef struct {
    uint32_t UB : 12;  // Upper Bound
    uint32_t LB : 12;  // Lower Bound
    uint32_t id : 8;   // id for backup_send_node
} UB_LB;

typedef union {
    v_w_d  vwd;
    UB_LB  ublb;
    uint32_t raw;
} node_t;

uint32_t *value;
uint32_t *weight;

/* -------------------------------------------------------------------------- */
/* 1) 16-bit ÷ 8-bit restoring divider (returns ⌊ dividend / divisor ⌋)       */
/* -------------------------------------------------------------------------- */
static uint16_t div_u16_u8(uint16_t dividend, uint8_t divisor) {
    uint16_t quotient  = 0;
    uint16_t remainder = 0;

    for (int bit = 15; bit >= 0; --bit) {
        remainder = static_cast<uint16_t>((remainder << 1) | ((dividend >> bit) & 1u));
        if (remainder >= divisor) {
            remainder = static_cast<uint16_t>(remainder - divisor);
            quotient  |= static_cast<uint16_t>(1u << bit);
        }
    }
    return quotient;
}

/* -------------------------------------------------------------------------- */
/* 2) bounds_kernel – computes UB / LB using global value[] / weight[]        */
/* -------------------------------------------------------------------------- */
static void bounds_kernel(uint32_t  currV, uint32_t  currW, uint32_t  depth, uint32_t& UB, uint32_t& LB) {
    uint32_t v_ub   = static_cast<uint32_t>(currV);
    uint32_t v_lb   = static_cast<uint32_t>(currV);
    uint32_t w_used = static_cast<uint32_t>(currW);

    /* already overweight? prune */
    if (w_used > weight_limit) { UB = 0; LB = 0; return; }

    uint32_t rem = static_cast<uint32_t>(weight_limit - w_used);
    uint32_t  i   = static_cast<uint32_t>(depth);

    for (; i < num_of_items; ++i) {
        uint32_t w_i = static_cast<uint32_t>(weight[i]);
        if (w_i > rem) break;
        rem  = static_cast<uint32_t>(rem - w_i);
        v_ub = static_cast<uint32_t>(v_ub + value[i]);
        v_lb = static_cast<uint32_t>(v_lb + value[i]);
    }

    /* fractional item for UB */
    if ((i < num_of_items) && rem) {
        uint32_t w_i = static_cast<uint32_t>(weight[i]);
        uint32_t v_i = static_cast<uint32_t>(value[i]);
        uint32_t prod = static_cast<uint32_t>(rem * v_i);
        v_ub = static_cast<uint32_t>(v_ub + div_u16_u8(prod, w_i));
    }

    UB = v_ub;
    LB = v_lb;
}

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
            case 0x0:  input_reg = *dp; break;            /* INPUT */
            case 0x8:  {                                  /* CMD   */
                busy = 1;
                if (*dp == CMD_PROCESS) {
                    //std::cout << "[PE" << irq - 5 << "] CMD_PROCESS received." << std::endl;
                    process_event.notify();
                } else if (*dp == CMD_FILLTABLE) {
                    //std::cout << "[PE" << irq - 5 << "] CMD_FILLTABLE received." << std::endl;
                    filltable_event.notify();
                } else if (*dp == CMD_HEADER) {
                    //std::cout << "[PE" << irq - 5 << "] CMD_HEADER received." << std::endl;
                    header_event.notify();
                } else {
                    std::cerr << "[PE" << irq - 5 << "] Unknown command: " << *dp << std::endl;
                }
                break;                                    
            }
        }
    } else { // READ
        switch (off) {
            case 0x4:  *dp = result_reg; break;          /* RESULT */
            case 0xC:  *dp = busy;       break;          /* STAT   */
        }
    }
    tr.set_response_status(tlm::TLM_OK_RESPONSE);
}

/* ------ worker thread ---------------------------------------------- */
void PE_Add1::run()
{
    node_t item;

    /* --- Phase 0: Read header ---*/
    //std::cout << "[PE" << irq - 5 << "] Waiting for header event1..." << std::endl;
    wait(header_event);
    num_of_items = input_reg;
    //std::cout << "[PE" << irq - 5 << "] Waiting for header event2..." << std::endl;
    wait(header_event);
    weight_limit = input_reg;
    //std::cout << "[PE" << irq - 5 << "] Header received: num_of_items = " << num_of_items << ", weight_limit = " << weight_limit << std::endl;

    value  = new uint32_t[num_of_items];
    weight = new uint32_t[num_of_items];

    /* ---Phase 1: fill table--- */
    for (uint32_t i = 0; i < num_of_items; ++i) {
        //std::cout << "[PE" << irq - 5 << "] Waiting for filltable event..." << std::endl;
        wait(filltable_event);
        item.raw = input_reg;
        value[i]  = item.vwd.value;
        weight[i] = item.vwd.weight;
        //std::cout << "[PE" << irq - 5 << "] item.vwd.value = " << item.vwd.value << ", item.vwd.weight = " << item.vwd.weight << std::endl;
    }

    /* ---Phase 2: process --- */
    uint32_t id = 0;
    while (1) {
        //std::cout << "[PE" << irq - 5 << "] Waiting for process event..." << std::endl;
        wait(process_event);
        //std::cout << "[PE" << irq - 5 << "] process event write received." << std::endl;

        /* --- Computing --- */
        node_t receive_node;
        node_t return_node;
        uint32_t UB, LB;
        uint32_t currV, currW;
        uint32_t depth;
        receive_node.raw = input_reg;
        currV = receive_node.vwd.value;
        currW = receive_node.vwd.weight;
        depth = receive_node.vwd.depth;
        bounds_kernel(currV, currW, depth, UB, LB);
        return_node.ublb.UB = UB;
        return_node.ublb.LB = LB;
        return_node.ublb.id = id++;
        result_reg = return_node.raw;
        busy = 0;
        wait(150000, sc_core::SC_NS);  // Add delay
        //std::cout << "[PE" << irq - 5 << "] bounds_kernel returned LB = " << LB << ", UB = " << UB << ", id = " << return_node.ublb.id << std::endl;
        /* --- Computing Done --- */


        //std::cout << "[PE" << irq - 5 << "] Call Plic" << std::endl;
        plic->gateway_trigger_interrupt(irq);
        //std::cout << "[PE" << irq - 5 << "] end of function" << std::endl;
    }
}

