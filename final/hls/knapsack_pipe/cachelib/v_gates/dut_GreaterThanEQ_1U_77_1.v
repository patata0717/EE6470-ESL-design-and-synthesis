`timescale 1ps / 1ps

// Generated by Cadence Genus(TM) Synthesis Solution 21.15-s080_1
// Generated on: Jun  9 2025 16:46:52 CST (Jun  9 2025 08:46:52 UTC)

module dut_GreaterThanEQ_1U_77_1(in1, out1);
  input [7:0] in1;
  output out1;
  wire [7:0] in1;
  wire out1;
  wire gte_15_26_n_0, gte_15_26_n_1, gte_15_26_n_2;
  OAI21X1 gte_15_26_g115(.A0 (in1[7]), .A1 (in1[6]), .B0
       (gte_15_26_n_2), .Y (out1));
  NAND2X2 gte_15_26_g116(.A (gte_15_26_n_0), .B (gte_15_26_n_1), .Y
       (gte_15_26_n_2));
  NOR3X6 gte_15_26_g117(.A (in1[7]), .B (in1[5]), .C (in1[4]), .Y
       (gte_15_26_n_1));
  NOR2X1 gte_15_26_g118(.A (in1[3]), .B (in1[2]), .Y (gte_15_26_n_0));
endmodule


