`timescale 1ps / 1ps

// Generated by Cadence Genus(TM) Synthesis Solution 21.15-s080_1
// Generated on: Jun  4 2025 00:40:10 CST (Jun  3 2025 16:40:10 UTC)

module dut_RightShift_16Ux4U_1U_1(in2, in1, out1);
  input [15:0] in2;
  input [3:0] in1;
  output out1;
  wire [15:0] in2;
  wire [3:0] in1;
  wire out1;
  wire srl_16_23_n_0, srl_16_23_n_1, srl_16_23_n_2, srl_16_23_n_3,
       srl_16_23_n_4, srl_16_23_n_5, srl_16_23_n_6, srl_16_23_n_7;
  wire srl_16_23_n_8, srl_16_23_n_9, srl_16_23_n_10, srl_16_23_n_11,
       srl_16_23_n_12, srl_16_23_n_13;
  MXI2XL srl_16_23_g267(.A (srl_16_23_n_12), .B (srl_16_23_n_13), .S0
       (in1[3]), .Y (out1));
  MXI2XL srl_16_23_g268(.A (srl_16_23_n_10), .B (srl_16_23_n_9), .S0
       (in1[2]), .Y (srl_16_23_n_13));
  MXI2XL srl_16_23_g269(.A (srl_16_23_n_8), .B (srl_16_23_n_11), .S0
       (in1[2]), .Y (srl_16_23_n_12));
  MXI2XL srl_16_23_g270(.A (srl_16_23_n_3), .B (srl_16_23_n_5), .S0
       (in1[1]), .Y (srl_16_23_n_11));
  MXI2XL srl_16_23_g271(.A (srl_16_23_n_0), .B (srl_16_23_n_2), .S0
       (in1[1]), .Y (srl_16_23_n_10));
  MXI2XL srl_16_23_g272(.A (srl_16_23_n_7), .B (srl_16_23_n_6), .S0
       (in1[1]), .Y (srl_16_23_n_9));
  MXI2XL srl_16_23_g273(.A (srl_16_23_n_4), .B (srl_16_23_n_1), .S0
       (in1[1]), .Y (srl_16_23_n_8));
  MXI2XL srl_16_23_g274(.A (in2[12]), .B (in2[13]), .S0 (in1[0]), .Y
       (srl_16_23_n_7));
  MXI2X1 srl_16_23_g275(.A (in2[14]), .B (in2[15]), .S0 (in1[0]), .Y
       (srl_16_23_n_6));
  MXI2XL srl_16_23_g276(.A (in2[6]), .B (in2[7]), .S0 (in1[0]), .Y
       (srl_16_23_n_5));
  MXI2XL srl_16_23_g277(.A (in2[0]), .B (in2[1]), .S0 (in1[0]), .Y
       (srl_16_23_n_4));
  MXI2XL srl_16_23_g278(.A (in2[4]), .B (in2[5]), .S0 (in1[0]), .Y
       (srl_16_23_n_3));
  MXI2X1 srl_16_23_g279(.A (in2[10]), .B (in2[11]), .S0 (in1[0]), .Y
       (srl_16_23_n_2));
  MXI2X1 srl_16_23_g280(.A (in2[2]), .B (in2[3]), .S0 (in1[0]), .Y
       (srl_16_23_n_1));
  MXI2X1 srl_16_23_g281(.A (in2[8]), .B (in2[9]), .S0 (in1[0]), .Y
       (srl_16_23_n_0));
endmodule


