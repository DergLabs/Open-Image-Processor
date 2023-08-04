`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/11/2023 06:13:37 PM
// Design Name: 
// Module Name: RGB2HSV_Top
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


module RGB2HSV_Top(
    // Inputs 
    input clk,
    input rst,
    input [23:0] RGB,
    input data_valid,
    
    //Outputs
    output [23:0] h,
    output [15:0] s,
    output [7:0] v,
    output data_out_ready,
    output n_core_busy
    );

    wire [23:0] h_w;
    wire [15:0] s_w;
    wire [7:0] v_w;

    wire [7:0] min;
    wire [7:0] max;
    wire [7:0] mid;
    wire [7:0] delta;
    wire [2:0] index;

    wire [7:0] min_delayed;
    wire [7:0] mid_delayed;
    wire [7:0] max_delayed;
    wire [7:0] delta_delayed;
    wire [2:0] index_delayed;


    // Ram wires/buffer registers
    wire [17:0] douta;
    wire [17:0] doutb;

    wire Q;

    /*c_shift_ram_17 data_valid_delay_rgb2hsv (
      .D(data_valid),         // input wire [0 : 0] D
      .CLK(clk),              // input wire CLK
      .SCLR(rst),             // input wire SCLR
      .Q(Q)      // output wire [0 : 0] Q
    );*/

    vector_delay_line #(1, 14) data_valid_delay( //1 bit, 19 stages -- Delay for pixel ready signal
        .clk(clk),
        .reset(rst),
        .data_in(data_valid),
        .data_out(Q)
    );

    pixel_flow_controller pixel_flow_controller_inst (
        .clk(clk),
        .rst(rst),
        .h_in(h_w),
        .s_in(s_w),
        .v_in(v_w),
        .pixel_ready(Q),
        .data_input_valid(data_valid),

        .h_out(h),
        .s_out(s),
        .v_out(v),
        .pixel_ready_hsv(data_out_ready),
        .n_core_busy(n_core_busy)
    );

    calculate_min_max calculate_min_max_inst
    (
        //inputs
        .clk(clk),
        .rst(rst),
        .r(RGB[23:16]),
        .g(RGB[15:8]),
        .b(RGB[7:0]),
        .data_in_valid(data_valid),

        //outputs
        .min(min),
        .max(max),
        .mid(mid),
        .diff(delta),
        .index(index)
    );

    inverse_value_rom inverse_value_rom_inst
    (
        .clk(clk),
        .rst(rst),
        .douta(douta), // To S calculator
        .doutb(doutb), // TO H calculator
        
        .addra(max), // Use the value of max as the address for the first RAM - feeds into the S calculation
        .addrb(delta) //Use the value of delta as the address for the second RAM - feeds into the H calculation
    );

    calculate_s calculate_s_inst
    (
        //inputs
        .clk(clk),
        .rst(rst),
        .delta(delta_delayed),
        .v(max_delayed),
        
        // ROM inputs/output
        .inverse_ram_data(douta),

        //outputs
        .s(s_w)
    );

    calculate_h calculate_h_inst
    (
        //inputs
        .clk(clk),
        .rst(rst),
        .min(min_delayed),
        .mid(mid_delayed),
        //.delta(delta_r),
        .selector_index(index_delayed),

        // ROM inputs/output
        .inverse_ram_data(doutb),

        //outputs
        .h(h_w)
    );

    vector_delay_line #(8, 2) min_data_delay(
        .clk(clk),
        .reset(rst),
        .data_in(min),
        .data_out(min_delayed)
    );

    vector_delay_line #(8, 2) mid_data_delay(
        .clk(clk),
        .reset(rst),
        .data_in(mid),
        .data_out(mid_delayed)
    );

    vector_delay_line #(8, 2) max_data_delay(
        .clk(clk),
        .reset(rst),
        .data_in(max),
        .data_out(max_delayed)
    );

    vector_delay_line #(8, 2) delta_data_delay( // 8 = data width, 2 = delay length
        .clk(clk),
        .reset(rst),
        .data_in(delta),
        .data_out(delta_delayed)
    );

    vector_delay_line #(3, 2) index_data_delay(
        .clk(clk),
        .reset(rst),
        .data_in(index),
        .data_out(index_delayed)
    );

    vector_delay_line #(8, 10) v_data_delay(
        .clk(clk),
        .reset(rst),
        .data_in(max),
        .data_out(v_w)
    );

endmodule
