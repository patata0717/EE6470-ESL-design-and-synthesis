// Generated by stratus_hls 23.02-s004  (100793.100415)
// Mon Jun  9 13:25:00 2025
// from dut.cc

`timescale 1ps / 1ps


module dut_Add_10S_5_4( in1, out1 );

    input [8:0] in1;
    output [9:0] out1;

    
    // rtl_process:dut_Add_10S_5_4/dut_Add_10S_5_4_thread_1
    assign out1 = {in1[8], in1} + 10'd0001;

endmodule


