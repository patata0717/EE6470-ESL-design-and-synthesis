`timescale 1ps / 1ps

// Generated by Cadence Genus(TM) Synthesis Solution 21.15-s080_1
// Generated on: Jun  4 2025 00:50:24 CST (Jun  3 2025 16:50:24 UTC)

module dut_Equal_1U_3_4(in1, out1);
  input [6:0] in1;
  output out1;
  wire [6:0] in1;
  wire out1;
  wire n_0, n_1;
  NOR4X1 g32(.A (n_0), .B (n_1), .C (in1[5]), .D (in1[4]), .Y (out1));
  OR3XL g33(.A (in1[6]), .B (in1[2]), .C (in1[1]), .Y (n_1));
  NAND2BX1 g34(.AN (in1[3]), .B (in1[0]), .Y (n_0));
endmodule


