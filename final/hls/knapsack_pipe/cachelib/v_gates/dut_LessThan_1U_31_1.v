`timescale 1ps / 1ps

// Generated by Cadence Genus(TM) Synthesis Solution 21.15-s080_1
// Generated on: Jun  9 2025 16:46:35 CST (Jun  9 2025 08:46:35 UTC)

module dut_LessThan_1U_31_1(in1, out1);
  input [7:0] in1;
  output out1;
  wire [7:0] in1;
  wire out1;
  wire lt_15_26_n_0, lt_15_26_n_2, lt_15_26_n_3, lt_15_26_n_4,
       lt_15_26_n_7, lt_15_26_n_8, n_18, n_19;
  NOR2X1 lt_15_26_g124(.A (lt_15_26_n_7), .B (lt_15_26_n_8), .Y (out1));
  NOR2X2 lt_15_26_g125(.A (lt_15_26_n_3), .B (n_19), .Y (lt_15_26_n_8));
  NAND2X1 lt_15_26_g126(.A (lt_15_26_n_2), .B (lt_15_26_n_4), .Y
       (lt_15_26_n_7));
  NAND2BX1 lt_15_26_g129(.AN (in1[7]), .B (lt_15_26_n_0), .Y
       (lt_15_26_n_4));
  OR2XL lt_15_26_g130(.A (in1[7]), .B (in1[5]), .Y (lt_15_26_n_3));
  OR2XL lt_15_26_g131(.A (in1[7]), .B (in1[6]), .Y (lt_15_26_n_2));
  NOR2X1 lt_15_26_g133(.A (in1[5]), .B (in1[4]), .Y (lt_15_26_n_0));
  NAND2BX4 g2(.AN (in1[3]), .B (n_18), .Y (n_19));
  OAI21X4 g3(.A0 (in1[1]), .A1 (in1[0]), .B0 (in1[2]), .Y (n_18));
endmodule


