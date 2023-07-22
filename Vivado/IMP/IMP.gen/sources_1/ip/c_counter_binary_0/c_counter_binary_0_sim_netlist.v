// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
// Date        : Fri Jul 21 13:04:53 2023
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
DQQSH4qNw5ZVMlJL9QT8dwvbsL/nbed/m83Z5cz6FUDRP8g+40LHJCm4QTVcJVKzwkI7aqrM8fl9
PrL+yDWb2DwDUBWWxB6H83/uR+pNZtZQ1HWN7NaNsE/BFvsWKcLnAMHCQfR1LqDQg7faMgTScIKj
LStR3o/Ee+wflPH/uIpElAOgvrUlXdhsIhiwpWCWYLH6d0s2LR4WxNZSW+xU+TK56PQNIwni4TxB
wmgnAflrLMclXPhcGil7dm4qgE/o4qrQTmCYlLy0MCOyUrIJmA1ZHSGM8A4k5UFpoO2VyOtwyx9Z
ua70a17+qAaQ5Yb7GTE2KUpPUWJBSHkynYOKQg==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
gxpZ+LfRq9u/zWpXSFKeaFF+0hWhek+TwMaxt4wCTJe4TimIcHbAkSjySfiXACj9d0Q9UACZkNvx
dNms9zPO1temu1M05ADDMbOfvaulVIagPDMS7rmwssYiAL4dKn5z+QypdMCX35UEBIx8Knno57RA
UT025TmZ5Rf4K3eGT/2SJWxIAN6+2ZYu5vcQZQO7Bm/IGxu1N7Y5y76iaQmrlxWe7wH8qmi+w358
b7dBwzNCWEhrUhhXs9G04HMw5Jo5m7pp50T+6bWkwH6Ce8Jjw8okjW4LLT8T/6x7J2v4hlYVexvO
T3W7niXWSWY3DkWbSiLdROfNaFh7ammYZRNXug==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 9296)
`pragma protect data_block
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
oIZZ8I4=
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
