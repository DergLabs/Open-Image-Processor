`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/20/2023 03:32:46 AM
// Design Name: 
// Module Name: Pixel_Sync
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


module Pixel_Sync(
    input pixel_clk,
    input rst_n,
    input CE,
    input vid_pVDE_in,
    input vid_pHSync_in,
    input vid_pVSync_in,
    input serial_clk_in,
    input hdmi_out_oen,

    output vid_pVDE_out,
    output vid_pHSync_out,
    output vid_pVSync_out,
    output serial_clk_out,
    output pixel_clk_out,
    output hdmi_out_oen_out
    );

    reg vid_pVDE_d0 = 1'b0;
    reg vid_pHSync_d0 = 1'b0;
    reg vid_pVSync_d0 = 1'b0;
    reg sierial_clk_d0 = 1'b0;
    reg pixel_clk_d0 = 1'b0;
    reg hdm_out_oen_d0 = 1'b0;

    always @(*) begin
      if (CE == 1'b1) begin
        vid_pVDE_d0 = vid_pVDE_in;
        vid_pHSync_d0 = vid_pHSync_in;
        vid_pVSync_d0 = vid_pVSync_in;
        hdm_out_oen_d0 = hdmi_out_oen;
      end
    end

    BUFGCE pixel_clk_BUFG (
      .O(pixel_clk_out),   // 1-bit output: Clock output
      .CE(CE), // 1-bit input: Clock enable input for I0
      .I(pixel_clk)    // 1-bit input: Primary clock
    );

    BUFGCE serial_clk_BUFG (
      .O(serial_clk_out),   // 1-bit output: Clock output
      .CE(CE), // 1-bit input: Clock enable input for I0
      .I(serial_clk_in)    // 1-bit input: Primary clock
    );
    
    assign vid_pVDE_out = vid_pVDE_d0;
    assign vid_pHSync_out = vid_pHSync_d0;
    assign vid_pVSync_out = vid_pVSync_d0;
    assign hdmi_out_oen_out = hdm_out_oen_d0;

endmodule
