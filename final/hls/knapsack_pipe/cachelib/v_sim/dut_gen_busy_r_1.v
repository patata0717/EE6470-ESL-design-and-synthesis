// Generated by stratus_hls 23.02-s004  (100793.100415)
// Mon Jun  9 15:41:40 2025
// from dut.cc

`timescale 1ps / 1ps


module dut_gen_busy_r_1( in1, in2, in3, out1 );

    input in1;
    input in2;
    input in3;
    output [2:0] out1;
    wire  ioread003;
    wire  tmp45;
    wire  ioread004;
    wire  tmp46;
    wire  tmp47;
    wire  tmp48;
    wire  tmp49;
    wire  tmp50;
    wire  din_gen_busy_din_m_data_is_invalid_next;
    wire  gdiv;
    wire  gnew_req;
    wire  tmp53;
    wire  tmp52;
    wire  tmp51;

    
    // rtl_process:dut_gen_busy_r_1/dut_gen_busy_r_1_thread_1_p16
    assign out1 = {tmp53, {tmp52, tmp51}};
    
    // rtl_process:dut_gen_busy_r_1/dut_gen_busy_r_1_thread_1_p15
    assign tmp53 = gnew_req;
    
    // rtl_process:dut_gen_busy_r_1/dut_gen_busy_r_1_thread_1_p14
    assign tmp52 = gdiv;
    
    // rtl_process:dut_gen_busy_r_1/dut_gen_busy_r_1_thread_1_p13
    assign tmp51 = din_gen_busy_din_m_data_is_invalid_next;
    
    // rtl_process:dut_gen_busy_r_1/dut_gen_busy_r_1_thread_1_p12
    assign din_gen_busy_din_m_data_is_invalid_next = tmp50;
    
    // rtl_process:dut_gen_busy_r_1/dut_gen_busy_r_1_thread_1_p11
    assign tmp50 = ~gdiv;
    
    // rtl_process:dut_gen_busy_r_1/dut_gen_busy_r_1_thread_1_p10
    assign gdiv = in1 & tmp49;
    
    // rtl_process:dut_gen_busy_r_1/dut_gen_busy_r_1_thread_1_p9
    assign tmp49 = tmp48;
    
    // rtl_process:dut_gen_busy_r_1/dut_gen_busy_r_1_thread_1_p8
    assign tmp48 = ~tmp47;
    
    // rtl_process:dut_gen_busy_r_1/dut_gen_busy_r_1_thread_1_p7
    assign tmp47 = gnew_req;
    
    // rtl_process:dut_gen_busy_r_1/dut_gen_busy_r_1_thread_1_p6
    assign gnew_req = ioread004 & tmp46;
    
    // rtl_process:dut_gen_busy_r_1/dut_gen_busy_r_1_thread_1_p5
    assign tmp46 = ioread003 | tmp45;
    
    // rtl_process:dut_gen_busy_r_1/dut_gen_busy_r_1_thread_1_p4
    assign tmp45 = in1;
    
    // rtl_process:dut_gen_busy_r_1/dut_gen_busy_r_1_thread_1_p3
    assign ioread004 = in2;
    
    // rtl_process:dut_gen_busy_r_1/dut_gen_busy_r_1_thread_1_p2
    assign ioread003 = in3;

endmodule


