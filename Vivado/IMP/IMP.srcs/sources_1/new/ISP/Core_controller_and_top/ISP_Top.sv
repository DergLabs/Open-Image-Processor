`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/19/2023 10:27:25 PM
// Design Name: 
// Module Name: ISP_Top
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


module ISP_Top(
    input core_clk,
    input ila_clk,
    input rst,
    input [23:0] rgb_in,
    
    input cs,
    input sclk,
    input [7:0] din,

    output reg [23:0] rgb_out,
    output reg CE
    );
    
    // Pixel processor Core
    ISPCore u_ISPCore (
        //Inputs
        .clk(core_clk),
        .ila_clk(ila_clk),
        .rst(rst),
        .RGB_IN(input_fifo_rgb_out),
        .data_in_valid(fifo_in_valid),

        .cs(cs),
        .sclk(sclk),
        .din(din),

        .RGB_OUT(output_fifo_rgb),
        .data_out_ready_rgb2hsv(data_out_ready_rgb2hsv),
        .data_out_ready_hsv2rgb(data_out_ready_hsv2rgb),
        .n_core_busy(n_core_busy)
    );

    // Input FIFO signals
    wire fifo_in_full;
    wire fifo_in_empty;
    wire fifo_in_valid;
    wire wr_rst_busy_in;
    wire rd_rst_busy_in;
    wire wr_en_in;
    wire rd_en_in;
    wire [23:0] input_fifo_rgb_out;

    assign wr_en_in = 1;
    assign rd_en_in = 1;

    // Instantiate input FIFO 
    fifo_generator_0 input_fifo_buffer (
    .clk(core_clk),      // input wire clk
    .srst(rst),    // input wire srst
    .din(rgb_in),      // input wire [23 : 0] din
    .wr_en(wr_en_in),  // input wire wr_en
    .rd_en(rd_en_in),  // input wire rd_en
    .dout(input_fifo_rgb_out),    // output wire [23 : 0] dout
    .full(),    // output wire full
    .empty(),  // output wire empty
    .valid(fifo_in_valid)  // output wire valid
    );

    // output FIFO signals
    wire fifo_out_full;
    wire fifo_out_empty;
    wire fifo_out_valid;
    wire wr_rst_busy_out;
    wire rd_rst_busy_out;
    wire wr_en_out;
    wire rd_en_out;
    wire [23:0] output_fifo_rgb;
    reg [23:0] fifo_input;

    assign wr_en_out = 1;
    assign rd_en_out = 1;

    // Instantiate input FIFO 
    fifo_generator_0 output_fifo_buffer (
        .clk(core_clk),      // input wire clk
        .srst(rst),      // input wire rst
        .din(output_fifo_rgb),      // input wire [23 : 0] din
        .wr_en(wr_en_out),  // input wire wr_en
        .rd_en(rd_en_out),  // input wire rd_en
        .dout(rgb_out),    // output wire [23 : 0] dout
        .full(fifo_out_full),    // output wire full
        .empty(fifo_out_empty),  // output wire empty
        .valid(fifo_out_valid)  // output wire valid
    );

    reg CE = 0;
    reg counter_CE = 1;
    wire [5:0] count;
    c_counter_binary_0 lost_pixel_counter (
      .CLK(core_clk),  // input wire CLK
      .CE(counter_CE),    // input wire CE
      .Q(count)      // output wire [4 : 0] Q
    );

    always @(posedge core_clk) begin
        if (count == 6'h2A) begin //Count to 42 (number of pixels we need to delay by before they're present on output)
            CE <= 1'b1;
            counter_CE <= 1'b0;
        end
    end

endmodule