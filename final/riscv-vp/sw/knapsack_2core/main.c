/* -------------------------------------------------------------------
 *  - 1 CPU hart + 4 PEs.
 * ----------------------------------------------------------------- */

/* ---Need to modify for different testcases--- */
const char* file_path = "stimulus_35.dat"; // modify here

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include "irq.h"

#define num_of_PEs 2
uint32_t count = 0;
uint32_t backup_cnt[num_of_PEs] = {0, 0}; // backup count for each PE
/* ----------------‐ global state for DMA ------------------------ */
static uint8_t    dma_busy = 0;             
static uint8_t    dma_read = 0;             

/* ----------------‐ PE state------------------------------ */
static uint8_t pe_idle[num_of_PEs] = {1, 1};

/* ----------------- CPU receive register------------------------------ */
static uint32_t cpu_receive_register = 0;
static uint8_t  which_PE = 0;

/* ---------------- address map (PE window = 0x40 bytes each) ----- */
#define PE_BASE(i)     (0x74000000u  + ((i) * 0x10))   // each 16 bytes
#define PE_INPUT(i)    ((void*)(PE_BASE(i) + 0x00))   // write 4 bytes
#define PE_RESULT(i)   ((void*)(PE_BASE(i) + 0x04))   // read  4 bytes
#define PE_CMD(i)      ((void*)(PE_BASE(i) + 0x08))   // write 4 bytes
#define PE_STAT(i)     ((void*)(PE_BASE(i) + 0x0C))   // read  4 bytes

/* ---------------- DMA registers ------------------------------- */
#define DMA_BASE        0x70000000UL
#define DMA_SRC_ADDR    (*(volatile uint32_t*)(DMA_BASE + 0x0))
#define DMA_DST_ADDR    (*(volatile uint32_t*)(DMA_BASE + 0x4))
#define DMA_LEN_ADDR    (*(volatile uint32_t*)(DMA_BASE + 0x8))
#define DMA_OP_ADDR     (*(volatile uint32_t*)(DMA_BASE + 0xC))
#define DMA_STAT_ADDR   (*(volatile uint32_t*)(DMA_BASE + 0x10))
#define DMA_OP_MEMCPY   1u


/* ---------------- DMA cmd ------------------------------- */
#define CMD_PROCESS   0x1
#define CMD_FILLTABLE 0x2
#define CMD_HEADER    0x3

/* --------------- Node ------------------- */
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
node_t backup_send_node[num_of_PEs][256];
uint32_t best_value = 0;

/* ----------------‐ queue for B&B nodes (here just integers) ----- */
static node_t queue[1024];
static int      q_head = 0, q_tail = 0;
static inline int      q_empty(void)    { return q_head == q_tail; }
static inline void     q_push(node_t v) { queue[q_tail++ & 1023] = v; }
static inline node_t   q_pop (void)     { return queue[q_head++ & 1023]; }

// 1. Unlock busy
// 2. Both read and write will trigger this, when read, call enqueue, when write, ignore
static void dma_irq_handler(void)
{
    if (dma_read) {
        uint32_t result = cpu_receive_register;
        cpu_receive_register = 0;
        node_t receive, node1, node2;
        receive.raw = result;
        uint32_t UB = receive.ublb.UB;
        uint32_t LB = receive.ublb.LB;
        uint32_t id = receive.ublb.id;
        //printf("[dma_irq_handler] PE%d UB %u, LB %u, id %u\n", which_PE, UB, LB, id);
        pe_idle[which_PE] = 1;
        dma_read = 0;
        if (LB > best_value){
            best_value = LB;
            //printf("[dma_irq_handler] New best value: %u\n", best_value);
        }
        if (UB <= best_value) {
            //printf("[dma_irq_handler] Bounded by %u <= best_value %u. Pruning.\n", UB, best_value);
            dma_busy = 0;
            return;
        }
        node1             = backup_send_node[which_PE][id]; node2             = backup_send_node[which_PE][id];       
        node1.vwd.value  += value[node1.vwd.depth];        
        node1.vwd.weight += weight[node1.vwd.depth];         
        node1.vwd.depth  += 1;                              node2.vwd.depth  += 1;                         
        q_push(node1);
        q_push(node2);
    } else {
        //printf("[dma_irq_handler] dma write, skipped\n");
    }
    dma_busy = 0;
}

/* ------------------------------------------------------------
 * Non‐blocking DMA helpers: just start the copy, return immediately.
 * We do NOT wait for completion; dma_irq_handler() will fire later.
 * ---------------------------------------------------------- */
static inline void write_data_to_ACC(void* dst, const void* src, uint32_t len)
{
    DMA_STAT_ADDR = 0;  // Clear DMA status register
    while (dma_busy) {
        asm volatile("wfi");
    }
    //printf("[write_data_to_ACC]\n");
    dma_busy = 1;
    DMA_SRC_ADDR = (uint32_t)src;
    DMA_DST_ADDR = (uint32_t)dst;
    DMA_LEN_ADDR = len;
    DMA_OP_ADDR  = DMA_OP_MEMCPY;
}

static inline void read_data_from_ACC(const void* src, void* dst, uint32_t len, int pe)
{
    // Only start a read if no other DMA is busy
    while (dma_busy) {
        asm volatile("wfi");
    }
    //printf("[read_data_from_ACC]\n");

    which_PE = pe;
    dma_busy = 1;
    dma_read = 1;  
    DMA_SRC_ADDR = (uint32_t)src;
    DMA_DST_ADDR = (uint32_t)dst;
    DMA_LEN_ADDR = len;
    DMA_OP_ADDR  = DMA_OP_MEMCPY;
}

static void PE_dispatch(int pe, node_t node)
{
    uint32_t packet;
    backup_send_node[pe][backup_cnt[pe]++] = node;
    packet = node.raw;

    // 1) Write PE INPUT register via DMA, PE still locking
    pe_idle[pe] = 0;
    //printf("[PE dispatch]PE%d, value %u, weight %u, depth %u\n", pe, node.vwd.value, node.vwd.weight, node.vwd.depth);
    write_data_to_ACC(PE_INPUT(pe), &packet, 4);

    // 2) Write PE CMD register to kick the PE
    uint32_t cmd = CMD_PROCESS;
    //printf("[PE dispatch]PE%d command %u\n", pe, cmd);
    write_data_to_ACC(PE_CMD(pe), &cmd, 4);
    //printf("[PE dispatch]PE dispatch end\n");
}

static void irq_PE(int idx)
{
    // Mark that we’re waiting for the read, then start it:
    //printf("[irq_PE]PE%d IRQ received\n", idx);
    read_data_from_ACC(PE_RESULT(idx), &cpu_receive_register, 4, idx);

}

static void irq_PE0(void) {irq_PE(0);}
static void irq_PE1(void) {irq_PE(1);}

/* ------------------------------------------------------------
 * Initialization: register DMA IRQ (we assume IRQ #4) and
 * PE IRQs 5–8 for PE0–PE3.
 * ---------------------------------------------------------- */
void init(void)
{
    register_interrupt_handler(4, dma_irq_handler);
    register_interrupt_handler(5, irq_PE0);
    register_interrupt_handler(6, irq_PE1);
}

int main(void)
{
    printf("Start (CPU hart)\n");
    init();

    /* ---Parse input--- */

    FILE *fp = fopen(file_path, "r");

    // Read header
    uint32_t num_items;
    uint32_t weight_limit;
    fscanf(fp, "%u %u", &num_items, &weight_limit);

    value = (uint32_t*)malloc(num_items * sizeof(uint32_t));
    weight = (uint32_t*)malloc(num_items * sizeof(uint32_t));

    // Send header to PEs
    for (int pe = 0; pe < num_of_PEs; ++pe) {
        uint32_t cmd = CMD_HEADER;
        printf("[Phase 0] Writing PE%d header: num_items = %u\n", pe, num_items);
        write_data_to_ACC(PE_INPUT(pe), &num_items, 4);
        printf("[Phase 0] Writing PE%d CMD_HEADER\n", pe);
        write_data_to_ACC(PE_CMD(pe), &cmd, 4);
        printf("[Phase 0] Writing PE%d header: weight_limit = %u\n", pe, weight_limit);
        write_data_to_ACC(PE_INPUT(pe), &weight_limit, 4);
        printf("[Phase 0] Writing PE%d CMD_HEADER\n", pe);
        write_data_to_ACC(PE_CMD(pe), &cmd, 4);
    }

    // Read items
    for (int i = 0; i < num_items; ++i) {
        fscanf(fp, "%u %u", &weight[i], &value[i]);
    }

    fclose(fp);

    // Sort items by value-to-weight ratio
    for (int i = 0; i < num_items - 1; ++i) {
        for (int j = i + 1; j < num_items; ++j) {
            if ((value[i] * weight[j]) < (value[j] * weight[i])) {
                // Swap items
                uint32_t temp_value = value[i]; uint32_t temp_weight = weight[i];
                value[i] = value[j]; weight[i] = weight[j];
                value[j] = temp_value; weight[j] = temp_weight;
            }
        }
    }

    // print items
    for (int i = 0; i < num_items; ++i) {
        printf("Item %d: weight = %u, value = %u\n", i, weight[i], value[i]);
    }

    /* ---Phase 1: Write item table to each PE--- */
    node_t item;
    uint32_t packet;

    for (int pe = 0; pe < num_of_PEs; ++pe) {
        for (int i = 0; i < num_items; ++i) {
            item.vwd.value = value[i];
            item.vwd.weight = weight[i];
            item.vwd.depth  = 0;
            packet = item.raw;
            printf("[Phase 1] Writing PE%d value[%d] = %u, weight[%d] = %u\n", pe, i, item.vwd.value, i, item.vwd.weight);
            write_data_to_ACC(PE_INPUT(pe), &packet, 4);
            uint32_t cmd = CMD_FILLTABLE;
            printf("[Phase 1] Writing PE%d CMD_FILLTABLE\n", pe);
            write_data_to_ACC(PE_CMD(pe), &cmd, 4);
        }
    }

    /* ---Phase 2: dispatch to PE and get result--- */
    node_t seed;
    seed.vwd.value = 0; 
    seed.vwd.weight = 0;
    seed.vwd.depth  = 0;
    q_push(seed);

    while (1) {
        // Dispatch the smallest_id idle PE
        for (int pe = 0; pe < num_of_PEs; ++pe) {
            if (pe_idle[pe] && !q_empty()) {
                node_t node = q_pop();
                PE_dispatch(pe, node);
                count++;
            }
        }
        int all_idle = pe_idle[0] && pe_idle[1];
        if (!all_idle) {
            printf("wfi\n");
            asm volatile("wfi");
        } else if (all_idle && q_empty()) {
            break;
        }
    }
    printf("Done – queue empty and all PEs idle\n");
    printf("Best value found: %u\n", best_value);
    printf("All PEs dispatched %u times\n", count);
    for (int pe = 0; pe < num_of_PEs; ++pe) {
        printf("PE%d dispatched %u times\n", pe, backup_cnt[pe]);
    }
    asm volatile("li a7,93; li a0,0; ecall");  // exit(0)
    return 0;
}

