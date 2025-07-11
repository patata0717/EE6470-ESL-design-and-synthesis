`timescale 1ps / 1ps

// Generated by Cadence Genus(TM) Synthesis Solution 21.15-s080_1
// Generated on: Jun  9 2025 16:46:22 CST (Jun  9 2025 08:46:22 UTC)

module dut_OrReduction_5U_1U_1(in1, out1);
  input [4:0] in1;
  output out1;
  wire [4:0] in1;
  wire out1;
  wire n_0, n_1;
  NAND2X2 g8(.A (n_0), .B (n_1), .Y (out1));
  NOR3X6 g9(.A (in1[1]), .B (in1[4]), .C (in1[0]), .Y (n_1));
  NOR2X1 g10(.A (in1[3]), .B (in1[2]), .Y (n_0));
endmodule


