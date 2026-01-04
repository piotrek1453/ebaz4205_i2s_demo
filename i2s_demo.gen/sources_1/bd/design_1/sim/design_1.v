//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2025.1 (lin64) Build 6140274 Wed May 21 22:58:25 MDT 2025
//Date        : Sun Jan  4 18:21:22 2026
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
    led_0,
    led_1,
    lr_clk_out,
    reset_in,
    sys_clk_in);
  output bit_clk_out;
  output i2s_data_out;
  output led_0;
  output led_1;
  output lr_clk_out;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RESET_IN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RESET_IN, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input reset_in;
  input sys_clk_in;

  wire bit_clk_out;
  wire clk_wiz_0_clk_out1;
  wire i2s_data_out;
  wire led_0;
  wire led_1;
  wire lr_clk_out;
  wire reset_in;
  wire sys_clk_in;

  design_1_clk_wiz_0_0 clk_wiz_0
       (.clk_in1(sys_clk_in),
        .clk_out1(clk_wiz_0_clk_out1),
        .reset(reset_in));
  design_1_i2s_square_wave_gene_0_0 i2s_square_wave_gene_0
       (.bit_clk_in(clk_wiz_0_clk_out1),
        .i2s_sck_out(bit_clk_out),
        .i2s_sd_out(i2s_data_out),
        .i2s_ws_out(lr_clk_out),
        .reset_in(reset_in));
  design_1_led_blinker_0_0 led_blinker_0
       (.clk_in(sys_clk_in),
        .led_0(led_0),
        .led_1(led_1),
        .reset_in(reset_in));
endmodule
