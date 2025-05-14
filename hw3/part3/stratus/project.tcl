#*******************************************************************************
# Copyright 2015 Cadence Design Systems, Inc.
# All Rights Reserved.
#*******************************************************************************
#
# Stratus Project File
#
############################################################
# Project Parameters
############################################################
#
# Technology Libraries
#
set LIB_PATH "[get_install_path]/share/stratus/techlibs/GPDK045/gsclib045_svt_v4.4/gsclib045/timing"
set LIB_LEAF "slow_vdd1v2_basicCells.lib"
use_tech_lib    "$LIB_PATH/$LIB_LEAF"

#
# Global synthesis attributes.
#
set_attr clock_period           10.0
set_attr message_detail         3 
#set_attr default_input_delay    0.1
#set_attr sched_aggressive_1 on
#set_attr unroll_loops on
set_attr flatten_arrays all 
#set_attr timing_aggression 0
#set_attr default_protocol true

#
# Simulation Options
#
### 1. You may add your own options for C++ compilation here.
set_attr cc_options             "-DCLOCK_PERIOD=10.0 -g"
#set_attr enable_waveform_logging -vcd
set_attr end_of_sim_command "make saySimPassed"

#
# Testbench or System Level Modules
#
### 2. Add your testbench source files here.
define_system_module ../main.cpp
define_system_module ../Testbench.cpp
define_system_module ../System.cpp

#
# SC_MODULEs to be synthesized
#
### 3. Add your design source files here (to be high-level synthesized).
define_hls_module GaussianFilter ../GaussianFilter.cpp
define_hls_module LaplacianFilter ../LaplacianFilter.cpp

### 4. Define your HLS configuration (arbitrary names, BASIC and DPA in this example). 
define_hls_config GaussianFilter BASIC --flatten_arrays=all -post_elab_tcl {
    constrain_latency [find -loop "while_1"]
}
define_hls_config GaussianFilter PIPELINE -DPIPE_OPTION=SOFT_STALL -DII=1
define_hls_config GaussianFilter PIPELINE2 -DPIPE_OPTION=SOFT_STALL -DII=2
define_hls_config GaussianFilter PIPELINE3 -DPIPE_OPTION=SOFT_STALL -DII=3
define_hls_config GaussianFilter PIPELINE4 -DPIPE_OPTION=SOFT_STALL -DII=4
define_hls_config GaussianFilter DPA       --dpopt_auto=op,expr

define_hls_config LaplacianFilter BASIC --flatten_arrays=all -post_elab_tcl {
    constrain_latency [find -loop "while_1"]
}
define_hls_config LaplacianFilter PIPELINE -DPIPE_OPTION=SOFT_STALL -DII=1
define_hls_config LaplacianFilter PIPELINE2 -DPIPE_OPTION=SOFT_STALL -DII=2
define_hls_config LaplacianFilter PIPELINE3 -DPIPE_OPTION=SOFT_STALL -DII=3
define_hls_config LaplacianFilter PIPELINE4 -DPIPE_OPTION=SOFT_STALL -DII=4
define_hls_config LaplacianFilter DPA       --dpopt_auto=op,expr

set IMAGE_DIR           "../../SW/golden"
set IN_FILE_NAME        "${IMAGE_DIR}/lena_color_256_gray_noise.bmp"
set OUT_FILE_NAME				"out.bmp"

### 5. Define simulation configuration for each HLS configuration
### 5.1 The behavioral simulation (C++ only).
define_sim_config B -argv "$IN_FILE_NAME $OUT_FILE_NAME"
### 5.2 The Verilog simulation for HLS config "BASIC". 
define_sim_config V_BASIC "GaussianFilter RTL_V BASIC" "LaplacianFilter RTL_V BASIC" -argv "$IN_FILE_NAME $OUT_FILE_NAME"

### 5.4 The Verilog simulation for HLS config "PIPELINE".
define_sim_config V_PIPELINE "GaussianFilter RTL_V PIPELINE" "LaplacianFilter RTL_V PIPELINE" -argv "$IN_FILE_NAME $OUT_FILE_NAME"

### 5.5 The Verilog simulation for HLS config "PIPELINE2".
define_sim_config V_PIPELINE2 "GaussianFilter RTL_V PIPELINE2" "LaplacianFilter RTL_V PIPELINE2" -argv "$IN_FILE_NAME $OUT_FILE_NAME"

### 5.6 The Verilog simulation for HLS config "PIPELINE2".
define_sim_config V_PIPELINE3 "GaussianFilter RTL_V PIPELINE3" "LaplacianFilter RTL_V PIPELINE3" -argv "$IN_FILE_NAME $OUT_FILE_NAME"

### 5.7 The Verilog simulation for HLS config "PIPELINE4".
define_sim_config V_PIPELINE4 "GaussianFilter RTL_V PIPELINE4" "LaplacianFilter RTL_V PIPELINE4" -argv "$IN_FILE_NAME $OUT_FILE_NAME"

### 5.8 The Verilog simulation for HLS config "DPA".
define_sim_config V_DPA "GaussianFilter RTL_V DPA" "LaplacianFilter RTL_V DPA" -argv "$IN_FILE_NAME $OUT_FILE_NAME"
