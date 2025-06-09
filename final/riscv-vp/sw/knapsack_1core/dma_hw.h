/* -------------  dma_hw.h  ------------------------------------------- */
/* Minimal driver for the single-channel DMA in tiny32-mc               */
/* The HW raises IRQ 4 when OP is finished.                             */
#ifndef DMA_HW_H
#define DMA_HW_H

#include <stdint.h>
#include <stdio.h>

#define DMA_BASE        0x70000000UL
#define DMA_SRC_ADDR    (*(volatile uint32_t*)(DMA_BASE+0x0))
#define DMA_DST_ADDR    (*(volatile uint32_t*)(DMA_BASE+0x4))
#define DMA_LEN_ADDR    (*(volatile uint32_t*)(DMA_BASE+0x8))
#define DMA_OP_ADDR     (*(volatile uint32_t*)(DMA_BASE+0xC))
#define DMA_STAT_ADDR   (*(volatile uint32_t*)(DMA_BASE+0x10))

#define DMA_OP_NOP      0u
#define DMA_OP_MEMCPY   1u      /* copy LEN  bytes from SRC to DST      */

static inline void dma_start_memcpy(const void*src, void*dst, uint32_t len)
{
    printf("DMA starting memcpy from %p to %p, length %u bytes...\n", src, dst, len);
    DMA_SRC_ADDR = (uint32_t)src;
    DMA_DST_ADDR = (uint32_t)dst;
    DMA_LEN_ADDR = len;
    DMA_OP_ADDR  = DMA_OP_MEMCPY;
}

static inline void dma_wait_irq(void)
{
    printf("DMA waiting for IRQ...\n");
    // Busy‐poll the status register until the DMA sets it to 1.
    while (DMA_STAT_ADDR == 0) {
        __asm__ volatile("nop");
    }
    // Clear STAT back to 0, so that the next transfer can set it again.
    DMA_STAT_ADDR = 0;
}

#endif /* DMA_HW_H */
