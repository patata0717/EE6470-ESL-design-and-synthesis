// Generated by stratus_hls 23.02-s004  (100793.100415)
// Mon Jun  9 16:22:24 2025
// from dut.cc

`timescale 1ps / 1ps


module dut_Add_9Sx1U_10S_1( in2, in1, out1 );

    input [8:0] in2;
    input in1;
    output [9:0] out1;

    
    // rtl_process:dut_Add_9Sx1U_10S_1/dut_Add_9Sx1U_10S_1_thread_1
    assign out1 = {in2[8], in2} + {9'b000000000, in1};

endmodule


