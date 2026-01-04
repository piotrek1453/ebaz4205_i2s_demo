// Copyright (c) 2026 piotrek1453. All Rights Reserved.
`timescale 1ns / 1ps
`default_nettype none

module i2s_tx #(
    parameter integer SAMPLE_BIT_DEPTH = 32
) (
    input wire bit_clk_in,  // I2S bit clock (typically 2-4 MHz)
    input wire reset_in,  // Active-high reset
    input wire [SAMPLE_BIT_DEPTH-1:0] left_data_in,  // Left channel audio data
    input wire [SAMPLE_BIT_DEPTH-1:0] right_data_in,  // Right channel audio data
    input wire data_valid_in,  // Pulse high for one cycle to load new data
    output wire bit_clk_out,  // Buffered bit clock output
    output wire lr_clk_out,  // Left/Right channel select (0=Left, 1=Right)
    output wire data_out,  // Serial data output
    output wire ready_for_data  // High when ready to accept new data
);

  // Internal registers
  reg [SAMPLE_BIT_DEPTH-1:0] left_data_reg = 0;
  reg [SAMPLE_BIT_DEPTH-1:0] right_data_reg = 0;
  reg [$clog2(SAMPLE_BIT_DEPTH)-1:0] bit_counter_reg = SAMPLE_BIT_DEPTH - 1;
  reg current_channel_reg = 0;  // 0 = left channel, 1 = right channel
  reg data_out_reg = 0;
  reg lr_clk_reg = 0;
  reg ready_for_data_reg = 0;

  // Track when we've loaded initial data
  reg data_loaded_once = 0;

  // Main state machine - operates on falling edge of bit clock
  always @(negedge bit_clk_in or posedge reset_in) begin
    if (reset_in) begin
      // Active-high reset: initialize all registers
      bit_counter_reg     <= SAMPLE_BIT_DEPTH - 1;  // Start with MSB
      current_channel_reg <= 1'b0;  // Start with left channel
      data_out_reg        <= 1'b0;  // Serial data output
      lr_clk_reg          <= 1'b0;  // Left/Right clock
      left_data_reg       <= {SAMPLE_BIT_DEPTH{1'b0}};  // Clear left data
      right_data_reg      <= {SAMPLE_BIT_DEPTH{1'b0}};  // Clear right data
      ready_for_data_reg  <= 1'b0;  // Not ready until we've sent first frame
      data_loaded_once    <= 1'b0;  // No data loaded yet
    end else begin
      // Always update the bit counter and channel
      if (bit_counter_reg == 0) begin
        // Reached LSB, reset to MSB for next sample
        bit_counter_reg <= SAMPLE_BIT_DEPTH - 1;
        // Toggle channel after completing current one
        current_channel_reg <= ~current_channel_reg;
        lr_clk_reg <= ~lr_clk_reg;

        // Set ready signal when we finish right channel (before starting new frame)
        if (current_channel_reg == 1'b1) begin  // Just finished right channel
          ready_for_data_reg <= 1'b1;
        end
      end else begin
        // Continue counting down through bits
        bit_counter_reg <= bit_counter_reg - 1;
        // Clear ready signal after it's been set (one-shot)
        if (ready_for_data_reg) begin
          ready_for_data_reg <= 1'b0;
        end
      end

      // Data loading: capture new audio samples when valid signal is asserted
      // This can happen at any time, but will be used in the next frame
      if (data_valid_in) begin
        left_data_reg <= left_data_in;
        right_data_reg <= right_data_in;
        data_loaded_once <= 1'b1;  // Mark that we've loaded data at least once
      end

      // If no data has been loaded yet, output 0
      if (!data_loaded_once) begin
        data_out_reg <= 1'b0;
      end else begin
        // Serial data output: select current bit based on channel
        if (current_channel_reg == 1'b0) begin
          // Left channel: output current bit from left data register
          data_out_reg <= left_data_reg[bit_counter_reg];
        end else begin
          // Right channel: output current bit from right data register
          data_out_reg <= right_data_reg[bit_counter_reg];
        end
      end
    end
  end

  // Continuous assignments for outputs
  assign bit_clk_out    = bit_clk_in;  // Pass-through bit clock
  assign lr_clk_out     = lr_clk_reg;  // Left/Right channel clock
  assign data_out       = data_out_reg;  // Serial data output
  assign ready_for_data = ready_for_data_reg;  // Data loading ready signal

endmodule
