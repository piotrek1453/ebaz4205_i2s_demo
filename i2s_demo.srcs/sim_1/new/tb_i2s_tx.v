`timescale 1ns / 1ps
`default_nettype none

module tb_i2s_tx;

  reg bit_clk_in_reg, bit_clk_locked_in_reg, reset_in_reg, audio_enable_in_reg;
  reg [31:0] left_sample_in_reg, right_sample_in_reg;
  wire lr_clk_out_reg, data_out_reg, bit_clk_out_reg;

  i2s_tx #(
      .DATA_BIT_DEPTH(32)
  ) i2s_tx_inst (
      .bit_clk_in(bit_clk_in_reg),
      .bit_clk_locked_in(bit_clk_locked_in_reg),
      .reset_in(reset_in_reg),
      .audio_enable_in(audio_enable_in_reg),
      .left_sample_in(left_sample_in_reg),
      .right_sample_in(right_sample_in_reg),
      .bit_clk_out(bit_clk_out_reg),
      .lr_clk_out(lr_clk_out_reg),
      .data_out(data_out_reg)
  );

  // generate clock
  initial bit_clk_in_reg = 'b0;
  always #10 bit_clk_in_reg = ~bit_clk_in_reg;

  // initial reset and PLL lock
  initial begin
    left_sample_in_reg = 'b0;
    right_sample_in_reg = 'b0;
    reset_in_reg = 'b0;
    bit_clk_locked_in_reg = 'b0;
    audio_enable_in_reg = 'b1;
    #50;
    reset_in_reg = 'b1;
    #50;
    bit_clk_locked_in_reg = 'b1;
  end

  always @(posedge bit_clk_in_reg) begin
    left_sample_in_reg  <= left_sample_in_reg + 'd1000000;
    right_sample_in_reg <= right_sample_in_reg - 'd1000000;
  end

  // dump simulation

  initial begin
    $dumpfile("i2s_tx.vcd");
    $dumpvars(0, tb_i2s_tx);
    #10000000;
    $finish;
  end

endmodule
