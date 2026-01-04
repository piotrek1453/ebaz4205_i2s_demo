// Copyright (c) 2026 piotrek1453. All Rights Reserved.
`timescale 1ns / 1ps
`default_nettype none

module blink (
    input  wire clk_in,
    output wire clk_out,
    output reg  led_0,
    output reg  led_1
);

  assign clk_out = clk_in;

  initial begin
    led_0 = 'b1;
    led_1 = 'b0;
  end

  reg [24:0] counter;

  always @(posedge clk_in) begin
    counter <= counter + 1;
    if (counter == 0) begin
      led_0 <= ~led_0;
      led_1 <= ~led_1;
    end
  end

endmodule

