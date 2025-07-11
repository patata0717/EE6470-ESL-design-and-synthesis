`timescale 1ps / 1ps

// Generated by Cadence Genus(TM) Synthesis Solution 21.15-s080_1
// Generated on: Jun  4 2025 00:51:48 CST (Jun  3 2025 16:51:48 UTC)

module dut_Equal_1U_75_1(in1, out1);
  input [6:0] in1;
  output out1;
  wire [6:0] in1;
  wire out1;
  wire n_0, n_1, n_2, n_3, n_4, n_5, n_6, n_7;
  NOR2X2 g53(.A (n_6), .B (n_7), .Y (out1));
  NAND2X4 g55(.A (n_5), .B (n_4), .Y (n_7));
  NAND3X4 g54(.A (in1[4]), .B (in1[6]), .C (n_2), .Y (n_6));
  NOR2X6 g56(.A (n_3), .B (n_1), .Y (n_5));
  NOR2X4 g57(.A (in1[3]), .B (n_0), .Y (n_4));
  CLKINVX12 g58(.A (in1[1]), .Y (n_3));
  CLKINVX3 g59(.A (in1[5]), .Y (n_2));
  CLKINVX4 g61(.A (in1[0]), .Y (n_1));
  CLKINVX3 g60(.A (in1[2]), .Y (n_0));
endmodule


