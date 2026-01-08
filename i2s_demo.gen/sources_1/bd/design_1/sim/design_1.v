//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
//Date        : Thu Jan  8 22:52:55 2026
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
    leds,
    lr_clk_out,
    reset_in,
    sys_clk_in);
  output bit_clk_out;
  output i2s_data_out;
  output [1:0]leds;
  output lr_clk_out;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RESET_IN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RESET_IN, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input reset_in;
  input sys_clk_in;

  wire bit_clk_out;
  wire clk_wiz_0_clk_out1;
  wire i2s_data_out;
  wire [1:0]leds;
  wire lr_clk_out;
  wire reset_in;
  wire sys_clk_in;

  design_1_clk_wiz_0_0 clk_wiz_0
       (.clk_in1(sys_clk_in),
        .clk_out1(clk_wiz_0_clk_out1),
        .resetn(reset_in));
  design_1_i2s_tx_0_0 i2s_tx_0
       (.bit_clk_in(clk_wiz_0_clk_out1),
        .bit_clk_out(bit_clk_out),
        .data_out(i2s_data_out),
        .lr_clk_out(lr_clk_out));
  design_1_led_blinker_0_0 led_blinker_0
       (.clk_in(sys_clk_in),
        .leds(leds),
        .reset_in(reset_in));
endmodule
