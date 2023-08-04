// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
// Date        : Thu Aug  3 20:24:18 2023
// Host        : DESKTOP-U9NB2CD running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/johnh/Desktop/IMP/IMP.gen/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0_sim_netlist.v
// Design      : blk_mem_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tfgg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_0,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.1" *) 
(* NotValidForBitStream *)
module blk_mem_gen_0
   (clka,
    rsta,
    addra,
    douta,
    clkb,
    rstb,
    addrb,
    doutb,
    rsta_busy,
    rstb_busy);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA RST" *) input rsta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [7:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [17:0]douta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB RST" *) input rstb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [7:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [17:0]doutb;
  output rsta_busy;
  output rstb_busy;

  wire [7:0]addra;
  wire [7:0]addrb;
  wire clka;
  wire [17:0]douta;
  wire [17:0]doutb;
  wire rsta;
  wire rsta_busy;
  wire rstb;
  wire rstb_busy;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [7:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [17:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "8" *) 
  (* C_ADDRB_WIDTH = "8" *) 
  (* C_ALGORITHM = "0" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "1" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "1" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.7928 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "0" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "1" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "1" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "1" *) 
  (* C_HAS_RSTB = "1" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "blk_mem_gen_0.mem" *) 
  (* C_INIT_FILE_NAME = "blk_mem_gen_0.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "4" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "4" *) 
  (* C_READ_DEPTH_A = "256" *) 
  (* C_READ_DEPTH_B = "256" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "18" *) 
  (* C_READ_WIDTH_B = "18" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "256" *) 
  (* C_WRITE_DEPTH_B = "256" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "18" *) 
  (* C_WRITE_WIDTH_B = "18" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  blk_mem_gen_0_blk_mem_gen_v8_4_5 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(1'b0),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[7:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(rsta),
        .rsta_busy(rsta_busy),
        .rstb(rstb),
        .rstb_busy(rstb_busy),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[7:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[17:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(1'b0),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2022.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
RgPKnWr9n0dGgttm3akiFhAlfB96usOQYxnEmPhGyTGg1AbizYAjGPWLXBWl50n/d0IA71ci4aJB
wt6mtfyNADm3ZReK7D3mKu037BOgxryoEwwf1kiC6q/PllxsdAgEMfQrfHJ3E2AzSpdYjoxVYito
y0JW6CUDcWvWa4WV0EA=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
M0l6KpOGH3jL8eRt3NCD7e2USYnkg5H9GAnE1PKmnjiouFN3Y8kjWA2PZDAQLm9UW+TsC1HeVlzO
WjNCHkjR/6ubCsIcWfpPZWdIuAenlsyq8Y9l6b8vMj8JSbDEOiFF/GHSbKsn22MJdDJKEhHFK6GV
s8gR2vywRFwG69gIRE4qGhVB+WIg8GJrDpDMYH6lCjMkTrjXuKDUcNlJN3NPLuhJ7tsditwf1pr5
moJRmGpJnip/rGm0g4o4A6ev4CtePjoao8C1wFtzHkERX9oenhh7cGjDMejU5IrLv8NxFnLj1FpB
9MuF1beTU20NI5oAn6zLiLiOtXjf0ghU3AN4DA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
hAsrUfp6Qgjm8yBjNYTEtQmVQmMxzL8TE/3oiQSxSI3+yEkXAbQCXkT9mo+LCdv+fGECOB0istHd
eLtbsiYbxjxNxYkXiUrRE5O+aSxynIray+uF9DJigTEUZu8JJXUbzxK4DDUu1Lm9tpGps4+Prz1m
0gkj13RT/Y/418s2VTw=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
BP/54Wm/GJmb1jy0bxWJJX4aiKyiWPVh4X3VL30BQrmX4PlEsNKzBJH3Qu8IIYERfnFP0ifAgboa
vypMQ5Ed0BrMePGkWIgT6I8hxJCMFpHdkSK7m1giSKyZzFfTOrVqoNFXE+qdzLfY1J5hBWCvouYo
jllavK4N3gF9FLScH2AUWYVMcVth2QPaTAU2NLnAUNH8kgtBjBfc8/KbPPTznD1QNVqvFstzcbTA
hGQ1ETVPvINQ0KqxxAG5PRhtQD4+pC+hr/Tvk+RSvGyBOfy9zE86OXkJiYs9dSFhNiMFmCPL9DBO
se4OxNNC0/7aBtb1mkSEA9YFDYEb9jS7Jasy2A==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
SnzT9DVH3xlEN8nrr2YrlvTO5qj7L22d7WaBcuKyTaiHoIwwFHrC4HQbfs0TAwkdWcOgmJoATPSF
F6qm0KiddbrlERF3MfKUldeGBJtqLdX+zGw7+3JD7S+HB9dIMOFOHy+IiCZp1/Pz8epKpi238cel
rcVoJQKz406wmXDvOo8KsT+XhRLs9BVCrBErPGGXKYDk6NXAp0duOgQE9DbslzMU83M/kUC7uERV
tQW02240peKQFp2elEZC7Tetvgp0TaFTtJiKN45REi8GQUCKGa85JjNIk1qb/+k95TIIP1xrHirc
6iX7qbwnPetv8TVu2NjkZ0WDEK5RXdOXcxBwHA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_07", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
erkR82V0jX8ytva+9MzEs0c75Z7j7TsgxWRLNAUfbbU28i+U9YzuZlSfYU75M0f9jx1gvxtBrfKv
cNHVdkR+i5zfHDZsDwfMEEBhs8wzDCKqe+eex6BBEvlIOesCPXrr2RozQgaQ1PBh/os2Arfu+873
BjsVxFJkbhpzIqlddOo/XZV9Yi+eih7A7pXXEBR6IL7Poo4Ka49MiVQU0xJrDTm+ddOuMPDRRD7g
dsxS/uzdcBcO2myV6g/7YH/C2Ce9s6+UywJN/0JeXSqwA7bsBqqnfFicVAT0lckLopMLiuzK7dsN
EwhFeqoetciFrDIj9+o0xDMWBZhgNP1u68vURA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
R+BI65BKLT0I9hEtsxGnDyM5XY9gzULeTPOSDXvd3KWOzZJAx6C0xlbyZcFZhAEG/QIK2yd0wAi6
IUWxyF/sx3HsqKjhVi5KxnpuXDBOZVoj811O7JukedFVmDW7OHGtBkuiJ5X5irw7mfsEKRQmF/1i
V6lj9HYHZEjxtDeZjACsLY4y1QxWalSKT4HIMOHznBLL8dLbGMlS+ZmFuFn0gcwZavVl7gTkTtkf
W0gn01A9ru7NKsf+iLX0kj4dgItPu9N2g02M1vWQ9UUQEVvfV7lUc7GY1suibrD8aEkhH9S7lZ7n
bFsT4qxyvzg8ML6v4g4v7N6VuyhEtgFgNd725Q==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
jNUVKiwH68vHsU54idgvKwaVJcoxTUuxfgrQpbpmM/IpesWA3wHsGzYClwAxkKzw3KRnFyQqTWcZ
yj1EQ2CMBxlJ0kyNbZW8OK8pXzeigToZ0U6Aq3Gy+j7wBbhe83wE1Ygn82sK8dHTEulvaRLn/c5r
ispy1s7jMKIvYNzoUuZrgyBQyfaYmdqUia8XlQjFd+VwzhTXKwzvmaqHWyaHjfBKeCooO7+oUxMG
OJg83W54EVe9ronFQ8Wr9EOL8ia7qelCAgyQe/bC0HHCoMAm8apI7sX23iMR/wMiPP5V2bQzycy+
rBX/+SWkqSeIE1FLm+muFPvrE7iLwJaW8d1fzdFFjAZ5aIXArbWNfwbK8S0TczXc9lEzmpb69rwA
UJIrs4alo81qGQ32UFhjuMQjX75O9Od1HWHDj5PFaT/Ja5Ly+bK8Cc3gfO6dCE81m7d+B2JBZ/Hl
tBA19QuOAYwT2EIPOdpaVtCULb33cWODWu3qQFhZMmDzKTb3kwpcr0LL

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
MnzcA2swaxH1LRacKDou0ZmiiMRETbWIdHgeBgyQz7ILronsXLoB/C20WuFNGEVSiL2/51EZ6MXZ
vMHI8fFcMQCJcuTBDBibUMKv6bXI9s8fTbtrBZppbF/R1icG5JYhqmX4aRnv4W/dxJRjI2L35nLN
Y48E9OfgfkD1sr+IRwx8WEKFmUhuk8dLe0VOK7ywe3XEcneYvrz+HhPj16bGmNfMwNnDgZ3gKKZD
hRnys+jzvAX3HyISrErWXhMKrhWMxXeTNFJCqNQ0LWAVHQYwyKnF5xVpyXSuGNSIrva+QXqOrZBG
3VNLirNVtMRiKLfwZeMaqvswkqBDAa53utlAAA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
d0xXkKtsKM8GvXhDZr16p1+oE3uBtD04BJ76eGGIEj/CFECfHVy9qsJ43oSKjas0+AJr4GFFnVb6
X7gJV6MmX/OboC9ier5joUCGz0mxVzkRZK9a+LPEDcg0K6+cLE36kr+FfxW9Uk2816EHBCMCf5mK
A4eAhSmAb5Nq74F/q0quiG416npbny7faiQ+xmPDfYYiM3UuMKaD4iE8ODlz1w5xThPllWESf3LZ
NTkw6fozyTqZ47vvE21O3dgIGAY1v+C6BwlCK24VwPJa1xs9csY+qTk31j5jjAc1ExlB6QF7t9UH
lk70qdNPWxT87OH7kFT8UvPO1D6BTC3/WkDZfA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
LYhdzKTvo93uJrAaiP5OfCDuOnu2BSvPnxlv6I7h2n1+xHtj34LNNKzWEgOg9dUV9cYDaHYUjjEt
DKdWcz6mZ61d5qyxAhpv67fc90v7JVgtOAcT94/Yb+AuLxXFcGA6Gic7uoJtUgz6JmTnb22Dxdjc
KuIewDj4IOTfP8XGXKTaF+cNp0CFrQgTAcVSQFyLFxr0I/9h3S+GZLecA7ntEeHEOfCJzPvy0ddi
7MCdQWECLb+fXC0IAn8V95TumcpINiRAX1BHi9IGJ4QoMrb3jOCrPkFhDMTJj2aiImUWdi/l/0QE
d7wcXlgIEYVeoKYUOJ4mqy+zZPUbLNeOPADUDQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 22656)
`pragma protect data_block
jin3pP+UWeXPUv7Xw3gDMklaweMGNqKZYSE1RDykV66w6SRsVSQZKZu2J9JW8pFru0jxOCWCmyp/
GewWrGfsJnqvcEegQllqxi2Ti5WOFwJkSi1Nls8ijZ/NM8AZSdEsDgxNkJ4ssCWrRPt3obydb+AB
6uD3BFt3iAbugtLP37Te5ngpl1KVxANvVPlqHtyOzbBo2zn3HEZrpulB39TnR0/xDeEfh9FJY2Lp
+RlpiNuqCvjiLm1e9ubCpeHKf1ALPajJWMSIiH+2WKGgyTZWXLPgQXRcJlNDj9mthr6M92vaRzE8
vsgqynlP5sgwBATAVhJI5CNQRJQBd+CheN7DKayonD8mb2rihFZ3xc0L1n8Ymgvr0p+VWiDGxF+k
so3hhI+kKgZccsjYLZdPzvNd3AmXuqrapaCudHnBEy7ovSWwBjLkt+0167JYOIRqhNHWxbMKOqUD
I4S6l/LC1hroa9y1a42bl/iXrNLL3bmVExNJNZNJhbQuRPjNjQ78r4WakROPqDvVfTBoP37X/AAW
anmk+rXr0xq8G7yGEOJlgCZNqiVJ6N6VkZjHALrr+ejCOiAkz+HWqDrZmSJWTn2fawx2vWYW290g
vSUBZ5Wor3StpCeLJ+UlTlGVksRGFRPKiFX+fhAkv9iHUzY1RzzKvadJSgT+E4UFjuczsplhV6/X
0gW59kUwQ+gWWl/i6zihf3nupYS7V3ZYb7+HcTWhaBdSeJSA2D0YD1XRcrzPfsyAVVVXRurbkRk5
ipWV+bMDBqO5pYGdzROva8w9vtUzGiq3dImLXOxNtSpuKRwxMQitJqGbJFbh4cXUnAxr5V7nWLt6
fWSQcLpjMoAugLP0eM+83kwx/i1VksA95g86XqzQ9el8Moqnu8KEeIs1fE1agyRP+HiXYX55ufYf
cfZy8JHyZUN4oDigkvsZKbtcze+Tgc+J2tKXiLvTBRUnarufKbx32+4oU0ZWIh+9fZCIqW96VDZd
wi+7kLiTHgo6w/h0ss4WqRjj9EMn5xCNF/OcsRC9t+2BTBV2MsxqZNhHHsRPK2W1PCnV2XEb0VBP
MPcqZU/13QyFCVOVYb3QFc8UjdVK/V9iu6UbqxDcNArOVmi43RhMX2BxP7wU1xBgwxO7xmUF49hR
uDmbIblYUXVSFcUKnxY+Do5sEYq6DYC2AiO/KDlImOYOXEWoQuhEk4N8mu197EyWR4k7ciUAEUeN
OrY6+x7iAOb98zHOqFeMkcTGGImW1Uw58mFgPBiiMtafgrXlOaEhX7mp1XKzMXddR/RV52iK/PbF
oXG6pI8wEPbOrKOVsnJnEGM0YIN3fTOAhBrip/GBf81IqUjZQJO5FZDWU3mhaH1kzvTv21TjS5Uy
hHDkkRulYEAKTWF0e7vOWGRcO6KeHagxnpGjcuVEbfJD8p5zJg7auovkSey5SbNnUAxoQhwIgIY8
ei27oPx/i8DhLpqPVvdnPP52jxO4ynpsX311rOYkwfpav3MFgCmHuuKmtBpSUpqjcWOc9ZLc0yWx
9fSGGYquB9zoK92j6ZKtcuOsRJlpiQ7yYa6gaktm3CWW4koVLRO2HHcdCXdE03HTiPd5af2w1ViW
8JG2K1deXasxV2tgJKGo/L/wxoCpldgD2b/HTh5XMtZSuZbX9dPsVvm9Oma3IMSpD53KBy5wpDUB
/jVBkDBUhqKnjT+GUEDZ+KmbuGgcdpWzKlSFj7YFhD690ww7iQSeTDGCzep7IBBj603MO4MWd6oM
MT2+VNz+NaKm/ThdfYJk/TjOolbvqvKx5P3aqZjJWAR+wEMWj8+Wmxepv8i/a+sqcAs108xLCc5Z
U7cAJ4/1/F/gc37n3lWLEjqr4YOTMYGbMhmRp5ok6CCPBuBHBB2dX2WEqcFHza4eqORoeaHfNF3y
Co9OITVcBatbqFdvy0NrX/ej4NODJc1VRkvNDFWgosakIOUQcLQiX6hExTAdKL8v64hLCH5XaQbW
UMQOeW6+TJYyDc737VzA5eiJPk3ruW6OW/vvmg9sNy8WjBlkVLCmuQpLVJbp9HLsZWuMchemMm96
OjDpyieh98YvaGM3FuC5m6qJYWlq1MS8f0+QNC+PQQ8o5YkTgUANROuMINERnKi53tsvOTrPDSbB
Bj6+kmzlJ47qFIFPywy7N9Fv5GLOcTxyUjWZcUlHDVBznWlqTgenNX6q/v6PKd8Y0oRR20CueZ6C
gUZ7PKAT+dnmiVjfUbRgJJe6PnvzkMt8fSGaS/02jbEdJPC3nkVC7Coh5dErN86mSqEtUyBa73TW
+HCjE6xXc+yduwgj6OckmUHKPS22bAQDtrHv4pPq7rXVMCgJIDhgTgpY6hvn2X3DeYVa/IynnTjw
sWjX+BPKr2E9Bjk4xjQqcHdhA4AAS/P+/nsFmaUMNT7dHPDRjEn1UDqpN6gvjxfwERUSdg7/ANoB
6IA7pGGa/ZEjbMFRXHO0pm1+OrAQvitJ9jOZl4iuMBsd8sqjkQORbNOnP1VqCQFubl5X10e5mKZn
9QPq2bculjZd8NOM0FCP+doO+okyDa17vxbRoGQtLJHH7JJS4opytg8gBV9Y4fyDv7zRXNSPIIZY
Op/a0/e2H8fKIIHr3n5GMFfxr8f+Wh5f6d0k9faVR6rvqCJlEynaNtqY3hauEoie2oKr4PTvLxgM
jxfhscn+oMXI+eUkbnNl2uPQazxMMERZj04RtSkzuFd4v18cRcaW1reu+hqK8L86gTqYexV7IAPe
gWLkp+JyCml9ROfp8VIFUyOD5miIrgqa4nZe4WwLoCiQa0Nzq1pMc/Ia7CV91FOcAenkmKKXlmSg
rNl8FPSNtYL5IDfM/VgyaVwAui/yxUkwcgH9yx5tAN5ro/+5KVpO/uG+zmb3b9XU36a/4++yCfu8
ZMFFQ3wrAwS4AfxV8Izcpk+PYuVGXK2NnCJlxzC5ru6hjsHUVl5LVxT7NGGxPRdUE0LNiReGVnMJ
gU6F0bfpPaStC17Cv3aDyIDYdqtrjRsgu+clr8P5PGpowxjx3gPt+CREqNkq8q90nMMhbWxy7C7h
x1fEvpYmjSx9AlYavdngj21JUiC6yfzHgBsHD9vSSr/IQU5GWNFJEuLogxSrq38OASi7tzTQg5fQ
v1vvZyVoMJ3qAhHQj+qfUBj52msiiCgWAA1480F3fwDIu4248w7wJg2RkJU8OvOL73TjXMn6XSQ1
Kk2nxVQKJCliiXGMD0pOVvU2noNZ+2LYLc30S/NiJUJTGByeYUWRLOthRwdjUKIGZ52flGwqVP+o
yBrbg3GbPkAZp3CkP625f7GRCn25eDHMINMSpB6l9V4qbTFcbm1sN04XhvnRW2KBbR8/9UyrYDji
Y5bg8gPO1fNkx4XkaS/yf6R5PlGNmdd+aleRX5CaXVEEglad2NMMUAXDyBN1VmSFI1WSIWOFpI86
d2vPTQcZdaVlbFQd20nl6L2ypKWIp38tUM4Tr8Hcaleh+15JaOgD2mPnePfc5SMWltjdQJkbeshr
5tPodUrGu+eOF5mN9+cwqYSbj+SaBtl3sRXKJxZ0+ldQaZQDPrwa79ATmGwrVxoq/gfiHRdyVFLy
GxkvY6L701GY2/N74G8Ci0mlNUlRxoDXPyliLv6jUzB+4CwPSyUlk8hjJPqXF9TP84mV1hIKplED
bZJy8pUpZbFcHwLYR6hufrQX6XO201qtczP9k04+9YDkO8nVECPgqZkduthvL9i3LUm5JiOZdxU5
EnWl/V9Dftt5An5OIIZgiekJUc/DaOZ3CXw1U3C8ucpF2qt8lIenaok144Ql4KhRgByX2KC+A2/M
VhYB+5N44mLr5/MDSQYSPGypf7bWXrTcLlxOYa6DyVE986bBTHgXa2AzZrIpdnpYRvu4tmhrZugf
usQILmLgRBT6tL8LiccrtkUhpqRC0bTXU1XIqG/+cE2VoUKQ0QrkcLiMZwnWOCGTRzIQNijgLsGo
d9mdnyMUss3x+JUGGMfw0peB5UjoVQWrEfYsLsOO44MSbsbxacOfKSYjYr2NmssqTPbSode31w7+
OFMHMMW9NJ0NPCLFprfKkSP8bPiKGgQrUTLnVZIFDKdhid+dEsKTIrxMJQB8dk9lv3FObYMj2UlT
ZvhqnlC15cYv1u+5zqm1AnEeZrX7O9v1xB4ebVpa8XkvjTjPEvYX9kOsATVAH23U2YNF+47n/vP0
U3pPjKxBA83/cUhzuHNvL5gjBfnOtssV729lA9otc5XWzTDc8Mlu5NruSwJRlooeCUB/QtZSVzKc
0gbgfXDyrwlN7WfINqFz2eaxQZCy/laXX5VwHNazlWpJIk4RzX1FUwTJDG5IAXXNLCvHxHRbu3Nf
HbSTUXUXvWhLCNJqMPkQC8cp5jbz8rjQE/ph/YEQ2FdXKCcBX8uzivVHmHX70CVGV61wzdMNX93K
AelrOLvcwUJ0RiZHZSlwwpgG5N79GPckphNcXVzVCAbdP5cfnTtYCPHs9wmXXCspMmN8M9+oXK4I
C1y1PF3dV4tsCiWDziOOZvUIgNaZXUah0lqb+ndwrZU7jE5ywHs8bj8G752KqZy76f0R9V4fCeLe
x/HwNKSXAw9iCKCG8wmHYs2AC4BY3dSOsvCuD0/Neyo98Rzu47t+EE3OLMdwUChm5MyhcMc6HwTx
r43mA2OmoVSB97NKmnns3le0i+NmYiDeH8aGNuwu/UVBOwYGTs+1fMTO5haDjvlfAT98UekhdAGt
r/NSyc6FfZ0oU5+BKDE4VvvbqV9L9/q5rpqYIynBlvYX0eoZ7m5ckZSulcPkAc/j+hwEqlcCXud/
l+hvvw7Z+lpncuiIT+ehcUncKxs9aHCa0Q9j+nKyVVbC73ahVLIwY1ycuObLbiqQlZGDU1cFL6hm
OAbf4BL50YGatXSwVVBMkb7R76qswZTOAG2HR6X1snURIc3v20RyA3Yolb1frHBXXY3vQ7ZeF92M
jMAEEh9MvX2SIQMnT7jdtJjJRBlW6TkMkQhP4L0j6903cijp7bc3WHLcQTrjCYerUnrMTFHm64pJ
D9wKJH9P5a/PlzHv3VWyU9WJ0zJc1HC7fM5aukyPdsy29ILqGMpearAPZ0m1cxJ1tGFgv9XiAfwv
o5wTCiyBdN+wtvOL8DBJXmtuv2n6FVfoE2I3ajxZ4i2o2SAdh2igNWDBjpI9wtvYIPfSYu9PJBP0
bmhIUJyiSOld9ceQWXVwr7+sGi51Aday9AJD/qlWIcf/7n+j3be+0MqXuQ+fCF0SK2tUn37bT+Cn
JjbAzcOUUAm9jCOxHzyn92zdgPZuqt8dP+zBlMs4KMaMlIgDDdIdt0Mf5os8opBgjtK+Oo4fvYH1
LhsKlGzCfB/PtvbxTYhURDTBaO4Gg2Vou32RMA05zinwMB3J5YKQ76TYFir1I89HEzjDu4R4uNc2
wQc/RwE6QQujygPO10NJPJcjdcSRW5WWajdAVtWNKrYCINvE8wWcGC6iKsyvfZYAJnJI81XzWxq/
ngo4bPpGMYoptJxSC1bA5RfOSWgSBVn7tGYKXwWEGOKSMd5ho1Xh8xHnl9VX3yOY04nxfhgfuDPt
7lyk2OXNyv8RqWWFaDCQQkDLWEuXzJ2IcRyTeIn4JnQ+Kn7Dt5ESK00IgNZcv7n7LAoiybBQmDAV
B5iw3hT8ddA47d+iGW3L1tk1IeXikVsNzlqvMOyVaKDAlwFjlg/epBYqdPz3F2KEIleOSnA8D5Uu
vvN4Q0HbyT2IZ6zi+JDg1O6zvUBH/p41m3NNZ1pkKGz+OusGjSTQ2yUo3SK0L1bSrlHpR6vkO2nQ
APCVjcIQZSQpndYb09rKMBcbLHURG0Sl0V+T8Yp1W+PvbfSH4rpLgzy237OO6+piLumRsySkcMX6
UbPC4jMoaBR2xQDDe+wiUDDLTJdJ3eMcuJdrFMCKd354B5rMDHtK8/gJo+0SDTcYB0NSsa3g6W4I
iJ8Xo31wCsmckydquVUOo37ECMwXyc42qI8DY5pB4x8dVNIs0sp5EQypt55L41uaRUx4eb5xjsPw
ZwkmAS70kHSPHcMbTQ549BO8Sp/WHPSj96PKHZDpCrqnpGCVgsHPn+o3JusSvWyfkkg0tkqX+Qci
XbFHIfyWT62RdPWr7+apg7JoXIMN9KW2fQTS2Sa+QqIgGJklO6KUXp7GY8I/UAVOmvN755424LLQ
dQynQ29ZGImX147rrlBBugnfuYOgKCirPvlWYS5m1qKUwgilXB7ECMaqSbU9JKL4i/Lh5TIeHJE6
UwtbwBPzNCgzrfhv90hPi/XLUyKeirSriUP+wyr7Eej0as31tp0LmsoujKZCdNQhjZZQGyzPwvYs
fkjMhh9uUgEjvL2kfitAGTKbf61l93nj9aH1rx/ym6wsTAR7ExTyaaFHl2ePoOcgbc1eQRxPK92+
sC/QQ6xRZdDwxbvysupr1gG8+VpoxeG1a/mX9A5wxsmf9Tro4P3u0gWHTx0CHEFSNIc1KDZSI+iL
CIRmHgABRHu+1eaOXRgEqZuEplN00ZtsuY/r624Dq8dAkjOm0Uh8b2eXkJOAFxD4ylXsWM62Gi/z
W7dIXyrKi6b0UNxBc4zvkNXsKZg6lgyIY549I6j0nYD68UoG3ROqp9qFoZcWf+r55s06n0j69dhP
cNfI9dBtn1X7UtdVlKGLSHYuCf8hCcVnl5qUGfr61WB1ldrRlcDAfxbpcs4s3gvVo7PpuCQa7Kot
iWwuvkmQKInMejbCyqFBDqHW9xIyU796mySbuWT3IiBgdwPE9vEPVt+sv2MkSfzeuVjz5P41epPe
4AvsyVI4KQgISoVMuSvwLxn38Ggw5guDh/5kNtrIKEbjrC1dSt/B+BhIQWYD1NCTlZeYK17nc3bc
jUFeY5fsmJxwgDEK/8Vy+jVeUh7LTPEpgjNcxC43L0StnhJfMrQnLHsqa0ds9pyi/V7zMjbX19g/
BL5hgbvLtJsEsSPI46yXEKsqD+qjmUzoJ7PGFj4v8UBqS6tCgRFpL/qBuVKRuTtmu0jV40dl+Yc6
2j+ye84DihTxOKA++eFFcNtFehxqBUs/RYxGnv1+0Ysl9zIvjDxy1R4xFx3F2PrecZt0UOe1QKiH
z8Kh35ToU2A1lqYUZophHPNjSw/P6RSWGD1pFuHBMnvq8BommWR8WXyHzwCLsJOBvJmZVl0yyuiu
COo7GoTcRx5KGjWnA8d59xD+bNtzNjgs8prPv9ry7nWfOYyIIluJRf2bBHc/qZWldpPTsHrdZs5E
tgbMi8BEpqlGZTGTLLo6znBmgEcTEp/XAsN4sNTjgLNr0cQ54nZZuYrQBYAudfCuf06+0slx68pK
JCSM5rgje+MiDaTK4AKTtF24dR32QWattYs13KJcExwtMc2Ko78f/Cmfx/HIHsEDGwxvmo1kPcSY
QkNHavqV33T7OInAQsBa5CDIZnr7KCMWUwQFh9hc3CEksujjEClcW0iLHyLK3rupAPUVVNRxOdvo
wsAKTqsTbjmhD0rD2rdahHrtidsDAgUTU4NCwsuWTDeKeB/mL2ytKNgs8nLFlJ5BHRssLueRX5qi
fmpRiyUnR3mp08zk7yAraaZNUdDFoxJWxB1FZ01Tw4RU011ZEUKA5QV7KUuh/kMHhasEuOdF8PZX
R5J8fFMEchzYqKCYrb6DKfjqiraH14YvAEB7TW80qL9QrqUodRL1mS/pGqhoGhcoxooVh6MQn6hm
rvQJmXHtfpKqR13qiFgz8UQJnVS87f363PKTsJCm8XFZ8ufEoii9WAQ2CmGqM2hxZKOCmTKh15oY
ps5WqdCcyf3qY6UFQXvMdRKFhN//M6XeBP2IyqFc3k2lxXnM+NbMKEhKY/c4JXIBx2Vl4Dc/6NRS
sFqJvQOJaNoiAdW6XdXThrDm0QTSeqhipmBbeY1bwZE0SjSERP1do0NQHs+aUUWcj6oc/5BQCOeF
Zqii16lsnSwY4jy5Pp91dnFbhkzWmCosizz8AwfrtgX5MzcoWCzOiLkop+cHcRvsi6hYEPUCACaV
DmszBJw/grod6DUg4ufz0nfV1MkzUiaBcfek6FJL+V3ZDz8JWJqjfDXg3UkR6w6abzR1cA4R9rlr
A/tgs4fTFCuz6t4FB9waEfseqRY2lETHSKBG+Ja+yRhiAKtzXXFihliMZIuqgZMzCuKM5tg1vqfA
li+3MizgZmCxDUfsjZIzZR75HsxA0WbPe88fhfyRvEwUiAbxdFDyK5Rd/hkP2kOdxceqf2kAFjB0
HgHPQm0jq7SFYKUGXIwVjO3aQBCt36mw4E4Awcx/ZkHFXCmvNXsHHv6YhPYmkZop3SsukcFYWoMJ
WAfgYOVSg1TXPWKUmTTe1bBAp/3cEvkU3aWBXR6DswAkGvEOSNlHlJv/4GzQJFQnhZ9QwNBdaiYp
68f5AnsDDNMBVVONiNrKl8Bpsa8RZR45r2Zsvr7h+TP7qSmS3sf5Qxn4nqp31oCOEs7DOWedKbP/
w0vj6yY8FfzmZ6nofHz0+7SofOjq9Jq3huzUXhBI6JBnWLFZDA3gIflIYfp2sJJt7I744MQxmvPc
CX3E1Uf6BQoP5JF6ztCOwwUQzYHKuM8E4HKfE0beVGsoWQIhcny2AqFHapiH04ix5l/e9vovJrV3
IitLX6034CyPC+OaELjnq8xWrpqIC2aUDOMGbCG8RCarn7A2Rq+8XuajVTHcL3cepY4Yn3l2qgwB
qvZFmW/30LBUhevedpbvDZqDfV9H7IUjZIoZTIbUHnQ5ttn6omCH9PCjjM25DznIoSepwE7eeOHw
xxvjpsUx6Gf+NkgFwJB79DQfh15732hct3SQMc6UDgV0ICEi3Yub1z4L9KUBj9Rmmx4mpz+iennU
9RX0lMEv6C7eELSndkfTERkjZIVK9X4vZbBfGdA4nEyi4isa16vNgwH991QZglneRpE8O0OlOInn
wuW2VnJtL2oIS0aqaJqcn2FdNOfvDtCwzPC08oDTuAxPyY1Hr2PgVsUJvqTJUKXOTrLpGO8U6o+O
Q98JIaQ5QJ5ueZ134OasxZxLAieX3fGeQ0yDivPdvtERNzjhPyu/2rPfMGBA8x5kswLqtdTmb+w9
J1mUgQYobtHghDIl3chjvcCSWwvkmpzOX03ygly556MbpN5HPA2p4gnBS+446fBSwK/d27CuCyn/
nFjF+CiyOPFnxnaQ5HQqC/m+fqDVtRtPCfitRUjKpeeJrci3Z0gBeXMjJZpOTmOUKCMXxKbupmaJ
M3x0TY0Hk/KPQdVS2pk4w99XNSlhI8h66LiUPjd9b8TJL0Sged+KSG6zBmIBS2n57uIsA6/OMqNu
qhOYOBb1WeK72NIak+qTGRyjmgsw5drZbaLUf+GfDj97t6e2cE5QuzLTwd4Kl9EUkFLFQPStVoPV
mWH28NZyknhLKPSHCj+T1Tl+bqkmVwGmkfiwmEk2+McWqjQ+qgAWpMpbseSVVr55ecSg23koN+cL
i0kwPF/rKxTgNRi+u5sjjSBvlISf++aMYfjFn7vtUR7V2JsyyquF/jkq9ByEYGIoua2QCm5N8OKj
9LJcjPKXgNLovyw/G+poMPdrp7uWV16AyYxFN6+5XtLhvpTx8To1IOeb9/HQhd35HqBgbUkUw8aL
YU6b0aB5CzRqR9RYfi0JvkrFnkZPlzvRzGDdfSmVv2+zbBhI5kKMcF99ygpnjTa6VJu8ei0AybEZ
Zm+9ozeS+JAOwRdwynsVbftYJMGgabgvr5AxQxe0GZINyICsEPdZ+BEcsHtNeiMR/Zh3HXDm1gZw
qoxgg7Udi8MfezbCKj4zIyqO5hTvlKWAFsYKJVFY8XuV+L3U3VhP+6LlQmTYKSM2IlBP9X5UefyP
1JlEiFCGrfIaAl1z7mh+GjpSjlV6SOu2jakfMBMnYVo5Z073jIr0BNx1i6u+kD/gBtuoONSJoPLP
nwrn/yYAiBR5wvR3JpCD70h1/uMmmGjUVBn+n+BrMaNkZGRPLF+MG25O52+lb9vDu0EFJiRbOvwB
CnFkcUH9AwsOcSOZfyRTOi1JpOtWtyRTzDuizixIZWa+iA0rWY/cmGEYbk21Vxva7yZcKd1bxIoe
hFNPOcju3YwFBElRAjLMypDZg18VJuRq04XbomFDgFk1ajpRxgV1AB327tk2HOoJCdVwn1vjTmyM
wR4agCJDMr5vRkOUsNgyzbmFz9ITkiYJ1nkCrZ85WPVTZDa8ZdgWE+u48gGYTEMm3AkToPDiOyQt
LTwmwWCQ2kM3fqpTUz3ARtLmIQ1RbgbuyDMb8jkZZh6i1kK64/r58F0M3P8DXOVsmN6uaOD8tQ/+
ZyVDAS3W+M/Xn3RzM892IexgMSdg4/pqmYAm21YVyXDwCKHjImRA5U5qNCY4BZgqzwKGnwrQPzyA
O5W3sdk9OvRYQjmSsYTOmL0T49hJ5geH6CkVQGAF1IkBM8cLcXlLV0dQAZX5PEf1NmY10DN30YQv
RU8ksK7XGt0tid7OGMZnqr00T4GHr+3ak3fwtjxi7CVYjhtGnvwNWTxCA0g5Er25tKVVlsjiaKzV
GTiDTQnLyKgWlZklL1XpZl4fF2KxktMK9car0HCedEL/jaSZq8vEUaGy3/MOopK4pIt1dmdUw8uR
fyBItUfOqKs5v+717NeGVe5CsBjI0omfxCxR8MC+gfPV+08KRb+aIWdPRH1pKMwxZGe+uyjBj7eY
+6J9Z0o+sIiCME9i5UKAWxwWZfAW2Jq0iFEIw7cIJ6QDs196HkDUvZ7zBaATKL9U3KekKsddcziB
3XHaqFn6dCMC65LeHwv4dNpZbvAFzWdv4N0YZzaxiwSZNSRrimsl3fbYFBo44UggAbR+XRxPaHZO
smUN0THLvqbetRoreouk9XXyWmT9i5gAFQpr0o9Kl4dEhjs/gChw0s7tmGLnYpLQwFKeu6tji3R/
t02jE802jY7ntw1kuwOWftuJr8lOAQ6gNt43d/ZYCPCCWtOe7km/oSmf4D6A/rAilBbW5A0wBCH3
AA9HC9Utsc03MFCdXhjYLGxFyKLD+98ntx6GpG6k+EKbiPuqKTQDCDjDeQ7kB/NOlRoDMVY6Ph6J
/03G7Er/px3qWQt8XLcUK1vD6tK6duMEysEHpaMM66mSrs0hkF87TBiax8j+nwgn+VWeqp76+Ocp
6awS9JccCYCqBzobCa/8vzIu/1IeSrncFWPNpZBZpH2c6XCnYyJa8pEGB3yJouseCUCRTIDZVkpV
T+ZFzlljerk50WkPK3iBQCQmjC1xaZKBkhMu360nmKjPnLkI4otZ1yiWW81RYOzAbNF/+Te2vxIB
D/rZZDLdwIrU7pkaZdWVjONVGScmfKsaTRzIExwQKhMo1HJRfn8WaX3vjUvD0OYseBzr8JskhyXa
ODM5XSOZ1Y4WOaXHttovQs2QVpX1hjaOJhDzLA7c6zwTOar+ZG0jqkNag7CqOOQHol/9YJmOGDyr
N1gCqOMSsbpREM6dmo24oRlKq2CPtZ9HtWuBvMTYN601CXqgdqI/ulD6ncQLyLEoImdqZrqeyyhv
NzeRya3E2Ae3ow6fgggHtIaQOj1g25CLvbHHZMUqKhFpx+TU9uW26Yiu6jBd/7leKZPyML5xXO1K
x2YyrNfbRMkIpEr66RTmn5cy6nbO86v7ShxLepED7T1da1SoLvn6C7w2Z8bWx0KTEsVrZgDeuJVx
P5ABpIogVrA7Kg2v8WrjBZ+4p8+kXuxq7JUV3rtkSfZvsaVqPljH04Xk9h9yTqJmYNKdgi3LUfoz
/TdgSLvx4mTRimvBiua+6q9KrYXBNl1VGuW+HkY19tagpIMlbRlp0NK4h72lfZlbgMy7mJqncNT9
y9Lulh68yF3JKkOiSSaiz3U31roQdFaKzmHtwoGyDbk0Gu5FP0NgD4NbiXiLcAGyrY10ZLIYfFcs
RCgV4czaoddjIPzyV3g6uLClrwm2zltkZTQePLiqAbedQDqNmAar7881hFgPuFLmGn9wxL9wJ3J4
RVFWW/BYBTPvBnuRiSmvaOyQ9/gaS02S9zBRAgJbFf1c4TySRe59HM8gMdLvfS173JD7yNW9AAg5
68sqrfsQywCNVlVxaC5oKTD2UTYuYuGLdXn9wO6xoDB6KG70aywevOJkuxPGMuolQX+U7E+/ssok
siO7FQSKlFzPTtPd5c4zzOn14zQ+sUhVPUibgojKVkX4KN0yBoqwvPYYmYxWDif+oiL79veVQCI9
M/JNRkXafzmUEkXR6vN/DNr0SpxbRqG9NzROsAps7lyxXqD7TQG3Wo6YYt+GLVRlJKPji2cd7TPx
Pc8O/Fs/MYbH6BMhKtZUEkZK0xZTOdYsf42qJo3oN2azxZafY/c0Mhp6FiHkMZ4Ynw3y6KiwQh8D
tVpDulPrt3nUCCU78HHg156P4PHIHuqZG67XmK4hKL+vVKeUz2BNAC5qGURKcwz2ac1gdoetK48C
t9XSOQsKNeXfWiZYsIhOxsgLv1NvQA75w7BNdB7JDYM1deOd2tGmp1aBq8L8fCDZWt5kF9MQO+m/
oSqLBDeSgnFYR/BYXEEsAKEGf5O2SUa6Ljl+U5vv6ikpMgTvBAL/6WLZYuEABvW48INWfhbx+5d0
+6gpzA7nbXIqzCgjqC7rSS3nTqdjmCUvv7/bkEIGEeWD0VYd0rqFp8HekkdMjUpxVdJI3wfhzjGG
xiFSioAVwkEVFdC/MmqvhLgvmxh8fDJd9yWCWhUEcDsLqqq7iihHXUk0iIBYC5q8Oz8fK1B5XWpL
Lgx5uqiOTKLHX+WQpfaUDsoqccmxEE66Y9mDU3PoiRsVToecmatz5PghU3QMxx8/w4LiRT8wMWNb
cS9yJzXsyeSDzfm6dBLQ9OuAG6dV6SGQisFRM5xr/ql6odbvbH4ArDnTppIjsEJ+S1mDdjfdBYMu
A6GtmZ2xcYo/Iri2U4jabt67swVC4yflD4GJHCm3PMkhkkxMz2U5pb3mekrdIZqDQ4izQX/VaHKV
ZLG8o5vEOsUi87c/GlXK9xgJaWUrIaAD7WIQSSIiLDQQMWVylWkPVvHy10dJmg17juJ4MULezaMK
dVagaa96Fh68k0x/c34V/gPntEWdS17b8iqiOXq8fITxCKQK4VpJsbToUYjSEHcjvbHZ4+gBo8Zw
Q8NBT/RGcR0r36LSGtBr3z+UcV1Onpsdk0qCtrFsGbRXBRKHTQwb5t0uiFwKGYzQQL91AfV9s/DO
Uas704pB+2joFE9UZ3lEGA56UTTMAFNBv1koCZvG7rcGBdPQandVOCn7XEBeMjoRylcqLziMxyq5
cruanUZ+4L2Ibnd9cpXtjk0YpczmtOqk4oqzKsYFFhiNTrFXgowChNbN2il49QGnfmXGqlU/Crtq
Bz/IVIvaa6B3rRjGedRgdBv7pgzcIDplSoPPxjIrfk4iGyss9fXbbdePJ9eBg78PErx6iosSQWPo
J5WH2OJLcGR5BzgiXqOAKbLIhtKm++ERY1Hjlf2/Xb58GLtVe3SeK6WvUP0uqUwWO01Dp5YH0iH6
hJqBPkZNcxJKZ/lJhN/MoS80cYLZEiDrd+w0PyErfG6tNzS6/E31lx5b2Lrnq1fhHvc8XERA+UWR
/ZRcD4Y8NV9uNLPrhTGfBAaAsWsR436GlYdTDb2bEpQUzjv8z8eqQcsp3hzt4nWe3pQK1wcTZBk0
PT0CbClKsGvtG0fBKjCPDW19E5fM8JE946cb+JxSSmhLylgS8t5Al41IHFr0Q0LsQ/Rvs/QEl76W
qQfTbuD5kNsG5CpdRoQcLT2xufGZ24KdrachwtHBzHIsPLaCHKFX+I/68FO5CuyFeEC5dcHBvXTT
3TUZsH8WuRypKT8/XKUsyRogMsD63o5DM8UIagHcErjIw/6PtSFhc+O3oSvua9hHTON6pb4qrmKU
EpSjBhyQaAQawd8MZ2gxMks2WgCqfv9LtaBhX4v5VOKGhjdie7h8C7q9O0ftmf3fMaiNnX/iPhVY
mroDXo1PGDaBG1hDIXPPsD4adB7cQyHWILme2Hh8Mjj59LUmbtizQd7Jr8K8vJCkhAWhJcqbkPk4
uyGzw+jMv6NywIQjcK2S7xAOMu/brW3rEvw9J7KdfS4a9nisN26u2UFMFkUagDYym2m4qkE4PihY
/FGceQKeFVzxgmL8NQ+I6y208JJALFKnBRQLc8Z6Y5MhCKpAmMotN2JcKrUZSNdFTF0CXCLduO7p
E4A3XKniUK71VCe85+oPCEtbFWOvAJ1vTqy8VGvu4SxSQ7bF4stVpcOEG6pS5UcTuQfNQ1sgHrfa
s47wAvyRGxNBqILK3796ToTNvMarCSx1oBxBczy8hIrFeMDPWBb5L61pjMmiK6db9We9U2mxb0SA
NR7CZAbWGmyUMVJi3cjzszjovZ1CjrHSs/3R0QnCnc0QniTeEH9d1HDRlDCL6HbcstXTkRP+USjd
i+1pxt/WiViAHVK+lsKslOQC8AElspQLxYke+OWXNQATuHtjxZYa/FybFGgzYZBKmAGuhaJc+iiu
XqdwNJ+uCxni3VYPMMIg73/aIirzVwKHt5RrGf1DAVOCN7t7PVJ36DEotuhLLrFYnyL9u7Yq2QbP
KUEB8s+mkRHvweZuSct5GmUE/aWK2VA4b7L+RZdttsEm2NQlNrc0SOqm/torxPJHih0N5x4Ni5fY
0u6cV1ATx7FqS0YbM9gExQ8bemSUcEGmC6CyJ75ru5ssm41R3MEWbsFrSFQ6VZo4RJsyVwcp1+tO
Z/52L0xaSpT9RsVFZMTpzsi0pZPqiEPhDw/iLhPyWkz/gjDVgecI3uLJ7ymYQxtVIVV/Hk2ZjD9E
D/+XhzSW0a9U7jeLYkTshvulM95A465r9AZ7PHGaqn0FzWRVFhj6la5K13OcOwx4gzST81QA2THg
vSYJDJ9Mv21xkM9qqwqff2/3ue4GSWcKtsnHoFfjkLuGT1WhE3djadGvEwfHpTr45dMe00d/lGVq
F/GAjbmXt+8WJ/tRPBdqC+5uLrz0kmN5JJEc4q/mpE1w47coUhIBLvlbQgToexfWum1V50VM3RYa
+2oJ8ZHn5Fgiy5I41zSQ9iNnhP/4DmCYgsw6DKXTdM0MIimL6pmuvEuhP1v4rvg+EmmA5s7OSIoS
oywYWb8lqzVbtuzMNKXHFtQbFXbKmTlvgFgJ0FqmffRKSc4GRVU9lW2jbOtcYvaZFZtwTxPdlpOY
kGWRAXcn+jYTKB1zv63nvleR6vJztOfsMDgpza18Q+bZrK+Okm+Wp9wgWTn/ASnahJGRwlxF/bR/
RPGXhpJ3s7NTg7rMAiPL4OZHE02wZgY3gEenM7ijzUec/tsOfUq49NVjjSFiK8S4GwYZUFAOnmrD
LLnQaeJEhtzq4OvJRYt4SA/SnLLhXX1DGMVPrjpzgNoT1VZMxwmxU0xEfX3qEFKnHDjtMseqKGIi
lQoB6JLKjMr9IA2n+4SW/CyzwedwJMtAmIDPhA7NOinbKlTEiIKzlBmSfF5r1Fp2KJGArnqGUMEr
xI4IUmzZl61JK8QRZKr5ftx2lGm+8/IziIytCk3qIu9RCIZxQP1YA1KS8iy/REfInHAQddF6bNdz
Wn+sl+bvbZx3fusSwrORpg3LDDdTF7ojWZF/Afttumrp0EwTUKN/VedLo7lcVV+lKIN+JxlIb8Q6
lb3KPgoZon7gpJWSHaStxdlgEySxYIHt1ci3rzx7ZhcKhwUJ4Q8RZYCIH9XQ5FksDVADLavgnis2
Y7NuGXX2e3zKxWS7p0IKuYlRKnTrKy5EQ/LJ+yRE30RA5lGhwq3X/nYje4AhF2l/FpugH/kGOHsq
2yWrjW0YazFGQefU21yWMJPHB9IiTZ+dD7X+GPoaGIPTRGjHZp+0fi5UeOZ75oUX8wl/2fPWSTrZ
R0+76PX+1zmk1HQHiMS8aU3XjjFpgrs+QwKiv5GdnrLWH6FIBHjfLD5NVqI5xtEuvWxJtLCpVGLL
M63//fQB2tBPx3j3hXQSfvvS4vZJiaDy+8JWU5KPPHV0GnyG9uDMHyph7P/xBa7skaBz90AKE38j
yb8xnqdbuzy/xyPvuI3uwT21pkvTrN3cNUpJE6vKU7u/hZj6jJEUVVsBylDp4zCyvY5rPBFHisaj
3zWiMGw2XY61vxzC99Eig/SrBfAJyubBTsEvFiuRxwQwwpAdhG6kVDbqXDMzvmQ+eVP5KNj5WhZL
JnONH8/v5SZdMUYJSO7NLnZz5j9UgHGb+mnFUQ76neFgKoMKsU084rQjzFnC42Z8uJyBi5L6Lum7
Jjmv0Vg8sEcW6/JQkotj11mtQdG8k0VJ+skx7CNSHa6Do3VG0PZc53D2GBdt9JaMwj3ORRGORSFw
cXdgecNQAY2piavHqBV0UYDqINcMLi6GWuDEEaKh2LekM8dXstKD0DS8mGdhWnUSSgp88ET06VB6
iGkm9xOUXb3oGwuuwVPgpXVKnsfUE91B32E3Tcxthz5nXMWaAL7PEyDISdnDRdLsJxvIfv4xsm/U
wDf/7VkKcVx2mOgzFHl1FFBccYDz2SORlPeDrukFea2tSEpzTUNgk0tlm56zNoz/+fUUcVn49ykK
Agl2E1JEfL2TSQX1O0icSbToYQiIAHxwzhMwxN3ab5+tpMSctBv3mfSkzhLMiG94Hcbxu6kyMPlq
SiGNDL70rZdPnoGIoIS058xAFbWUzKI5PDArcjfh6w0L9+QCHQzfjByYnbZVMLLZCJyfvRA8tlKV
4ChOHxtGQtVDRSFZiJEzSvrQNAZUgjqqMXASxx5W429QYiszmMv5JfvD2pSqisvw/0pJIIy/TTEP
jZCDBbGNaPVxbd0y5ONcjARE1fOEMcZbukdqUk1FLOwEaYmERJcla/+U5azBoFO0eX8xJIvH7HT7
Y/1USFwKYoqbMbzWaj/YPrLHskaQdksi57hES7duLkcxOhGJKzNRPzJK0S9CBrioiVDWnbG0kCgl
VzUlK6SfekAkhHhPl/ayUpRHYtiQQjUZ+bx6cKHOPTCxKVjpNyhshkGifpRxjZ9/EIX1tEwUh1XV
d7zJGlBXg3eTzaV+aO9H5CQuFYzUXLiaWlnnUHr+qUiJbbUnlJ5bwkADmB97IR8YUElz5hU+CK6y
IWEx8yB3PnMgwEH/4l1PsVwRTsUi6TukD/D64iYbMJQIOExiaaMOQL8KEGraqFwGdjh8Gy66V+x0
5wuWc4qZvAMo+gJ1Dtl54CGNfS4sEfG1y4/nf3rkZa/8QyIfv19WMzAFL+Ix5/N7qd9zOzoYI4fN
C6sjY4QKs2tcWLb+w3PvPXxE/SnGNISKPPiXHAw82v2+cGZyeBKdSYLbLA82ZuuNWb/YckdQHIeF
vIrqYxo80IA0lX5GlC5MVMC6Zu+RDi6If6gUmNVAhFSVHrVymnZC+tOB7w5wYmfl9lmuOmP0AVoa
DXjhG8kepuZWcZU+RY/VAXu3dfOtA8zNDDLGAelfK3Mr6vr+VFINY4vdlevgQ2hCq0G2I2boEcye
DixBIFC+8E4mPYGzE8ghYW2cqV4wtMV3YXkujEpU9wdZ0xx465lV55o7RGgR2nqEhcLv6G0aoMXU
bIBpS5dfDP7sZY4fG48jsXQj4qSK8m+FilTucg9qmDIcSRXpygH0iPWyc4RPgSPM0V916GeIEsts
qhiu7LADJ39mY9FN76aJNKsCnr/DvU32IKfIKwoMZbaSnIF02MuSuA0uEvgXq8r/F1VH60CkTOEV
FIcR3YiruBpwYBGMvv18br85jCpxIu2N7HBpr/YUTbQPKmgqYWv1zXFTkIOiQ3k2KvjCBHlhFBR7
z5KoljgEZRD9q4ROlVzfbmd0bQ1w1vLoML42X+G+QYTFB51pUjlVa6J1EiQwnxY0RsveObNCvafD
ZqqjjMD9Iv7/Td1gMQYodtPancF5HoHAbWaNNb7CEn3f0+EZKgjWOA2OdPGw6ChvdwYwlUAL5lRG
LW7JE25dkiPnkBS2fGou+7Y762yoSAuYwkZ2Wl9pJNcV5sRL9Ng3WczchkOGAdeJRm/W99nh/s6O
mB/oo5oH+IyXhkhCNeJaD6dA25ijPS4lXUqJ6eBR1FQPxHyDKRTXFkMw7LdAFp4eP0F7MNLWVB+h
RA0q+rmlvjt0OYyurF577dTXFfuk8bY+vjgL26TRTeLsR96RZdxbJmUskzw0JXsIyXw6DG9cC91h
sX0iVsxLaGqaaS3oDTOzVTXFqWrxGWAbTNTS4lYVSISw82oaH5AR4J3w83bjLJCDGnOYb7UYQkts
g8YCxxdNgu9Z2Yxd5NLJmsa5V4AZ2AxsZapJCk371HYTYmaqTw7nyY4wLAxSjWPvPds0HcIUm9dR
VqKdbr5Bvqc+i6HpQ7ZVl3nP4R1i7v3FT6k+Yy54ooc6zGkb02+11IsPxoptUJFQciN/H7PX4vOg
AkPX/rfCDC11GFNaFudUHABpl6zwCUnCaH1vVeSTPVOJLtP/o8JNs20g/5ZiUE50ob099MEq1Z8w
ZqUmp0CJYzlGhYgcpv5YgKMML6smy/n2FehN3gsQD3ya3sl1f6rB2d796uGXjgZTAvffedi+sgCz
tKp2i3Q8c22Pc2boUSkSDSrcYP8exhhtlbOFxWZmJtbiyGyADivAs38qCmh0auHSJtJ7AtWTr6k8
qMpy9/FXrdrkq3soqcZcKNubdLIxtQ+j2zg7Gl7y1SjUliTYasPg4Njm6/W9qo1Y/bx4t5IZag7K
BAG4hXZfPtcLJJeiKc+I2cKx6SFY4WfLU8r3Bw/VndVfVJiot6cL6DHmE3qAAdGT1vUo1cK5q4KT
/MxVpcHkwl/VcO7AupZkTqPv/sjox60sw9CGiZSpG6Tzms4jIg6et0H7SRFlczMEgxUnajSJFPXn
vZOof3pfTM6Hnl2y89warLKeG5lgQH73NrHPJRWPDMCgnBdKvpY+P/ZnhO4lkDiLS00JJfmGpm5m
+7KTEJP9dtpEWmtGBYqsBJF7smgIdTzhJLIF+ZxQGYNxGuTWlHGQJFBb3ReGjC9MR5aZ78juaGf9
J/CL55DE+8vT/Ar6prAwEOBCqnh0a/X+WQ9AMySFX+MgPcBzfJlw999TXz8hr8NDYEMhK9KsUX5j
ya6EA6fMETNUvT8Ehg5RUTLAKQ9oe2dlfXMdnBHepzM0TROEGURgHLUbRLZbZiwTshozsr6qbntA
CuDt5C1iPx62eRBcr8/pN3fBFSO0C73QQhcDkb/DaMcQXca993UPYGb/Nu9k9xGxjUjn6Oo7m/U+
0Yv5zsIR6Z12Vhta9H7I5cqYOipMLc4tlN6CSw1tMQ+0vEkTgNa+dy3QAlX9z9G1TCUZA71yn/Ja
CF5Q8m6k07q7bJgRf2NYU4f8SmtyDBuWhZtdCGlL5cHMs4VB1iOC/XaQ5B8lkB3+McJTNXKHE6ZQ
1Jwm+1vHto/7tu6GAcrR4sR9VUqxMB2sI1c06Zp3tNITpFveZWNUvvmfzcJ4UP2HYVT0a2//NGXF
lXcsbByG/IhqiCCHz8PNgB5PV9g9elZKW9SEvqcNFYGRwjXN6SwxifEiWvzTznRLEGzdxa1WY1H0
zXKcfGqKxt1G+K+n4rzsNs4IhtaSmyKnYtEE9tHNlS5l5Brr8/0diUKSWUMD8rVcaM3VKewsn1IS
pEuAYTgOnGPs6sBfTbu7J3Z1XfPTnvIR9+868OwxUJcKltLJxlZLSir0cJS45glk/nhNing1CDT0
5YndpZFCNoJfOyx9/YOBDNsSFjBnCDeo0k1TnbhEdI96oGYFk/g6513QlKIeO9Vh5oQESuSsNeL/
o34llBeC7moYBt04xOgt0HZgtTx2tZ4FVJsY3NPfCDrRsBMHbb8hF8Xhe0ljHQWOwrSnmMTwVZIN
/Wir1capHBT5bouSe27jTqLCfyIqurfXqjGUJ0ZKhKpc5Itxun06w3ajw4Njb2f5bvX3KzAvziR3
kzY87J0h7kMhgZzPxDyp2ay4dx08Bb3GTWI5sfvsos93fiZtCMFVY+1sumXkul04geLDcx2S1YUu
c34j8ffVrZepL9A9w/Cy+3fWAMn1Jrmn75TDLvJjvkeSoaFyf9GRL12KG4N/lxMBBdGCDuzTbO/V
xIuwRshIMmdR8VXsEPkgEEvc+WllAVfYGsbxqZ4XqujSke4zXvxN1SABN611GwIhXv4KEmtwUv65
ogwx7XEQnAiDvmVZyw1ebeOeZOH12NhjFHJvcy9DNYCxbV4GDhugT0vFs3xvbzHGLU9QBc4eNUkP
6LP6QLPg7ETEEjgHblXuWB5QXHTmV59Xodzyj2twAc8EzeqV/HfF5x2IXWIh+xFyNNTrRgF7Yje5
MeGjaVTf1lIdXh4SZstygO0o6GItfrG0uY5cMFC2Avcmg+YPC1Rmi3rTynkKJWzGdnefyDTeiE3w
8L7aoOV/toOCkwGsBj00usUTcSc46ISx1jbvtbz7cN9vlvnIIIKOYzhnUHqUtUP5AbeM4B1uuB1W
nn8D1DLTCl1PRREQnRXpY0eR00MYcFyYA4H4cRin3uDrI0jK3dQ4EFQSpxaKYtopSmeTlLlBiDGi
t4mljyQcgIG7KpIRCw+YKgyus2XzFbVkq8ROD56b9N7gUGEk9WfUYfr2RUdi265Eh3DlkMi8mhOS
rAM92+8fK94NQcxdWAcaB2Y8Cw9nNb7IpKJCLqI1mY6TMEoBuCzHeDWYLzzFvDXfpE87qXDajBQQ
Cux/uMGK7bHDtMX4GV9BrjTcgqBw7BS3/WHJxX9DSJzPyIlH4yNJSyU/7XDFBCeJ4ckjk4NuZj/k
HzDQnsyjtqhIpRM3G2WRRoQ+tnM/Gdt7Kc/GqrTC8CvAaDdn2k224KUoGWGq0nKeZ7ollQ28l8cs
d/yDt2LaIwbi34vh3CqnGWuAl62LiRuhu2HoSOo2RmJLwfUDiaUnXBKypK2Xze0auCOmYIpvXVfg
SmUHYNvh5DrtEFfKADfEa4bLqKGXPMLpOYzZMgvQXYD0E5fxU7UiR5a/S1R45hCGpLvw7i9ntgfo
nkYg1A623rO2Y8Uj9afhlh7R5dDv1e823eSgag3pMJIEMvPyHUUKCF37Vs3dcfx/jSk2hqXzZfAf
FhQbRYrlqfl923+gbNGUgiqvXW64/mWyEwLJGOlFXfw0SGsuDd24D/Zd2um13ioS1HQNTnu0Gwy1
Fg6XlcKPQ0Q12hs+47SbDvE8D7m+5dPTRKGsMdM619Vo/nWkVHXbUreh9cXtbQkhcovonPLkNaZb
l4ZUxr4XDk4wWemMuh8bjmWjAvPYJzlE+gQXyUMY8kLOb7ICNFRX4FT0WZyWUzdwcV6w4ktuZASo
zzk2M3lpUTF0SALCdkzMtjnZrgoEzzWWaKHvjQkEY59d7KsEmOUqdHB1EWLa7qvs60/PyGA5p81i
2lVWA2Ap+cq2LnsYI7QyAUcOl6/Uhs7A3xqOU5L9y8iMzy9Ybac0cBtTS3hGsyehhsUtN3OH2Riu
09YZu+0aKI2ttyhT2iYwedxhASpJeOmhF00QCI9RHpk6j444zdDNPtpGq4IOvyN4gbnsLYLiOsVh
ns0r4IV3NpS+/3AeLO16wDSc/6LsCs4RDYmZHucHIPDG7MdS5aH7e8g2xizJZeOZTGTTyCxSU2o6
6QJ8jVFLwZOel3uABVwrx+cqCtY5PxijgAG7kyBTTOZ/l1wfDP0aXCDIGDQCL7I5he4vN7TpenVm
KAuBEGyPEiqOIy29RNp1nXyt3hCdQAWc060YhF5PBe5yPL5sNWVXkfhXMD34soE636r22bq1Z+Xo
M6Tf5eA+xUtT2ADVIix8XBFima5/Ra/TJuyMsnZBqfa8c1+yfaJmuWJkUOT6OvQBYU35g4WgNZ2E
j8qibiEiO9aqFPN5hWRw9GXIxTEQKI8fVXe+Xik+uYXjbgFRn7uTHkOPLasBb84vSgGu7anFZJbC
jSM7anM7v85CcZA4ZE4h9sfXanaYciaR2Gos9CYlFvsTLjCtPkf4EXjVzWzs880pCh4e4794a0bf
jG+d+ocfDXJtNkSnHwaMV8J7xo0FZEUD6jEYtuBtZKJ4zosM0rwLB7GkSvYclJdxy91TxqJYfUHu
FiW00xfCj9YLjkrIYsr2G2P6/VfDpYPlqPdew4Fj5njsZaYHVU1TRYOZOSEkh14S/MiSPq2A7Tve
xfyvmQhiIvPJxhNI2PtoKparkRu8p0XLNu4AG80P6ulC3mGgIuNfNqE5LjxNbrVYiULTLl+VC1MR
kF9qN5zQbgkA39xAw/zS4l6d6gdfpFaZ9SKDE9M5jQrX6MCOGETmrsNRwM5jh75KML3bfglvXyr3
KpZxel1gWA5/dBGgCXaxt7yps4pFQ3J04dgHiOV7pNQu/8GHW/aNjgMo3YqrvzCXJB3BdQ+Dq89g
vLuL7jRM7HNkpJgaqLycylRtfiT+FrwUIZOVBQgNQENLTwUlj4mcBrn/ac9r487Gv6ZzQunBqnr9
Bx1dP8mLLwKx2GytxHXPOAK6K/RtjeBIyk+4wYhQEulYIcHHA8jVh8C2BQSMH2StRHRCBnpKrEMm
FsdgqvLMg/AOxFqmSuej51rvliX2Pt753mMWFODVz5dUtx9Oh3NWevApuYJ8shQb7WIuoGYPYH3N
lag5pbvE5lpnaoY48twzj7WUnNbojispk14MTqcqk614p9q7cAZHfbAjaVfZYZ02EaKoE4b6WLrh
7vrOz7t1d7GdzfBJtWnXPScmqiIuwi7qDAVFcD0DDciZ9KI0RCCi3VdnOwINITzPmDTNXia//JEw
/3QxyqiRaa4gjweOTI6/glUZzgOr14vYCKiDTzJYUVrh3pXQTCWngtZty93g/Ws+j24qBryi6maz
EdG+S6uI4scPdQ8FErhfc7s1OQ0jhU91KxVYK38tbVwSiploVAs42n+SMyXTKrKRYGkQGWxGaBZ0
+Dve+ksh3bbPXptYeWgdaS6hYj/wdsC75/K5mpPSTVU990ixgeL/9Ms/dEdWKBFYWO1dN4bMQGeR
4oUlYVWprij1xzGd1TWNMBCaw7zHl34QlGkls++g7geb0PEqNDJi3XWRLpAsoQwrnyGVA483zFDV
uRyulNUpt1teAjXFJlUNHFt9S0OjM20TDHdk62nclOX0u9rOBOlf6dQCipG1uqn0KcprE6P2nBNY
jMeTx8uIqncKpkMprWOR/mIAy1/Y22bl1qoVjLP02l6PBAIg7jiAX1EpjzKUNFGsWD2/EAmOV/7n
7sCUDLfNC+nN0FAhpn3hGz74FzRpRBmwsKElX/DiYmeg+xgpWVgY7cnh96lIBny6hhpV035Axu96
J1jvYeKMIln4bpbeFH4ymB150lYKPBmyB7ZE/mt6mLT35D0IAINXRjdfTyRDCyQUDK9WrVDUcHqd
SChy0/NEEk1NJJZIJ+4HpM/YoMJswFcHP94Wqc3HiSLoHwWV/8RGHoNoSYJ+OLJNNb41ZrtsxN9k
cNAfvXCQwArbB9Rka9JC0sKRToGNiLoh1mPg0JHTBIvb6IpnbUW57jQKb6FmTv5nZ306DAzd6QTG
dN0fGpvwD4jQ78ojJGFnpzrowFf3NGXhK9sxW2bBU4pkPMc23gk39Oa8NFRJBSOQaPXdHZMwyfJ9
gXE4eQuHjc7OV60n2TzGj7gANW0ErwkD8sU0vTMmsz1fj0J674E5O3FdOyhEwpmk2yLf3TYDMrQr
jVD7pDM6Xol5n5svRDMBR0rI3YorkJdGxedLgqgwta2keU1Iqxqq8FTAG3fxhqgE34UAmqC6hrCr
6iI53qzGGcUjko7XmLxjNalwlyzIDtUMLebBF1gLmw1Xfqnp1/Jzb1lfNOOE5P5u1UQeCjD/IPQY
M9JcPz9UqJH7yEu1PzfQtHdrlLh4mPRQICQXfZzh46nZwCvbFC3I5mm1UFtJGkV+IXSH5tTJrKNa
ZTaebI4XMCw2mgLptrE8LHm3RlLwpCTrvm76+IFej750NFoYTNR7zL6AmN+zL+ZWAhZJpRh/23Tg
2lxIfcrXT5yHAUXmnfgESl874Rn5YU3LK48U5TBJkOAoX3u+IAoFTYmNjoqaNugXQK5VoDn7irm0
DB8e/kaE9TBSSLt2vv+Y7EhHlXQxnLCg+/r4iOh4sXNfJXJZp8yh9ll9d66KD6LC+n4vYcTASHjA
uaTC2v4SlEwR1ZlHQ6SSIuNtTuhWTh0f7mfwUE6hF3qdwX1CtC6BEHND+xqoF85afS43xZ4tHXWX
hpcNeRHd1vXNjNVvoSjxSqKIbAifSvJn9Z90yL++MD8I8NmbjevSnzBFFhcLId2FLo+3chi7ODmT
8rpBxK/UlHGWLFO/9wCzc1DKn57B0nhFFUmi+dpKAGBXAWYqAnlsxiYKVJKyVDV7KQmNVH7cszdI
+CyLC4vWZvUwNSJfmOTC/gz9ph9PvZqZolg+ujWCDaWq66Nn2IHYsSogP2a9bezskcZyaEAWp92S
8EPrR0RHAoKB/bjkmPTDt8nvxi5ckbxOf79P7nO3sslaZDhf3LsWRrck6ckav8w9CKks9iNtF4UY
6tc0al/taZ7mVgKOafn0vlE6VZpxmv+NgDvs/CuGNof9pak/xtd1Uw1yw4nQVk/JsyxVq6e8nDWz
WfmxlUgxHJCBshbITWIeI6lng/2cl9gzs5bTacvvnWB1hdZijiyCGC4tu2PrZOYu6AUVd4D5oKVh
NdFZmLujAR9Srn55mVUvWzK6+MkkJZ+q5UCC4/4ICWcjtJixDKNgNmqcWTS8f4boK8juBuyR8AYt
2ufgEkjsAgwtlVucFG6KCIUEBy8XRjW5QmHWJWudbZ++EwLP3lowSex9+JzPr3XZxJUN5BU7TPUE
pBed1DQd2Hz/Myxf4B7zqXgDM5rjmdIZ9qEYsnTkV3wn+fRck6AtDVwgBAMZK727mTmd+A0/Q/OJ
fgAOBa5hHMKUjOhkVQXqmJ0rDYdO62lFdv61zwKpGvSHgbFmXo3Cjb2FemimkiHBZnNm38/SA30v
bzzkPgeuUFozRmJjRu05gnLB94TYxT4cwhh14HUL2e0CX1qMyWVkkAyCGsihIYDtb1NnSIvE1rin
7fWLLpsGR29scaNo0KbtDvaK3Q7w3LnmqKq52XFbdu3PMkJfmJ5uE2WKFfHqv378YPfkua3+q2cq
/KnysT/4r8Mh1mty5BLHahcxd51APDHAPQhSkdAOodHL5qvqcC5KG//8rHFY/TjeieOj0U+ZrC5F
DCYSBcR2TveU+5NDXsZalvezBgQdcD5pC3ZZGeVelnOR5fIiMIzGsPIt3g9R+bUFRpJ3QFNRjpVZ
hwPw8RfiCtzesxn0bRj+hQSjRdtt+YbpUbzhZiCGXg2BCH2gM7E5h4XuJRPUWXwqslJJF7K348cj
Oc+KHw/cQSboU7LoV1h+aDgMGnK7litvVJmqMr0UAk2Tm7wvdg1GdvLJoIDPIBGTXOracSsA1sTa
VaSr/ehc0Eca+ygBrp8j/O/h5lcugq+ZVsfJybE/xywdKyh9OTpaezahJYubw/qO8a8H3tTGfnGP
S1xMCLNGFNGCRCKOldaEtZd9pP6Tsdxy5X77Aq09YSKWegkW9T8c7Y96OC9S9Boqt9GWwo7uYz0E
GNxP7O8kbJ/e7XEw241+c9B9pIQuDHh/cjAPXhgGyxW/fDgy/yI3vdx5MrJB5JzrE6ulwfTLntf2
/bERx8kqansFOD+DnvvqgodTCMZ/kgf2ZPPzdiqifULM42ZNfJGLOM3DiXdgNVqAoOvgzIAhZziZ
boVcBiWkW/DZEBJZfLnkm/LTIxPktlmuoKqffwDh2f0E2BB83z1obO98whnjr/ly81/r4JztvMNW
fEXooCc3RBsbkTn8TAOLJpld7ioINbvgntaMIc9wcCc8uZdK7IdA9ncGw5XJmK6qTcxWoaI8mvFE
VXGaEiP5PXy+EMtOVizmqxRjGWIk9Ur+J1LBPpzftfK2sSII/bqt4FVrkRBdvn79g9fqu2cYMgpl
KvAMKS3YjZEkYOsGI00CEmKiy4TSxOkVoN6h4Dqm2Bb9pIh7YVjEXFwOk/AkgW3zAtk7Pkes/Bjs
TZY23+dQfFqbNMiuqpJ8ekfmeAuzTDGoP7A5M8n6wxRqdPKr0N1/DjaZNadei0qTaNl90BzcWA9r
DnZJTE3OMJXZMs2SJ6b5QGjbCtmWb2w4aHl/SUGTH6TJxI5kh1IbxmY9zFsnFrbp2818sL31R/xA
aAuFNjC6lDQqlOfs7gTZaxLxIJNEzVA69IAPufqJPR3RRePI5irPz46hL7HtfLxOeQ3JKB4b7bU1
tB1TexT2sSXML9dCc9+gLrxq9ozYZmgUTN7zG99UkK3W7MgVKhn9kYS/lzPnT1SMVjyNExtk4yt2
TTklpoK3hRrDWyBig1ue5ifi/kLp5sx9rx5WGQbjNp8j7E6rqKzOTQj48oKbwwo/Qi4t9s4qLWO/
IW3eG/QKS/WFtAR66hQqAyun/4mIu0R48bEvXQddxTlMPoZd3D3841/cONauE8DE1JDst3/y9RLz
61QXh9DRHg/l/YCKb/wwWeMaw0fm4a6ntD4kY/FpNagUG7Gr8kBZo/BAGa+zqxbAMu9r2oxCWEgy
0nTy71codWYhLCJcHYbeG2/rguQ3MMRcWQsR2edM7gg5gHoWG1uzP2K3QuJVClSLMlU6ePuzOrFD
/DoCCVGYj2ZXf54bFUDK4/Fwv+ddlacqMLzW4nznzzWfW/EnqLMeRXkps42OMlneWAm7GSRsRIEP
6fpXIYYJQNefImOFF+et2tvCVZWZS6J0Npc0unBaLuL+wLgX0LG8WxXfhdUSAM8ul9l+QHrE5A7X
NL6rHdtzvIYUP8Qh2xFk8qm4KlnD52ZX5gCg596A/hnGZLAXnfz2gyszbpXvn1h4+l0QcH3Jcc/I
4EiDSCFM+BzqZh6R8tLdRACiKUBIlh/xgqh9VPRRstLz2fW2V1c2GIJ6Zgl9RQ1j+8DB4G8xcTse
jvXLTCHBaHt1fa9yXAsoyGyi1ICOHoL3uywfXan7Y63kzdbhZnfcXlgGZL1Ho4d+OKohcgrKrCj+
o5Cu0O20u3DhVoXudDYiUwsaxurwvHJV/tueHNvEhXanpGMxuJkG+jaDkFku+QVRL5x/6gnTCTlS
6pGc/KhzaGrRT4i7c7TMv5zyGKCP/kq9TAIa2OGJR3J9c3y8umJHxW4m8VuxRykojR6gYwDe6VIz
wxPyJsRsFvkeem254r3L6KefwjoYrnfeKjADv6JhwrIAUbMCUJ8gD6JSY4FeM5j7nZ+TjdQ+hakZ
+fiuu01WCMzx+kuH1X8OWi7LceTIVzc/m40hFgG9Bx8vdTiDIGLkSNS1BAKAu2PIZeTh8aHakId4
B1BoqMrtR/FF5Ab/zDYzLHj1tLANKr6Trhl9wVz9gbtDfAKKm4alCQN+tLYPnA7eJ9HdaKR8meYJ
AA8vH5HT8b2/J63qvT0uLFfsTGIYrvS0u8wrpz8n6PzP12NtTMsL6dZ6mF5jOqn6SfUrNOffbo1+
vvaaljwbValaWTgVbu6hYjRhv51MyjfEPdbezqvLplYYOSWtfi/IIGYyiUc/2XNnZQTZmdDn6dwH
4/jS2r0wK97KCrPvXBiOlD5HCU8YV43KzfUpJTyjhtNGC6OyijoFiYoBc0K+Fieqlaxlj6i4/hd0
mFSvHHbEuw+k/60+rMfHEt9mC2trzm/8fwF4rbTcZrAGKKQUCA90oNX2CXWSWaU0VlZSNM9J3XNe
gle5geUn3gZpiY2dX3N+JHRK56I0ZVrTQgLKZKdy4ov5lOqJL8RStRAPrrLX49y3+Wr7ft1VCuQx
8pUpddDF1qFDbPSZtD3l/MfZ4lZ2Z3MzGQqT9YYJ0ZTiuLXqR965vYv6d6iyBAbl9oIde369cwjM
LfIhChDo97HT3BUz+S2UBufldzMn/hEEj18Xk1ASgKxBxrnmKbP8zzMTzje6drMj2dMCZrgsUKT9
UIiWbG4W4nEuih/OPNO57Mnj7JYszz7XZrj49jP8lQNNM/XCou0KILGDELPDUiz8fm4fygeMEeNI
mr2ZRxMVIBVCBWVaUlFqI7F8Fc9DQZbbQz7A5JY5b7/6/DXYFxgdyV1ZcOle6EVOa4hzfDVDGJDv
05B+eanOdnql33cwD6ew1NKEn9dy/NGTxOibCHVs8Qa/vaEa2K6NJD4ftETJ2ou8v7srXpTj8J0f
NhsyPZhDr6wx/fLHsriiFN97aZuvVcBwwoOjyWxFB9BX6Za9moUzJ9Y9AkH3ysgTVolW4e7IEDf8
SF/Pbk2K9SRh7mRsVedtHlIAbRy7YDisKtJQfYQjckWUKVQG6QQQMIzA90RifgPmGcF/6Ym0YOvW
tyFKxd5/qX9R6O3CNmyrGq+z8qDxrVCAYfdYtCYS9DFaLNDNRfV5nTJT8wTkKh5/h6KPxEJOHQ5Y
zLMH1iPJbfKDZ/Oqq8G53CMFElZgWhSzLO3uUSG4MD0SjMHtaQN4fTagqfcmgpr+dY1fh0nAsv0x
HafWQv8+cHyZeoTW7TLFJmfq1Txm5Obl8Acr67JQACQHRg/MQKlYET2a2/TMfXR9fXlC2LFDd/yJ
D07pc3ghjfm6R23EPMGKLgyig6YULBJxT0gJs4p4NydOoS/GqxtXO4b+eg36UAnmKIqUaMspIxtL
kGSKhtV6PnT3g97nbgxdYhNkIAfaKxaxxxhM9UzBU7rN0HyC47w7DR54qqZMNcDHStiVUPDHzWNE
4O3XQULGg/v2jhDDKMQTllPV6VuzeQpbkybl5TNYBX0bKrwbI9gNYCJYAzf/+60D+3SbJU1g/WCK
Fdp9sSGc3m0HLJDf5f9iehx+1V3ZXjUtIqSQfiXAN0aaI1v1AvynNtLyAqwsC0cIKNQFX/bDe+Cw
DWIYEQR1tPh0kYT7aCofK8LzcPLLkdBVogjgllwa6l+kaV/YAZiLatGEKiDUz0Dg8QjihtS9mr03
0DvhwUifENAfoZi8r1K0V6KPmJthKD4WyB4RYLCNKz9qjIhQjdX5k8YvdUYfYQGL4CEINS/xMAb3
gHpBVDLeVixKeSQbQTTfXALdijWWZMCCZkeWkuEod9EdK20QOY8enjdIJwdePQdWLwrKA+LEYJ7n
MIJh+Hrs9EZFTmliu5hBR0AbtDFuIe6TusbcHtwToQqQfS9yQNeBr5i+dn3x7TADVJhLHYpYU2+s
Z7+wJwNJHKvf0p073YQz1O+CLToZY6uFucoDIkccXlpo8rzqLeG4Ao4Aqfx84RJuVJTBZDVUWlHD
na5X2FeZoTX7kTwPmsut668PM5DPYPiexy0HmdFiP2+p9lXZTlGMihbugfAQDZ1dN2hFzW+tBn1f
LmX6G2zREn4cqxPeiufR+Uvg9kyMYcXxkiCqJLecATnScyRi+2N84m03hisM5fnldallAUDITmQL
jowEyancrFxPnSVa2ZNgvCxjVigzWYdal7P+a5z+0RPU0KBilJXRlxOtVmxc+EaWzOPdrKT9OM8F
atomTyFG/WsAFURrjbndjR/qepiZxXD4nkYMNhblLeXBoldgfzrjyUr+GsgYDWruM+GaeMrH9XFw
zyoDBJO9GhzF75aee4lHAj2HKLxMNtCRMv+1cWCTCs3ll8eMtkGZJJWTTGMQxN7n5na9t6U4JJbp
7umsLLG5WSBBlJiqIibRgruQofeDiqA7GihEOxHXtrMptCQ5wp/ttibwfarMzd9CzAReDno4dCQh
kKjjlOS+R1NNRhGwuMKA3xnrjQuPKNoIJ2C+MoaaVj6zVfD0do20HU5zqU3r/mScVnl5tIlk1R8S
nlewsedhs5JAF9orHu76i3oI5BZPkA9kQ29/+tWzxW1b++7xv+RqHSJ4J4R6St5ZfL081W338TGC
EE5G55Woq+cxQB3WA2IaOUTfc9tgXTfNffhcAkysM8E/2Ci4AQjQRm+LmGsNpXyK2LAFALnKVncA
+k2LvodJZm52RXQwAZtVHhNt/FAgJpLCvbk+Nq6MQ+BroRlPOn4l+sLywNFGpcOySVWPw/b933ZU
DN/H3OZz+knnmN3Hv8XhVw6qh5XUx/t5yjUedpv1s1dkVWJD0zB8MMNVbuKu3iIeR0bsWh76H+al
iGEBnWL7G5BEJBpiBK46DYnpyfj2KySsbMHTrwGXcVV23TAPJ62iwFjH9/v/u7otpxhMRTJie4r7
wV+t4GyxY5SF+84mQFTt6/Rr+MRCkO7/9e2MtuDHR4GOJ6anWfd1RrWIFWsa3W95Fbh+EjbefD3C
GDT4BWL9A/4WbJ17qAE78p9PY76bmWFDT+f2a3Zq2jpKL+6f700HEYpvA3a6RpkkRDT7++jOVqRi
6cmlVQYAAx69LkM8OynGu9LYxoqE0q8jr5CO
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
