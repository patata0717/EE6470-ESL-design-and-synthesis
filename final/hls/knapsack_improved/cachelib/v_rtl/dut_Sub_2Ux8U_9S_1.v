// Generated by stratus_hls 23.02-s004  (100793.100415)
// Wed Jun  4 00:42:39 2025
// from dut.cc

`timescale 1ps / 1ps


module dut_Sub_2Ux8U_9S_1( in2, in1, out1 );

    input [1:0] in2;
    input [7:0] in1;
    output [8:0] out1;

    
    // rtl_process:dut_Sub_2Ux8U_9S_1/dut_Sub_2Ux8U_9S_1_thread_1
    assign out1 = {7'b0000000, in2} - {1'b0, in1};

endmodule


