// Generated by stratus_hls 23.02-s004  (100793.100415)
// Mon Jun  9 13:24:59 2025
// from dut.cc

`timescale 1ps / 1ps


module dut_gen_busy_r_4( in1, in2, in3, out1 );

    input in1;
    input in2;
    input in3;
    output [2:0] out1;
    wire  ioread003;
    wire  tmp9;
    wire  ioread004;
    wire  tmp10;
    wire  tmp11;
    wire  tmp12;
    wire  tmp13;
    wire  tmp14;
    wire  din_gen_busy_din_m_data_is_invalid_next;
    wire  gdiv;
    wire  gnew_req;
    wire  tmp17;
    wire  tmp16;
    wire  tmp15;

    
    // rtl_process:dut_gen_busy_r_4/dut_gen_busy_r_4_thread_1_p16
    assign out1 = {tmp17, {tmp16, tmp15}};
    
    // rtl_process:dut_gen_busy_r_4/dut_gen_busy_r_4_thread_1_p15
    assign tmp17 = gnew_req;
    
    // rtl_process:dut_gen_busy_r_4/dut_gen_busy_r_4_thread_1_p14
    assign tmp16 = gdiv;
    
    // rtl_process:dut_gen_busy_r_4/dut_gen_busy_r_4_thread_1_p13
    assign tmp15 = din_gen_busy_din_m_data_is_invalid_next;
    
    // rtl_process:dut_gen_busy_r_4/dut_gen_busy_r_4_thread_1_p12
    assign din_gen_busy_din_m_data_is_invalid_next = tmp14;
    
    // rtl_process:dut_gen_busy_r_4/dut_gen_busy_r_4_thread_1_p11
    assign tmp14 = ~gdiv;
    
    // rtl_process:dut_gen_busy_r_4/dut_gen_busy_r_4_thread_1_p10
    assign gdiv = in1 & tmp13;
    
    // rtl_process:dut_gen_busy_r_4/dut_gen_busy_r_4_thread_1_p9
    assign tmp13 = tmp12;
    
    // rtl_process:dut_gen_busy_r_4/dut_gen_busy_r_4_thread_1_p8
    assign tmp12 = ~tmp11;
    
    // rtl_process:dut_gen_busy_r_4/dut_gen_busy_r_4_thread_1_p7
    assign tmp11 = gnew_req;
    
    // rtl_process:dut_gen_busy_r_4/dut_gen_busy_r_4_thread_1_p6
    assign gnew_req = ioread004 & tmp10;
    
    // rtl_process:dut_gen_busy_r_4/dut_gen_busy_r_4_thread_1_p5
    assign tmp10 = ioread003 | tmp9;
    
    // rtl_process:dut_gen_busy_r_4/dut_gen_busy_r_4_thread_1_p4
    assign tmp9 = in1;
    
    // rtl_process:dut_gen_busy_r_4/dut_gen_busy_r_4_thread_1_p3
    assign ioread004 = in2;
    
    // rtl_process:dut_gen_busy_r_4/dut_gen_busy_r_4_thread_1_p2
    assign ioread003 = in3;

endmodule


