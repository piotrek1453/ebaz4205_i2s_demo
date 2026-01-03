`timescale 1ns / 1ps
`default_nettype none

module tb_i2s_tx;

  reg bit_clk, reset_in;
  wire lr_clk, data;

  i2s_tx #(
      .SAMPLE_BIT_DEPTH(32)
  ) i2s_tx_instance (
      .bit_clk_in(bit_clk),
      .reset_in(reset_in),
      .bit_clk_out(),
      .lr_clk_out(lr_clk),
      .data_out(data)
  );

  initial bit_clk = 0;
  always #10 bit_clk = ~bit_clk;

  initial begin
    reset_in = 'b1;
    #50;
    reset_in = 'b0;
  end

  initial begin
    $dumpfile("i2s_tx.vcd");
    $dumpvars(0, tb_i2s_tx);
    #10000;
    $finish;
  end

endmodule
