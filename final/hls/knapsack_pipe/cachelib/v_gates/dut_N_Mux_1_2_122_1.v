`timescale 1ps / 1ps

// Generated by Cadence Genus(TM) Synthesis Solution 21.15-s080_1
// Generated on: Jun  9 2025 16:47:05 CST (Jun  9 2025 08:47:05 UTC)

module dut_N_Mux_1_2_122_1(in2, ctrl1, out1);
  input in2, ctrl1;
  output out1;
  wire in2, ctrl1;
  wire out1;
  wire n_0, n_1;
  NAND2X2 g3(.A (n_0), .B (n_1), .Y (out1));
  INVX2 g4(.A (ctrl1), .Y (n_1));
  CLKINVX4 g5(.A (in2), .Y (n_0));
endmodule


