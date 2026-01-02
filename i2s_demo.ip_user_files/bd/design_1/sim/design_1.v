//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2025.1 (lin64) Build 6140274 Wed May 21 22:58:25 MDT 2025
//Date        : Fri Jan  2 23:13:11 2026
//Host        : PC-Arch running 64-bit Arch Linux
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=3,numReposBlks=3,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=2,numPkgbdBlks=0,bdsource=USER,da_ps7_cnt=1,synth_mode=Hierarchical}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   (bit_clk_out,
    i2s_data_out,
    lr_clk_out,
    sys_clk_in);
  output bit_clk_out;
  output i2s_data_out;
  output lr_clk_out;
  input sys_clk_in;

  wire bit_clk_out;
  wire clk_wiz_0_clk_out1;
  wire i2s_data_out;
  wire lr_clk_out;
  wire sys_clk_in;

  design_1_clk_wiz_0_0 clk_wiz_0
       (.clk_in1(sys_clk_in),
        .clk_out1(clk_wiz_0_clk_out1),
        .reset(1'b0));
  design_1_i2s_tx_0_0 i2s_tx_0
       (.bit_clk_in(clk_wiz_0_clk_out1),
        .bit_clk_out(bit_clk_out),
        .data_out(i2s_data_out),
        .lr_clk_out(lr_clk_out));
  design_1_led_blinker_0_2 led_blinker_0
       (.clk_in(1'b0));
endmodule
