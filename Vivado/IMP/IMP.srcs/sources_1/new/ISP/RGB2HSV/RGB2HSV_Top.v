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
    
    // internal signal Buffer registers 
    reg [7:0] min_r;
    reg [7:0] max_r;
    reg [7:0] mid_r;
    reg [7:0] delta_r;
    reg [2:0] index_r;

    reg [7:0] min_r_2;
    reg [7:0] max_r_2;
    reg [7:0] mid_r_2;
    reg [7:0] delta_r_2;
    reg [2:0] index_r_2;


    // Ram wires/buffer registers
    wire [17:0] douta;
    wire [17:0] doutb;

    wire Q;
    c_shift_ram_17 data_valid_delay_rgb2hsv (
      .D(data_valid),         // input wire [0 : 0] D
      .CLK(clk),              // input wire CLK
      .SCLR(rst),             // input wire SCLR
      .Q(Q)      // output wire [0 : 0] Q
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
        .delta(delta_r_2),
        .v(max_r_2),
        
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
        .min(min_r_2),
        .mid(mid_r_2),
        //.delta(delta_r),
        .selector_index(index_r_2),

        // ROM inputs/output
        .inverse_ram_data(doutb),

        //outputs
        .h(h_w)
    );

    
    // Buffer registers. ROM takes 2 clk cycles to produce output so we must delay other signals by 2 clk cycles
    always@(posedge clk)
    begin
        if(rst) begin
            min_r <= 0;
            max_r <= 0;
            mid_r <= 0;
            delta_r <= 0;
            index_r <= 0;

            min_r_2 <= 0;
            max_r_2 <= 0;
            mid_r_2 <= 0;
            delta_r_2 <= 0;
            index_r_2 <= 0;

        end else begin
            min_r <= min;
            max_r <= max;
            mid_r <= mid;
            delta_r <= delta;
            index_r <= index;

            min_r_2 <= min_r;
            max_r_2 <= max_r;
            mid_r_2 <= mid_r;
            delta_r_2 <= delta_r;
            index_r_2 <= index_r;

        end
    end

    assign v_w = max_r_2;
endmodule
