// Generated by stratus_hls 23.02-s004  (100793.100415)
// Mon Jun  9 16:22:24 2025
// from dut.cc

`timescale 1ps / 1ps


module dut_N_Muxb_1_2_29_1( in3, in2, ctrl1, out1 );

    input in3;
    input in2;
    input ctrl1;
    output out1;
    reg out1;

    
    // rtl_process:dut_N_Muxb_1_2_29_1/dut_N_Muxb_1_2_29_1_thread_1
    always @*
      begin : dut_N_Muxb_1_2_29_1_thread_1
        case (ctrl1) 
          1'b1: 
            begin
              out1 = in2;
            end
          default: 
            begin
              out1 = in3;
            end
        endcase
      end

endmodule


