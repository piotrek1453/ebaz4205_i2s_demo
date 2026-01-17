// Copyright (c) 2026 piotrek1453
`timescale 1ns / 1ps
`default_nettype none

module i2s_tx #(
    parameter integer DATA_BIT_DEPTH = 32
) (
    // speed of this clock is dependent on transmission parameters: feed as per slave's manual
    input  wire bit_clk_in,
    // either connect to PLL's locked output to wait for stable clock or wire to '1'
    input  wire bit_clk_locked_in,
    input  wire reset_in,
    input  wire audio_enable_in,
    output wire bit_clk_out,
    output wire lr_clk_out,
    output wire data_out
);
  localparam integer DATA_MSB_IDX = DATA_BIT_DEPTH - 1;

  reg lr_clk_reg, data_reg, audio_enable_reg;
  // reg notation is [msb:lsb] and i2s starts with MSB so start from bit DATA_BIT_DEPTH-1
  reg [DATA_MSB_IDX:0] sample_buffer;
  integer current_bit_index;

  assign bit_clk_out = bit_clk_in;
  assign lr_clk_out = lr_clk_reg;
  assign data_out = data_reg & audio_enable_reg;

  initial begin
    lr_clk_reg = 'b0;  // start with left channel
    data_reg = 'b0;  // reset output
    sample_buffer = 'd0;  // test samples
    // reset bit counter to DATA_BIT_DEPTH-1: going from MSB to LSB
    current_bit_index = DATA_MSB_IDX;
    audio_enable_reg = 'b1;
  end

  always @(negedge audio_enable_in) begin
    if (!audio_enable_in) begin
      audio_enable_reg <= ~audio_enable_reg;
    end
  end

  always @(negedge bit_clk_in) begin
    if (!reset_in || !bit_clk_locked_in) begin
      lr_clk_reg <= 'b0;
      data_reg <= 'b0;
      current_bit_index <= DATA_MSB_IDX;
    end else begin
      data_reg <= sample_buffer[current_bit_index];
      if (current_bit_index == 0) begin
        lr_clk_reg <= ~lr_clk_reg;
      end
    end

    if (current_bit_index == 0) begin
      current_bit_index <= DATA_MSB_IDX;
      sample_buffer <= sample_buffer + 10000000;  // invert test samples for other channel
    end else begin
      current_bit_index <= current_bit_index - 1;
    end

  end

endmodule
