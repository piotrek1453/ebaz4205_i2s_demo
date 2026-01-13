//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
//Date        : Tue Jan 13 22:37:55 2026
//Host        : PC-Arch running 64-bit Arch Linux
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
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
  input reset_in;
  input sys_clk_in;

  wire bit_clk_out;
  wire i2s_data_out;
  wire [1:0]leds;
  wire lr_clk_out;
  wire reset_in;
  wire sys_clk_in;

  design_1 design_1_i
       (.bit_clk_out(bit_clk_out),
        .i2s_data_out(i2s_data_out),
        .leds(leds),
        .lr_clk_out(lr_clk_out),
        .reset_in(reset_in),
        .sys_clk_in(sys_clk_in));
endmodule
