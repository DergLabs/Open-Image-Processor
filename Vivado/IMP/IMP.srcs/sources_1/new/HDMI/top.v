`timescale 1 ps / 1 ps

module top
(
    input sys_clk,
    input rst_n,
    inout hdmi_ddc_scl_io,//HDMIIN
    inout hdmi_ddc_sda_io,
    output hdmi_hdmi_in_hpd,
    output[0:0] HDMI_hdmi_in_OEN,
    input TMDS_clk_hdmi_in_n,
    input TMDS_clk_hdmi_in_p,
    input[2:0] TMDS_data_hdmi_in_n,
    input[2:0] TMDS_data_hdmi_in_p,

    input isp_alu_cs,
    input isp_alu_sclk,
    input isp_alu_din,

    output [0:0]HDMI_hdmi_out_OEN,//HDMIOUT       
    output TMDS_clk_hdmi_out_n,
    output TMDS_clk_hdmi_out_p,
    output [2:0]TMDS_data_hdmi_out_n,
    output [2:0]TMDS_data_hdmi_out_p
  );

    wire hdmi_ddc_scl_i;
    wire hdmi_ddc_scl_o;
    wire hdmi_ddc_scl_t;
    wire hdmi_ddc_sda_i;
    wire hdmi_ddc_sda_o;
    wire hdmi_ddc_sda_t;
    wire clk_200mhz;
    wire[23:0] vid_pData;
    wire vid_pVDE;
    wire vid_pHSync;
    wire vid_pVSync;

    reg[23:0] vid_pData_d0;
    reg vid_pVDE_d0;
    reg vid_pHSync_d0;
    reg vid_pVSync_d0;


    reg[23:0] vid_pData_d1;
    reg vid_pVDE_d1;
    reg vid_pHSync_d1;
    reg vid_pVSync_d1;


    wire PixelClk;
    wire peripheral_aresetn;
    wire SerialClk;
    reg hdmi_hpd_r;
    wire vid_io_in_reset;
    wire aPixelClkLckd;
    assign HDMI_hdmi_in_OEN = 1'b0;
    assign hdmi_hdmi_in_hpd = hdmi_hpd_r;

    always@(posedge clk_200mhz or negedge rst_n)
    begin
      if( rst_n == 1'b0)
      hdmi_hpd_r <= 1'b0;
      else
      hdmi_hpd_r <= 1'b1;
    end

    IOBUF hdmi_ddc_scl_iobuf
    (
    .I(hdmi_ddc_scl_o),
    .IO(hdmi_ddc_scl_io),
    .O(hdmi_ddc_scl_i),
    .T(hdmi_ddc_scl_t)
    );

    IOBUF hdmi_ddc_sda_iobuf
    (
    .I(hdmi_ddc_sda_o),
    .IO(hdmi_ddc_sda_io),
    .O(hdmi_ddc_sda_i),
    .T(hdmi_ddc_sda_t)
    ); 

    dvi2rgb
    #(
    .kEmulateDDC(1'b1),
    .kRstActiveHigh(1'b0),
    .kAddBUFG(1'b1),
    .kClkRange(1),
    .kEdidFileName("720p_edid.txt"),
    .kIDLY_TapValuePs(78),
    .kIDLY_TapWidth(5)
    )

    dvi2rgb_m0
    (
    .TMDS_Clk_p(TMDS_clk_hdmi_in_p),
    .TMDS_Clk_n(TMDS_clk_hdmi_in_n),
    .TMDS_Data_p(TMDS_data_hdmi_in_p),
    .TMDS_Data_n(TMDS_data_hdmi_in_n),

    .RefClk(clk_200mhz),
    .aRst(1'b0),
    .aRst_n(rst_n),

    .vid_pData(vid_pData),
    .vid_pVDE(vid_pVDE), 
    .vid_pHSync(vid_pHSync), 
    .vid_pVSync(vid_pVSync), 
    .PixelClk(PixelClk),

    .SerialClk(SerialClk),
    .aPixelClkLckd(aPixelClkLckd),

    .DDC_SDA_I(hdmi_ddc_sda_i),
    .DDC_SDA_O(hdmi_ddc_sda_o), 
    .DDC_SDA_T(hdmi_ddc_sda_t), 
    .DDC_SCL_I(hdmi_ddc_scl_i),
    .DDC_SCL_O(hdmi_ddc_scl_o),  
    .DDC_SCL_T(hdmi_ddc_scl_t), 

    .pRst(1'b0),
    .pRst_n(rst_n)
    );
    
    wire sysclk_BUFG;
    BUFG sysclk_BUFG (
       .O(sysclk_BUFG), // 1-bit output: Clock output
       .I(sys_clk)  // 1-bit input: Clock input
    );

   

    
    /*ila_0 internalDebug (
      .clk(clk_200mhz), // input wire clk


      .probe0(vid_pData), // input wire [23:0]  probe0  
      .probe1(isp_rgb_out), // input wire [23:0]  probe1 
      .probe2(count_cout), // input wire [5:0]  probe2 
      .probe3(vid_pVDE), // input wire [0:0]  probe3 
      .probe4(vid_pHSync), // input wire [0:0]  probe4 
      .probe5(vid_pVSync), // input wire [0:0]  probe5 
      .probe6(PixelClk), // input wire [0:0]  probe6 
      .probe7(pvde_sr), // input wire [0:0]  probe7 
      .probe8(hsync_sr), // input wire [0:0]  probe8 
      .probe9(vsync_sr), // input wire [0:0]  probe9 
      .probe10(pixel_clk_sr), // input wire [0:0]  probe10 
      .probe11(HDMI_hdmi_out_OEN) // input wire [0:0]  probe11
    );*/
    

    wire rst_p;
    assign rst_p = ~rst_n;
    wire [23:0] isp_rgb_out;
    ISP_Top image_processor
    (
    .core_clk(PixelClk),
    .ila_clk(sysclk_BUFG),
    .rst(rst_p),
    .rgb_in(vid_pData),
    .cs(isp_alu_cs),
    .sclk(isp_alu_sclk),
    .din(isp_alu_din),
    .rgb_out(isp_rgb_out),
    .CE(pixel_ready_CE)
    );

    // Pixel Sync logic. Accounts for 40 Cycle ISP latency
    wire pixel_ready_CE;
    wire hsync_sr;
    wire vsync_sr;
    wire pvde_sr;
    wire serial_clk_sr;
    wire pixel_clk_sr;
    wire hdmi_oen = 1'b1;
    reg [5:0] count_cout;
    Pixel_Sync pixel_sync_inst
    (
      .pixel_clk(PixelClk),
      .rst_n(rst_n),
      .CE(pixel_ready_CE),
      .vid_pVDE_in(vid_pVDE),
      .vid_pHSync_in(vid_pHSync),
      .vid_pVSync_in(vid_pVSync),
      .serial_clk_in(SerialClk),
      .hdmi_out_oen(hdmi_oen),

      .vid_pVDE_out(pvde_sr),
      .vid_pHSync_out(hsync_sr),
      .vid_pVSync_out(vsync_sr),
      .serial_clk_out(serial_clk_sr),
      .pixel_clk_out(pixel_clk_sr),
      .hdmi_out_oen_out(HDMI_hdmi_out_OEN)
    );


    clk_ref clk_refm0
    (
      // Clock out ports
      .clk_out1(clk_200mhz),       // output clk_out1
      // Status and control signals
      .reset(1'b0),               // input reset
      .locked(),                  // output locked
      // Clock in ports
      .clk_in1(sysclk_BUFG)           // input clk_in1
    );   

    rgb2dvi
    #(
    .kGenerateSerialClk(1'b1),
    .kClkRange(1),     
    .kRstActiveHigh(1'b1)
    )

    rgb2dvi_m0 
    (
    // DVI 1.0 TMDS video interface
    .TMDS_Clk_p(TMDS_clk_hdmi_out_p),
    .TMDS_Clk_n(TMDS_clk_hdmi_out_n),
    .TMDS_Data_p(TMDS_data_hdmi_out_p),
    .TMDS_Data_n(TMDS_data_hdmi_out_n),
      
    //Auxiliary signals 
    .aRst(1'b0), //asynchronous reset; must be reset when RefClk is not within spec
    .aRst_n(1'b1), //-asynchronous reset; must be reset when RefClk is not within spec

    // Video in
    .vid_pData(isp_rgb_out),
    .vid_pVDE(pvde_sr),
    .vid_pHSync(hsync_sr),
    .vid_pVSync(vsync_sr),
    .PixelClk(pixel_clk_sr),

    .SerialClk(serial_clk_sr)// 5x PixelClk
    ); 

endmodule

