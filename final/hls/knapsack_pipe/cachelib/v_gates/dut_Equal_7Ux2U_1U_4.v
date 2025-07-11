`timescale 1ps / 1ps

// Generated by Cadence Genus(TM) Synthesis Solution 21.15-s080_1
// Generated on: Jun  4 2025 00:50:21 CST (Jun  3 2025 16:50:21 UTC)

module dut_Equal_7Ux2U_1U_4(in2, in1, out1);
  input [6:0] in2;
  input [1:0] in1;
  output out1;
  wire [6:0] in2;
  wire [1:0] in1;
  wire out1;
  wire n_0, n_1, n_2;
  NOR4X1 g63(.A (in2[5]), .B (in2[4]), .C (in2[6]), .D (n_2), .Y
       (out1));
  OR4X1 g64(.A (in2[3]), .B (in2[2]), .C (n_0), .D (n_1), .Y (n_2));
  XOR2XL g65(.A (in2[0]), .B (in1[0]), .Y (n_1));
  XOR2XL g66(.A (in2[1]), .B (in1[1]), .Y (n_0));
endmodule


