`timescale 1ps / 1ps

// Generated by Cadence Genus(TM) Synthesis Solution 21.15-s080_1
// Generated on: Jun  9 2025 16:45:08 CST (Jun  9 2025 08:45:08 UTC)

module dut_GreaterThanEQ_1U_110_4(in1, out1);
  input [7:0] in1;
  output out1;
  wire [7:0] in1;
  wire out1;
  wire gte_15_26_n_0, gte_15_26_n_1, gte_15_26_n_2;
  OAI22X1 gte_15_26_g104(.A0 (gte_15_26_n_2), .A1 (gte_15_26_n_1), .B0
       (in1[4]), .B1 (gte_15_26_n_2), .Y (out1));
  OR3XL gte_15_26_g105(.A (in1[5]), .B (in1[7]), .C (in1[6]), .Y
       (gte_15_26_n_2));
  OAI2BB1X1 gte_15_26_g106(.A0N (in1[1]), .A1N (in1[0]), .B0
       (gte_15_26_n_0), .Y (gte_15_26_n_1));
  NOR2X1 gte_15_26_g107(.A (in1[3]), .B (in1[2]), .Y (gte_15_26_n_0));
endmodule


