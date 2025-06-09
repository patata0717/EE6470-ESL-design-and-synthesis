/*  tiny32-bootstrap.S  – 1 CPU hart, 4 PEs (IRQ0 + IRQ4-7)  */
        .section .text
        .globl  _start, main
        .extern level_1_interrupt_handler   /* from irq.c */

        /* ─── constants ─────────────────────────────────────── */
        .equ    RAM_TOP,        0x02000000      /* 32 MB DRAM top    */
        .equ    STACK_SIZE,     0x00004000      /* 16 KiB            */

        .equ    PLIC_BASE,      0x0C000000
        .equ    PLIC_PRIORITY,  (PLIC_BASE + 0x0000)
        .equ    PLIC_ENABLE,    (PLIC_BASE + 0x2000)   /* hart-0 M-mode */

        .equ  DMA_IRQ,   4
        .equ  PE0_IRQ,   5
        .equ  PE1_IRQ,   6
        .equ  PE2_IRQ,   7
        .equ  PE3_IRQ,   8          /* if you actually wire PE3 */

        /* ─── reset entry ───────────────────────────────────── */
_start:
        /* 1) global pointer (gp) */
        .option push
        .option norelax
1:      auipc  gp, %pcrel_hi(__global_pointer$)
        addi   gp, gp, %pcrel_lo(1b)
        .option pop

        /* 2) stack */
        la     sp, _stack_top

        /* 3) basic PLIC setup: priorities =1, enable DMA+PE0-3 */
        li     t0,  2            
        li     t1, PLIC_PRIORITY
        sw     t0,  (DMA_IRQ*4)(t1)      /* IRQ0  (DMA)  level=2 */
        li     t0,  1            
        sw     t0,  (PE0_IRQ*4)(t1)      /* IRQ4  (PE0)  level=1 */
        sw     t0,  (PE1_IRQ*4)(t1)      /* IRQ5  (PE1)  level=1 */
        sw     t0,  (PE2_IRQ*4)(t1)      /* IRQ6  (PE2)  level=1 */
        sw     t0,  (PE3_IRQ*4)(t1)      /* IRQ7  (PE3)  level=1 */

        li     t0, (1<<DMA_IRQ) | (1<<PE0_IRQ) | (1<<PE1_IRQ) | (1<<PE2_IRQ) | (1<<PE3_IRQ)
        li     t1, PLIC_ENABLE
        sw     t0, 0(t1)

        /* 4) unmask machine-level IE bits and set global MIE */
        li     t0, 0x888
        csrw   mie, t0
        csrsi  mstatus, 8

        /* 5) point mtvec to our trap stub */
        la     t0, _trap_vector
        csrw   mtvec, t0

        /* 6) jump to C main() */
        jal    main

        /* 7) if main returns → exit(0) */
        li     a7, 93        /* SYS_exit */
        li     a0, 0
        ecall
        /* never returns */

        /* ─── trap vector: save/restore ra & t0, pass mcause in a0 ── */
_trap_vector:
        addi   sp, sp, -16
        sw     ra, 12(sp)
        sw     t0,  8(sp)

        csrr   a0, mcause
        call   level_1_interrupt_handler   /* C dispatcher */

        lw     t0,  8(sp)
        lw     ra, 12(sp)
        addi   sp, sp, 16
        mret

/* ─── reserve stack ─────────────────────────────────────────── */
        .section .bss
        .align 4
_stack_area:
        .space STACK_SIZE
_stack_top:
