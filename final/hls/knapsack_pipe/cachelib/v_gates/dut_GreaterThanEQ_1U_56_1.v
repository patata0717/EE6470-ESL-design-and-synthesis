`timescale 1ps / 1ps

// Generated by Cadence Genus(TM) Synthesis Solution 21.15-s080_1
// Generated on: Jun  9 2025 16:46:45 CST (Jun  9 2025 08:46:45 UTC)

module dut_GreaterThanEQ_1U_56_1(in1, out1);
  input [7:0] in1;
  output out1;
  wire [7:0] in1;
  wire out1;
  wire gte_15_26_n_0, gte_15_26_n_1, gte_15_26_n_2, gte_15_26_n_3,
       gte_15_26_n_4, gte_15_26_n_5;
  OAI21X2 gte_15_26_g120(.A0 (gte_15_26_n_5), .A1 (gte_15_26_n_4), .B0
       (gte_15_26_n_3), .Y (out1));
  NAND2BX4 gte_15_26_g121(.AN (in1[7]), .B (gte_15_26_n_1), .Y
       (gte_15_26_n_5));
  NOR2X4 gte_15_26_g122(.A (gte_15_26_n_2), .B (gte_15_26_n_0), .Y
       (gte_15_26_n_4));
  OR2XL gte_15_26_g123(.A (in1[7]), .B (in1[6]), .Y (gte_15_26_n_3));
  NAND2X6 gte_15_26_g124(.A (in1[3]), .B (in1[2]), .Y (gte_15_26_n_2));
  NOR2X6 gte_15_26_g125(.A (in1[5]), .B (in1[4]), .Y (gte_15_26_n_1));
  NAND2X4 gte_15_26_g126(.A (in1[1]), .B (in1[0]), .Y (gte_15_26_n_0));
endmodule


