// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
// Date        : Thu Jul 20 03:09:44 2023
// Host        : DESKTOP-U9NB2CD running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               C:/Users/johnh/Desktop/IMP/IMP.runs/c_counter_binary_0_synth_1/c_counter_binary_0_sim_netlist.v
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
  (* x_interface_info = "xilinx.com:signal:data:1.0 q_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME q_intf, LAYERED_METADATA undef" *) output [4:0]Q;

  wire CE;
  wire CLK;
  wire [4:0]Q;
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
  (* C_WIDTH = "5" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* c_count_by = "1" *) 
  (* c_count_mode = "0" *) 
  (* c_count_to = "10110" *) 
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
        .L({1'b0,1'b0,1'b0,1'b0,1'b0}),
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
FaUY/vLqBHPYbzGM3pKZsS2xryrMw7/R+BcccmPnTxN7wUuMmzFoStN2DyzZsFlAY3oO23fDjWpj
JucYH3FKmDTxIH8K4h9YKCgRrJkvoQ0zsGB2Oe1+erLLkZgdfDGYlyahSZ/mtBnOiXv1GrHSmR/v
E5kMKf/x+x505VQioTXKFuikHD+PypEFhoTLW8cekTIKyNqlt26oc7FrJMhA8f6QJwgXkhUmbfjS
SWawTumWOd06JhOb9kPObqc1zI3CDpD3TuU2xl3p6k2mDrGtThKjpTtM7oh9Z82UoCpLgSP0xUoo
7MOel1K1/wO/65cEr2mQFl+b9CcdBSuqNyWpXg==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
IbjKYj1I92yImJSQkmdoSyItUfEZ3Bxxvak6UTjv42AQk6PMHUsYCqJSz1ESiR85oK/+ksgZEQng
pmA2CtqZj1lEHmmgWlTLsW2Pa2QHarcPiJMpDfTsRsdHTUlsO2eVNvyOaU7XZirQdvNd/3pVdBXf
fZTQ5crrODJ/55gQoRfcWvPYcUDoDWv9cXgbe/ut1BzN97o/mY92VYUgk+RuUkS89VolsgIjY6Dg
1ZfZhbCfPBZVkt98Ij+laeM+1b7PzpyEDMcUWIDE4nvDbFwczMTJ3HL0fPMpcFF79Vlbr0oXCKHx
1tqpLIGPcWvtsfHB4yZopUsBbBxrFU5rByXW5A==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 8736)
`pragma protect data_block
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
CXrWXpUTAfEojs3ZjsZV
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
