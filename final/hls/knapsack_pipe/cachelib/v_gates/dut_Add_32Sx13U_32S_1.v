`timescale 1ps / 1ps

// Generated by Cadence Genus(TM) Synthesis Solution 21.15-s080_1
// Generated on: Jun  9 2025 16:46:00 CST (Jun  9 2025 08:46:00 UTC)

module dut_Add_32Sx13U_32S_1(in2, in1, out1);
  input [31:0] in2;
  input [12:0] in1;
  output [31:0] out1;
  wire [31:0] in2;
  wire [12:0] in1;
  wire [31:0] out1;
  wire add_16_23_n_0, add_16_23_n_1, add_16_23_n_3, add_16_23_n_4,
       add_16_23_n_15, add_16_23_n_17, add_16_23_n_18, add_16_23_n_19;
  wire add_16_23_n_20, add_16_23_n_21, add_16_23_n_22, add_16_23_n_23,
       add_16_23_n_24, add_16_23_n_25, add_16_23_n_26, add_16_23_n_27;
  wire add_16_23_n_28, add_16_23_n_29, add_16_23_n_30, add_16_23_n_31,
       add_16_23_n_32, add_16_23_n_33, add_16_23_n_34, add_16_23_n_35;
  wire add_16_23_n_36, add_16_23_n_37, add_16_23_n_38, add_16_23_n_39,
       add_16_23_n_40, add_16_23_n_41, add_16_23_n_42, add_16_23_n_43;
  wire add_16_23_n_44, add_16_23_n_45, add_16_23_n_46, add_16_23_n_47,
       add_16_23_n_48, add_16_23_n_49, add_16_23_n_50, add_16_23_n_51;
  wire add_16_23_n_52, add_16_23_n_53, add_16_23_n_54, add_16_23_n_55,
       add_16_23_n_56, add_16_23_n_57, add_16_23_n_58, add_16_23_n_59;
  wire add_16_23_n_60, add_16_23_n_61, add_16_23_n_62, add_16_23_n_63,
       add_16_23_n_64, add_16_23_n_66, add_16_23_n_67, add_16_23_n_68;
  wire add_16_23_n_70, add_16_23_n_71, add_16_23_n_72, add_16_23_n_73,
       add_16_23_n_74, add_16_23_n_75, add_16_23_n_76, add_16_23_n_78;
  wire add_16_23_n_79, add_16_23_n_80, add_16_23_n_81, add_16_23_n_82,
       add_16_23_n_83, add_16_23_n_84, add_16_23_n_85, add_16_23_n_86;
  wire add_16_23_n_87, add_16_23_n_88, add_16_23_n_89, add_16_23_n_90,
       add_16_23_n_91, add_16_23_n_92, add_16_23_n_93, add_16_23_n_94;
  wire add_16_23_n_95, add_16_23_n_96, add_16_23_n_97, add_16_23_n_98,
       add_16_23_n_99, add_16_23_n_100, add_16_23_n_101,
       add_16_23_n_102;
  wire add_16_23_n_103, add_16_23_n_104, add_16_23_n_105,
       add_16_23_n_106, add_16_23_n_107, add_16_23_n_108,
       add_16_23_n_109, add_16_23_n_110;
  wire add_16_23_n_111, add_16_23_n_112, add_16_23_n_113,
       add_16_23_n_114, add_16_23_n_116, add_16_23_n_117,
       add_16_23_n_118, add_16_23_n_119;
  wire add_16_23_n_120, add_16_23_n_121, add_16_23_n_122,
       add_16_23_n_123, add_16_23_n_124, add_16_23_n_125,
       add_16_23_n_126, add_16_23_n_127;
  wire add_16_23_n_128, add_16_23_n_129, add_16_23_n_130,
       add_16_23_n_131, add_16_23_n_132, add_16_23_n_133,
       add_16_23_n_134, add_16_23_n_135;
  wire add_16_23_n_136, add_16_23_n_137, add_16_23_n_138,
       add_16_23_n_139, add_16_23_n_140, add_16_23_n_141,
       add_16_23_n_142, add_16_23_n_143;
  wire add_16_23_n_144, add_16_23_n_145, add_16_23_n_146,
       add_16_23_n_147, add_16_23_n_148, add_16_23_n_149,
       add_16_23_n_150, add_16_23_n_151;
  wire add_16_23_n_152, add_16_23_n_153, add_16_23_n_154,
       add_16_23_n_155, add_16_23_n_156, add_16_23_n_157,
       add_16_23_n_158, add_16_23_n_159;
  wire add_16_23_n_160, add_16_23_n_161, add_16_23_n_162,
       add_16_23_n_163, add_16_23_n_164, add_16_23_n_165,
       add_16_23_n_166, add_16_23_n_167;
  wire add_16_23_n_168, add_16_23_n_169, add_16_23_n_170,
       add_16_23_n_171, add_16_23_n_172, add_16_23_n_173,
       add_16_23_n_174, add_16_23_n_175;
  wire add_16_23_n_176, add_16_23_n_177, add_16_23_n_178,
       add_16_23_n_179, add_16_23_n_180, add_16_23_n_181,
       add_16_23_n_182, add_16_23_n_183;
  wire add_16_23_n_184, add_16_23_n_185, add_16_23_n_186,
       add_16_23_n_187, add_16_23_n_188, add_16_23_n_189, n_255, n_260;
  wire n_261, n_263, n_264, n_265, n_267, n_268, n_269, n_270;
  wire n_272, n_275, n_276, n_277, n_279, n_280, n_286, n_287;
  wire n_288, n_290, n_293, n_294, n_296, n_297, n_298, n_300;
  wire n_301, n_302;
  MXI2X1 add_16_23_g820(.A (add_16_23_n_27), .B (in2[17]), .S0
       (add_16_23_n_188), .Y (out1[17]));
  MXI2X1 add_16_23_g821(.A (add_16_23_n_30), .B (in2[22]), .S0
       (add_16_23_n_178), .Y (out1[22]));
  MXI2X1 add_16_23_g822(.A (add_16_23_n_34), .B (in2[19]), .S0
       (add_16_23_n_179), .Y (out1[19]));
  MXI2X1 add_16_23_g823(.A (add_16_23_n_37), .B (in2[25]), .S0
       (add_16_23_n_180), .Y (out1[25]));
  MXI2X1 add_16_23_g824(.A (add_16_23_n_26), .B (in2[23]), .S0
       (add_16_23_n_182), .Y (out1[23]));
  MXI2X1 add_16_23_g825(.A (add_16_23_n_23), .B (in2[27]), .S0
       (add_16_23_n_176), .Y (out1[27]));
  MXI2X1 add_16_23_g826(.A (add_16_23_n_24), .B (in2[29]), .S0
       (add_16_23_n_177), .Y (out1[29]));
  MXI2X1 add_16_23_g827(.A (add_16_23_n_35), .B (in2[21]), .S0
       (add_16_23_n_181), .Y (out1[21]));
  MXI2X1 add_16_23_g828(.A (add_16_23_n_36), .B (in2[30]), .S0
       (add_16_23_n_175), .Y (out1[30]));
  MXI2X1 add_16_23_g829(.A (add_16_23_n_31), .B (in2[28]), .S0
       (add_16_23_n_184), .Y (out1[28]));
  MXI2X1 add_16_23_g830(.A (add_16_23_n_22), .B (in2[26]), .S0
       (add_16_23_n_189), .Y (out1[26]));
  MXI2X1 add_16_23_g831(.A (add_16_23_n_19), .B (in2[24]), .S0
       (add_16_23_n_187), .Y (out1[24]));
  MXI2X1 add_16_23_g832(.A (add_16_23_n_39), .B (in2[31]), .S0
       (add_16_23_n_185), .Y (out1[31]));
  MXI2X1 add_16_23_g833(.A (add_16_23_n_33), .B (in2[18]), .S0
       (add_16_23_n_183), .Y (out1[18]));
  MXI2X1 add_16_23_g834(.A (add_16_23_n_20), .B (in2[20]), .S0
       (add_16_23_n_186), .Y (out1[20]));
  MXI2X1 add_16_23_g835(.A (in2[14]), .B (add_16_23_n_18), .S0
       (add_16_23_n_168), .Y (out1[14]));
  MXI2XL add_16_23_g836(.A (in2[16]), .B (add_16_23_n_32), .S0
       (add_16_23_n_174), .Y (out1[16]));
  MXI2X1 add_16_23_g837(.A (in2[15]), .B (add_16_23_n_25), .S0
       (add_16_23_n_169), .Y (out1[15]));
  MXI2XL add_16_23_g838(.A (add_16_23_n_88), .B (add_16_23_n_87), .S0
       (add_16_23_n_17), .Y (out1[12]));
  MXI2X1 add_16_23_g842(.A (in2[13]), .B (add_16_23_n_21), .S0
       (add_16_23_n_170), .Y (out1[13]));
  NOR2BX1 add_16_23_g843(.AN (add_16_23_n_137), .B (add_16_23_n_174),
       .Y (add_16_23_n_189));
  NOR2X1 add_16_23_g844(.A (add_16_23_n_32), .B (add_16_23_n_174), .Y
       (add_16_23_n_188));
  NOR2X1 add_16_23_g845(.A (add_16_23_n_111), .B (add_16_23_n_174), .Y
       (add_16_23_n_187));
  NOR2X1 add_16_23_g846(.A (n_267), .B (add_16_23_n_174), .Y
       (add_16_23_n_186));
  NOR2X1 add_16_23_g847(.A (add_16_23_n_133), .B (add_16_23_n_174), .Y
       (add_16_23_n_185));
  NOR2BX1 add_16_23_g848(.AN (add_16_23_n_139), .B (add_16_23_n_174),
       .Y (add_16_23_n_184));
  NOR2X1 add_16_23_g849(.A (add_16_23_n_61), .B (add_16_23_n_174), .Y
       (add_16_23_n_183));
  NOR2X1 add_16_23_g850(.A (add_16_23_n_106), .B (add_16_23_n_174), .Y
       (add_16_23_n_182));
  NOR2X1 add_16_23_g851(.A (add_16_23_n_120), .B (add_16_23_n_174), .Y
       (add_16_23_n_181));
  NOR2X1 add_16_23_g852(.A (add_16_23_n_136), .B (add_16_23_n_174), .Y
       (add_16_23_n_180));
  NOR2X1 add_16_23_g853(.A (add_16_23_n_92), .B (add_16_23_n_174), .Y
       (add_16_23_n_179));
  NOR2BX1 add_16_23_g854(.AN (add_16_23_n_121), .B (add_16_23_n_174),
       .Y (add_16_23_n_178));
  NOR2X1 add_16_23_g855(.A (add_16_23_n_128), .B (add_16_23_n_174), .Y
       (add_16_23_n_177));
  NOR2X1 add_16_23_g856(.A (add_16_23_n_129), .B (add_16_23_n_174), .Y
       (add_16_23_n_176));
  NOR2BX1 add_16_23_g857(.AN (add_16_23_n_130), .B (add_16_23_n_174),
       .Y (add_16_23_n_175));
  NOR2X1 add_16_23_g859(.A (n_260), .B (add_16_23_n_166), .Y
       (add_16_23_n_173));
  NOR2BX1 add_16_23_g860(.AN (add_16_23_n_45), .B (add_16_23_n_165), .Y
       (add_16_23_n_172));
  NOR2X1 add_16_23_g861(.A (add_16_23_n_143), .B (add_16_23_n_160), .Y
       (add_16_23_n_171));
  NOR2X1 add_16_23_g862(.A (add_16_23_n_148), .B (add_16_23_n_163), .Y
       (add_16_23_n_170));
  NOR2X6 add_16_23_g863(.A (add_16_23_n_146), .B (add_16_23_n_161), .Y
       (add_16_23_n_174));
  NOR2X1 add_16_23_g868(.A (add_16_23_n_145), .B (add_16_23_n_164), .Y
       (add_16_23_n_169));
  NOR2X1 add_16_23_g869(.A (add_16_23_n_147), .B (add_16_23_n_162), .Y
       (add_16_23_n_168));
  NOR2X1 add_16_23_g870(.A (add_16_23_n_122), .B (add_16_23_n_159), .Y
       (add_16_23_n_167));
  NOR2X1 add_16_23_g871(.A (add_16_23_n_96), .B (add_16_23_n_159), .Y
       (add_16_23_n_166));
  NOR2X1 add_16_23_g872(.A (add_16_23_n_62), .B (add_16_23_n_159), .Y
       (add_16_23_n_165));
  NOR2X1 add_16_23_g873(.A (add_16_23_n_134), .B (add_16_23_n_159), .Y
       (add_16_23_n_164));
  NOR2X1 add_16_23_g874(.A (add_16_23_n_127), .B (add_16_23_n_159), .Y
       (add_16_23_n_163));
  NOR2X1 add_16_23_g875(.A (add_16_23_n_131), .B (add_16_23_n_159), .Y
       (add_16_23_n_162));
  NOR2X4 add_16_23_g876(.A (add_16_23_n_138), .B (add_16_23_n_159), .Y
       (add_16_23_n_161));
  NOR2X1 add_16_23_g877(.A (add_16_23_n_107), .B (add_16_23_n_159), .Y
       (add_16_23_n_160));
  NOR2X4 add_16_23_g878(.A (add_16_23_n_142), .B (add_16_23_n_154), .Y
       (add_16_23_n_159));
  NOR2BX1 add_16_23_g880(.AN (n_286), .B (add_16_23_n_156), .Y
       (add_16_23_n_158));
  NOR2X1 add_16_23_g883(.A (add_16_23_n_144), .B (add_16_23_n_153), .Y
       (add_16_23_n_157));
  NOR2X1 add_16_23_g884(.A (add_16_23_n_63), .B (n_290), .Y
       (add_16_23_n_156));
  NOR2X1 add_16_23_g885(.A (add_16_23_n_81), .B (n_290), .Y
       (add_16_23_n_155));
  NOR2X4 add_16_23_g886(.A (add_16_23_n_117), .B (add_16_23_n_151), .Y
       (add_16_23_n_154));
  NOR2X1 add_16_23_g887(.A (add_16_23_n_118), .B (n_290), .Y
       (add_16_23_n_153));
  NOR2BX1 add_16_23_g888(.AN (n_275), .B (add_16_23_n_150), .Y
       (add_16_23_n_152));
  NOR2X6 add_16_23_g890(.A (add_16_23_n_105), .B (add_16_23_n_149), .Y
       (add_16_23_n_151));
  NOR2X1 add_16_23_g891(.A (n_279), .B (n_264), .Y (add_16_23_n_150));
  NOR2X4 add_16_23_g892(.A (add_16_23_n_76), .B (add_16_23_n_140), .Y
       (add_16_23_n_149));
  OAI21X1 add_16_23_g893(.A0 (n_297), .A1 (n_272), .B0
       (add_16_23_n_67), .Y (add_16_23_n_148));
  OAI21X1 add_16_23_g894(.A0 (add_16_23_n_94), .A1 (n_272), .B0
       (add_16_23_n_97), .Y (add_16_23_n_147));
  OAI21X4 add_16_23_g895(.A0 (add_16_23_n_126), .A1 (add_16_23_n_141),
       .B0 (add_16_23_n_119), .Y (add_16_23_n_146));
  OAI21X1 add_16_23_g896(.A0 (add_16_23_n_124), .A1 (n_272), .B0
       (add_16_23_n_116), .Y (add_16_23_n_145));
  OAI21X1 add_16_23_g897(.A0 (add_16_23_n_58), .A1 (n_301), .B0
       (add_16_23_n_48), .Y (add_16_23_n_144));
  OAI2BB1X1 add_16_23_g898(.A0N (add_16_23_n_3), .A1N (n_261), .B0
       (add_16_23_n_59), .Y (add_16_23_n_143));
  OAI21X2 add_16_23_g899(.A0 (add_16_23_n_104), .A1 (add_16_23_n_113),
       .B0 (add_16_23_n_108), .Y (add_16_23_n_142));
  NOR2X4 add_16_23_g901(.A (add_16_23_n_109), .B (add_16_23_n_132), .Y
       (add_16_23_n_141));
  NOR2X2 add_16_23_g902(.A (add_16_23_n_53), .B (add_16_23_n_135), .Y
       (add_16_23_n_140));
  NOR2XL add_16_23_g904(.A (add_16_23_n_79), .B (add_16_23_n_111), .Y
       (add_16_23_n_139));
  NAND2X2 add_16_23_g905(.A (add_16_23_n_125), .B (add_16_23_n_123), .Y
       (add_16_23_n_138));
  NOR2XL add_16_23_g906(.A (add_16_23_n_50), .B (add_16_23_n_111), .Y
       (add_16_23_n_137));
  NAND2X1 add_16_23_g907(.A (in2[24]), .B (add_16_23_n_112), .Y
       (add_16_23_n_136));
  NOR2X4 add_16_23_g908(.A (add_16_23_n_55), .B (add_16_23_n_46), .Y
       (add_16_23_n_135));
  OR2XL add_16_23_g909(.A (add_16_23_n_124), .B (add_16_23_n_122), .Y
       (add_16_23_n_134));
  NAND2X1 add_16_23_g910(.A (add_16_23_n_110), .B (add_16_23_n_112), .Y
       (add_16_23_n_133));
  NOR2X2 add_16_23_g911(.A (add_16_23_n_4), .B (add_16_23_n_114), .Y
       (add_16_23_n_132));
  NAND2BX1 add_16_23_g912(.AN (add_16_23_n_94), .B (add_16_23_n_123),
       .Y (add_16_23_n_131));
  NOR3X1 add_16_23_g913(.A (add_16_23_n_79), .B (add_16_23_n_72), .C
       (add_16_23_n_111), .Y (add_16_23_n_130));
  NAND3BXL add_16_23_g914(.AN (add_16_23_n_50), .B (add_16_23_n_112),
       .C (in2[26]), .Y (add_16_23_n_129));
  NAND3BXL add_16_23_g915(.AN (add_16_23_n_79), .B (add_16_23_n_112),
       .C (in2[28]), .Y (add_16_23_n_128));
  NAND2BX1 add_16_23_g916(.AN (add_16_23_n_43), .B (add_16_23_n_123),
       .Y (add_16_23_n_127));
  INVX1 add_16_23_g918(.A (add_16_23_n_125), .Y (add_16_23_n_126));
  INVX1 add_16_23_g919(.A (add_16_23_n_123), .Y (add_16_23_n_122));
  NOR2X1 add_16_23_g920(.A (add_16_23_n_52), .B (n_269), .Y
       (add_16_23_n_121));
  NAND2X1 add_16_23_g921(.A (in2[20]), .B (n_268), .Y
       (add_16_23_n_120));
  OR2XL add_16_23_g922(.A (add_16_23_n_56), .B (add_16_23_n_97), .Y
       (add_16_23_n_119));
  OR2XL add_16_23_g923(.A (add_16_23_n_58), .B (add_16_23_n_81), .Y
       (add_16_23_n_118));
  NAND2X2 add_16_23_g924(.A (add_16_23_n_103), .B (add_16_23_n_80), .Y
       (add_16_23_n_117));
  OR2XL add_16_23_g925(.A (add_16_23_n_18), .B (add_16_23_n_97), .Y
       (add_16_23_n_116));
  NOR2X2 add_16_23_g926(.A (add_16_23_n_56), .B (add_16_23_n_94), .Y
       (add_16_23_n_125));
  NAND2X1 add_16_23_g927(.A (in2[14]), .B (add_16_23_n_93), .Y
       (add_16_23_n_124));
  NOR2X2 add_16_23_g928(.A (add_16_23_n_4), .B (add_16_23_n_96), .Y
       (add_16_23_n_123));
  INVX1 add_16_23_g931(.A (add_16_23_n_112), .Y (add_16_23_n_111));
  NOR3X1 add_16_23_g932(.A (add_16_23_n_79), .B (add_16_23_n_36), .C
       (add_16_23_n_72), .Y (add_16_23_n_110));
  OAI21X1 add_16_23_g933(.A0 (add_16_23_n_59), .A1 (add_16_23_n_47),
       .B0 (add_16_23_n_73), .Y (add_16_23_n_109));
  AOI2BB1X1 add_16_23_g934(.A0N (add_16_23_n_48), .A1N
       (add_16_23_n_64), .B0 (add_16_23_n_74), .Y (add_16_23_n_108));
  NAND2X1 add_16_23_g935(.A (add_16_23_n_3), .B (add_16_23_n_95), .Y
       (add_16_23_n_107));
  NAND3BXL add_16_23_g936(.AN (add_16_23_n_52), .B (n_270), .C
       (in2[22]), .Y (add_16_23_n_106));
  OAI21X2 add_16_23_g937(.A0 (add_16_23_n_66), .A1 (add_16_23_n_71),
       .B0 (add_16_23_n_54), .Y (add_16_23_n_105));
  NOR2X1 add_16_23_g938(.A (add_16_23_n_1), .B (add_16_23_n_91), .Y
       (add_16_23_n_114));
  NOR2X2 add_16_23_g939(.A (add_16_23_n_0), .B (add_16_23_n_90), .Y
       (add_16_23_n_113));
  NOR2X2 add_16_23_g940(.A (add_16_23_n_75), .B (add_16_23_n_78), .Y
       (add_16_23_n_112));
  INVX1 add_16_23_g941(.A (add_16_23_n_103), .Y (add_16_23_n_104));
  INVX2 add_16_23_g947(.A (add_16_23_n_95), .Y (add_16_23_n_96));
  INVX1 add_16_23_g948(.A (add_16_23_n_93), .Y (add_16_23_n_94));
  OR2XL add_16_23_g949(.A (add_16_23_n_33), .B (add_16_23_n_61), .Y
       (add_16_23_n_92));
  NOR2X1 add_16_23_g950(.A (add_16_23_n_45), .B (add_16_23_n_70), .Y
       (add_16_23_n_91));
  NOR2X1 add_16_23_g951(.A (add_16_23_n_44), .B (add_16_23_n_49), .Y
       (add_16_23_n_90));
  NOR2X1 add_16_23_g952(.A (add_16_23_n_53), .B (add_16_23_n_55), .Y
       (add_16_23_n_89));
  NOR2X1 add_16_23_g953(.A (add_16_23_n_64), .B (add_16_23_n_58), .Y
       (add_16_23_n_103));
  NAND2BX1 add_16_23_g954(.AN (add_16_23_n_58), .B (add_16_23_n_48), .Y
       (add_16_23_n_102));
  NOR2X1 add_16_23_g955(.A (add_16_23_n_0), .B (add_16_23_n_49), .Y
       (add_16_23_n_101));
  NAND2BX1 add_16_23_g956(.AN (add_16_23_n_63), .B (n_287), .Y
       (add_16_23_n_100));
  NOR2X1 add_16_23_g957(.A (add_16_23_n_74), .B (add_16_23_n_64), .Y
       (add_16_23_n_99));
  NAND2BX1 add_16_23_g958(.AN (n_280), .B (n_276), .Y (add_16_23_n_98));
  OR2XL add_16_23_g959(.A (add_16_23_n_21), .B (add_16_23_n_67), .Y
       (add_16_23_n_97));
  NOR2X2 add_16_23_g960(.A (add_16_23_n_70), .B (add_16_23_n_62), .Y
       (add_16_23_n_95));
  NOR2X1 add_16_23_g961(.A (add_16_23_n_21), .B (add_16_23_n_43), .Y
       (add_16_23_n_93));
  INVX1 add_16_23_g962(.A (add_16_23_n_87), .Y (add_16_23_n_88));
  INVX1 add_16_23_g968(.A (add_16_23_n_80), .Y (add_16_23_n_81));
  NAND2X4 add_16_23_g971(.A (n_294), .B (add_16_23_n_68), .Y
       (add_16_23_n_76));
  NAND2X1 add_16_23_g972(.A (add_16_23_n_42), .B (add_16_23_n_51), .Y
       (add_16_23_n_75));
  NAND2BX1 add_16_23_g973(.AN (n_296), .B (add_16_23_n_67), .Y
       (add_16_23_n_87));
  NAND2BX1 add_16_23_g974(.AN (add_16_23_n_62), .B (add_16_23_n_45), .Y
       (add_16_23_n_86));
  NOR2BX1 add_16_23_g975(.AN (add_16_23_n_73), .B (add_16_23_n_47), .Y
       (add_16_23_n_85));
  NOR2BX1 add_16_23_g976(.AN (add_16_23_n_54), .B (n_293), .Y
       (add_16_23_n_84));
  NOR2X1 add_16_23_g977(.A (add_16_23_n_1), .B (add_16_23_n_70), .Y
       (add_16_23_n_83));
  NAND2X1 add_16_23_g979(.A (add_16_23_n_59), .B (add_16_23_n_3), .Y
       (add_16_23_n_82));
  NOR2X1 add_16_23_g980(.A (add_16_23_n_49), .B (add_16_23_n_63), .Y
       (add_16_23_n_80));
  OR2X1 add_16_23_g981(.A (add_16_23_n_57), .B (add_16_23_n_50), .Y
       (add_16_23_n_79));
  NAND2X2 add_16_23_g982(.A (add_16_23_n_41), .B (add_16_23_n_60), .Y
       (add_16_23_n_78));
  INVX1 add_16_23_g985(.A (add_16_23_n_60), .Y (add_16_23_n_61));
  NAND2X1 add_16_23_g986(.A (in2[27]), .B (in2[26]), .Y
       (add_16_23_n_57));
  AND2X1 add_16_23_g987(.A (in2[7]), .B (in1[7]), .Y (add_16_23_n_74));
  NAND2X1 add_16_23_g988(.A (in2[11]), .B (in1[11]), .Y
       (add_16_23_n_73));
  NAND2X1 add_16_23_g989(.A (in2[29]), .B (in2[28]), .Y
       (add_16_23_n_72));
  NAND2X2 add_16_23_g990(.A (in2[2]), .B (in1[2]), .Y (add_16_23_n_71));
  NOR2X2 add_16_23_g991(.A (in2[9]), .B (in1[9]), .Y (add_16_23_n_70));
  NAND2X2 add_16_23_g992(.A (add_16_23_n_38), .B (add_16_23_n_29), .Y
       (add_16_23_n_68));
  NAND2X1 add_16_23_g993(.A (in2[12]), .B (in1[12]), .Y
       (add_16_23_n_67));
  NOR2X6 add_16_23_g994(.A (in2[3]), .B (in1[3]), .Y (add_16_23_n_66));
  NOR2X4 add_16_23_g995(.A (in2[7]), .B (in1[7]), .Y (add_16_23_n_64));
  NOR2X1 add_16_23_g996(.A (in2[4]), .B (in1[4]), .Y (add_16_23_n_63));
  NOR2X1 add_16_23_g997(.A (in2[8]), .B (in1[8]), .Y (add_16_23_n_62));
  NOR2X2 add_16_23_g998(.A (add_16_23_n_27), .B (add_16_23_n_32), .Y
       (add_16_23_n_60));
  NAND2X1 add_16_23_g999(.A (in2[10]), .B (in1[10]), .Y
       (add_16_23_n_59));
  NOR2X4 add_16_23_g1000(.A (in2[6]), .B (in1[6]), .Y (add_16_23_n_58));
  INVX1 add_16_23_g1002(.A (add_16_23_n_51), .Y (add_16_23_n_52));
  NOR2X1 add_16_23_g1004(.A (add_16_23_n_26), .B (add_16_23_n_30), .Y
       (add_16_23_n_42));
  NOR2X1 add_16_23_g1005(.A (add_16_23_n_34), .B (add_16_23_n_33), .Y
       (add_16_23_n_41));
  NAND2X1 add_16_23_g1006(.A (in2[15]), .B (in2[14]), .Y
       (add_16_23_n_56));
  NOR2X8 add_16_23_g1007(.A (in2[1]), .B (in1[1]), .Y (add_16_23_n_55));
  NAND2X1 add_16_23_g1008(.A (in2[3]), .B (in1[3]), .Y
       (add_16_23_n_54));
  NOR2X2 add_16_23_g1011(.A (add_16_23_n_28), .B (add_16_23_n_40), .Y
       (add_16_23_n_53));
  NOR2X1 add_16_23_g1012(.A (add_16_23_n_35), .B (add_16_23_n_20), .Y
       (add_16_23_n_51));
  NAND2X1 add_16_23_g1013(.A (in2[25]), .B (in2[24]), .Y
       (add_16_23_n_50));
  NOR2X2 add_16_23_g1014(.A (in2[5]), .B (in1[5]), .Y (add_16_23_n_49));
  NAND2X1 add_16_23_g1015(.A (in2[6]), .B (in1[6]), .Y
       (add_16_23_n_48));
  NOR2X4 add_16_23_g1016(.A (in2[11]), .B (in1[11]), .Y
       (add_16_23_n_47));
  NAND2X8 add_16_23_g1017(.A (in2[0]), .B (in1[0]), .Y
       (add_16_23_n_46));
  NAND2X1 add_16_23_g1018(.A (in2[8]), .B (in1[8]), .Y
       (add_16_23_n_45));
  NAND2X1 add_16_23_g1019(.A (in2[4]), .B (in1[4]), .Y
       (add_16_23_n_44));
  NOR2X1 add_16_23_g1020(.A (in2[12]), .B (in1[12]), .Y
       (add_16_23_n_43));
  CLKINVX2 add_16_23_g1022(.A (in1[1]), .Y (add_16_23_n_40));
  INVXL add_16_23_g1023(.A (in2[31]), .Y (add_16_23_n_39));
  CLKINVX2 add_16_23_g1024(.A (in2[2]), .Y (add_16_23_n_38));
  INVXL add_16_23_g1025(.A (in2[25]), .Y (add_16_23_n_37));
  INVX1 add_16_23_g1026(.A (in2[30]), .Y (add_16_23_n_36));
  INVX1 add_16_23_g1027(.A (in2[21]), .Y (add_16_23_n_35));
  INVX1 add_16_23_g1028(.A (in2[19]), .Y (add_16_23_n_34));
  INVX1 add_16_23_g1030(.A (in2[18]), .Y (add_16_23_n_33));
  INVX1 add_16_23_g1031(.A (in2[16]), .Y (add_16_23_n_32));
  INVXL add_16_23_g1032(.A (in2[28]), .Y (add_16_23_n_31));
  INVX1 add_16_23_g1033(.A (in2[22]), .Y (add_16_23_n_30));
  INVX1 add_16_23_g1038(.A (in1[2]), .Y (add_16_23_n_29));
  CLKINVX2 add_16_23_g1040(.A (in2[1]), .Y (add_16_23_n_28));
  INVX1 add_16_23_g1041(.A (in2[17]), .Y (add_16_23_n_27));
  INVX1 add_16_23_g1042(.A (in2[23]), .Y (add_16_23_n_26));
  INVX1 add_16_23_g1043(.A (in2[15]), .Y (add_16_23_n_25));
  INVXL add_16_23_g1044(.A (in2[29]), .Y (add_16_23_n_24));
  INVXL add_16_23_g1045(.A (in2[27]), .Y (add_16_23_n_23));
  INVXL add_16_23_g1046(.A (in2[26]), .Y (add_16_23_n_22));
  INVX1 add_16_23_g1047(.A (in2[13]), .Y (add_16_23_n_21));
  INVX1 add_16_23_g1048(.A (in2[20]), .Y (add_16_23_n_20));
  INVXL add_16_23_g1049(.A (in2[24]), .Y (add_16_23_n_19));
  INVX1 add_16_23_g1050(.A (in2[14]), .Y (add_16_23_n_18));
  NOR2BX1 add_16_23_g2(.AN (n_272), .B (add_16_23_n_167), .Y
       (add_16_23_n_17));
  XNOR2X1 add_16_23_g1051(.A (add_16_23_n_46), .B (add_16_23_n_89), .Y
       (out1[1]));
  NOR2BX1 add_16_23_g1052(.AN (n_300), .B (add_16_23_n_155), .Y
       (add_16_23_n_15));
  CLKXOR2X1 add_16_23_g1053(.A (add_16_23_n_102), .B (add_16_23_n_15),
       .Y (out1[6]));
  XNOR2X1 add_16_23_g1054(.A (add_16_23_n_101), .B (add_16_23_n_158),
       .Y (out1[5]));
  CLKXOR2X1 add_16_23_g1055(.A (add_16_23_n_100), .B (n_290), .Y
       (out1[4]));
  XNOR2X1 add_16_23_g1056(.A (add_16_23_n_99), .B (add_16_23_n_157), .Y
       (out1[7]));
  CLKXOR2X1 add_16_23_g1057(.A (add_16_23_n_98), .B (n_263), .Y
       (out1[2]));
  CLKXOR2X1 add_16_23_g1058(.A (add_16_23_n_86), .B (n_255), .Y
       (out1[8]));
  XNOR2XL add_16_23_g1059(.A (add_16_23_n_85), .B (add_16_23_n_171), .Y
       (out1[11]));
  XNOR2X1 add_16_23_g1060(.A (add_16_23_n_84), .B (add_16_23_n_152), .Y
       (out1[3]));
  XNOR2XL add_16_23_g1061(.A (add_16_23_n_83), .B (add_16_23_n_172), .Y
       (out1[9]));
  XOR2XL add_16_23_g1062(.A (add_16_23_n_82), .B (add_16_23_n_173), .Y
       (out1[10]));
  NAND2BX2 add_16_23_g1063(.AN (add_16_23_n_47), .B (add_16_23_n_3), .Y
       (add_16_23_n_4));
  OR2X6 add_16_23_g1064(.A (in2[10]), .B (in1[10]), .Y (add_16_23_n_3));
  CLKXOR2X1 add_16_23_g1065(.A (in2[0]), .B (in1[0]), .Y (out1[0]));
  AND2X1 add_16_23_g1066(.A (in2[9]), .B (in1[9]), .Y (add_16_23_n_1));
  AND2X1 add_16_23_g1067(.A (in2[5]), .B (in1[5]), .Y (add_16_23_n_0));
  BUFX2 fopt(.A (add_16_23_n_159), .Y (n_255));
  BUFX2 fopt1068(.A (n_261), .Y (n_260));
  INVXL fopt1(.A (add_16_23_n_114), .Y (n_261));
  INVXL fopt1069(.A (n_265), .Y (n_263));
  INVXL fopt1070(.A (n_265), .Y (n_264));
  INVXL fopt2(.A (add_16_23_n_140), .Y (n_265));
  INVXL fopt1071(.A (n_268), .Y (n_267));
  CLKINVX1 fopt1072(.A (n_269), .Y (n_268));
  CLKINVX1 fopt1073(.A (n_270), .Y (n_269));
  CLKINVX1 fopt3(.A (add_16_23_n_78), .Y (n_270));
  BUFX3 fopt1074(.A (add_16_23_n_141), .Y (n_272));
  INVXL fopt1075(.A (n_277), .Y (n_275));
  INVXL fopt1076(.A (n_277), .Y (n_276));
  INVXL fopt1077(.A (add_16_23_n_71), .Y (n_277));
  BUFX2 fopt1078(.A (n_280), .Y (n_279));
  INVXL fopt1079(.A (add_16_23_n_68), .Y (n_280));
  INVXL fopt1082(.A (n_288), .Y (n_286));
  INVXL fopt1083(.A (n_288), .Y (n_287));
  INVXL fopt1084(.A (add_16_23_n_44), .Y (n_288));
  BUFX3 fopt1085(.A (add_16_23_n_151), .Y (n_290));
  INVXL fopt1086(.A (n_294), .Y (n_293));
  CLKINVX2 fopt1087(.A (add_16_23_n_66), .Y (n_294));
  INVXL fopt1088(.A (n_298), .Y (n_296));
  INVXL fopt1089(.A (n_298), .Y (n_297));
  INVXL fopt1090(.A (add_16_23_n_43), .Y (n_298));
  INVXL fopt1091(.A (n_302), .Y (n_300));
  INVXL fopt1092(.A (n_302), .Y (n_301));
  INVXL fopt1093(.A (add_16_23_n_113), .Y (n_302));
endmodule


