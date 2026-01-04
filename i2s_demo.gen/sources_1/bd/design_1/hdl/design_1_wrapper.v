//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2025.1 (lin64) Build 6140274 Wed May 21 22:58:25 MDT 2025
//Date        : Sun Jan  4 18:21:22 2026
//Host        : PC-Arch running 64-bit Arch Linux
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
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
  input reset_in;
  input sys_clk_in;

  wire bit_clk_out;
  wire i2s_data_out;
  wire led_0;
  wire led_1;
  wire lr_clk_out;
  wire reset_in;
  wire sys_clk_in;

  design_1 design_1_i
       (.bit_clk_out(bit_clk_out),
        .i2s_data_out(i2s_data_out),
        .led_0(led_0),
        .led_1(led_1),
        .lr_clk_out(lr_clk_out),
        .reset_in(reset_in),
        .sys_clk_in(sys_clk_in));
endmodule
