`timescale 1ps / 1ps

// Generated by Cadence Genus(TM) Synthesis Solution 21.15-s080_1
// Generated on: Jun  4 2025 00:42:35 CST (Jun  3 2025 16:42:35 UTC)

module dut_GreaterThan_15Ux7U_1U_4(in2, in1, out1);
  input [14:0] in2;
  input [6:0] in1;
  output out1;
  wire [14:0] in2;
  wire [6:0] in1;
  wire out1;
  wire gt_16_23_n_0, gt_16_23_n_1, gt_16_23_n_2, gt_16_23_n_3,
       gt_16_23_n_4, gt_16_23_n_5, gt_16_23_n_6, gt_16_23_n_7;
  wire gt_16_23_n_8, gt_16_23_n_9, gt_16_23_n_10, gt_16_23_n_11,
       gt_16_23_n_12, gt_16_23_n_13, gt_16_23_n_14, gt_16_23_n_15;
  wire gt_16_23_n_16, gt_16_23_n_17, gt_16_23_n_18, gt_16_23_n_19,
       gt_16_23_n_20, gt_16_23_n_21, gt_16_23_n_22;
  OR4X1 gt_16_23_g270(.A (in2[14]), .B (gt_16_23_n_22), .C (in2[13]),
       .D (in2[12]), .Y (out1));
  NAND2X1 gt_16_23_g271(.A (gt_16_23_n_12), .B (gt_16_23_n_21), .Y
       (gt_16_23_n_22));
  OAI221X1 gt_16_23_g272(.A0 (gt_16_23_n_16), .A1 (gt_16_23_n_17), .B0
       (in2[7]), .B1 (gt_16_23_n_10), .C0 (gt_16_23_n_20), .Y
       (gt_16_23_n_21));
  NAND4XL gt_16_23_g273(.A (gt_16_23_n_19), .B (gt_16_23_n_15), .C
       (gt_16_23_n_7), .D (gt_16_23_n_11), .Y (gt_16_23_n_20));
  OAI211X1 gt_16_23_g274(.A0 (gt_16_23_n_1), .A1 (in2[3]), .B0
       (gt_16_23_n_18), .C0 (gt_16_23_n_14), .Y (gt_16_23_n_19));
  OAI221X1 gt_16_23_g275(.A0 (gt_16_23_n_8), .A1 (gt_16_23_n_13), .B0
       (gt_16_23_n_2), .B1 (in1[2]), .C0 (gt_16_23_n_9), .Y
       (gt_16_23_n_18));
  AOI32X1 gt_16_23_g276(.A0 (gt_16_23_n_7), .A1 (in1[4]), .A2
       (gt_16_23_n_0), .B0 (in1[5]), .B1 (gt_16_23_n_3), .Y
       (gt_16_23_n_17));
  INVX1 gt_16_23_g277(.A (gt_16_23_n_15), .Y (gt_16_23_n_16));
  AOI21X1 gt_16_23_g278(.A0 (in2[6]), .A1 (gt_16_23_n_4), .B0 (in2[7]),
       .Y (gt_16_23_n_15));
  NAND3X1 gt_16_23_g279(.A (gt_16_23_n_9), .B (in1[2]), .C
       (gt_16_23_n_2), .Y (gt_16_23_n_14));
  AOI22X1 gt_16_23_g280(.A0 (in2[0]), .A1 (gt_16_23_n_6), .B0 (in2[1]),
       .B1 (gt_16_23_n_5), .Y (gt_16_23_n_13));
  NOR4X1 gt_16_23_g281(.A (in2[11]), .B (in2[10]), .C (in2[9]), .D
       (in2[8]), .Y (gt_16_23_n_12));
  NAND2BXL gt_16_23_g282(.AN (in1[4]), .B (in2[4]), .Y (gt_16_23_n_11));
  NAND2BX1 gt_16_23_g283(.AN (in2[6]), .B (in1[6]), .Y (gt_16_23_n_10));
  NAND2X1 gt_16_23_g284(.A (in2[3]), .B (gt_16_23_n_1), .Y
       (gt_16_23_n_9));
  NOR2X1 gt_16_23_g285(.A (gt_16_23_n_5), .B (in2[1]), .Y
       (gt_16_23_n_8));
  NAND2BXL gt_16_23_g286(.AN (in1[5]), .B (in2[5]), .Y (gt_16_23_n_7));
  INVX1 gt_16_23_g287(.A (in1[0]), .Y (gt_16_23_n_6));
  INVX1 gt_16_23_g288(.A (in1[1]), .Y (gt_16_23_n_5));
  INVX1 gt_16_23_g289(.A (in1[6]), .Y (gt_16_23_n_4));
  INVX1 gt_16_23_g290(.A (in2[5]), .Y (gt_16_23_n_3));
  INVX1 gt_16_23_g291(.A (in2[2]), .Y (gt_16_23_n_2));
  INVX1 gt_16_23_g292(.A (in1[3]), .Y (gt_16_23_n_1));
  INVX1 gt_16_23_g293(.A (in2[4]), .Y (gt_16_23_n_0));
endmodule


