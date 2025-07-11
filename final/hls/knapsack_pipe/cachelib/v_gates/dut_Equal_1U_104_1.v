`timescale 1ps / 1ps

// Generated by Cadence Genus(TM) Synthesis Solution 21.15-s080_1
// Generated on: Jun  4 2025 00:52:01 CST (Jun  3 2025 16:52:01 UTC)

module dut_Equal_1U_104_1(in1, out1);
  input [6:0] in1;
  output out1;
  wire [6:0] in1;
  wire out1;
  wire n_0, n_1, n_2, n_3, n_4, n_5;
  NOR2X1 g39(.A (n_3), .B (n_5), .Y (out1));
  NAND2X1 g41(.A (n_4), .B (n_2), .Y (n_5));
  NOR2X4 g42(.A (in1[6]), .B (n_1), .Y (n_4));
  NAND3X2 g40(.A (in1[5]), .B (in1[4]), .C (in1[3]), .Y (n_3));
  NOR2X2 g43(.A (in1[1]), .B (n_0), .Y (n_2));
  CLKINVX12 g44(.A (in1[2]), .Y (n_1));
  CLKINVX20 g45(.A (in1[0]), .Y (n_0));
endmodule


