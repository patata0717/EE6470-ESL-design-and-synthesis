`timescale 1ps / 1ps

// Generated by Cadence Genus(TM) Synthesis Solution 21.15-s080_1
// Generated on: Jun  9 2025 16:46:55 CST (Jun  9 2025 08:46:55 UTC)

module dut_GreaterThanEQ_1U_86_1(in1, out1);
  input [7:0] in1;
  output out1;
  wire [7:0] in1;
  wire out1;
  wire gte_15_26_n_0, gte_15_26_n_1, gte_15_26_n_2, gte_15_26_n_3,
       gte_15_26_n_4, gte_15_26_n_5;
  OAI21X2 gte_15_26_g109(.A0 (gte_15_26_n_3), .A1 (gte_15_26_n_5), .B0
       (gte_15_26_n_4), .Y (out1));
  NAND2BX1 gte_15_26_g110(.AN (in1[5]), .B (gte_15_26_n_0), .Y
       (gte_15_26_n_5));
  NAND2X1 gte_15_26_g111(.A (gte_15_26_n_0), .B (gte_15_26_n_2), .Y
       (gte_15_26_n_4));
  NOR2BX2 gte_15_26_g112(.AN (in1[1]), .B (gte_15_26_n_1), .Y
       (gte_15_26_n_3));
  NOR2X1 gte_15_26_g113(.A (in1[5]), .B (in1[4]), .Y (gte_15_26_n_2));
  NAND2X4 gte_15_26_g114(.A (in1[3]), .B (in1[2]), .Y (gte_15_26_n_1));
  NOR2X2 gte_15_26_g115(.A (in1[7]), .B (in1[6]), .Y (gte_15_26_n_0));
endmodule


