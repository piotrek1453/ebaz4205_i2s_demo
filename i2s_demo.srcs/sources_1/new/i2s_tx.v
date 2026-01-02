`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/31/2025 10:12:26 PM
// Design Name: 
// Module Name: i2s_tx
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`default_nettype none

module i2s_tx(
    input wire bit_clk_in,
    output wire bit_clk_out,
    output wire lr_clk_out,
    output wire data_out
    );
    
    assign bit_clk_out = bit_clk_in;
    
endmodule
