`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/11/2023 06:15:43 PM
// Design Name: 
// Module Name: HSV2RGB_Top
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


module HSV2RGB_Top(
    // Inputs
    input clk,
    input rst,
    input [23:0] h,
    input [15:0] s,
    input [7:0] v,
    input pixel_ready_in,

    //Outputs
    output [23:0] RGB_OUT,
    output pixel_ready_out
    );

    wire [7:0] d;
    wire [7:0] c;
    wire [7:0] m;
    wire [2:0] i;

    wire [23:0] RGB_OUT_w;
    wire [7:0] r;
    wire [7:0] g;
    wire [7:0] b;

    wire [23:0] h_out;
    wire [15:0] s_out;
    wire [7:0] v_out;

    input_pixel_flow_controller input_pixel_flow_controller_inst
    (
        .clk(clk),
        .rst(rst),
        .pixel_ready(pixel_ready_in),
        .h(h),
        .s(s),
        .v(v),

        .h_out(h_out),
        .s_out(s_out),
        .v_out(v_out)
    );

    back_calculate_d back_calculate_d_inst
    (
        .clk(clk),
        .rst(rst),
        .S(s_out),
        .V(v_out),
        .d(d)
    );

    back_calculate_c_m back_calculate_c_m_inst
    (
        .clk(clk),
        .rst(rst),
        .h(h_out),
        .i(i),
        .d(d),
        .v(v_out),

        .c(c),
        .m(m)
    );

    back_calculate_i back_calculate_i_inst
    (
        .clk(clk),
        .rst(rst),
        .h(h_out),
        .i(i)
    );

    wire Q;
    c_shift_ram_17 data_valid_delay_hsv2rgb (
      .D(pixel_ready_in),      // input wire [0 : 0] D
      .CLK(clk),               // input wire CLK
      .SCLR(rst),              // input wire SCLR
      .Q(Q)      // output wire [0 : 0] Q
    );

    generate_rgb_out generate_rgb_out_inst
    (
        .clk(clk),
        .rst(rst),
        .i(i),
        .v(v_out), 
        .c(c),
        .m(m),
        .pixel_ready_in(Q),

        .pixel_ready_out(pixel_ready_out),
        .r(r),
        .g(g),
        .b(b),
        .rgb_out(RGB_OUT)
    );

    /*
    output_pixel_flow_controller output_pixel_flow_controller_inst
    (
        .clk(clk),
        .rst(rst),
        .rgb_input(RGB_OUT_w),
        .rgb_output(RGB_OUT),
        .pixel_ready()
    );
    */
    
endmodule
