`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/19/2023 09:37:23 PM
// Design Name: 
// Module Name: MUX
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


module MUX(
    input [23:0]rgb_in[NUM_CORES-1:0],
    input [3:0] sel,

    output reg [23:0] rgb_out
    );

    parameter NUM_CORES = 15;

    always @(sel, rgb_in) begin
        rgb_out <= rgb_in[sel];
    end

endmodule
