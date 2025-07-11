`timescale 1ps / 1ps

// Generated by Cadence Genus(TM) Synthesis Solution 21.15-s080_1
// Generated on: Jun  9 2025 16:47:30 CST (Jun  9 2025 08:47:30 UTC)

module dut_LessThan_1U_214_1(in1, out1);
  input [7:0] in1;
  output out1;
  wire [7:0] in1;
  wire out1;
  wire lt_15_26_n_0, lt_15_26_n_1, lt_15_26_n_2, lt_15_26_n_3,
       lt_15_26_n_4, lt_15_26_n_5;
  AOI21X1 lt_15_26_g112(.A0 (lt_15_26_n_3), .A1 (lt_15_26_n_4), .B0
       (lt_15_26_n_5), .Y (out1));
  NOR2X1 lt_15_26_g113(.A (in1[5]), .B (lt_15_26_n_2), .Y
       (lt_15_26_n_5));
  NOR2X2 lt_15_26_g114(.A (in1[4]), .B (lt_15_26_n_2), .Y
       (lt_15_26_n_4));
  NAND3X1 lt_15_26_g115(.A (in1[1]), .B (in1[3]), .C (in1[2]), .Y
       (lt_15_26_n_3));
  NAND2X4 lt_15_26_g116(.A (lt_15_26_n_0), .B (lt_15_26_n_1), .Y
       (lt_15_26_n_2));
  CLKINVX3 lt_15_26_g117(.A (in1[6]), .Y (lt_15_26_n_1));
  CLKINVX12 lt_15_26_g118(.A (in1[7]), .Y (lt_15_26_n_0));
endmodule


