`timescale 1ps / 1ps

// Generated by Cadence Genus(TM) Synthesis Solution 21.15-s080_1
// Generated on: Jun  9 2025 16:46:19 CST (Jun  9 2025 08:46:19 UTC)

module dut_OrReduction_2U_1U_1(in1, out1);
  input [1:0] in1;
  output out1;
  wire [1:0] in1;
  wire out1;
  wire n_0, n_1;
  NAND2X2 g4(.A (n_0), .B (n_1), .Y (out1));
  INVX2 g5(.A (in1[0]), .Y (n_1));
  CLKINVX4 g6(.A (in1[1]), .Y (n_0));
endmodule


