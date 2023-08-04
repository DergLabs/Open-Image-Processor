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

    wire [7:0] v_out_delayed;
    wire [23:0] h_out_delayed;

    wire [7:0] v_out_delayed_2;
    wire [2:0] i_delayed;

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

    vector_delay_line #(8, 6) vout_data_delay( //8 bits, 7 stages
        .clk(clk),
        .reset(rst),
        .data_in(v_out),
        .data_out(v_out_delayed)
    );

    vector_delay_line #(24, 6) hout_data_delay( //24 bits, 7 stages
        .clk(clk),
        .reset(rst),
        .data_in(h_out),
        .data_out(h_out_delayed)
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
        .h(h_out_delayed),
        .i(i),
        .d(d),
        .v(v_out_delayed),

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
    /*
    c_shift_ram_17 data_valid_delay_hsv2rgb (
      .D(pixel_ready_in),      // input wire [0 : 0] D
      .CLK(clk),               // input wire CLK
      .SCLR(rst),              // input wire SCLR
      .Q(Q)      // output wire [0 : 0] Q
    );*/

    vector_delay_line #(1, 17) pixel_ready_delay( //1 bit, 19 stages -- Delay for pixel ready signal
        .clk(clk),
        .reset(rst),
        .data_in(pixel_ready_in),
        .data_out(Q)
    );

    vector_delay_line #(8, 10) vout_data_delay_2( //8 bits, 7 stages
        .clk(clk),
        .reset(rst),
        .data_in(v_out_delayed),
        .data_out(v_out_delayed_2)
    );

    vector_delay_line #(3, 10) iout_data_delay( //24 bits, 7 stages
        .clk(clk),
        .reset(rst),
        .data_in(i),
        .data_out(i_delayed)
    );


    generate_rgb_out generate_rgb_out_inst
    (
        .clk(clk),
        .rst(rst),
        .i(i_delayed),
        .v(v_out_delayed_2), 
        .c(c),
        .m(m),
        .pixel_ready_in(Q),

        .pixel_ready_out(pixel_ready_out),
        .r(r),
        .g(g),
        .b(b),
        .rgb_out(RGB_OUT)
    );

endmodule
