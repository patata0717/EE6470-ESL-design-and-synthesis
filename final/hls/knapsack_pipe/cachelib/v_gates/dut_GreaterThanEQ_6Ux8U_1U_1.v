`timescale 1ps / 1ps

// Generated by Cadence Genus(TM) Synthesis Solution 21.15-s080_1
// Generated on: Jun  9 2025 16:46:20 CST (Jun  9 2025 08:46:20 UTC)

module dut_GreaterThanEQ_6Ux8U_1U_1(in2, in1, out1);
  input [5:0] in2;
  input [7:0] in1;
  output out1;
  wire [5:0] in2;
  wire [7:0] in1;
  wire out1;
  wire gte_16_32_n_0, gte_16_32_n_1, gte_16_32_n_2, gte_16_32_n_3,
       gte_16_32_n_4, gte_16_32_n_5, gte_16_32_n_6, gte_16_32_n_7;
  wire gte_16_32_n_8, gte_16_32_n_9, gte_16_32_n_10, gte_16_32_n_11,
       gte_16_32_n_12, gte_16_32_n_13, gte_16_32_n_14, gte_16_32_n_15;
  wire gte_16_32_n_16, gte_16_32_n_17, gte_16_32_n_18, gte_16_32_n_19,
       gte_16_32_n_20, gte_16_32_n_21, gte_16_32_n_22;
  OAI21X1 gte_16_32_g128(.A0 (gte_16_32_n_2), .A1 (gte_16_32_n_22), .B0
       (gte_16_32_n_21), .Y (out1));
  NOR2X1 gte_16_32_g129(.A (gte_16_32_n_18), .B (gte_16_32_n_20), .Y
       (gte_16_32_n_22));
  OAI21X1 gte_16_32_g130(.A0 (gte_16_32_n_6), .A1 (gte_16_32_n_16), .B0
       (gte_16_32_n_9), .Y (gte_16_32_n_21));
  NOR2X1 gte_16_32_g131(.A (gte_16_32_n_17), .B (gte_16_32_n_19), .Y
       (gte_16_32_n_20));
  AOI21X1 gte_16_32_g132(.A0 (gte_16_32_n_1), .A1 (gte_16_32_n_14), .B0
       (gte_16_32_n_13), .Y (gte_16_32_n_19));
  NAND2X1 gte_16_32_g133(.A (gte_16_32_n_10), .B (gte_16_32_n_15), .Y
       (gte_16_32_n_18));
  NAND2X1 gte_16_32_g135(.A (gte_16_32_n_8), .B (gte_16_32_n_12), .Y
       (gte_16_32_n_17));
  NOR3BX1 gte_16_32_g136(.AN (in2[4]), .B (gte_16_32_n_0), .C (in1[4]),
       .Y (gte_16_32_n_16));
  NAND2X1 gte_16_32_g137(.A (gte_16_32_n_8), .B (gte_16_32_n_7), .Y
       (gte_16_32_n_15));
  NAND2X1 gte_16_32_g138(.A (in1[1]), .B (gte_16_32_n_3), .Y
       (gte_16_32_n_14));
  NOR2X1 gte_16_32_g139(.A (gte_16_32_n_3), .B (in1[1]), .Y
       (gte_16_32_n_13));
  NAND2X1 gte_16_32_g140(.A (in1[2]), .B (gte_16_32_n_5), .Y
       (gte_16_32_n_12));
  NAND2BXL gte_16_32_g141(.AN (in2[4]), .B (in1[4]), .Y
       (gte_16_32_n_11));
  NAND2BXL gte_16_32_g142(.AN (in1[3]), .B (in2[3]), .Y
       (gte_16_32_n_10));
  NOR2X1 gte_16_32_g144(.A (gte_16_32_n_5), .B (in1[2]), .Y
       (gte_16_32_n_7));
  NOR2BX1 gte_16_32_g146(.AN (in2[5]), .B (in1[5]), .Y (gte_16_32_n_6));
  NOR2X1 gte_16_32_g148(.A (in1[7]), .B (in1[6]), .Y (gte_16_32_n_9));
  NAND2X2 gte_16_32_g149(.A (in1[3]), .B (gte_16_32_n_4), .Y
       (gte_16_32_n_8));
  INVX1 gte_16_32_g151(.A (in2[2]), .Y (gte_16_32_n_5));
  INVX1 gte_16_32_g152(.A (in2[3]), .Y (gte_16_32_n_4));
  INVX1 gte_16_32_g154(.A (in2[1]), .Y (gte_16_32_n_3));
  NAND3BXL gte_16_32_g2(.AN (gte_16_32_n_0), .B (gte_16_32_n_9), .C
       (gte_16_32_n_11), .Y (gte_16_32_n_2));
  NAND2BX1 gte_16_32_g155(.AN (in2[0]), .B (in1[0]), .Y
       (gte_16_32_n_1));
  NOR2BX1 gte_16_32_g156(.AN (in1[5]), .B (in2[5]), .Y (gte_16_32_n_0));
endmodule


