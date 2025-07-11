`timescale 1ps / 1ps

// Generated by Cadence Genus(TM) Synthesis Solution 21.15-s080_1
// Generated on: Jun  9 2025 16:46:23 CST (Jun  9 2025 08:46:23 UTC)

module dut_GreaterThanEQ_3Ux8U_1U_1(in2, in1, out1);
  input [2:0] in2;
  input [7:0] in1;
  output out1;
  wire [2:0] in2;
  wire [7:0] in1;
  wire out1;
  wire gte_16_35_n_0, gte_16_35_n_1, gte_16_35_n_2, gte_16_35_n_3,
       gte_16_35_n_4, gte_16_35_n_5, gte_16_35_n_6, gte_16_35_n_7;
  wire gte_16_35_n_8, gte_16_35_n_9, gte_16_35_n_10, gte_16_35_n_11;
  AOI21X2 gte_16_35_g126(.A0 (gte_16_35_n_9), .A1 (gte_16_35_n_11), .B0
       (gte_16_35_n_7), .Y (out1));
  OAI21X2 gte_16_35_g127(.A0 (gte_16_35_n_0), .A1 (gte_16_35_n_8), .B0
       (gte_16_35_n_10), .Y (gte_16_35_n_11));
  AOI21X1 gte_16_35_g128(.A0 (in1[2]), .A1 (gte_16_35_n_3), .B0
       (in1[3]), .Y (gte_16_35_n_10));
  NAND2BX1 gte_16_35_g129(.AN (in1[3]), .B (gte_16_35_n_5), .Y
       (gte_16_35_n_9));
  NOR2X1 gte_16_35_g130(.A (gte_16_35_n_1), .B (gte_16_35_n_2), .Y
       (gte_16_35_n_8));
  NAND2X1 gte_16_35_g131(.A (gte_16_35_n_4), .B (gte_16_35_n_6), .Y
       (gte_16_35_n_7));
  NOR2X1 gte_16_35_g134(.A (in1[5]), .B (in1[4]), .Y (gte_16_35_n_6));
  NOR2X1 gte_16_35_g135(.A (gte_16_35_n_3), .B (in1[2]), .Y
       (gte_16_35_n_5));
  NOR2X1 gte_16_35_g137(.A (in1[7]), .B (in1[6]), .Y (gte_16_35_n_4));
  INVX1 gte_16_35_g140(.A (in2[2]), .Y (gte_16_35_n_3));
  NOR2BX1 gte_16_35_g2(.AN (in1[0]), .B (in2[0]), .Y (gte_16_35_n_2));
  NOR2BX1 gte_16_35_g142(.AN (in1[1]), .B (in2[1]), .Y (gte_16_35_n_1));
  NOR2BX1 gte_16_35_g143(.AN (in2[1]), .B (in1[1]), .Y (gte_16_35_n_0));
endmodule


