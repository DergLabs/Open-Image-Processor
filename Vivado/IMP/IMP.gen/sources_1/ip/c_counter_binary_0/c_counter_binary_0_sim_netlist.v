// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
// Date        : Fri Aug  4 01:32:38 2023
// Host        : DESKTOP-U9NB2CD running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/johnh/Desktop/IMP/IMP.gen/sources_1/ip/c_counter_binary_0/c_counter_binary_0_sim_netlist.v
// Design      : c_counter_binary_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tfgg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "c_counter_binary_0,c_counter_binary_v12_0_15,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_counter_binary_v12_0_15,Vivado 2022.1" *) 
(* NotValidForBitStream *)
module c_counter_binary_0
   (CLK,
    CE,
    Q);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF q_intf:thresh0_intf:l_intf:load_intf:up_intf:sinit_intf:sset_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 10000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* x_interface_parameter = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_HIGH" *) input CE;
  (* x_interface_info = "xilinx.com:signal:data:1.0 q_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME q_intf, LAYERED_METADATA undef" *) output [5:0]Q;

  wire CE;
  wire CLK;
  wire [5:0]Q;
  wire NLW_U0_THRESH0_UNCONNECTED;

  (* C_AINIT_VAL = "0" *) 
  (* C_CE_OVERRIDES_SYNC = "0" *) 
  (* C_FB_LATENCY = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_WIDTH = "6" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* c_count_by = "1" *) 
  (* c_count_mode = "0" *) 
  (* c_count_to = "100111" *) 
  (* c_has_load = "0" *) 
  (* c_has_thresh0 = "0" *) 
  (* c_latency = "1" *) 
  (* c_load_low = "0" *) 
  (* c_restrict_count = "1" *) 
  (* c_thresh0_value = "1" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  c_counter_binary_0_c_counter_binary_v12_0_15 U0
       (.CE(CE),
        .CLK(CLK),
        .L({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .LOAD(1'b0),
        .Q(Q),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0),
        .THRESH0(NLW_U0_THRESH0_UNCONNECTED),
        .UP(1'b1));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2022.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
pOoCy2lYSLdoKW5+30MbT0kuTiRSJJ4jG7/RQeB9eRVWQwL+y1zWMiA09vc76Tm9Rm62Cxs2gO7D
cjnDEBDTj9JD9pG0UZ4qvjorK7qe6ttWdmBnoDWg7u86SxcI9hFq/+WSIIz2nufv18Jw1CdSZZOy
fCT9rx9380uRhjUSqF4=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
w0+6vlnZpk2rtsD4bdd9LWwLOAaGlFa69N2rasBQ5mfULBHdtMEL9pZ+aHU222MNGvYQsqWvMFAX
ZesYGDQv4e1JRb1BpT/jMo86E62GcoY5Sma8x/T4td4zjf0tiKaBP1Veutb3G2ureWf4YyEtS8Kg
0PbkWpeGMRgAOQdiRWzcZPYx3TUExmrrpy9HrfwUmeKPRnrLj5W77hmCzmmY/53V9Md+OUxZ1ud9
ra8U2X1hpvTj8Igqf7zkxVLE84R1u3R0xstKE7AwHtdQLmfOOTdMaIeA0cXdV4Fq+KbQfLKFpCch
DBJGJEKdw9bsv3LDnU2dwusgZdqMlPyniUhHIw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
ltA4GqALLdRzzHvj261Uwyntak7z4EkFduT9K3QGtHb0sATa3ybVqK8ZI4jQfsAU7X0LxSWB4LoB
EFa45I2fE9dxusPz3iWXrfp4gx+koM3MHUXxrPW4jG2EucHFZqktvn1Le6uXQTfIURspnbJdYYLN
gfsKiiF0MyJaAIqneyk=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
FfEP5FVX1Ax5kxu3ZOO1vQ9h+VBDpOGG5H86yMu1QcxnGqo9gnUM01F3P96BdUFjnV725KGMIQni
FqRDoY3T9Ab12xgASphiapofR3LD5psN/JEAIwqfr0LAp+qbJG9vsC++s2ZWr5bT40BWrvc2jxSi
Mi9YGtaFzL/QmiZd5c8rctXA06pFCKZTPrpVbHHVLIxt3wRGSfzPS5Adi6/wI6QDGsNH6a/h9Rtx
LuJWu70Te3UtGxU4L6xsNyvbBZ4CCFz0dL447PvB0CTDucB/adAFHdWo0DhlvfzkmkoGEAhixHmj
AoxUm5dvM43CGcaupKLSyc0TidiSEq+GR7l2NQ==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ZQjvUbsJRfCx35iNqwoFQmy1CIf6Coiu+UjavEdAZwIWsKthBwuj7XZZrMuAVlWaw7ztRQITxIW9
joM5AKjSyOnQP0f19GFwzJf84AeawIF3W9rKLzDq3SOmO06CNxp31zfLk/c+P2Aynl/Jtva1fUn+
ZF04qq8HtC+QFVbXW41MZFd1Q/xtg+Oldf7hPUXUSbzn733pCcjZe3zSpulIMxkV5fk6YIh0+pJe
FvtHzhcQPf+iDQm82ToezAiqE2VGuquf6pVU84b/8tWxFyqvKnXHdfXGLEBP/P8+ifSgyJsyvbli
DuFRBrF+POpxQ584I5j7CL45AdM45WR9270K2w==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_07", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
I8jEzvdjBEX5gYqZOZMUoavSPVwkkhEzNXKZi6Gv+UZEzEyUPN1l9Jdmm/OohZWWJebb0ecKEuTu
VzUnDYkQifscYwKLjT++bhkfP4fHR6IIJnlOajPL1U2absc717Uq65HLaP0ISJfczzo4S5Mq4/hU
Rj95X70zIG4pYiyaOllA1V+RNsA8rd8f45qhX1XuzYpufo4yOkEdXFfuzY1bDq2nK2OMRH+4TOXw
XMXsCKqNTpsyaEsutNj+rZ7eONFsaOylKo5ofdpJ7IxWzO1aaCcYaqmbNCpkUqe5RQvLE4FuE8Nc
kmvAvUj3g/pJm2VGGdJ2nOsn2uyD9ptFCVK/nQ==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
SEnqVTEa7lkg72h4bpTlKL4fhEuzRqr3rTaNC4OrFZR9Cmrlss8ucbtz4kUEBRUrIzx8ZMZ08aDm
ncvKMpDrsOi59zmzvYyoJ1TK502awdtp+k9xaIVQ0qsM1TxTMEiq6w388MnoJjwOZ7BhuBa1GHgd
Dx/0z+9+rmVCuHs+HULZnwjMyc6gfx7LRVbLQPb0S4Oh9i+rXperDiv5N7FQeNdfsDeRCLVRB8U+
OU60liE0nqP2X7bte91esX0nspE9bMEb88nopvRxFTNBXG/PoJoQvlFjrUXWbVELwUtfC4YAkcvq
eB2RVDysb8DuzJ1PztoiUPf6FAvw6WhfDouB4A==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
k8QHc8h8draQ9agAUUfM6s9ta/pxWprdP2NhBlzOaFB4j4J1MHoYvPuMlWY3IJ+53iC58d58V0KQ
DSf99XKI/DpI43M7z3Rgp6WKRkU72yQMB/tXQk3sQKHKE6DVb5qPkMC13hq+bkDwfv5JMbQX9lwx
tWwloAcpFCR03nGPXqH3V+FDys7YFNmWUI7F6BYxX4W4/4feSosYPgETUP5gLQPnK2SXr1PUeuuW
7UIFcKUwBjx7S6gYUPq3hlO6AFN7ync67eZp8N1tozzGnF23XCk7gUU6srDt2QOWbA0sBL6TTsrI
WW1ADpBsIdstAGiZnMRRGDeA6rN2JiwulhuiWHQAuKSkUSbuIT6uPRmlnd31uhSh7aTrvogfUJSz
uGNb/TAHJkpHm4yL40iI8yO7JTcwLuy2ahdpE16AMDfZJFU4IGouo/H5+p6SO+jvzHZYkIWZusPm
nBK++GQUzk/PMlSRT0cCTnxIgVAFToP96NqnZtn2E47iYToxig/+YKBy

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
LAw56NZhBnNhisjUaakOb87L4sBFj31jlxTUnVSf9FfOIV53do249b3JPp4K8xGqQsYrn2pUQ4U5
FOdo/y2m6aKiAdn9UA1Nx3HHK46586WxtcSd74xxYlIKJMy+xE1yeJIeWoC/+HvDmglnTzt9aJaA
6XKocO7esAOu13fafAa/D4l+73oqYb+v1wIcK34mj43NqEWg+qxUVG5vj9kDrx0l72qkTMtQeCMZ
j9Rr2RJ9uMO8H71F9qVSbAIun5zjMh+cd29z54TJZTanzFEdpk6UmY6Fopv5VuIykHN10J8fpmUH
HEQQJDGCCq33NL6UiradkAd+1GvEk6iYZmweRA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QIRlimWJmYvvT1ndG8RVXU+cBHBvbqMgDswq7KHRUlILSZa/7QBkjHU4jRyMbn85GKWYZAkXtSSg
FdOVfkm4iqRqh7s6v7IojQK6L7bFcWX9v/0Z+d9qJBHsMIOaLDcItzay3eJHuR59CVQPFQe0poBv
TCalp/LllTIFaqWzv/p/62vwMqGMxLSmXpzcvJ74bWsu7rJGsXof9+aSGuB9IJn169W5Q7MjdtOI
uyyZAsZkEziLaZtOR2gb9jvexNEARDt8JCBmERsnGkwdSJqIFMKkQ2nadXlO4cKgmGhVjLStP2Du
O+Iq46dsb+KneGRn0A8cqCGLr4W9DO/PhYLLKw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
TbUw9alexqPUlmO2Y7CSSdNK63EeDMrj8Lm45NJqGOHsSqM0xW1ZjoYLJrMGokagZ66Qkz12k+OF
uU94V7yO5Uf9b1fyR46oqyA7F9GQrYAmKIkj8WXY7freg0ZeIWUUBDHPGODVFZcTvAK4Z/+xPeVZ
f/gWYrtrZjoUaycONzVwRQmtgk/ZSEGwkeMdiwFBDnMUzkbU0WZ8NVq71//YWjT8JQPKn1vKxdNp
tPG2QEfYExXB8lSdJ1VOQMwdvfv9J1vDFX5hLTSqbn+V2vKYq0occ31OnqfxMUvgK94NkKBOBvHr
rd/xsyIYEfk+AxNk4JNpKt0bvkp4lGUI/HyXMQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 9280)
`pragma protect data_block
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
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
