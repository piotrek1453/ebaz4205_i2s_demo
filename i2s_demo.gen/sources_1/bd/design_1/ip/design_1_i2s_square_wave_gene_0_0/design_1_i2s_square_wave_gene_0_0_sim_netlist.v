// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (lin64) Build 6140274 Wed May 21 22:58:25 MDT 2025
// Date        : Sun Jan  4 18:21:49 2026
// Host        : PC-Arch running 64-bit Arch Linux
// Command     : write_verilog -force -mode funcsim
//               /home/juchap/kodzenie/FPGA/EBAZ4205/i2s_demo/i2s_demo.gen/sources_1/bd/design_1/ip/design_1_i2s_square_wave_gene_0_0/design_1_i2s_square_wave_gene_0_0_sim_netlist.v
// Design      : design_1_i2s_square_wave_gene_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_i2s_square_wave_gene_0_0,i2s_square_wave_generator,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "i2s_square_wave_generator,Vivado 2025.1" *) 
(* NotValidForBitStream *)
module design_1_i2s_square_wave_gene_0_0
   (bit_clk_in,
    reset_in,
    i2s_sck_out,
    i2s_ws_out,
    i2s_sd_out);
  input bit_clk_in;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 reset_in RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME reset_in, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input reset_in;
  output i2s_sck_out;
  output i2s_ws_out;
  output i2s_sd_out;

  wire bit_clk_in;
  wire i2s_sd_out;
  wire i2s_ws_out;
  wire reset_in;

  assign i2s_sck_out = bit_clk_in;
  design_1_i2s_square_wave_gene_0_0_i2s_square_wave_generator inst
       (.bit_clk_in(bit_clk_in),
        .i2s_sd_out(i2s_sd_out),
        .i2s_ws_out(i2s_ws_out),
        .reset_in(reset_in));
endmodule

(* ORIG_REF_NAME = "i2s_square_wave_generator" *) 
module design_1_i2s_square_wave_gene_0_0_i2s_square_wave_generator
   (i2s_sd_out,
    i2s_ws_out,
    bit_clk_in,
    reset_in);
  output i2s_sd_out;
  output i2s_ws_out;
  input bit_clk_in;
  input reset_in;

  wire bit_clk_in;
  wire data_valid;
  wire \frame_counter[7]_i_2_n_0 ;
  wire [7:0]frame_counter_reg;
  wire i2s_sd_out;
  wire i2s_tx_inst_n_3;
  wire i2s_ws_out;
  wire \left_data[30]_i_1_n_0 ;
  wire [7:0]p_0_in;
  wire ready;
  wire reset_in;
  wire [31:30]right_data;
  wire toggle;

  FDCE #(
    .INIT(1'b0)) 
    data_valid_reg
       (.C(bit_clk_in),
        .CE(1'b1),
        .CLR(reset_in),
        .D(ready),
        .Q(data_valid));
  LUT1 #(
    .INIT(2'h1)) 
    \frame_counter[0]_i_1 
       (.I0(frame_counter_reg[0]),
        .O(p_0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \frame_counter[1]_i_1 
       (.I0(frame_counter_reg[0]),
        .I1(frame_counter_reg[1]),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \frame_counter[2]_i_1 
       (.I0(frame_counter_reg[1]),
        .I1(frame_counter_reg[0]),
        .I2(frame_counter_reg[2]),
        .O(p_0_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \frame_counter[3]_i_1 
       (.I0(frame_counter_reg[2]),
        .I1(frame_counter_reg[0]),
        .I2(frame_counter_reg[1]),
        .I3(frame_counter_reg[3]),
        .O(p_0_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \frame_counter[4]_i_1 
       (.I0(frame_counter_reg[3]),
        .I1(frame_counter_reg[1]),
        .I2(frame_counter_reg[0]),
        .I3(frame_counter_reg[2]),
        .I4(frame_counter_reg[4]),
        .O(p_0_in[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \frame_counter[5]_i_1 
       (.I0(frame_counter_reg[4]),
        .I1(frame_counter_reg[2]),
        .I2(frame_counter_reg[0]),
        .I3(frame_counter_reg[1]),
        .I4(frame_counter_reg[3]),
        .I5(frame_counter_reg[5]),
        .O(p_0_in[5]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \frame_counter[6]_i_1 
       (.I0(\frame_counter[7]_i_2_n_0 ),
        .I1(frame_counter_reg[6]),
        .O(p_0_in[6]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hD2)) 
    \frame_counter[7]_i_1 
       (.I0(frame_counter_reg[6]),
        .I1(\frame_counter[7]_i_2_n_0 ),
        .I2(frame_counter_reg[7]),
        .O(p_0_in[7]));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \frame_counter[7]_i_2 
       (.I0(frame_counter_reg[4]),
        .I1(frame_counter_reg[2]),
        .I2(frame_counter_reg[0]),
        .I3(frame_counter_reg[1]),
        .I4(frame_counter_reg[3]),
        .I5(frame_counter_reg[5]),
        .O(\frame_counter[7]_i_2_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \frame_counter_reg[0] 
       (.C(bit_clk_in),
        .CE(ready),
        .CLR(reset_in),
        .D(p_0_in[0]),
        .Q(frame_counter_reg[0]));
  FDCE #(
    .INIT(1'b0)) 
    \frame_counter_reg[1] 
       (.C(bit_clk_in),
        .CE(ready),
        .CLR(reset_in),
        .D(p_0_in[1]),
        .Q(frame_counter_reg[1]));
  FDCE #(
    .INIT(1'b0)) 
    \frame_counter_reg[2] 
       (.C(bit_clk_in),
        .CE(ready),
        .CLR(reset_in),
        .D(p_0_in[2]),
        .Q(frame_counter_reg[2]));
  FDCE #(
    .INIT(1'b0)) 
    \frame_counter_reg[3] 
       (.C(bit_clk_in),
        .CE(ready),
        .CLR(reset_in),
        .D(p_0_in[3]),
        .Q(frame_counter_reg[3]));
  FDCE #(
    .INIT(1'b0)) 
    \frame_counter_reg[4] 
       (.C(bit_clk_in),
        .CE(ready),
        .CLR(reset_in),
        .D(p_0_in[4]),
        .Q(frame_counter_reg[4]));
  FDCE #(
    .INIT(1'b0)) 
    \frame_counter_reg[5] 
       (.C(bit_clk_in),
        .CE(ready),
        .CLR(reset_in),
        .D(p_0_in[5]),
        .Q(frame_counter_reg[5]));
  FDCE #(
    .INIT(1'b0)) 
    \frame_counter_reg[6] 
       (.C(bit_clk_in),
        .CE(ready),
        .CLR(reset_in),
        .D(p_0_in[6]),
        .Q(frame_counter_reg[6]));
  FDCE #(
    .INIT(1'b0)) 
    \frame_counter_reg[7] 
       (.C(bit_clk_in),
        .CE(ready),
        .CLR(reset_in),
        .D(p_0_in[7]),
        .Q(frame_counter_reg[7]));
  design_1_i2s_square_wave_gene_0_0_i2s_tx i2s_tx_inst
       (.D(toggle),
        .E(data_valid),
        .Q(frame_counter_reg[7:6]),
        .bit_clk_in(bit_clk_in),
        .\frame_counter_reg[6] (i2s_tx_inst_n_3),
        .i2s_sd_out(i2s_sd_out),
        .i2s_ws_out(i2s_ws_out),
        .ready_for_data_reg_reg_0(ready),
        .reset_in(reset_in),
        .\right_data_reg_reg[31]_0 (right_data),
        .toggle_reg(\frame_counter[7]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \left_data[30]_i_1 
       (.I0(toggle),
        .O(\left_data[30]_i_1_n_0 ));
  FDPE \left_data_reg[30] 
       (.C(bit_clk_in),
        .CE(ready),
        .D(\left_data[30]_i_1_n_0 ),
        .PRE(reset_in),
        .Q(right_data[30]));
  FDCE \left_data_reg[31] 
       (.C(bit_clk_in),
        .CE(ready),
        .CLR(reset_in),
        .D(toggle),
        .Q(right_data[31]));
  FDCE #(
    .INIT(1'b0)) 
    toggle_reg
       (.C(bit_clk_in),
        .CE(1'b1),
        .CLR(reset_in),
        .D(i2s_tx_inst_n_3),
        .Q(toggle));
endmodule

(* ORIG_REF_NAME = "i2s_tx" *) 
module design_1_i2s_square_wave_gene_0_0_i2s_tx
   (i2s_sd_out,
    i2s_ws_out,
    ready_for_data_reg_reg_0,
    \frame_counter_reg[6] ,
    bit_clk_in,
    reset_in,
    E,
    toggle_reg,
    Q,
    D,
    \right_data_reg_reg[31]_0 );
  output i2s_sd_out;
  output i2s_ws_out;
  output [0:0]ready_for_data_reg_reg_0;
  output \frame_counter_reg[6] ;
  input bit_clk_in;
  input reset_in;
  input [0:0]E;
  input toggle_reg;
  input [1:0]Q;
  input [0:0]D;
  input [1:0]\right_data_reg_reg[31]_0 ;

  wire [0:0]D;
  wire [0:0]E;
  wire [1:0]Q;
  wire bit_clk_in;
  wire [4:0]bit_counter_reg;
  wire \bit_counter_reg[0]_i_1_n_0 ;
  wire \bit_counter_reg[1]_i_1_n_0 ;
  wire \bit_counter_reg[2]_i_1_n_0 ;
  wire \bit_counter_reg[3]_i_1_n_0 ;
  wire \bit_counter_reg[4]_i_1_n_0 ;
  wire current_channel_reg;
  wire current_channel_reg_i_1_n_0;
  wire data_out_reg;
  wire data_out_reg_i_2_n_0;
  wire \frame_counter_reg[6] ;
  wire i2s_sd_out;
  wire i2s_ws_out;
  wire [31:29]left_data_reg;
  wire lr_clk_reg_i_1_n_0;
  wire ready_for_data_reg_i_1_n_0;
  wire ready_for_data_reg_i_2_n_0;
  wire [0:0]ready_for_data_reg_reg_0;
  wire reset_in;
  wire [1:0]\right_data_reg_reg[31]_0 ;
  wire toggle_reg;

  LUT1 #(
    .INIT(2'h1)) 
    \bit_counter_reg[0]_i_1 
       (.I0(bit_counter_reg[0]),
        .O(\bit_counter_reg[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \bit_counter_reg[1]_i_1 
       (.I0(bit_counter_reg[1]),
        .I1(bit_counter_reg[0]),
        .O(\bit_counter_reg[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hA9)) 
    \bit_counter_reg[2]_i_1 
       (.I0(bit_counter_reg[2]),
        .I1(bit_counter_reg[0]),
        .I2(bit_counter_reg[1]),
        .O(\bit_counter_reg[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'hAAA9)) 
    \bit_counter_reg[3]_i_1 
       (.I0(bit_counter_reg[3]),
        .I1(bit_counter_reg[1]),
        .I2(bit_counter_reg[0]),
        .I3(bit_counter_reg[2]),
        .O(\bit_counter_reg[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hAAAAAAA9)) 
    \bit_counter_reg[4]_i_1 
       (.I0(bit_counter_reg[4]),
        .I1(bit_counter_reg[2]),
        .I2(bit_counter_reg[0]),
        .I3(bit_counter_reg[1]),
        .I4(bit_counter_reg[3]),
        .O(\bit_counter_reg[4]_i_1_n_0 ));
  FDPE #(
    .INIT(1'b1),
    .IS_C_INVERTED(1'b1)) 
    \bit_counter_reg_reg[0] 
       (.C(bit_clk_in),
        .CE(1'b1),
        .D(\bit_counter_reg[0]_i_1_n_0 ),
        .PRE(reset_in),
        .Q(bit_counter_reg[0]));
  FDPE #(
    .INIT(1'b1),
    .IS_C_INVERTED(1'b1)) 
    \bit_counter_reg_reg[1] 
       (.C(bit_clk_in),
        .CE(1'b1),
        .D(\bit_counter_reg[1]_i_1_n_0 ),
        .PRE(reset_in),
        .Q(bit_counter_reg[1]));
  FDPE #(
    .INIT(1'b1),
    .IS_C_INVERTED(1'b1)) 
    \bit_counter_reg_reg[2] 
       (.C(bit_clk_in),
        .CE(1'b1),
        .D(\bit_counter_reg[2]_i_1_n_0 ),
        .PRE(reset_in),
        .Q(bit_counter_reg[2]));
  FDPE #(
    .INIT(1'b1),
    .IS_C_INVERTED(1'b1)) 
    \bit_counter_reg_reg[3] 
       (.C(bit_clk_in),
        .CE(1'b1),
        .D(\bit_counter_reg[3]_i_1_n_0 ),
        .PRE(reset_in),
        .Q(bit_counter_reg[3]));
  FDPE #(
    .INIT(1'b1),
    .IS_C_INVERTED(1'b1)) 
    \bit_counter_reg_reg[4] 
       (.C(bit_clk_in),
        .CE(1'b1),
        .D(\bit_counter_reg[4]_i_1_n_0 ),
        .PRE(reset_in),
        .Q(bit_counter_reg[4]));
  LUT6 #(
    .INIT(64'hFFFFFFFE00000001)) 
    current_channel_reg_i_1
       (.I0(bit_counter_reg[3]),
        .I1(bit_counter_reg[1]),
        .I2(bit_counter_reg[0]),
        .I3(bit_counter_reg[2]),
        .I4(bit_counter_reg[4]),
        .I5(current_channel_reg),
        .O(current_channel_reg_i_1_n_0));
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    current_channel_reg_reg
       (.C(bit_clk_in),
        .CE(1'b1),
        .CLR(reset_in),
        .D(current_channel_reg_i_1_n_0),
        .Q(current_channel_reg));
  LUT5 #(
    .INIT(32'h80000000)) 
    data_out_reg_i_1
       (.I0(bit_counter_reg[4]),
        .I1(left_data_reg[29]),
        .I2(bit_counter_reg[2]),
        .I3(bit_counter_reg[3]),
        .I4(data_out_reg_i_2_n_0),
        .O(data_out_reg));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hE2CCE200)) 
    data_out_reg_i_2
       (.I0(left_data_reg[30]),
        .I1(bit_counter_reg[0]),
        .I2(left_data_reg[31]),
        .I3(bit_counter_reg[1]),
        .I4(left_data_reg[29]),
        .O(data_out_reg_i_2_n_0));
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    data_out_reg_reg
       (.C(bit_clk_in),
        .CE(1'b1),
        .CLR(reset_in),
        .D(data_out_reg),
        .Q(i2s_sd_out));
  LUT6 #(
    .INIT(64'hFFFFFFFE00000001)) 
    lr_clk_reg_i_1
       (.I0(bit_counter_reg[3]),
        .I1(bit_counter_reg[1]),
        .I2(bit_counter_reg[0]),
        .I3(bit_counter_reg[2]),
        .I4(bit_counter_reg[4]),
        .I5(i2s_ws_out),
        .O(lr_clk_reg_i_1_n_0));
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    lr_clk_reg_reg
       (.C(bit_clk_in),
        .CE(1'b1),
        .CLR(reset_in),
        .D(lr_clk_reg_i_1_n_0),
        .Q(i2s_ws_out));
  LUT3 #(
    .INIT(8'h32)) 
    ready_for_data_reg_i_1
       (.I0(ready_for_data_reg_reg_0),
        .I1(ready_for_data_reg_i_2_n_0),
        .I2(current_channel_reg),
        .O(ready_for_data_reg_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    ready_for_data_reg_i_2
       (.I0(bit_counter_reg[3]),
        .I1(bit_counter_reg[1]),
        .I2(bit_counter_reg[0]),
        .I3(bit_counter_reg[2]),
        .I4(bit_counter_reg[4]),
        .O(ready_for_data_reg_i_2_n_0));
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    ready_for_data_reg_reg
       (.C(bit_clk_in),
        .CE(1'b1),
        .CLR(reset_in),
        .D(ready_for_data_reg_i_1_n_0),
        .Q(ready_for_data_reg_reg_0));
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \right_data_reg_reg[29] 
       (.C(bit_clk_in),
        .CE(E),
        .CLR(reset_in),
        .D(1'b1),
        .Q(left_data_reg[29]));
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \right_data_reg_reg[30] 
       (.C(bit_clk_in),
        .CE(E),
        .CLR(reset_in),
        .D(\right_data_reg_reg[31]_0 [0]),
        .Q(left_data_reg[30]));
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \right_data_reg_reg[31] 
       (.C(bit_clk_in),
        .CE(E),
        .CLR(reset_in),
        .D(\right_data_reg_reg[31]_0 [1]),
        .Q(left_data_reg[31]));
  LUT5 #(
    .INIT(32'hFFBF0040)) 
    toggle_i_1
       (.I0(toggle_reg),
        .I1(Q[0]),
        .I2(ready_for_data_reg_reg_0),
        .I3(Q[1]),
        .I4(D),
        .O(\frame_counter_reg[6] ));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
