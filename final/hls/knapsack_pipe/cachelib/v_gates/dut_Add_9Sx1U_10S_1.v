`timescale 1ps / 1ps

// Generated by Cadence Genus(TM) Synthesis Solution 21.15-s080_1
// Generated on: Jun  4 2025 00:40:23 CST (Jun  3 2025 16:40:23 UTC)

module dut_Add_9Sx1U_10S_1(in2, in1, out1);
  input [8:0] in2;
  input in1;
  output [9:0] out1;
  wire [8:0] in2;
  wire in1;
  wire [9:0] out1;
  wire inc_add_16_33_1_n_0, inc_add_16_33_1_n_2, inc_add_16_33_1_n_3,
       inc_add_16_33_1_n_4, inc_add_16_33_1_n_5, inc_add_16_33_1_n_6,
       inc_add_16_33_1_n_7, inc_add_16_33_1_n_8;
  wire inc_add_16_33_1_n_9, inc_add_16_33_1_n_10, inc_add_16_33_1_n_11,
       inc_add_16_33_1_n_12, inc_add_16_33_1_n_13,
       inc_add_16_33_1_n_14, inc_add_16_33_1_n_16, inc_add_16_33_1_n_17;
  wire inc_add_16_33_1_n_18, inc_add_16_33_1_n_20,
       inc_add_16_33_1_n_22, inc_add_16_33_1_n_23,
       inc_add_16_33_1_n_24, inc_add_16_33_1_n_25, n_43, n_48;
  wire n_50;
  MXI2XL inc_add_16_33_1_g92(.A (inc_add_16_33_1_n_7), .B (in2[5]), .S0
       (inc_add_16_33_1_n_24), .Y (out1[5]));
  MXI2XL inc_add_16_33_1_g93(.A (inc_add_16_33_1_n_6), .B (in2[3]), .S0
       (inc_add_16_33_1_n_0), .Y (out1[3]));
  MXI2XL inc_add_16_33_1_g94(.A (inc_add_16_33_1_n_5), .B (in2[8]), .S0
       (inc_add_16_33_1_n_23), .Y (out1[8]));
  MXI2XL inc_add_16_33_1_g95(.A (inc_add_16_33_1_n_3), .B (in2[7]), .S0
       (inc_add_16_33_1_n_22), .Y (out1[7]));
  MXI2XL inc_add_16_33_1_g96(.A (inc_add_16_33_1_n_2), .B (in2[6]), .S0
       (inc_add_16_33_1_n_25), .Y (out1[6]));
  NOR2X1 inc_add_16_33_1_g99(.A (inc_add_16_33_1_n_12), .B
       (inc_add_16_33_1_n_20), .Y (inc_add_16_33_1_n_25));
  NOR2X1 inc_add_16_33_1_g100(.A (inc_add_16_33_1_n_10), .B
       (inc_add_16_33_1_n_20), .Y (inc_add_16_33_1_n_24));
  NOR2X1 inc_add_16_33_1_g101(.A (inc_add_16_33_1_n_16), .B
       (inc_add_16_33_1_n_20), .Y (inc_add_16_33_1_n_23));
  NOR2X1 inc_add_16_33_1_g102(.A (inc_add_16_33_1_n_17), .B
       (inc_add_16_33_1_n_20), .Y (inc_add_16_33_1_n_22));
  MXI2XL inc_add_16_33_1_g103(.A (inc_add_16_33_1_n_9), .B (in2[2]),
       .S0 (n_50), .Y (out1[2]));
  NAND2X6 inc_add_16_33_1_g106(.A (inc_add_16_33_1_n_14), .B
       (inc_add_16_33_1_n_18), .Y (inc_add_16_33_1_n_20));
  MXI2XL inc_add_16_33_1_g108(.A (in2[1]), .B (inc_add_16_33_1_n_4),
       .S0 (n_48), .Y (out1[1]));
  NOR2X6 inc_add_16_33_1_g109(.A (inc_add_16_33_1_n_4), .B
       (inc_add_16_33_1_n_11), .Y (inc_add_16_33_1_n_18));
  OR2XL inc_add_16_33_1_g110(.A (inc_add_16_33_1_n_2), .B
       (inc_add_16_33_1_n_12), .Y (inc_add_16_33_1_n_17));
  OR2XL inc_add_16_33_1_g111(.A (inc_add_16_33_1_n_13), .B
       (inc_add_16_33_1_n_12), .Y (inc_add_16_33_1_n_16));
  MXI2XL inc_add_16_33_1_g112(.A (inc_add_16_33_1_n_8), .B (in2[0]),
       .S0 (in1), .Y (out1[0]));
  NOR2X4 inc_add_16_33_1_g113(.A (inc_add_16_33_1_n_6), .B
       (inc_add_16_33_1_n_9), .Y (inc_add_16_33_1_n_14));
  NAND2X4 inc_add_16_33_1_g114(.A (in2[7]), .B (in2[6]), .Y
       (inc_add_16_33_1_n_13));
  NAND2X4 inc_add_16_33_1_g115(.A (in2[5]), .B (in2[4]), .Y
       (inc_add_16_33_1_n_12));
  NAND2X8 inc_add_16_33_1_g116(.A (in2[0]), .B (in1), .Y
       (inc_add_16_33_1_n_11));
  INVX1 inc_add_16_33_1_g117(.A (in2[4]), .Y (inc_add_16_33_1_n_10));
  CLKINVX2 inc_add_16_33_1_g118(.A (in2[2]), .Y (inc_add_16_33_1_n_9));
  INVX1 inc_add_16_33_1_g119(.A (in2[0]), .Y (inc_add_16_33_1_n_8));
  INVXL inc_add_16_33_1_g120(.A (in2[5]), .Y (inc_add_16_33_1_n_7));
  CLKINVX3 inc_add_16_33_1_g121(.A (in2[3]), .Y (inc_add_16_33_1_n_6));
  INVX1 inc_add_16_33_1_g122(.A (in2[8]), .Y (inc_add_16_33_1_n_5));
  CLKINVX2 inc_add_16_33_1_g123(.A (in2[1]), .Y (inc_add_16_33_1_n_4));
  INVXL inc_add_16_33_1_g124(.A (in2[7]), .Y (inc_add_16_33_1_n_3));
  INVX1 inc_add_16_33_1_g125(.A (in2[6]), .Y (inc_add_16_33_1_n_2));
  MXI2XL inc_add_16_33_1_g2(.A (in2[4]), .B (inc_add_16_33_1_n_10), .S0
       (inc_add_16_33_1_n_20), .Y (out1[4]));
  NOR2BX1 inc_add_16_33_1_g126(.AN (inc_add_16_33_1_n_18), .B
       (inc_add_16_33_1_n_9), .Y (inc_add_16_33_1_n_0));
  NOR2X1 g2(.A (n_43), .B (inc_add_16_33_1_n_5), .Y (out1[9]));
  NOR3BX1 g3(.AN (in2[8]), .B (inc_add_16_33_1_n_16), .C
       (inc_add_16_33_1_n_20), .Y (n_43));
  BUFX2 fopt(.A (inc_add_16_33_1_n_11), .Y (n_48));
  BUFX2 fopt128(.A (inc_add_16_33_1_n_18), .Y (n_50));
endmodule


