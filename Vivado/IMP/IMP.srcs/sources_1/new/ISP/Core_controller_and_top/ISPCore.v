`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/13/2023 10:02:59 PM
// Design Name: 
// Module Name: ISPCore
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: This module serves to link the RGB2HSV and HSV2RGB modules as well as the ALU modules
// 
//////////////////////////////////////////////////////////////////////////////////


module ISPCore(
    input clk,
    input ila_clk,
    input rst,
    input [23:0] RGB_IN,
    input data_in_valid,
    input cs,
    input sclk,
    input [7:0] din,

    output [23:0] RGB_OUT,
    output data_out_ready_rgb2hsv,
    output data_out_ready_hsv2rgb,
    output n_core_busy
    );

    wire [23:0] rgbhsv_h;
    wire [15:0] rgbhsv_s;
    wire [7:0] rgbhsv_v;
    
    wire data_ready_hsv;
    wire [23:0] rgb_alu_out;

    // RGB ALU Control signals
    wire [26:0] rgb_operand;
    wire [10:0] rgb_alu_op;
    wire [8:0] r_operand;
    wire [8:0] g_operand;
    wire [8:0] b_operand;
    wire rgb_alu_enable;

    // H and SV ALU Control signals
    wire [24:0] h_operand;
    wire [16:0] s_operand;
    wire [8:0] v_operand;
    
    wire [10:0] opcode_h;
    wire [10:0] opcode_sv;

    wire en_h;
    wire en_sv;

    // ALU CTRL IO signals
    wire [47:0] hsv_operand;

    assign h_operand = hsv_operand[47:24];
    assign s_operand = hsv_operand[23:8];
    assign v_operand = hsv_operand[7:0];

    assign r_operand = rgb_operand[26:18];
    assign g_operand = rgb_operand[17:9];
    assign b_operand = rgb_operand[8:0];
    
    wire [23:0] dummy1 = 0;
    wire [23:0] dummy2 = 0;
    wire [5:0] dummy3 = 0;

    ila_0 internalDebug_ALU_CTRL (
      .clk(ila_clk), // input wire clk


      .probe0(dummy1), // input wire [23:0]  probe0  
      .probe1(dummy2), // input wire [23:0]  probe1 
      .probe2(dummy3), // input wire [5:0]  probe2 
      .probe3(sclk), // input wire [0:0]  probe3 
      .probe4(cs), // input wire [0:0]  probe4 
      .probe5(din[0]), // input wire [0:0]  probe5 
      .probe6(din[1]), // input wire [0:0]  probe6 
      .probe7(din[2]), // input wire [0:0]  probe7 
      .probe8(din[3]), // input wire [0:0]  probe8 
      .probe9(din[4]), // input wire [0:0]  probe9 
      .probe10(din[5]), // input wire [0:0]  probe10 
      .probe11(din[6]) // input wire [0:0]  probe11
    );


    ALU_REG_CTRL_IO ALU_IO
    (
        .clk(clk),
        .rst(rst),
        .cs(cs),
        .sclk(sclk),
        .din(din),

        .rgb_alu_operand(rgb_operand),
        .rgb_alu_opmode(rgb_alu_op),
        .rgb_alu_en(rgb_alu_enable),

        .hsv_alu_operand(hsv_operand),
        .h_alu_opmode(opcode_h),
        .sv_alu_opmode(opcode_sv),

        .h_alu_en(en_h),
        .sv_alu_en(en_sv)
    );

    RGB_ALU RGB_ALU_Core_Inst
    (
        .clk(clk),
        .rst(rst),
        .rgb_data_in(RGB_IN),
        .r_operand(r_operand),
        .g_operand(g_operand),
        .b_operand(b_operand),
        .opcode(rgb_alu_op),
        .en(rgb_alu_enable),
        .rgb_data_out(rgb_alu_out)
    );

    RGB2HSV_Top RGB2HSV_Core_Inst
    (
        .clk(clk),
        .rst(rst),
        //.RGB(RGB_IN),
        .RGB(rgb_alu_out),
        .data_valid(data_in_valid),
        
        .h(rgbhsv_h),
        .s(rgbhsv_s),
        .v(rgbhsv_v),
        .data_out_ready(data_ready_hsv),
        .n_core_busy(n_core_busy)
    );

    assign data_out_ready_rgb2hsv = data_ready_hsv;


    wire [23:0] alu_h_out;
    wire [15:0] alu_s_out;
    wire [7:0] alu_v_out;

    HSV_ALU HSV_ALU_Core_Inst
    (
        .clk(clk),
        .rst(rst),

        .h_in(rgbhsv_h),
        .s_in(rgbhsv_s),
        .v_in(rgbhsv_v),

        .h_operand(h_operand),
        .s_operand(s_operand),
        .v_operand(v_operand),

        .opcode_h(opcode_h),
        .opcode_sv(opcode_sv),

        .en_h(en_h),
        .en_sv(en_sv),

        .h_out(alu_h_out),
        .s_out(alu_s_out),
        .v_out(alu_v_out)
    );

    HSV2RGB_Top HSV2RGB_Core_Inst
    (
        .clk(clk),
        .rst(rst),
        //.h(rgbhsv_h),
        //.s(rgbhsv_s),
        //.v(rgbhsv_v),
        .h(alu_h_out),
        .s(alu_s_out),
        .v(alu_v_out),
        .pixel_ready_in(data_ready_hsv),
        .RGB_OUT(RGB_OUT),
        .pixel_ready_out(data_out_ready_hsv2rgb)
    );

endmodule
