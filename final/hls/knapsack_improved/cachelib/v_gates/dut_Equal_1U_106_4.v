`timescale 1ps / 1ps

// Generated by Cadence Genus(TM) Synthesis Solution 21.15-s080_1
// Generated on: Jun  4 2025 00:51:02 CST (Jun  3 2025 16:51:02 UTC)

module dut_Equal_1U_106_4(in1, out1);
  input [6:0] in1;
  output out1;
  wire [6:0] in1;
  wire out1;
  wire n_0, n_1, n_2;
  NOR2XL g23(.A (n_1), .B (n_2), .Y (out1));
  NAND4XL g24(.A (in1[5]), .B (n_0), .C (in1[1]), .D (in1[0]), .Y
       (n_2));
  NAND2X1 g25(.A (in1[4]), .B (in1[3]), .Y (n_1));
  NOR2X1 g26(.A (in1[6]), .B (in1[2]), .Y (n_0));
endmodule


