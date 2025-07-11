`timescale 1ps / 1ps

// Generated by Cadence Genus(TM) Synthesis Solution 21.15-s080_1
// Generated on: Jun  4 2025 00:40:24 CST (Jun  3 2025 16:40:24 UTC)

module dut_LeftShift_16U_0_1(in1, out1);
  input [3:0] in1;
  output [15:0] out1;
  wire [3:0] in1;
  wire [15:0] out1;
  wire n_33, n_34, n_37, n_38, sll_15_29_n_1, sll_15_29_n_2,
       sll_15_29_n_4, sll_15_29_n_5;
  wire sll_15_29_n_6, sll_15_29_n_7, sll_15_29_n_8, sll_15_29_n_9,
       sll_15_29_n_10, sll_15_29_n_11, sll_15_29_n_12;
  NOR2BX1 sll_15_29_g147(.AN (sll_15_29_n_11), .B (sll_15_29_n_9), .Y
       (out1[8]));
  NOR2X1 sll_15_29_g148(.A (sll_15_29_n_12), .B (sll_15_29_n_9), .Y
       (out1[14]));
  NOR2X1 sll_15_29_g149(.A (sll_15_29_n_6), .B (sll_15_29_n_10), .Y
       (out1[9]));
  NOR2BX1 sll_15_29_g150(.AN (sll_15_29_n_11), .B (sll_15_29_n_8), .Y
       (out1[1]));
  NOR2X1 sll_15_29_g151(.A (sll_15_29_n_12), .B (sll_15_29_n_6), .Y
       (out1[15]));
  NOR2X1 sll_15_29_g152(.A (sll_15_29_n_12), .B (sll_15_29_n_8), .Y
       (out1[7]));
  NOR2X1 sll_15_29_g153(.A (sll_15_29_n_6), .B (sll_15_29_n_7), .Y
       (out1[13]));
  NOR2X1 sll_15_29_g154(.A (sll_15_29_n_12), .B (sll_15_29_n_5), .Y
       (out1[6]));
  NOR2X1 sll_15_29_g155(.A (sll_15_29_n_4), .B (sll_15_29_n_8), .Y
       (out1[3]));
  NOR2X1 sll_15_29_g156(.A (sll_15_29_n_7), .B (sll_15_29_n_5), .Y
       (out1[4]));
  NOR2X1 sll_15_29_g157(.A (sll_15_29_n_4), .B (sll_15_29_n_5), .Y
       (out1[2]));
  NOR2X1 sll_15_29_g158(.A (sll_15_29_n_10), .B (sll_15_29_n_5), .Y
       (out1[0]));
  NOR2X1 sll_15_29_g159(.A (sll_15_29_n_6), .B (sll_15_29_n_4), .Y
       (out1[11]));
  NOR2X1 sll_15_29_g160(.A (sll_15_29_n_7), .B (sll_15_29_n_8), .Y
       (out1[5]));
  NOR2X1 sll_15_29_g161(.A (sll_15_29_n_7), .B (sll_15_29_n_9), .Y
       (out1[12]));
  NOR2X1 sll_15_29_g162(.A (sll_15_29_n_4), .B (sll_15_29_n_9), .Y
       (out1[10]));
  NAND2X2 sll_15_29_g163(.A (in1[2]), .B (in1[1]), .Y (sll_15_29_n_12));
  INVX1 sll_15_29_g164(.A (sll_15_29_n_11), .Y (sll_15_29_n_10));
  NOR2X2 sll_15_29_g165(.A (in1[2]), .B (in1[1]), .Y (sll_15_29_n_11));
  NAND2X2 sll_15_29_g166(.A (in1[3]), .B (n_38), .Y (sll_15_29_n_9));
  NAND2X2 sll_15_29_g167(.A (in1[0]), .B (n_33), .Y (sll_15_29_n_8));
  NAND2X2 sll_15_29_g168(.A (in1[2]), .B (sll_15_29_n_2), .Y
       (sll_15_29_n_7));
  NAND2X2 sll_15_29_g169(.A (in1[3]), .B (in1[0]), .Y (sll_15_29_n_6));
  NAND2X2 sll_15_29_g170(.A (n_34), .B (n_37), .Y (sll_15_29_n_5));
  NAND2X2 sll_15_29_g171(.A (in1[1]), .B (sll_15_29_n_1), .Y
       (sll_15_29_n_4));
  CLKINVX4 sll_15_29_g173(.A (in1[1]), .Y (sll_15_29_n_2));
  CLKINVX4 sll_15_29_g174(.A (in1[2]), .Y (sll_15_29_n_1));
  CLKINVX2 fopt(.A (in1[3]), .Y (n_33));
  CLKINVX4 fopt176(.A (in1[3]), .Y (n_34));
  CLKINVX4 fopt177(.A (in1[0]), .Y (n_37));
  CLKINVX4 fopt178(.A (in1[0]), .Y (n_38));
endmodule


