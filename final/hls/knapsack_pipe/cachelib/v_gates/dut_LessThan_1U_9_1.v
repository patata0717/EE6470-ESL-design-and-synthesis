`timescale 1ps / 1ps

// Generated by Cadence Genus(TM) Synthesis Solution 21.15-s080_1
// Generated on: Jun  9 2025 16:46:28 CST (Jun  9 2025 08:46:28 UTC)

module dut_LessThan_1U_9_1(in1, out1);
  input [7:0] in1;
  output out1;
  wire [7:0] in1;
  wire out1;
  wire lt_15_26_n_0, lt_15_26_n_2, n_12;
  AOI21X2 lt_15_26_g111(.A0 (lt_15_26_n_0), .A1 (lt_15_26_n_2), .B0
       (n_12), .Y (out1));
  NOR3X6 lt_15_26_g112(.A (in1[1]), .B (in1[3]), .C (in1[2]), .Y
       (lt_15_26_n_2));
  NOR2X1 lt_15_26_g114(.A (in1[7]), .B (in1[4]), .Y (lt_15_26_n_0));
  AOI21X2 g2(.A0 (in1[5]), .A1 (in1[6]), .B0 (in1[7]), .Y (n_12));
endmodule


