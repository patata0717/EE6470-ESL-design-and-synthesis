`timescale 1ps / 1ps

// Generated by Cadence Genus(TM) Synthesis Solution 21.15-s080_1
// Generated on: Jun  4 2025 01:36:07 CST (Jun  3 2025 17:36:07 UTC)

module dut_N_Mux_56_2_105_4(in3, in2, ctrl1, out1);
  input [55:0] in3, in2;
  input ctrl1;
  output [55:0] out1;
  wire [55:0] in3, in2;
  wire ctrl1;
  wire [55:0] out1;
  MX2XL g569(.A (in3[28]), .B (in2[28]), .S0 (ctrl1), .Y (out1[28]));
  MX2XL g591(.A (in3[54]), .B (in2[54]), .S0 (ctrl1), .Y (out1[54]));
  MX2XL g592(.A (in3[53]), .B (in2[53]), .S0 (ctrl1), .Y (out1[53]));
  MX2XL g562(.A (in3[52]), .B (in2[52]), .S0 (ctrl1), .Y (out1[52]));
  MX2XL g579(.A (in3[51]), .B (in2[51]), .S0 (ctrl1), .Y (out1[51]));
  MX2XL g599(.A (in3[50]), .B (in2[50]), .S0 (ctrl1), .Y (out1[50]));
  MX2XL g563(.A (in3[49]), .B (in2[49]), .S0 (ctrl1), .Y (out1[49]));
  MX2XL g573(.A (in3[48]), .B (in2[48]), .S0 (ctrl1), .Y (out1[48]));
  MX2XL g580(.A (in3[47]), .B (in2[47]), .S0 (ctrl1), .Y (out1[47]));
  MX2XL g586(.A (in3[46]), .B (in2[46]), .S0 (ctrl1), .Y (out1[46]));
  MX2XL g600(.A (in3[45]), .B (in2[45]), .S0 (ctrl1), .Y (out1[45]));
  MX2XL g605(.A (in3[44]), .B (in2[44]), .S0 (ctrl1), .Y (out1[44]));
  MX2XL g611(.A (in3[43]), .B (in2[43]), .S0 (ctrl1), .Y (out1[43]));
  MX2XL g564(.A (in3[42]), .B (in2[42]), .S0 (ctrl1), .Y (out1[42]));
  MX2XL g574(.A (in3[41]), .B (in2[41]), .S0 (ctrl1), .Y (out1[41]));
  MX2XL g576(.A (in3[40]), .B (in2[40]), .S0 (ctrl1), .Y (out1[40]));
  MX2XL g581(.A (in3[39]), .B (in2[39]), .S0 (ctrl1), .Y (out1[39]));
  MX2XL g584(.A (in3[38]), .B (in2[38]), .S0 (ctrl1), .Y (out1[38]));
  MX2XL g616(.A (in3[37]), .B (in2[37]), .S0 (ctrl1), .Y (out1[37]));
  MX2XL g593(.A (in3[36]), .B (in2[36]), .S0 (ctrl1), .Y (out1[36]));
  MX2XL g596(.A (in3[35]), .B (in2[35]), .S0 (ctrl1), .Y (out1[35]));
  MX2XL g601(.A (in3[34]), .B (in2[34]), .S0 (ctrl1), .Y (out1[34]));
  MX2XL g606(.A (in3[33]), .B (in2[33]), .S0 (ctrl1), .Y (out1[33]));
  MX2XL g608(.A (in3[32]), .B (in2[32]), .S0 (ctrl1), .Y (out1[32]));
  MX2XL g612(.A (in3[31]), .B (in2[31]), .S0 (ctrl1), .Y (out1[31]));
  MX2XL g615(.A (in3[30]), .B (in2[30]), .S0 (ctrl1), .Y (out1[30]));
  MX2XL g565(.A (in3[29]), .B (in2[29]), .S0 (ctrl1), .Y (out1[29]));
  MX2XL g588(.A (in3[55]), .B (in2[55]), .S0 (ctrl1), .Y (out1[55]));
  MX2XL g571(.A (in3[0]), .B (in2[0]), .S0 (ctrl1), .Y (out1[0]));
  MX2XL g575(.A (in3[26]), .B (in2[26]), .S0 (ctrl1), .Y (out1[26]));
  MX2XL g577(.A (in3[25]), .B (in2[25]), .S0 (ctrl1), .Y (out1[25]));
  MX2XL g578(.A (in3[24]), .B (in2[24]), .S0 (ctrl1), .Y (out1[24]));
  MX2XL g582(.A (in3[23]), .B (in2[23]), .S0 (ctrl1), .Y (out1[23]));
  MX2XL g583(.A (in3[22]), .B (in2[22]), .S0 (ctrl1), .Y (out1[22]));
  MX2XL g585(.A (in3[21]), .B (in2[21]), .S0 (ctrl1), .Y (out1[21]));
  MX2XL g587(.A (in3[20]), .B (in2[20]), .S0 (ctrl1), .Y (out1[20]));
  MX2XL g561(.A (in3[19]), .B (in2[19]), .S0 (ctrl1), .Y (out1[19]));
  MX2XL g590(.A (in3[18]), .B (in2[18]), .S0 (ctrl1), .Y (out1[18]));
  MX2XL g594(.A (in3[17]), .B (in2[17]), .S0 (ctrl1), .Y (out1[17]));
  MX2XL g595(.A (in3[16]), .B (in2[16]), .S0 (ctrl1), .Y (out1[16]));
  MX2XL g597(.A (in3[15]), .B (in2[15]), .S0 (ctrl1), .Y (out1[15]));
  MX2XL g598(.A (in3[14]), .B (in2[14]), .S0 (ctrl1), .Y (out1[14]));
  MX2XL g602(.A (in3[13]), .B (in2[13]), .S0 (ctrl1), .Y (out1[13]));
  MX2XL g603(.A (in3[12]), .B (in2[12]), .S0 (ctrl1), .Y (out1[12]));
  MX2XL g604(.A (in3[11]), .B (in2[11]), .S0 (ctrl1), .Y (out1[11]));
  MX2XL g607(.A (in3[10]), .B (in2[10]), .S0 (ctrl1), .Y (out1[10]));
  MX2XL g609(.A (in3[9]), .B (in2[9]), .S0 (ctrl1), .Y (out1[9]));
  MX2XL g610(.A (in3[8]), .B (in2[8]), .S0 (ctrl1), .Y (out1[8]));
  MX2XL g613(.A (in3[7]), .B (in2[7]), .S0 (ctrl1), .Y (out1[7]));
  MX2XL g614(.A (in3[6]), .B (in2[6]), .S0 (ctrl1), .Y (out1[6]));
  MX2XL g589(.A (in3[5]), .B (in2[5]), .S0 (ctrl1), .Y (out1[5]));
  MX2XL g566(.A (in3[4]), .B (in2[4]), .S0 (ctrl1), .Y (out1[4]));
  MX2XL g567(.A (in3[3]), .B (in2[3]), .S0 (ctrl1), .Y (out1[3]));
  MX2XL g568(.A (in3[2]), .B (in2[2]), .S0 (ctrl1), .Y (out1[2]));
  MX2XL g570(.A (in3[1]), .B (in2[1]), .S0 (ctrl1), .Y (out1[1]));
  MX2XL g572(.A (in3[27]), .B (in2[27]), .S0 (ctrl1), .Y (out1[27]));
endmodule


