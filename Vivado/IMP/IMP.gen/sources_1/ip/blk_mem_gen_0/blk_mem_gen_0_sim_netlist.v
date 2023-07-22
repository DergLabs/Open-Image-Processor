// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
// Date        : Wed Jul 19 14:40:53 2023
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
    addra,
    douta,
    clkb,
    addrb,
    doutb);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [7:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [17:0]douta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [7:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [17:0]doutb;

  wire [7:0]addra;
  wire [7:0]addrb;
  wire clka;
  wire clkb;
  wire [17:0]douta;
  wire [17:0]doutb;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
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
  (* C_COMMON_CLK = "0" *) 
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
  (* C_EN_SAFETY_CKT = "0" *) 
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
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
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
        .clkb(clkb),
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
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 18016)
`pragma protect data_block
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
PnGiSQ==
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
