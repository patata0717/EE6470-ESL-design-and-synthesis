`timescale 1ps / 1ps

// Generated by Cadence Genus(TM) Synthesis Solution 21.15-s080_1
// Generated on: Jun  4 2025 00:51:35 CST (Jun  3 2025 16:51:35 UTC)

module dut_Equal_1U_41_1(in1, out1);
  input [6:0] in1;
  output out1;
  wire [6:0] in1;
  wire out1;
  wire n_0, n_1, n_2, n_3, n_4, n_5, n_6, n_7;
  NOR2X2 g58(.A (n_6), .B (n_7), .Y (out1));
  NAND2X4 g60(.A (n_5), .B (n_4), .Y (n_7));
  NAND2X2 g59(.A (in1[4]), .B (n_3), .Y (n_6));
  NOR2X6 g62(.A (n_1), .B (n_0), .Y (n_5));
  NOR2X4 g63(.A (in1[1]), .B (n_2), .Y (n_4));
  NOR2X2 g61(.A (in1[6]), .B (in1[5]), .Y (n_3));
  CLKINVX3 g65(.A (in1[0]), .Y (n_2));
  CLKINVX12 g64(.A (in1[3]), .Y (n_1));
  CLKINVX4 g66(.A (in1[2]), .Y (n_0));
endmodule


