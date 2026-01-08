// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
// Date        : Thu Jan  8 22:46:37 2026
// Host        : PC-Arch running 64-bit Arch Linux
// Command     : write_verilog -force -mode synth_stub
//               /home/juchap/kodzenie/FPGA/EBAZ4205/i2s_demo/i2s_demo.gen/sources_1/bd/design_1/ip/design_1_i2s_tx_0_0_1/design_1_i2s_tx_0_0_stub.v
// Design      : design_1_i2s_tx_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "design_1_i2s_tx_0_0,i2s_tx,{}" *) (* CORE_GENERATION_INFO = "design_1_i2s_tx_0_0,i2s_tx,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=i2s_tx,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) 
(* IP_DEFINITION_SOURCE = "module_ref" *) (* X_CORE_INFO = "i2s_tx,Vivado 2025.2" *) 
module design_1_i2s_tx_0_0(bit_clk_in, bit_clk_out, lr_clk_out, data_out)
/* synthesis syn_black_box black_box_pad_pin="bit_clk_in,bit_clk_out,lr_clk_out,data_out" */;
  input bit_clk_in;
  output bit_clk_out;
  output lr_clk_out;
  output data_out;
endmodule
