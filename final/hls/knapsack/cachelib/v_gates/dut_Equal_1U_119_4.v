`timescale 1ps / 1ps

// Generated by Cadence Genus(TM) Synthesis Solution 21.15-s080_1
// Generated on: Jun  4 2025 00:51:07 CST (Jun  3 2025 16:51:07 UTC)

module dut_Equal_1U_119_4(in1, out1);
  input [6:0] in1;
  output out1;
  wire [6:0] in1;
  wire out1;
  wire n_0, n_1;
  NOR4BBX1 g25(.AN (in1[4]), .BN (in1[5]), .C (in1[3]), .D (n_1), .Y
       (out1));
  OR4X1 g26(.A (n_0), .B (in1[1]), .C (in1[6]), .D (in1[2]), .Y (n_1));
  INVX1 g27(.A (in1[0]), .Y (n_0));
endmodule


