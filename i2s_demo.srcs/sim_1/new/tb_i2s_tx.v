`timescale 1ns / 1ps
`default_nettype none

module tb_i2s_tx;

  reg bit_clk, bit_clk_locked, reset;
  wire lr_clk, data;

  i2s_tx #(
      .DATA_BIT_DEPTH(32)
  ) i2s_tx_inst (
      .bit_clk_in(bit_clk),
      .bit_clk_locked_in(bit_clk_locked),
      .reset_in(reset),
      .bit_clk_out(),
      .lr_clk_out(lr_clk),
      .data_out(data)
  );

  // generate clock
  initial bit_clk = 'b0;
  always #10 bit_clk = ~bit_clk;

  // initial reset and PLL lock
  initial begin
    reset = 'b0;
    bit_clk_locked = 'b0;
    #50;
    reset = 'b1;
    #50;
    bit_clk_locked = 'b1;
  end

  // dump simulation
  initial begin
    $dumpfile("i2s_tx.vcd");
    $dumpvars(0, tb_i2s_tx);
    #100000;
    $finish;
  end

endmodule
