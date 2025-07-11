`timescale 1ps / 1ps

// Generated by Cadence Genus(TM) Synthesis Solution 21.15-s080_1
// Generated on: Jun  4 2025 00:51:39 CST (Jun  3 2025 16:51:39 UTC)

module dut_Equal_1U_54_1(in1, out1);
  input [6:0] in1;
  output out1;
  wire [6:0] in1;
  wire out1;
  wire n_0, n_1, n_2, n_3, n_4, n_5, n_6, n_7;
  NOR2X2 g42(.A (n_7), .B (n_6), .Y (out1));
  NAND2BX4 g43(.AN (in1[3]), .B (n_5), .Y (n_7));
  NAND2X4 g44(.A (n_4), .B (n_3), .Y (n_6));
  NOR2X8 g45(.A (in1[4]), .B (n_0), .Y (n_5));
  NOR2X6 g46(.A (in1[6]), .B (n_2), .Y (n_4));
  NOR2X4 g47(.A (in1[1]), .B (n_1), .Y (n_3));
  CLKINVX12 g48(.A (in1[2]), .Y (n_2));
  CLKINVX20 g49(.A (in1[0]), .Y (n_1));
  CLKINVX12 g50(.A (in1[5]), .Y (n_0));
endmodule


