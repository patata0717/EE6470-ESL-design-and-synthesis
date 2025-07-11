`timescale 1ps / 1ps

// Generated by Cadence Genus(TM) Synthesis Solution 21.15-s080_1
// Generated on: Jun  9 2025 16:47:12 CST (Jun  9 2025 08:47:12 UTC)

module dut_GreaterThanEQ_1U_148_1(in1, out1);
  input [7:0] in1;
  output out1;
  wire [7:0] in1;
  wire out1;
  wire gte_15_26_n_0, gte_15_26_n_1, gte_15_26_n_2, gte_15_26_n_3;
  NOR2BX2 gte_15_26_g112(.AN (gte_15_26_n_1), .B (gte_15_26_n_3), .Y
       (out1));
  NAND2X4 gte_15_26_g113(.A (gte_15_26_n_0), .B (gte_15_26_n_2), .Y
       (gte_15_26_n_3));
  NOR2X4 gte_15_26_g114(.A (in1[5]), .B (in1[4]), .Y (gte_15_26_n_2));
  NAND2X1 gte_15_26_g115(.A (in1[3]), .B (in1[2]), .Y (gte_15_26_n_1));
  NOR2X8 gte_15_26_g116(.A (in1[7]), .B (in1[6]), .Y (gte_15_26_n_0));
endmodule


