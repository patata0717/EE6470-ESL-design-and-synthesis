// Generated by stratus_hls 23.02-s004  (100793.100415)
// Mon Jun  9 16:45:51 2025
// from dut.cc

`timescale 1ps / 1ps


module dut_Add_32Sx10U_32S_1( in2, in1, out1 );

    input [31:0] in2;
    input [9:0] in1;
    output [31:0] out1;

    
    // rtl_process:dut_Add_32Sx10U_32S_1/dut_Add_32Sx10U_32S_1_thread_1
    assign out1 = in2 + {22'b0000000000000000000000, in1};

endmodule


