`timescale 1ps / 1ps

// Generated by Cadence Genus(TM) Synthesis Solution 21.15-s080_1
// Generated on: Jun  9 2025 16:44:11 CST (Jun  9 2025 08:44:11 UTC)

module dut_Add_16Ux9U_16U_4(in2, in1, out1);
  input [15:0] in2;
  input [8:0] in1;
  output [15:0] out1;
  wire [15:0] in2;
  wire [8:0] in1;
  wire [15:0] out1;
  wire add_16_23_n_0, add_16_23_n_1, add_16_23_n_2, add_16_23_n_3,
       add_16_23_n_4, add_16_23_n_5, add_16_23_n_6, add_16_23_n_7;
  wire add_16_23_n_8, add_16_23_n_9, add_16_23_n_10, add_16_23_n_11,
       add_16_23_n_12, add_16_23_n_13, add_16_23_n_14, add_16_23_n_15;
  wire add_16_23_n_16, add_16_23_n_17, add_16_23_n_18, add_16_23_n_19,
       add_16_23_n_20, add_16_23_n_21, add_16_23_n_22, add_16_23_n_23;
  wire add_16_23_n_24, add_16_23_n_25, add_16_23_n_26, add_16_23_n_27,
       add_16_23_n_28, add_16_23_n_31, add_16_23_n_32, add_16_23_n_34;
  wire add_16_23_n_35, add_16_23_n_37, add_16_23_n_39, add_16_23_n_40,
       add_16_23_n_41, add_16_23_n_44, add_16_23_n_46, add_16_23_n_47;
  wire add_16_23_n_48, add_16_23_n_50, add_16_23_n_51, add_16_23_n_52,
       add_16_23_n_56;
  XNOR2X1 add_16_23_g323(.A (in2[15]), .B (add_16_23_n_56), .Y
       (out1[15]));
  XNOR2X1 add_16_23_g324(.A (in2[13]), .B (add_16_23_n_52), .Y
       (out1[13]));
  XNOR2X1 add_16_23_g325(.A (in2[11]), .B (add_16_23_n_51), .Y
       (out1[11]));
  XNOR2X1 add_16_23_g326(.A (in2[14]), .B (add_16_23_n_50), .Y
       (out1[14]));
  NAND2BX1 add_16_23_g327(.AN (add_16_23_n_50), .B (in2[14]), .Y
       (add_16_23_n_56));
  XOR2XL add_16_23_g328(.A (in2[9]), .B (add_16_23_n_47), .Y (out1[9]));
  XOR2XL add_16_23_g329(.A (in2[12]), .B (add_16_23_n_46), .Y
       (out1[12]));
  XOR2XL add_16_23_g330(.A (in2[10]), .B (add_16_23_n_48), .Y
       (out1[10]));
  NAND2X1 add_16_23_g331(.A (in2[12]), .B (add_16_23_n_46), .Y
       (add_16_23_n_52));
  NAND2X1 add_16_23_g332(.A (in2[10]), .B (add_16_23_n_48), .Y
       (add_16_23_n_51));
  NAND3X1 add_16_23_g333(.A (add_16_23_n_46), .B (in2[13]), .C
       (in2[12]), .Y (add_16_23_n_50));
  XNOR2X1 add_16_23_g334(.A (add_16_23_n_17), .B (add_16_23_n_44), .Y
       (out1[7]));
  OAI21X1 add_16_23_g335(.A0 (add_16_23_n_20), .A1 (add_16_23_n_41),
       .B0 (add_16_23_n_23), .Y (add_16_23_n_48));
  OAI21X1 add_16_23_g336(.A0 (add_16_23_n_2), .A1 (add_16_23_n_41), .B0
       (add_16_23_n_9), .Y (add_16_23_n_47));
  OAI32X1 add_16_23_g337(.A0 (add_16_23_n_41), .A1 (add_16_23_n_7), .A2
       (add_16_23_n_20), .B0 (add_16_23_n_7), .B1 (add_16_23_n_23), .Y
       (add_16_23_n_46));
  XNOR2X1 add_16_23_g338(.A (add_16_23_n_18), .B (add_16_23_n_41), .Y
       (out1[8]));
  OAI21X1 add_16_23_g339(.A0 (add_16_23_n_11), .A1 (add_16_23_n_40),
       .B0 (add_16_23_n_5), .Y (add_16_23_n_44));
  XNOR2X1 add_16_23_g340(.A (add_16_23_n_19), .B (add_16_23_n_40), .Y
       (out1[6]));
  XNOR2X1 add_16_23_g341(.A (add_16_23_n_16), .B (add_16_23_n_39), .Y
       (out1[5]));
  AOI221X1 add_16_23_g342(.A0 (add_16_23_n_25), .A1 (add_16_23_n_27),
       .B0 (add_16_23_n_25), .B1 (add_16_23_n_37), .C0
       (add_16_23_n_26), .Y (add_16_23_n_41));
  NOR2X1 add_16_23_g343(.A (add_16_23_n_27), .B (add_16_23_n_37), .Y
       (add_16_23_n_40));
  OAI2BB1X1 add_16_23_g344(.A0N (add_16_23_n_4), .A1N (add_16_23_n_35),
       .B0 (add_16_23_n_1), .Y (add_16_23_n_39));
  XNOR2X1 add_16_23_g345(.A (add_16_23_n_22), .B (add_16_23_n_35), .Y
       (out1[4]));
  NOR3BX1 add_16_23_g346(.AN (add_16_23_n_35), .B (add_16_23_n_0), .C
       (add_16_23_n_3), .Y (add_16_23_n_37));
  XNOR2X1 add_16_23_g347(.A (add_16_23_n_21), .B (add_16_23_n_34), .Y
       (out1[3]));
  OAI221X1 add_16_23_g348(.A0 (add_16_23_n_10), .A1 (add_16_23_n_32),
       .B0 (add_16_23_n_12), .B1 (add_16_23_n_10), .C0 (add_16_23_n_6),
       .Y (add_16_23_n_35));
  NAND2X1 add_16_23_g349(.A (add_16_23_n_12), .B (add_16_23_n_32), .Y
       (add_16_23_n_34));
  XNOR2X1 add_16_23_g350(.A (add_16_23_n_24), .B (add_16_23_n_31), .Y
       (out1[2]));
  NAND2BX1 add_16_23_g351(.AN (add_16_23_n_14), .B (add_16_23_n_31), .Y
       (add_16_23_n_32));
  ADDFX1 add_16_23_g352(.A (add_16_23_n_28), .B (in1[1]), .CI (in2[1]),
       .CO (add_16_23_n_31), .S (out1[1]));
  ADDHX1 add_16_23_g353(.A (in2[0]), .B (in1[0]), .CO (add_16_23_n_28),
       .S (out1[0]));
  OAI21X1 add_16_23_g354(.A0 (add_16_23_n_1), .A1 (add_16_23_n_0), .B0
       (add_16_23_n_15), .Y (add_16_23_n_27));
  OAI21X1 add_16_23_g355(.A0 (add_16_23_n_5), .A1 (add_16_23_n_13), .B0
       (add_16_23_n_8), .Y (add_16_23_n_26));
  NOR2X1 add_16_23_g356(.A (add_16_23_n_13), .B (add_16_23_n_11), .Y
       (add_16_23_n_25));
  NAND2BX1 add_16_23_g357(.AN (add_16_23_n_14), .B (add_16_23_n_12), .Y
       (add_16_23_n_24));
  NAND2BX1 add_16_23_g358(.AN (add_16_23_n_9), .B (in2[9]), .Y
       (add_16_23_n_23));
  NAND2X1 add_16_23_g359(.A (add_16_23_n_1), .B (add_16_23_n_4), .Y
       (add_16_23_n_22));
  NAND2BX1 add_16_23_g360(.AN (add_16_23_n_10), .B (add_16_23_n_6), .Y
       (add_16_23_n_21));
  NAND2BX1 add_16_23_g361(.AN (add_16_23_n_2), .B (in2[9]), .Y
       (add_16_23_n_20));
  NOR2BX1 add_16_23_g362(.AN (add_16_23_n_5), .B (add_16_23_n_11), .Y
       (add_16_23_n_19));
  NOR2BX1 add_16_23_g363(.AN (add_16_23_n_9), .B (add_16_23_n_2), .Y
       (add_16_23_n_18));
  NAND2BX1 add_16_23_g364(.AN (add_16_23_n_13), .B (add_16_23_n_8), .Y
       (add_16_23_n_17));
  NAND2BX1 add_16_23_g365(.AN (add_16_23_n_0), .B (add_16_23_n_15), .Y
       (add_16_23_n_16));
  NAND2X1 add_16_23_g366(.A (in2[5]), .B (in1[5]), .Y (add_16_23_n_15));
  NOR2X1 add_16_23_g367(.A (in2[2]), .B (in1[2]), .Y (add_16_23_n_14));
  NOR2X1 add_16_23_g368(.A (in2[7]), .B (in1[7]), .Y (add_16_23_n_13));
  NAND2X1 add_16_23_g369(.A (in2[2]), .B (in1[2]), .Y (add_16_23_n_12));
  NOR2X1 add_16_23_g370(.A (in2[6]), .B (in1[6]), .Y (add_16_23_n_11));
  NOR2X1 add_16_23_g371(.A (in2[3]), .B (in1[3]), .Y (add_16_23_n_10));
  NAND2X1 add_16_23_g372(.A (in2[8]), .B (in1[8]), .Y (add_16_23_n_9));
  INVX1 add_16_23_g373(.A (add_16_23_n_3), .Y (add_16_23_n_4));
  NAND2X1 add_16_23_g374(.A (in2[7]), .B (in1[7]), .Y (add_16_23_n_8));
  NAND2X1 add_16_23_g375(.A (in2[11]), .B (in2[10]), .Y
       (add_16_23_n_7));
  NAND2X1 add_16_23_g376(.A (in2[3]), .B (in1[3]), .Y (add_16_23_n_6));
  NAND2X1 add_16_23_g377(.A (in2[6]), .B (in1[6]), .Y (add_16_23_n_5));
  NOR2X1 add_16_23_g378(.A (in2[4]), .B (in1[4]), .Y (add_16_23_n_3));
  NOR2X1 add_16_23_g379(.A (in2[8]), .B (in1[8]), .Y (add_16_23_n_2));
  NAND2X1 add_16_23_g380(.A (in2[4]), .B (in1[4]), .Y (add_16_23_n_1));
  NOR2X1 add_16_23_g381(.A (in2[5]), .B (in1[5]), .Y (add_16_23_n_0));
endmodule


