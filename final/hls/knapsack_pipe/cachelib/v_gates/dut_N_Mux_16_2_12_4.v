`timescale 1ps / 1ps

// Generated by Cadence Genus(TM) Synthesis Solution 21.15-s080_1
// Generated on: Jun  9 2025 15:57:38 CST (Jun  9 2025 07:57:38 UTC)

module dut_N_Mux_16_2_12_4(in2, ctrl1, out1);
  input [15:0] in2;
  input ctrl1;
  output [15:0] out1;
  wire [15:0] in2;
  wire ctrl1;
  wire [15:0] out1;
  AND2XL g143(.A (in2[2]), .B (ctrl1), .Y (out1[2]));
  AND2XL g144(.A (in2[1]), .B (ctrl1), .Y (out1[1]));
  AND2XL g129(.A (in2[0]), .B (ctrl1), .Y (out1[0]));
  AND2XL g130(.A (in2[14]), .B (ctrl1), .Y (out1[14]));
  AND2XL g133(.A (in2[15]), .B (ctrl1), .Y (out1[15]));
  AND2XL g138(.A (in2[13]), .B (ctrl1), .Y (out1[13]));
  AND2XL g131(.A (in2[12]), .B (ctrl1), .Y (out1[12]));
  AND2XL g135(.A (in2[11]), .B (ctrl1), .Y (out1[11]));
  AND2XL g134(.A (in2[7]), .B (ctrl1), .Y (out1[7]));
  AND2XL g139(.A (in2[10]), .B (ctrl1), .Y (out1[10]));
  AND2XL g142(.A (in2[9]), .B (ctrl1), .Y (out1[9]));
  AND2XL g132(.A (in2[8]), .B (ctrl1), .Y (out1[8]));
  AND2XL g136(.A (in2[6]), .B (ctrl1), .Y (out1[6]));
  AND2XL g141(.A (in2[5]), .B (ctrl1), .Y (out1[5]));
  AND2XL g140(.A (in2[4]), .B (ctrl1), .Y (out1[4]));
  AND2XL g137(.A (in2[3]), .B (ctrl1), .Y (out1[3]));
endmodule


