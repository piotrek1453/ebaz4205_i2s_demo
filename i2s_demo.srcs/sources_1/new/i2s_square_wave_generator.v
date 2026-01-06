`timescale 1ns / 1ps

module i2s_square_wave_generator (
    input  wire bit_clk_in,   // 24.576 MHz from PLL
    input  wire reset_in,     // System reset
    output wire i2s_sck_out,  // I2S bit clock output
    output wire i2s_ws_out,   // I2S word select output
    output wire i2s_sd_out    // I2S serial data output
);

  // Square wave values - audible square wave
  wire [31:0] square_high = 32'h60000000;  // Positive
  wire [31:0] square_low = 32'hA0000000;  // Negative

  // I2S interface
  wire ready;
  reg [31:0] left_data;
  reg [31:0] right_data;
  reg data_valid = 0;
  reg toggle = 0;

  // Simple counter for frequency control
  // This creates about 750 Hz square wave (toggles every 256 frames)
  reg [7:0] frame_counter = 0;

  // I2S transmitter instance
  i2s_tx i2s_tx_inst (
      .bit_clk_in(bit_clk_in),
      .reset_in(reset_in),
      .left_data_in(left_data),
      .right_data_in(right_data),
      .data_valid_in(data_valid),
      .bit_clk_out(i2s_sck_out),
      .lr_clk_out(i2s_ws_out),
      .data_out(i2s_sd_out),
      .ready_for_data(ready)
  );

  // Square wave generator
  always @(posedge bit_clk_in or negedge reset_in) begin
    if (!reset_in) begin
      left_data <= square_high;
      right_data <= square_high;
      data_valid <= 0;
      toggle <= 0;
      frame_counter <= 0;
    end else if (ready) begin
      // Load new data when ready
      data_valid <= 1'b1;

      // Count frames
      frame_counter <= frame_counter + 1;

      // Toggle square wave every 128 frames (~750 Hz at 384 kHz)
      if (frame_counter == 127) begin
        toggle <= ~toggle;
      end

      // Set output data
      if (toggle) begin
        left_data  <= square_low;
        right_data <= square_low;
      end else begin
        left_data  <= square_high;
        right_data <= square_high;
      end
    end else begin
      // Clear data_valid after one clock
      data_valid <= 0;
    end
  end

endmodule

