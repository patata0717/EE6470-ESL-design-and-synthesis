`timescale 1ps / 1ps

// Generated by Cadence Genus(TM) Synthesis Solution 21.15-s080_1
// Generated on: Jun  4 2025 00:50:28 CST (Jun  3 2025 16:50:28 UTC)

module dut_Equal_1U_17_4(in1, out1);
  input [6:0] in1;
  output out1;
  wire [6:0] in1;
  wire out1;
  wire n_0;
  NOR4X1 g45(.A (in1[5]), .B (in1[4]), .C (in1[6]), .D (n_0), .Y
       (out1));
  NAND4BX1 g46(.AN (in1[2]), .B (in1[1]), .C (in1[0]), .D (in1[3]), .Y
       (n_0));
endmodule


