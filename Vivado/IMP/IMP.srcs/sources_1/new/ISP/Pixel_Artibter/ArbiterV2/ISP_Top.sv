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
    input pixel_clk,
    input core_clk,
    input rst,
    input [23:0] rgb_in,
    output reg [23:0] rgb_out
    );
    
    // Constants - Max # of cores is 15 
    parameter NUM_CORES = 15;

    // Arrays to hold instances and control signals
    reg [NUM_CORES-1:0] data_in_valid_reg;

    wire [NUM_CORES-1:0] data_out_ready_rgb2hsv;
    wire [NUM_CORES-1:0] data_out_ready_hsv2rgb;
    wire [NUM_CORES-1:0] n_core_busy;

    wire [23:0] rgb_out_array [NUM_CORES-1:0];
    reg [23:0] rgb_in_array [NUM_CORES-1:0];

    // Instantiate ISPCore modules
    generate
        genvar i;
        for(i=0; i<NUM_CORES; i=i+1) begin : ISPCore_inst
            ISPCore u_ISPCore (
                //Inputs
                .clk(core_clk),
                .rst(rst),
                .RGB_IN(rgb_in_array[i]),
                .data_in_valid(data_in_valid_reg[i]),

                .RGB_OUT(rgb_out_array[i]),
                .data_out_ready_rgb2hsv(data_out_ready_rgb2hsv[i]),
                .data_out_ready_hsv2rgb(data_out_ready_hsv2rgb[i]),
                .n_core_busy(n_core_busy[i])
            );
        end
    endgenerate

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
    fifo_generator_0 rgb_input_fifo (
        .rst(rst),                  // input wire rst
        .wr_clk(pixel_clk),            // input wire wr_clk -- CHANGE ME TO PIXEL CLK
        .rd_clk(core_clk),            // input wire rd_clk
        .din(rgb_in),                  // input wire [23 : 0] din
        .wr_en(wr_en_in),              // input wire wr_en
        .rd_en(rd_en_in),              // input wire rd_en
        .dout(input_fifo_rgb_out),                // output wire [23 : 0] dout
        .full(fifo_in_full),                // output wire full
        .empty(fifo_in_empty),              // output wire empty
        .valid(fifo_in_valid),              // output wire valid
        .wr_rst_busy(wr_rst_busy_in),  // output wire wr_rst_busy
        .rd_rst_busy(rd_rst_busy_in)  // output wire rd_rst_busy
    );

    wire [3:0] n_core_busy_select;
    reg core_ready;
    integer k;

    assign core_ready = |n_core_busy;

            
    DMUX DMUX_Inst(
        .clk(core_clk),
        .rst(rst),
        .fifo_empty(fifo_in_empty),
        .fifo_data_valid(fifo_in_valid),
        .core_ready(core_ready),
        .rgb_in(input_fifo_rgb_out),
        .sel(n_core_busy_select),
        .rgb_out(rgb_in_array),
        .pixel_pulse(data_in_valid_reg)
    );

    PriorityEncoder PrioEnc_core_busy_Inst(
        .clk(core_clk),
        .rst(rst),
        .data_in(n_core_busy),
        .core_select(n_core_busy_select)
    );


    // Output MUX - Collect output data from each core
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

    // Instantiate output FIFO
    fifo_generator_0 rgb_output_fifo (
        .rst(rst),                  // input wire rst
        .wr_clk(core_clk),            // input wire wr_clk
        .rd_clk(pixel_clk),            // input wire rd_clk -- CHANGE ME TO PIXEL CLK
        .din(fifo_input),                  // input wire [23 : 0] din
        .wr_en(wr_en_out),              // input wire wr_en
        .rd_en(rd_en_out),              // input wire rd_en
        .dout(rgb_out),                // output wire [23 : 0] dout
        .full(fifo_out_full),                // output wire full
        .empty(fifo_out_empty),              // output wire empty
        .valid(fifo_out_valid),              // output wire valid
        .wr_rst_busy(wr_rst_busy_out),  // output wire wr_rst_busy
        .rd_rst_busy(rd_rst_busy_out)  // output wire rd_rst_busy
    );
    
    // Instantiate Priority Encoder
    wire [3:0] core_data_valid;
    PriorityEncoder PrioEnc_data_out_valid_Inst(
        .clk(core_clk),
        .rst(rst),
        .data_in(data_out_ready_rgb2hsv),
        .core_select(core_data_valid)
    );


    // Instantiate output MUX
    MUX MUX_Inst(
        .rgb_in(rgb_out_array),
        .sel(core_data_valid),
        .rgb_out(fifo_input)
    );

endmodule