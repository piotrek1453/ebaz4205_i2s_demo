// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (lin64) Build 6140274 Wed May 21 22:58:25 MDT 2025
// Date        : Tue Jan  6 13:48:03 2026
// Host        : PC-Arch running 64-bit Arch Linux
// Command     : write_verilog -force -mode synth_stub
//               /home/juchap/kodzenie/FPGA/EBAZ4205/i2s_demo/i2s_demo.gen/sources_1/bd/design_1/ip/design_1_led_blinker_0_0/design_1_led_blinker_0_0_stub.v
// Design      : design_1_led_blinker_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "design_1_led_blinker_0_0,led_blinker,{}" *) (* CORE_GENERATION_INFO = "design_1_led_blinker_0_0,led_blinker,{x_ipProduct=Vivado 2025.1,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=led_blinker,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) 
(* IP_DEFINITION_SOURCE = "module_ref" *) (* X_CORE_INFO = "led_blinker,Vivado 2025.1" *) 
module design_1_led_blinker_0_0(clk_in, reset_in, leds)
/* synthesis syn_black_box black_box_pad_pin="reset_in,leds[1:0]" */
/* synthesis syn_force_seq_prim="clk_in" */;
  input clk_in /* synthesis syn_isclock = 1 */;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 reset_in RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME reset_in, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input reset_in;
  output [1:0]leds;
endmodule
