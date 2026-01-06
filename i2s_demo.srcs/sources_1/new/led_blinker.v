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
    input wire reset_in,
    output wire [1:0] leds
    );
    
    reg [1:0] r_leds;
    
    assign leds = r_leds;
    
    reg [24:0] counter;
    
    always@(posedge clk_in) begin
        if(!reset_in) begin
            r_leds <= 'b01;
        end
        else begin
            counter <= counter + 1;
            if(counter == 0) begin
                r_leds <= ~r_leds;
            end
        end
    end
    
endmodule
