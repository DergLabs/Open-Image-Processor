// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
// Date        : Thu Jul 20 03:08:29 2023
// Host        : DESKTOP-U9NB2CD running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/johnh/Desktop/IMP/IMP.gen/sources_1/ip/c_shift_ram_sync_buffer/c_shift_ram_sync_buffer_stub.v
// Design      : c_shift_ram_sync_buffer
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tfgg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "c_shift_ram_v12_0_14,Vivado 2022.1" *)
module c_shift_ram_sync_buffer(D, CLK, CE, Q)
/* synthesis syn_black_box black_box_pad_pin="D[0:0],CLK,CE,Q[0:0]" */;
  input [0:0]D;
  input CLK;
  input CE;
  output [0:0]Q;
endmodule
