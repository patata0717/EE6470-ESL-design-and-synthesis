`timescale 1ps / 1ps

// Generated by Cadence Genus(TM) Synthesis Solution 21.15-s080_1
// Generated on: Jun  4 2025 00:50:45 CST (Jun  3 2025 16:50:45 UTC)

module dut_Equal_1U_66_4(in1, out1);
  input [6:0] in1;
  output out1;
  wire [6:0] in1;
  wire out1;
  wire n_0;
  AND4XL g40(.A (in1[2]), .B (in1[1]), .C (in1[0]), .D (n_0), .Y
       (out1));
  NOR4BBX1 g41(.AN (in1[3]), .BN (in1[6]), .C (in1[4]), .D (in1[5]), .Y
       (n_0));
endmodule


