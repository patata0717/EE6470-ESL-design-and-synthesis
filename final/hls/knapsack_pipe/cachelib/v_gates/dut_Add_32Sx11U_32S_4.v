`timescale 1ps / 1ps

// Generated by Cadence Genus(TM) Synthesis Solution 21.15-s080_1
// Generated on: Jun  9 2025 16:44:14 CST (Jun  9 2025 08:44:14 UTC)

module dut_Add_32Sx11U_32S_4(in2, in1, out1);
  input [31:0] in2;
  input [10:0] in1;
  output [31:0] out1;
  wire [31:0] in2;
  wire [10:0] in1;
  wire [31:0] out1;
  wire add_16_23_n_0, add_16_23_n_1, add_16_23_n_2, add_16_23_n_3,
       add_16_23_n_4, add_16_23_n_5, add_16_23_n_6, add_16_23_n_7;
  wire add_16_23_n_8, add_16_23_n_9, add_16_23_n_10, add_16_23_n_11,
       add_16_23_n_12, add_16_23_n_13, add_16_23_n_14, add_16_23_n_15;
  wire add_16_23_n_16, add_16_23_n_17, add_16_23_n_18, add_16_23_n_19,
       add_16_23_n_20, add_16_23_n_21, add_16_23_n_22, add_16_23_n_23;
  wire add_16_23_n_24, add_16_23_n_25, add_16_23_n_26, add_16_23_n_27,
       add_16_23_n_28, add_16_23_n_29, add_16_23_n_30, add_16_23_n_31;
  wire add_16_23_n_32, add_16_23_n_33, add_16_23_n_34, add_16_23_n_35,
       add_16_23_n_36, add_16_23_n_37, add_16_23_n_38, add_16_23_n_39;
  wire add_16_23_n_40, add_16_23_n_41, add_16_23_n_43, add_16_23_n_45,
       add_16_23_n_46, add_16_23_n_48, add_16_23_n_49, add_16_23_n_51;
  wire add_16_23_n_53, add_16_23_n_54, add_16_23_n_55, add_16_23_n_58,
       add_16_23_n_59, add_16_23_n_61, add_16_23_n_62, add_16_23_n_63;
  wire add_16_23_n_65, add_16_23_n_68, add_16_23_n_69, add_16_23_n_70,
       add_16_23_n_71, add_16_23_n_73, add_16_23_n_74, add_16_23_n_75;
  wire add_16_23_n_76, add_16_23_n_80, add_16_23_n_81, add_16_23_n_82,
       add_16_23_n_85, add_16_23_n_86, add_16_23_n_87, add_16_23_n_91;
  wire add_16_23_n_92, add_16_23_n_93, add_16_23_n_98;
  XNOR2X1 add_16_23_g657(.A (in2[31]), .B (add_16_23_n_98), .Y
       (out1[31]));
  XNOR2X1 add_16_23_g658(.A (in2[29]), .B (add_16_23_n_93), .Y
       (out1[29]));
  XNOR2X1 add_16_23_g659(.A (in2[27]), .B (add_16_23_n_92), .Y
       (out1[27]));
  XNOR2X1 add_16_23_g660(.A (in2[25]), .B (add_16_23_n_86), .Y
       (out1[25]));
  XNOR2X1 add_16_23_g661(.A (in2[23]), .B (add_16_23_n_85), .Y
       (out1[23]));
  XNOR2X1 add_16_23_g662(.A (in2[30]), .B (add_16_23_n_91), .Y
       (out1[30]));
  XNOR2X1 add_16_23_g663(.A (in2[19]), .B (add_16_23_n_80), .Y
       (out1[19]));
  XNOR2X1 add_16_23_g664(.A (in2[21]), .B (add_16_23_n_81), .Y
       (out1[21]));
  NAND2BX1 add_16_23_g665(.AN (add_16_23_n_91), .B (in2[30]), .Y
       (add_16_23_n_98));
  XNOR2X1 add_16_23_g666(.A (in2[28]), .B (add_16_23_n_1), .Y
       (out1[28]));
  XNOR2X1 add_16_23_g667(.A (in2[15]), .B (add_16_23_n_75), .Y
       (out1[15]));
  XNOR2X1 add_16_23_g668(.A (in2[17]), .B (add_16_23_n_74), .Y
       (out1[17]));
  XOR2XL add_16_23_g669(.A (in2[26]), .B (add_16_23_n_87), .Y
       (out1[26]));
  NAND2BX1 add_16_23_g670(.AN (add_16_23_n_1), .B (in2[28]), .Y
       (add_16_23_n_93));
  NAND2X1 add_16_23_g671(.A (in2[26]), .B (add_16_23_n_87), .Y
       (add_16_23_n_92));
  NAND3BXL add_16_23_g672(.AN (add_16_23_n_1), .B (in2[29]), .C
       (in2[28]), .Y (add_16_23_n_91));
  XNOR2X1 add_16_23_g673(.A (in2[24]), .B (add_16_23_n_0), .Y
       (out1[24]));
  XNOR2X1 add_16_23_g674(.A (in2[13]), .B (add_16_23_n_70), .Y
       (out1[13]));
  XOR2XL add_16_23_g675(.A (in2[22]), .B (add_16_23_n_82), .Y
       (out1[22]));
  NOR2X1 add_16_23_g676(.A (add_16_23_n_23), .B (add_16_23_n_0), .Y
       (add_16_23_n_87));
  NAND2BX1 add_16_23_g677(.AN (add_16_23_n_0), .B (in2[24]), .Y
       (add_16_23_n_86));
  NAND2X1 add_16_23_g678(.A (in2[22]), .B (add_16_23_n_82), .Y
       (add_16_23_n_85));
  XNOR2X1 add_16_23_g680(.A (in2[20]), .B (add_16_23_n_73), .Y
       (out1[20]));
  XNOR2X1 add_16_23_g681(.A (in2[18]), .B (add_16_23_n_76), .Y
       (out1[18]));
  NOR2X1 add_16_23_g682(.A (add_16_23_n_13), .B (add_16_23_n_73), .Y
       (add_16_23_n_82));
  NAND2BX1 add_16_23_g683(.AN (add_16_23_n_73), .B (in2[20]), .Y
       (add_16_23_n_81));
  NAND2BX1 add_16_23_g684(.AN (add_16_23_n_76), .B (in2[18]), .Y
       (add_16_23_n_80));
  XNOR2X1 add_16_23_g687(.A (in2[14]), .B (add_16_23_n_71), .Y
       (out1[14]));
  XOR2XL add_16_23_g688(.A (in2[16]), .B (add_16_23_n_68), .Y
       (out1[16]));
  XOR2XL add_16_23_g689(.A (in2[11]), .B (add_16_23_n_69), .Y
       (out1[11]));
  NAND2BX1 add_16_23_g690(.AN (add_16_23_n_12), .B (add_16_23_n_68), .Y
       (add_16_23_n_76));
  NAND2BX1 add_16_23_g691(.AN (add_16_23_n_71), .B (in2[14]), .Y
       (add_16_23_n_75));
  NAND2X1 add_16_23_g692(.A (in2[16]), .B (add_16_23_n_68), .Y
       (add_16_23_n_74));
  NAND4BX1 add_16_23_g694(.AN (add_16_23_n_12), .B (add_16_23_n_68), .C
       (in2[19]), .D (in2[18]), .Y (add_16_23_n_73));
  XOR2XL add_16_23_g695(.A (in2[12]), .B (add_16_23_n_65), .Y
       (out1[12]));
  NAND2BX1 add_16_23_g696(.AN (add_16_23_n_11), .B (add_16_23_n_65), .Y
       (add_16_23_n_71));
  NAND2X1 add_16_23_g697(.A (in2[12]), .B (add_16_23_n_65), .Y
       (add_16_23_n_70));
  OAI21X1 add_16_23_g698(.A0 (add_16_23_n_3), .A1 (add_16_23_n_63), .B0
       (add_16_23_n_15), .Y (add_16_23_n_69));
  OAI22X1 add_16_23_g699(.A0 (add_16_23_n_30), .A1 (add_16_23_n_62),
       .B0 (add_16_23_n_30), .B1 (add_16_23_n_43), .Y (add_16_23_n_68));
  XNOR2X1 add_16_23_g700(.A (add_16_23_n_34), .B (add_16_23_n_63), .Y
       (out1[10]));
  XNOR2X1 add_16_23_g701(.A (add_16_23_n_33), .B (add_16_23_n_61), .Y
       (out1[9]));
  NAND2X1 add_16_23_g702(.A (add_16_23_n_43), .B (add_16_23_n_62), .Y
       (add_16_23_n_65));
  XNOR2X1 add_16_23_g703(.A (add_16_23_n_29), .B (add_16_23_n_59), .Y
       (out1[7]));
  NOR2X1 add_16_23_g704(.A (add_16_23_n_38), .B (add_16_23_n_58), .Y
       (add_16_23_n_63));
  NAND2X1 add_16_23_g705(.A (add_16_23_n_31), .B (add_16_23_n_58), .Y
       (add_16_23_n_62));
  OAI21X1 add_16_23_g706(.A0 (add_16_23_n_18), .A1 (add_16_23_n_55),
       .B0 (add_16_23_n_4), .Y (add_16_23_n_61));
  XNOR2X1 add_16_23_g707(.A (add_16_23_n_32), .B (add_16_23_n_55), .Y
       (out1[8]));
  OAI21X1 add_16_23_g708(.A0 (add_16_23_n_7), .A1 (add_16_23_n_54), .B0
       (add_16_23_n_20), .Y (add_16_23_n_59));
  NOR3X1 add_16_23_g709(.A (add_16_23_n_55), .B (add_16_23_n_8), .C
       (add_16_23_n_18), .Y (add_16_23_n_58));
  XNOR2X1 add_16_23_g710(.A (add_16_23_n_28), .B (add_16_23_n_54), .Y
       (out1[6]));
  XNOR2X1 add_16_23_g711(.A (add_16_23_n_27), .B (add_16_23_n_53), .Y
       (out1[5]));
  AOI221X1 add_16_23_g712(.A0 (add_16_23_n_37), .A1 (add_16_23_n_39),
       .B0 (add_16_23_n_37), .B1 (add_16_23_n_51), .C0
       (add_16_23_n_40), .Y (add_16_23_n_55));
  NOR2X1 add_16_23_g713(.A (add_16_23_n_39), .B (add_16_23_n_51), .Y
       (add_16_23_n_54));
  OAI2BB1X1 add_16_23_g714(.A0N (add_16_23_n_6), .A1N (add_16_23_n_49),
       .B0 (add_16_23_n_9), .Y (add_16_23_n_53));
  XNOR2X1 add_16_23_g715(.A (add_16_23_n_26), .B (add_16_23_n_49), .Y
       (out1[4]));
  NOR3BX1 add_16_23_g716(.AN (add_16_23_n_49), .B (add_16_23_n_16), .C
       (add_16_23_n_5), .Y (add_16_23_n_51));
  XNOR2X1 add_16_23_g717(.A (add_16_23_n_35), .B (add_16_23_n_48), .Y
       (out1[3]));
  OAI221X1 add_16_23_g718(.A0 (add_16_23_n_19), .A1 (add_16_23_n_46),
       .B0 (add_16_23_n_17), .B1 (add_16_23_n_19), .C0
       (add_16_23_n_22), .Y (add_16_23_n_49));
  NAND2X1 add_16_23_g719(.A (add_16_23_n_17), .B (add_16_23_n_46), .Y
       (add_16_23_n_48));
  XNOR2X1 add_16_23_g720(.A (add_16_23_n_36), .B (add_16_23_n_45), .Y
       (out1[2]));
  NAND2BX1 add_16_23_g721(.AN (add_16_23_n_10), .B (add_16_23_n_45), .Y
       (add_16_23_n_46));
  ADDFX1 add_16_23_g722(.A (add_16_23_n_41), .B (in1[1]), .CI (in2[1]),
       .CO (add_16_23_n_45), .S (out1[1]));
  AOI22X1 add_16_23_g723(.A0 (add_16_23_n_31), .A1 (add_16_23_n_38),
       .B0 (in2[11]), .B1 (add_16_23_n_14), .Y (add_16_23_n_43));
  ADDHX1 add_16_23_g724(.A (in2[0]), .B (in1[0]), .CO (add_16_23_n_41),
       .S (out1[0]));
  OAI21X1 add_16_23_g725(.A0 (add_16_23_n_20), .A1 (add_16_23_n_2), .B0
       (add_16_23_n_24), .Y (add_16_23_n_40));
  OAI21X1 add_16_23_g726(.A0 (add_16_23_n_9), .A1 (add_16_23_n_16), .B0
       (add_16_23_n_21), .Y (add_16_23_n_39));
  OAI21X1 add_16_23_g727(.A0 (add_16_23_n_4), .A1 (add_16_23_n_8), .B0
       (add_16_23_n_25), .Y (add_16_23_n_38));
  NAND2BX1 add_16_23_g728(.AN (add_16_23_n_10), .B (add_16_23_n_17), .Y
       (add_16_23_n_36));
  NAND2BX1 add_16_23_g729(.AN (add_16_23_n_19), .B (add_16_23_n_22), .Y
       (add_16_23_n_35));
  NOR2X1 add_16_23_g730(.A (add_16_23_n_14), .B (add_16_23_n_3), .Y
       (add_16_23_n_34));
  NAND2BX1 add_16_23_g731(.AN (add_16_23_n_8), .B (add_16_23_n_25), .Y
       (add_16_23_n_33));
  NOR2X1 add_16_23_g732(.A (add_16_23_n_2), .B (add_16_23_n_7), .Y
       (add_16_23_n_37));
  NOR2BX1 add_16_23_g733(.AN (add_16_23_n_4), .B (add_16_23_n_18), .Y
       (add_16_23_n_32));
  NOR2BX1 add_16_23_g734(.AN (in2[11]), .B (add_16_23_n_3), .Y
       (add_16_23_n_31));
  NAND2BX1 add_16_23_g735(.AN (add_16_23_n_2), .B (add_16_23_n_24), .Y
       (add_16_23_n_29));
  NOR2BX1 add_16_23_g736(.AN (add_16_23_n_20), .B (add_16_23_n_7), .Y
       (add_16_23_n_28));
  NAND2BX1 add_16_23_g737(.AN (add_16_23_n_16), .B (add_16_23_n_21), .Y
       (add_16_23_n_27));
  NAND2X1 add_16_23_g738(.A (add_16_23_n_9), .B (add_16_23_n_6), .Y
       (add_16_23_n_26));
  NAND3BXL add_16_23_g739(.AN (add_16_23_n_11), .B (in2[15]), .C
       (in2[14]), .Y (add_16_23_n_30));
  INVX1 add_16_23_g740(.A (add_16_23_n_14), .Y (add_16_23_n_15));
  NAND2X1 add_16_23_g741(.A (in2[9]), .B (in1[9]), .Y (add_16_23_n_25));
  NAND2X1 add_16_23_g742(.A (in2[7]), .B (in1[7]), .Y (add_16_23_n_24));
  NAND2X1 add_16_23_g743(.A (in2[25]), .B (in2[24]), .Y
       (add_16_23_n_23));
  NAND2X1 add_16_23_g744(.A (in2[3]), .B (in1[3]), .Y (add_16_23_n_22));
  NAND2X1 add_16_23_g745(.A (in2[5]), .B (in1[5]), .Y (add_16_23_n_21));
  NAND2X1 add_16_23_g746(.A (in2[6]), .B (in1[6]), .Y (add_16_23_n_20));
  NOR2X1 add_16_23_g747(.A (in2[3]), .B (in1[3]), .Y (add_16_23_n_19));
  NOR2X1 add_16_23_g748(.A (in2[8]), .B (in1[8]), .Y (add_16_23_n_18));
  NAND2X1 add_16_23_g749(.A (in2[2]), .B (in1[2]), .Y (add_16_23_n_17));
  NOR2X1 add_16_23_g750(.A (in2[5]), .B (in1[5]), .Y (add_16_23_n_16));
  AND2X1 add_16_23_g751(.A (in2[10]), .B (in1[10]), .Y
       (add_16_23_n_14));
  INVX1 add_16_23_g752(.A (add_16_23_n_5), .Y (add_16_23_n_6));
  NAND2X1 add_16_23_g753(.A (in2[21]), .B (in2[20]), .Y
       (add_16_23_n_13));
  NAND2X1 add_16_23_g754(.A (in2[17]), .B (in2[16]), .Y
       (add_16_23_n_12));
  NAND2X1 add_16_23_g755(.A (in2[13]), .B (in2[12]), .Y
       (add_16_23_n_11));
  NOR2X1 add_16_23_g756(.A (in2[2]), .B (in1[2]), .Y (add_16_23_n_10));
  NAND2X1 add_16_23_g757(.A (in2[4]), .B (in1[4]), .Y (add_16_23_n_9));
  NOR2X1 add_16_23_g758(.A (in2[9]), .B (in1[9]), .Y (add_16_23_n_8));
  NOR2X1 add_16_23_g759(.A (in2[6]), .B (in1[6]), .Y (add_16_23_n_7));
  NOR2X1 add_16_23_g760(.A (in2[4]), .B (in1[4]), .Y (add_16_23_n_5));
  NAND2X1 add_16_23_g761(.A (in2[8]), .B (in1[8]), .Y (add_16_23_n_4));
  NOR2X1 add_16_23_g762(.A (in2[10]), .B (in1[10]), .Y (add_16_23_n_3));
  NOR2X1 add_16_23_g763(.A (in2[7]), .B (in1[7]), .Y (add_16_23_n_2));
  NAND4BBXL add_16_23_g2(.AN (add_16_23_n_23), .BN (add_16_23_n_0), .C
       (in2[27]), .D (in2[26]), .Y (add_16_23_n_1));
  NAND4BBXL add_16_23_g764(.AN (add_16_23_n_13), .BN (add_16_23_n_73),
       .C (in2[23]), .D (in2[22]), .Y (add_16_23_n_0));
endmodule


