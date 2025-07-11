`timescale 1ps / 1ps

// Generated by Cadence Genus(TM) Synthesis Solution 21.15-s080_1
// Generated on: Jun  4 2025 00:40:09 CST (Jun  3 2025 16:40:09 UTC)

module dut_GreaterThanEQ_16Ux8U_1U_1(in2, in1, out1);
  input [15:0] in2;
  input [7:0] in1;
  output out1;
  wire [15:0] in2;
  wire [7:0] in1;
  wire out1;
  wire gte_16_23_n_0, gte_16_23_n_1, gte_16_23_n_2, gte_16_23_n_3,
       gte_16_23_n_4, gte_16_23_n_5, gte_16_23_n_6, gte_16_23_n_7;
  wire gte_16_23_n_8, gte_16_23_n_9, gte_16_23_n_10, gte_16_23_n_11,
       gte_16_23_n_12, gte_16_23_n_13, gte_16_23_n_14, gte_16_23_n_15;
  wire gte_16_23_n_16, gte_16_23_n_17, gte_16_23_n_18, gte_16_23_n_19,
       gte_16_23_n_20, gte_16_23_n_21, gte_16_23_n_22, gte_16_23_n_23;
  wire gte_16_23_n_24, gte_16_23_n_25, gte_16_23_n_26, gte_16_23_n_27,
       gte_16_23_n_28, gte_16_23_n_29, gte_16_23_n_30, gte_16_23_n_31;
  wire gte_16_23_n_32, gte_16_23_n_33, gte_16_23_n_34, gte_16_23_n_35,
       gte_16_23_n_36;
  NAND2X1 gte_16_23_g286(.A (gte_16_23_n_36), .B (gte_16_23_n_35), .Y
       (out1));
  OAI21X1 gte_16_23_g287(.A0 (gte_16_23_n_28), .A1 (gte_16_23_n_32),
       .B0 (gte_16_23_n_26), .Y (gte_16_23_n_36));
  NOR2X1 gte_16_23_g288(.A (gte_16_23_n_34), .B (gte_16_23_n_33), .Y
       (gte_16_23_n_35));
  NOR2X1 gte_16_23_g289(.A (gte_16_23_n_25), .B (gte_16_23_n_27), .Y
       (gte_16_23_n_34));
  NAND2X1 gte_16_23_g290(.A (gte_16_23_n_31), .B (gte_16_23_n_30), .Y
       (gte_16_23_n_33));
  NOR2X1 gte_16_23_g291(.A (gte_16_23_n_22), .B (gte_16_23_n_29), .Y
       (gte_16_23_n_32));
  AOI21X2 gte_16_23_g292(.A0 (gte_16_23_n_13), .A1 (gte_16_23_n_0), .B0
       (gte_16_23_n_5), .Y (gte_16_23_n_31));
  NOR2X1 gte_16_23_g293(.A (gte_16_23_n_23), .B (gte_16_23_n_20), .Y
       (gte_16_23_n_30));
  AOI21X1 gte_16_23_g294(.A0 (gte_16_23_n_18), .A1 (gte_16_23_n_3), .B0
       (gte_16_23_n_16), .Y (gte_16_23_n_29));
  NAND2X1 gte_16_23_g295(.A (gte_16_23_n_17), .B (gte_16_23_n_21), .Y
       (gte_16_23_n_28));
  AOI21X1 gte_16_23_g296(.A0 (gte_16_23_n_4), .A1 (gte_16_23_n_14), .B0
       (gte_16_23_n_19), .Y (gte_16_23_n_27));
  NOR2X1 gte_16_23_g297(.A (gte_16_23_n_24), .B (gte_16_23_n_25), .Y
       (gte_16_23_n_26));
  OAI2BB1X1 gte_16_23_g298(.A0N (in1[6]), .A1N (gte_16_23_n_9), .B0
       (gte_16_23_n_0), .Y (gte_16_23_n_25));
  OAI2BB1X1 gte_16_23_g299(.A0N (in1[4]), .A1N (gte_16_23_n_7), .B0
       (gte_16_23_n_4), .Y (gte_16_23_n_24));
  OAI2BB1X1 gte_16_23_g300(.A0N (in2[7]), .A1N (gte_16_23_n_8), .B0
       (gte_16_23_n_12), .Y (gte_16_23_n_23));
  NAND2X1 gte_16_23_g301(.A (gte_16_23_n_1), .B (gte_16_23_n_10), .Y
       (gte_16_23_n_22));
  NAND2X1 gte_16_23_g302(.A (gte_16_23_n_1), .B (gte_16_23_n_2), .Y
       (gte_16_23_n_21));
  NAND2X1 gte_16_23_g303(.A (gte_16_23_n_11), .B (gte_16_23_n_15), .Y
       (gte_16_23_n_20));
  NOR2BX1 gte_16_23_g304(.AN (in2[5]), .B (in1[5]), .Y
       (gte_16_23_n_19));
  NAND2X1 gte_16_23_g305(.A (in1[1]), .B (gte_16_23_n_6), .Y
       (gte_16_23_n_18));
  NAND2BXL gte_16_23_g307(.AN (in1[3]), .B (in2[3]), .Y
       (gte_16_23_n_17));
  NOR2X1 gte_16_23_g308(.A (gte_16_23_n_6), .B (in1[1]), .Y
       (gte_16_23_n_16));
  NOR2X1 gte_16_23_g309(.A (in2[9]), .B (in2[8]), .Y (gte_16_23_n_15));
  NOR2X1 gte_16_23_g310(.A (gte_16_23_n_7), .B (in1[4]), .Y
       (gte_16_23_n_14));
  NOR2X1 gte_16_23_g312(.A (gte_16_23_n_9), .B (in1[6]), .Y
       (gte_16_23_n_13));
  NOR2X2 gte_16_23_g313(.A (in2[13]), .B (in2[12]), .Y
       (gte_16_23_n_12));
  NOR2X1 gte_16_23_g315(.A (in2[15]), .B (in2[14]), .Y
       (gte_16_23_n_11));
  NAND2BX1 gte_16_23_g317(.AN (in2[2]), .B (in1[2]), .Y
       (gte_16_23_n_10));
  INVX1 gte_16_23_g322(.A (in2[6]), .Y (gte_16_23_n_9));
  INVX1 gte_16_23_g324(.A (in1[7]), .Y (gte_16_23_n_8));
  INVX1 gte_16_23_g326(.A (in2[4]), .Y (gte_16_23_n_7));
  INVX1 gte_16_23_g327(.A (in2[1]), .Y (gte_16_23_n_6));
  OR2XL gte_16_23_g2(.A (in2[11]), .B (in2[10]), .Y (gte_16_23_n_5));
  NAND2BX1 gte_16_23_g331(.AN (in2[5]), .B (in1[5]), .Y
       (gte_16_23_n_4));
  NAND2BX1 gte_16_23_g332(.AN (in2[0]), .B (in1[0]), .Y
       (gte_16_23_n_3));
  NOR2BX1 gte_16_23_g333(.AN (in2[2]), .B (in1[2]), .Y (gte_16_23_n_2));
  NAND2BX4 gte_16_23_g334(.AN (in2[3]), .B (in1[3]), .Y
       (gte_16_23_n_1));
  NAND2BX4 gte_16_23_g335(.AN (in2[7]), .B (in1[7]), .Y
       (gte_16_23_n_0));
endmodule


