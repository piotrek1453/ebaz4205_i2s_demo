`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/31/2025 10:12:26 PM
// Design Name: 
// Module Name: led_blinker
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

module led_blinker(
    input wire clk_in,
    output wire led_0,
    output wire led_1
    );
    
    reg r_leds[1:0];
    
    assign led_0 = r_leds[0];
    assign led_1 = r_leds[1];
    
    reg [24:0] counter;
    
    always@(posedge clk_in) begin
        counter <= counter + 1;
        if(counter == 0) begin
            r_leds[0] <= ~r_leds[0];
            r_leds[1] <= ~r_leds[1];
        end
    end
    
endmodule
