`timescale 1ps / 1ps

// Generated by Cadence Genus(TM) Synthesis Solution 21.15-s080_1
// Generated on: Jun  4 2025 00:51:24 CST (Jun  3 2025 16:51:24 UTC)

module dut_Equal_1U_5_1(in1, out1);
  input [6:0] in1;
  output out1;
  wire [6:0] in1;
  wire out1;
  wire n_0, n_1, n_2, n_3;
  NOR3X4 g17(.A (n_2), .B (in1[2]), .C (n_3), .Y (out1));
  NAND2X4 g18(.A (n_1), .B (n_0), .Y (n_3));
  NAND2X2 g20(.A (in1[1]), .B (in1[0]), .Y (n_2));
  NOR2X8 g19(.A (in1[6]), .B (in1[5]), .Y (n_1));
  NOR2X4 g21(.A (in1[4]), .B (in1[3]), .Y (n_0));
endmodule


