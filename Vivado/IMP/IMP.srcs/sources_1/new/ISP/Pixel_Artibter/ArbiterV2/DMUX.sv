`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/19/2023 06:56:41 PM
// Design Name: 
// Module Name: DMUX
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


module DMUX(
    input clk,
    input rst,
    input fifo_empty,
    input fifo_data_valid,
    input core_ready,
    input [23:0] rgb_in,
    input [3:0] sel,

    output reg [23:0] rgb_out[NUM_CORES-1:0],
    output reg [NUM_CORES-1:0] pixel_pulse
    );

    parameter NUM_CORES = 15;
    
    reg [3:0] prev_sel = 4'b0;

    ///////////////////SIMULATION ONLY/////////////////////
    initial begin
        for (int j = 0; j < NUM_CORES; j = j + 1) begin
            rgb_out[j] = 0;
            pixel_pulse[j] = 0;
        end
        prev_sel = 0;
    end
    ///////////////////////////////////////////////////////
    wire green_light; 
    and #(3) and_gate (green_light, fifo_data_valid, core_ready, !fifo_empty);

    always @(*) begin
        if (rst == 1) begin
            for (int j = 0; j < NUM_CORES; j = j + 1) begin //Simply reset all outputs to 0
                rgb_out[j] = 0;
                pixel_pulse[j] = 0;
            end
            prev_sel <= 0;
        end
        else begin
            if (green_light == 1) begin
                rgb_out[sel] <= rgb_in;
                pixel_pulse[sel] <= 1;
                if (prev_sel != sel) begin
                    pixel_pulse[prev_sel] <= 0;
                end
                prev_sel <= sel;
            end
            else begin
               $display("DMUX: No green light"); 
            end
        end
    end

endmodule



