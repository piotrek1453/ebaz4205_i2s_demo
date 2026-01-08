// Copyright (c) 2026 piotrek1453
`timescale 1ns / 1ps
`default_nettype none

module i2s_tx (
    input  wire bit_clk_in,
    output wire bit_clk_out,
    output wire lr_clk_out,
    output wire data_out
);

    assign bit_clk_out = bit_clk_in;

endmodule
