`timescale 1ps / 1ps

// Generated by Cadence Genus(TM) Synthesis Solution 21.15-s080_1
// Generated on: Jun  9 2025 16:44:41 CST (Jun  9 2025 08:44:41 UTC)

module dut_LessThan_1U_37_4(in1, out1);
  input [7:0] in1;
  output out1;
  wire [7:0] in1;
  wire out1;
  wire lt_15_26_n_0, lt_15_26_n_1, lt_15_26_n_2;
  NOR2X1 lt_15_26_g109(.A (lt_15_26_n_1), .B (lt_15_26_n_2), .Y (out1));
  NOR4X1 lt_15_26_g110(.A (lt_15_26_n_0), .B (in1[1]), .C (in1[3]), .D
       (in1[2]), .Y (lt_15_26_n_2));
  OAI22X1 lt_15_26_g111(.A0 (in1[4]), .A1 (lt_15_26_n_0), .B0 (in1[7]),
       .B1 (in1[6]), .Y (lt_15_26_n_1));
  OR2XL lt_15_26_g112(.A (in1[7]), .B (in1[5]), .Y (lt_15_26_n_0));
endmodule


