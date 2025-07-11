`timescale 1ps / 1ps

// Generated by Cadence Genus(TM) Synthesis Solution 21.15-s080_1
// Generated on: Jun  9 2025 16:47:28 CST (Jun  9 2025 08:47:28 UTC)

module dut_LessThan_1U_208_1(in1, out1);
  input [7:0] in1;
  output out1;
  wire [7:0] in1;
  wire out1;
  wire lt_15_26_n_0, lt_15_26_n_1, lt_15_26_n_2, lt_15_26_n_3,
       lt_15_26_n_4, lt_15_26_n_5;
  NOR2X1 lt_15_26_g110(.A (lt_15_26_n_0), .B (lt_15_26_n_5), .Y (out1));
  NOR2X1 lt_15_26_g111(.A (lt_15_26_n_3), .B (lt_15_26_n_4), .Y
       (lt_15_26_n_5));
  NOR2BX2 lt_15_26_g112(.AN (in1[3]), .B (lt_15_26_n_2), .Y
       (lt_15_26_n_4));
  NAND2BX1 lt_15_26_g113(.AN (in1[4]), .B (lt_15_26_n_1), .Y
       (lt_15_26_n_3));
  AOI21X4 lt_15_26_g115(.A0 (in1[1]), .A1 (in1[0]), .B0 (in1[2]), .Y
       (lt_15_26_n_2));
  NOR2X4 lt_15_26_g117(.A (in1[7]), .B (in1[6]), .Y (lt_15_26_n_1));
  NOR2BX1 lt_15_26_g2(.AN (lt_15_26_n_1), .B (in1[5]), .Y
       (lt_15_26_n_0));
endmodule


