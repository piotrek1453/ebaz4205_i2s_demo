// Copyright (c) 2026 piotrek1453. All Rights Reserved.
`timescale 1ns / 1ps
`default_nettype none

module i2s_tx #(
    parameter integer SAMPLE_BIT_DEPTH = 32
) (
    input  wire bit_clk_in,
    input  wire reset_in,
    output wire bit_clk_out,
    output wire lr_clk_out,
    output wire data_out
);
  localparam integer STATE_IDLE = 'd0;
  localparam integer STATE_LEFT_CHANNEL_TX_START = 'd1;
  localparam integer STATE_LEFT_CHANNEL_TX = 'd2;
  localparam integer STATE_RIGHT_CHANNEL_TX_START = 'd3;
  localparam integer STATE_RIGHT_CHANNEL_TX = 'd4;

  // pointer for bit to send on next transaction
  reg [$clog2(SAMPLE_BIT_DEPTH-1):0] currentBitIndex;
  // 0 - left, 1 - right
  reg currentChannel;
  // currently loaded bit to be sent
  reg currentBitValue;

  // generate a sawtooth for testing
  reg [31:0] testAudioData = {2{16'b0000000011111111}};
  // always @(posedge bit_clk_in) begin
  //   testAudioData <= testAudioData + 1;
  // end

  always @(negedge bit_clk_in) begin
    if (reset_in) begin
      currentBitIndex <= 0;
      currentChannel  <= 0;
      currentBitValue <= 0;
    end else begin
      currentBitValue <= testAudioData[SAMPLE_BIT_DEPTH-1-currentBitIndex];

      if (currentBitIndex == SAMPLE_BIT_DEPTH - 1) begin
        currentBitIndex <= 0;
        currentChannel  <= ~currentChannel;
      end else begin
        currentBitIndex <= currentBitIndex + 1;
      end
    end
  end

  assign bit_clk_out = bit_clk_in;
  assign lr_clk_out = currentChannel;
  assign data_out = currentBitValue;

endmodule
