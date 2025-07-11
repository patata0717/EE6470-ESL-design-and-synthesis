// Generated by stratus_hls 23.02-s004  (100793.100415)
// Wed Jun  4 01:36:08 2025
// from dut.cc

`timescale 1ps / 1ps


module dut_gen_busy_r_4_0( in1, in2, in3, in4, out1 );

    input in1;
    input in2;
    input in3;
    input in4;
    output [2:0] out1;
    wire  ioread005;
    wire  tmp11;
    wire  ioread006;
    wire  tmp12;
    wire  tmp13;
    wire  gnew_req;
    wire  tmp14;
    wire  tmp15;
    wire  tmp16;
    wire  tmp17;
    wire  ioread003;
    wire  tmp18;
    wire  din_gen_busy_din_m_data_is_invalid_next;
    wire  gdiv;
    wire  gnew_busy;
    wire  tmp21;
    wire  tmp20;
    wire  tmp19;

    
    // rtl_process:dut_gen_busy_r_4/dut_gen_busy_r_4_thread_1_p20
    assign out1 = {tmp21, {tmp20, tmp19}};
    
    // rtl_process:dut_gen_busy_r_4/dut_gen_busy_r_4_thread_1_p19
    assign tmp21 = gnew_busy;
    
    // rtl_process:dut_gen_busy_r_4/dut_gen_busy_r_4_thread_1_p18
    assign tmp20 = gdiv;
    
    // rtl_process:dut_gen_busy_r_4/dut_gen_busy_r_4_thread_1_p17
    assign tmp19 = din_gen_busy_din_m_data_is_invalid_next;
    
    // rtl_process:dut_gen_busy_r_4/dut_gen_busy_r_4_thread_1_p16
    assign din_gen_busy_din_m_data_is_invalid_next = tmp18;
    
    // rtl_process:dut_gen_busy_r_4/dut_gen_busy_r_4_thread_1_p15
    assign tmp18 = ~gdiv;
    
    // rtl_process:dut_gen_busy_r_4/dut_gen_busy_r_4_thread_1_p14
    assign gdiv = tmp17 | ioread003;
    
    // rtl_process:dut_gen_busy_r_4/dut_gen_busy_r_4_thread_1_p13
    assign tmp17 = in1 & tmp16;
    
    // rtl_process:dut_gen_busy_r_4/dut_gen_busy_r_4_thread_1_p12
    assign tmp16 = tmp15;
    
    // rtl_process:dut_gen_busy_r_4/dut_gen_busy_r_4_thread_1_p11
    assign tmp15 = ~tmp14;
    
    // rtl_process:dut_gen_busy_r_4/dut_gen_busy_r_4_thread_1_p10
    assign tmp14 = gnew_req;
    
    // rtl_process:dut_gen_busy_r_4/dut_gen_busy_r_4_thread_1_p9
    assign gnew_busy = tmp13 | ioread003;
    
    // rtl_process:dut_gen_busy_r_4/dut_gen_busy_r_4_thread_1_p8
    assign tmp13 = gnew_req;
    
    // rtl_process:dut_gen_busy_r_4/dut_gen_busy_r_4_thread_1_p7
    assign gnew_req = ioread006 & tmp12;
    
    // rtl_process:dut_gen_busy_r_4/dut_gen_busy_r_4_thread_1_p6
    assign tmp12 = ioread005 | tmp11;
    
    // rtl_process:dut_gen_busy_r_4/dut_gen_busy_r_4_thread_1_p5
    assign tmp11 = in1;
    
    // rtl_process:dut_gen_busy_r_4/dut_gen_busy_r_4_thread_1_p4
    assign ioread006 = in2;
    
    // rtl_process:dut_gen_busy_r_4/dut_gen_busy_r_4_thread_1_p3
    assign ioread005 = in3;
    
    // rtl_process:dut_gen_busy_r_4/dut_gen_busy_r_4_thread_1_p2
    assign ioread003 = in4;

endmodule


