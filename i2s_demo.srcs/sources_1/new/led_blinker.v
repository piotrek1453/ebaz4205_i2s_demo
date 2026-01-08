// Copyright (c) 2026 piotrek1453

`timescale 1ns / 1ps
`default_nettype none

module led_blinker (
    input wire clk_in,
    input wire reset_in,
    output wire [1:0] leds
);

  reg [1:0] r_leds;

  assign leds = r_leds;

  reg [24:0] counter;

  initial begin
    r_leds = 'b01;
  end

  always @(posedge clk_in) begin
    if (!reset_in) begin
      r_leds <= 'b01;
    end else begin
      counter <= counter + 1;
      if (counter == 0) begin
        r_leds <= ~r_leds;
      end
    end
  end

endmodule
