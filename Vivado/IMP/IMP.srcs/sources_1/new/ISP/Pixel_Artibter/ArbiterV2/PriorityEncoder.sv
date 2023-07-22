`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/19/2023 08:01:40 PM
// Design Name: 
// Module Name: PriorityEncoder
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


module PriorityEncoder(
        input clk,
        input rst, 
        input [14:0] data_in,
        output reg [3:0] core_select
    );

    ///////////////////SIMULATION ONLY/////////////////////
    initial begin
        core_select = 4'b0;
    end
    ///////////////////////////////////////////////////////

    always @(data_in) begin
        if (data_in[14] == 1) begin
            core_select <= 14;                
        end else if (data_in[13] == 1) begin
            core_select <= 13;                
        end else if (data_in[12] == 1) begin
            core_select <= 12;                
        end else if (data_in[11] == 1) begin
            core_select <= 11;                
        end else if (data_in[10] == 1) begin
            core_select <= 10;                
        end else if (data_in[9] == 1) begin
            core_select <= 9;               
        end else if (data_in[8] == 1) begin
            core_select <= 8;                
        end else if (data_in[7] == 1) begin
            core_select <= 7;               
        end else if (data_in[6] == 1) begin
            core_select <= 6;                
        end else if (data_in[5] == 1) begin
            core_select <= 5;                
        end else if (data_in[4] == 1) begin
            core_select <= 4;                
        end else if (data_in[3] == 1) begin
            core_select <= 3;                
        end else if (data_in[2] == 1) begin
            core_select <= 2;               
        end else if (data_in[1] == 1) begin
            core_select <= 1;               
        end else if (data_in[0] == 1) begin
            core_select <= 0;
        end
    end

endmodule

