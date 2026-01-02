`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/31/2025 10:12:26 PM
// Design Name: 
// Module Name: top
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

module top(
    input wire clk_in,
    output wire clk_out,
    output reg led_0,
    output reg led_1
    );
    
    assign clk_out = clk_in;
    
    initial begin
        led_0 = 'b1;
        led_1 = 'b0;
    end
    
    reg [24:0] counter;
    
    always@(posedge clk_in) begin
        counter <= counter + 1;
        if(counter == 0) begin
            led_0 <= ~led_0;
            led_1 <= ~led_1;
        end
    end
    
endmodule
