`timescale 1ps / 1ps

// Generated by Cadence Genus(TM) Synthesis Solution 21.15-s080_1
// Generated on: Jun  9 2025 16:46:50 CST (Jun  9 2025 08:46:50 UTC)

module dut_GreaterThanEQ_1U_72_1(in1, out1);
  input [7:0] in1;
  output out1;
  wire [7:0] in1;
  wire out1;
  wire gte_15_26_n_1, gte_15_26_n_3, gte_15_26_n_4, n_14;
  OAI21X2 gte_15_26_g117(.A0 (n_14), .A1 (gte_15_26_n_4), .B0
       (gte_15_26_n_1), .Y (out1));
  NAND2BX4 gte_15_26_g118(.AN (in1[7]), .B (gte_15_26_n_3), .Y
       (gte_15_26_n_4));
  NOR2X6 gte_15_26_g120(.A (in1[5]), .B (in1[4]), .Y (gte_15_26_n_3));
  OR2XL gte_15_26_g122(.A (in1[7]), .B (in1[6]), .Y (gte_15_26_n_1));
  BUFX2 g2(.A (in1[3]), .Y (n_14));
endmodule


