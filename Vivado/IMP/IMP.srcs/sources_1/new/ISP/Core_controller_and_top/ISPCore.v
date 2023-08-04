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
    input rst,
    input [23:0] RGB_IN,
    input data_in_valid,

    output [23:0] RGB_OUT,
    output data_out_ready_rgb2hsv,
    output data_out_ready_hsv2rgb,
    output n_core_busy
    );

    wire [23:0] rgbhsv_h;
    wire [15:0] rgbhsv_s;
    wire [7:0] rgbhsv_v;
    
    wire data_ready_hsv;

    RGB2HSV_Top RGB2HSV_Core_Inst
    (
        .clk(clk),
        .rst(rst),
        .RGB(RGB_IN),
        .data_valid(data_in_valid),
        
        .h(rgbhsv_h),
        .s(rgbhsv_s),
        .v(rgbhsv_v),
        .data_out_ready(data_ready_hsv),
        .n_core_busy(n_core_busy)
    );

    assign data_out_ready_rgb2hsv = data_ready_hsv;

    HSV2RGB_Top HSV2RGB_Core_Inst
    (
        .clk(clk),
        .rst(rst),
        .h(rgbhsv_h),
        .s(rgbhsv_s),
        .v(rgbhsv_v),
        .pixel_ready_in(data_ready_hsv),
        .RGB_OUT(RGB_OUT),
        .pixel_ready_out(data_out_ready_hsv2rgb)
    );

endmodule
