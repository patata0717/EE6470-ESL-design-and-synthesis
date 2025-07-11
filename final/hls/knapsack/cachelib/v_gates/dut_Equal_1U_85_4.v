`timescale 1ps / 1ps

// Generated by Cadence Genus(TM) Synthesis Solution 21.15-s080_1
// Generated on: Jun  4 2025 00:50:54 CST (Jun  3 2025 16:50:54 UTC)

module dut_Equal_1U_85_4(in1, out1);
  input [6:0] in1;
  output out1;
  wire [6:0] in1;
  wire out1;
  wire n_0, n_1, n_2;
  NOR2XL g35(.A (n_1), .B (n_2), .Y (out1));
  NAND4XL g36(.A (in1[0]), .B (in1[3]), .C (in1[4]), .D (n_0), .Y
       (n_2));
  NAND2X1 g37(.A (in1[2]), .B (in1[1]), .Y (n_1));
  NOR2BX1 g38(.AN (in1[6]), .B (in1[5]), .Y (n_0));
endmodule


