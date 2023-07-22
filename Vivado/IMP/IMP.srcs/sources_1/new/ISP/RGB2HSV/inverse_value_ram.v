`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/10/2023 03:00:11 PM
// Design Name: 
// Module Name: inverse_value_ram
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


module inverse_value_rom(clk, douta, doutb, addra, addrb);
    input clk;
    input [7:0] addra;
    input [7:0] addrb;

    output [17:0] douta;
    output [17:0] doutb;

    wire [17:0] dina = 18'b0;
    wire [17:0] dinb = 18'b0;

    blk_mem_gen_0 inverse_value_rom (
      .clka(clk),    // input wire clka
      .addra(addra),  // input wire [7 : 0] addra
      .douta(douta),  // output wire [17 : 0] douta
      .clkb(clk),    // input wire clkb
      .addrb(addrb),  // input wire [7 : 0] addrb
      .doutb(doutb)  // output wire [17 : 0] doutb
    );


endmodule
