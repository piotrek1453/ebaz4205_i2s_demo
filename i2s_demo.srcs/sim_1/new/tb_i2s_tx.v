// Copyright (c) 2026 piotrek1453. All Rights Reserved.
`timescale 1ns / 1ps
module tb_i2s_tx;

  // Testbench signals
  reg bit_clk;
  reg reset_in;
  reg [31:0] left_data;
  reg [31:0] right_data;
  reg data_valid;
  wire lr_clk;
  wire data;
  wire ready;

  // Instance of I2S transmitter
  i2s_tx #(
      .SAMPLE_BIT_DEPTH(32)
  ) i2s_tx_instance (
      .bit_clk_in(bit_clk),
      .reset_in(reset_in),
      .left_data_in(left_data),
      .right_data_in(right_data),
      .data_valid_in(data_valid),
      .bit_clk_out(),
      .lr_clk_out(lr_clk),
      .data_out(data),
      .ready_for_data(ready)
  );

  // Clock generation (3.072 MHz typical for 48kHz audio)
  initial bit_clk = 0;
  always #162.76 bit_clk = ~bit_clk;  // ~3.072 MHz

  // Reset sequence
  initial begin
    reset_in   = 1'b1;
    left_data  = 32'h00000000;
    right_data = 32'h00000000;
    data_valid = 1'b0;

    #1000;
    reset_in = 1'b0;

    // Load initial data immediately after reset
    #100;
    @(negedge bit_clk);
    left_data  = 32'hAAAAAAAA;  // Pattern: 10101010...
    right_data = 32'h55555555;  // Pattern: 01010101...
    data_valid = 1'b1;
    @(negedge bit_clk);
    data_valid = 1'b0;
  end

  // Data generation process - reload data each time ready signal pulses
  always begin
    // Wait for ready signal
    wait (ready == 1'b1);

    // Small delay to ensure we're at the right time
    #10;

    // Load new data on negedge
    @(negedge bit_clk);
    left_data  = $urandom;
    right_data = $urandom;
    data_valid = 1'b1;
    @(negedge bit_clk);
    data_valid = 1'b0;

    // Wait a bit before checking for next ready
    #1000;
  end

  // Monitor for debugging - only print on changes
  always @(lr_clk or data or ready) begin
    $display("Time=%t LRCLK=%b DATA=%b READY=%b", $time, lr_clk, data, ready);
  end

  // Additional monitor to see data loading
  always @(posedge data_valid) begin
    $display("Time=%t Loading data: left=0x%h, right=0x%h", $time, left_data,
             right_data);
  end

  // Simulation control
  initial begin
    $dumpfile("i2s_tx.vcd");
    $dumpvars(0, tb_i2s_tx);
    #1000000;  // Simulate for 1ms
    $finish;
  end

endmodule
