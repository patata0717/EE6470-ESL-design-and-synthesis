`timescale 1ps / 1ps

// Generated by Cadence Genus(TM) Synthesis Solution 21.15-s080_1
// Generated on: Jun  4 2025 00:51:21 CST (Jun  3 2025 16:51:21 UTC)

module dut_Equal_7Ux3U_1U_1(in2, in1, out1);
  input [6:0] in2;
  input [2:0] in1;
  output out1;
  wire [6:0] in2;
  wire [2:0] in1;
  wire out1;
  wire n_0, n_1, n_2, n_3, n_4, n_5, n_6, n_7;
  wire n_8, n_9, n_10, n_11, n_12, n_13, n_14, n_15;
  wire n_16;
  NOR4X2 g63(.A (n_15), .B (n_14), .C (in2[3]), .D (n_16), .Y (out1));
  NAND2X2 g64(.A (n_12), .B (n_13), .Y (n_16));
  NOR2X1 g68(.A (n_7), .B (n_11), .Y (n_15));
  NOR2X1 g66(.A (n_8), .B (n_10), .Y (n_14));
  NAND2X1 g67(.A (n_6), .B (n_9), .Y (n_13));
  NOR3X4 g65(.A (in2[4]), .B (in2[6]), .C (in2[5]), .Y (n_12));
  NOR2X4 g69(.A (n_2), .B (n_1), .Y (n_11));
  NOR2X2 g70(.A (n_5), .B (n_0), .Y (n_10));
  NAND2X2 g72(.A (n_4), .B (n_3), .Y (n_9));
  NOR2X1 g73(.A (in2[1]), .B (in1[1]), .Y (n_8));
  NOR2X2 g74(.A (in2[2]), .B (in1[2]), .Y (n_7));
  NAND2X1 g71(.A (in2[0]), .B (in1[0]), .Y (n_6));
  CLKINVX3 g79(.A (in2[1]), .Y (n_5));
  CLKINVX4 g78(.A (in2[0]), .Y (n_4));
  INVX2 g76(.A (in1[0]), .Y (n_3));
  CLKINVX12 g77(.A (in2[2]), .Y (n_2));
  CLKINVX3 g80(.A (in1[2]), .Y (n_1));
  INVX2 g75(.A (in1[1]), .Y (n_0));
endmodule


