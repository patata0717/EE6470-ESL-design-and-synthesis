`timescale 1ps / 1ps

// Generated by Cadence Genus(TM) Synthesis Solution 21.15-s080_1
// Generated on: Jun  9 2025 16:45:19 CST (Jun  9 2025 08:45:19 UTC)

module dut_GreaterThanEQ_1U_159_4(in1, out1);
  input [7:0] in1;
  output out1;
  wire [7:0] in1;
  wire out1;
  wire gte_15_26_n_0, gte_15_26_n_1;
  AND2XL gte_15_26_g118(.A (gte_15_26_n_0), .B (gte_15_26_n_1), .Y
       (out1));
  OAI32X1 gte_15_26_g119(.A0 (in1[3]), .A1 (in1[1]), .A2 (in1[0]), .B0
       (in1[3]), .B1 (in1[2]), .Y (gte_15_26_n_1));
  NOR4X1 gte_15_26_g120(.A (in1[7]), .B (in1[6]), .C (in1[5]), .D
       (in1[4]), .Y (gte_15_26_n_0));
endmodule


