// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
// Date        : Sun Aug  6 00:04:49 2023
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
  (* c_count_to = "111110" *) 
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
VAfBZKYReU1oQxnMXSsJkHBpHjxFFxxLtcGJuTuzGNUap8bzDmR6EXpX4uuOB0UDhsfJDV0J0Pn4
vQmWsqW6VL2b3ZxzsfF9CbFkneo5EJlqe46wSkMEH/WWbaoXSHVyYxXO6IMxNdUumTe59y1JKxc8
IDbEugOiqg8Fy3a4Jqhgs7anWZaErm3XbY33rvFZTaaw4foSNWxrjVrU70ejJOxcRQFK5TXO3yv6
8p2+Qik2ahInqs7t5uwXkvDlPljiI0GwTiYF+E45Ueq97ZK80caOWxgjErJSDZWMcrTmhZO5a471
fHwJnvVueJd+AbRnPCTPGLoURCkvn7Ptqqf/IQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
KmsKWKUGTq1kg0DmewcsQDrTemGt79bklTO8OL6gyO0hbzBLThxWPTUArWKCn0qRdS/sbfZcYbuA
SQEkbdu4d5JdVyFkkIyGPRwXc2XGfYtx9suTnnqp7zGAoYhY8V1heeCPhDv7A91pMZc5rY085RF9
aGlU/56pbwb1fRHHwNNKvofUZgNfWSP9ANvI6q7KXQdTOUPtzUuwvA8oJlxjDXhQUjcSygTJhzGn
BwMASwa3cxettNE50GjLozEWhvdTDZKrT+qHmRPG/JV7dEpKDCguLatXjgu6GLQcTdZ98Fj+gwL6
A9cIzI+5zCSpDXh71Y//UEN1bJlKz9tjSr5CSQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 9296)
`pragma protect data_block
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
FCfP5JY=
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
