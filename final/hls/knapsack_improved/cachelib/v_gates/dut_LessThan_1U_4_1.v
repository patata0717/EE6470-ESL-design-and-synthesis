`timescale 1ps / 1ps

// Generated by Cadence Genus(TM) Synthesis Solution 21.15-s080_1
// Generated on: Jun  4 2025 00:40:25 CST (Jun  3 2025 16:40:25 UTC)

module dut_LessThan_1U_4_1(in1, out1);
  input [8:0] in1;
  output out1;
  wire [8:0] in1;
  wire out1;
  wire gt_15_24_n_0, gt_15_24_n_1, gt_15_24_n_2, gt_15_24_n_3,
       gt_15_24_n_4, gt_15_24_n_5, gt_15_24_n_6;
  NOR2X1 gt_15_24_g133(.A (gt_15_24_n_5), .B (gt_15_24_n_4), .Y
       (gt_15_24_n_6));
  NAND2X1 gt_15_24_g134(.A (gt_15_24_n_2), .B (gt_15_24_n_3), .Y
       (gt_15_24_n_5));
  NAND2X1 gt_15_24_g135(.A (gt_15_24_n_1), .B (gt_15_24_n_0), .Y
       (gt_15_24_n_4));
  NOR2X2 gt_15_24_g136(.A (in1[5]), .B (in1[4]), .Y (gt_15_24_n_3));
  NOR2X6 gt_15_24_g137(.A (in1[7]), .B (in1[6]), .Y (gt_15_24_n_2));
  NOR2X2 gt_15_24_g138(.A (in1[3]), .B (in1[2]), .Y (gt_15_24_n_1));
  NOR2X2 gt_15_24_g139(.A (in1[1]), .B (in1[0]), .Y (gt_15_24_n_0));
  NOR2X1 g2(.A (in1[8]), .B (gt_15_24_n_6), .Y (out1));
endmodule


