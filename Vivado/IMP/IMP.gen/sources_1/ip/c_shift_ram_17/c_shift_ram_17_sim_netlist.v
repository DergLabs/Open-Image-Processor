// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
// Date        : Wed Jul 19 15:11:48 2023
// Host        : DESKTOP-U9NB2CD running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/johnh/Desktop/IMP/IMP.gen/sources_1/ip/c_shift_ram_17/c_shift_ram_17_sim_netlist.v
// Design      : c_shift_ram_17
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tfgg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "c_shift_ram_17,c_shift_ram_v12_0_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_shift_ram_v12_0_14,Vivado 2022.1" *) 
(* NotValidForBitStream *)
module c_shift_ram_17
   (D,
    CLK,
    SCLR,
    Q);
  (* x_interface_info = "xilinx.com:signal:data:1.0 d_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME d_intf, LAYERED_METADATA undef" *) input [0:0]D;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF q_intf:sinit_intf:sset_intf:d_intf:a_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) (* x_interface_parameter = "XIL_INTERFACENAME sclr_intf, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input SCLR;
  (* x_interface_info = "xilinx.com:signal:data:1.0 q_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME q_intf, LAYERED_METADATA undef" *) output [0:0]Q;

  wire CLK;
  wire [0:0]D;
  wire [0:0]Q;
  wire SCLR;

  (* C_AINIT_VAL = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "1" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_SYNC_ENABLE = "0" *) 
  (* C_SYNC_PRIORITY = "1" *) 
  (* C_WIDTH = "1" *) 
  (* c_addr_width = "4" *) 
  (* c_default_data = "0" *) 
  (* c_depth = "13" *) 
  (* c_elaboration_dir = "./" *) 
  (* c_has_a = "0" *) 
  (* c_mem_init_file = "no_coe_file_loaded" *) 
  (* c_opt_goal = "0" *) 
  (* c_parser_type = "0" *) 
  (* c_read_mif = "0" *) 
  (* c_reg_last_bit = "1" *) 
  (* c_shift_type = "0" *) 
  (* c_verbosity = "0" *) 
  (* c_xdevicefamily = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  c_shift_ram_17_c_shift_ram_v12_0_14 U0
       (.A({1'b0,1'b0,1'b0,1'b0}),
        .CE(1'b1),
        .CLK(CLK),
        .D(D),
        .Q(Q),
        .SCLR(SCLR),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2022.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
VUB/TDtvHTRAJIP+81WGC6nqP7zbm/cwqJc8J20PI4nkXYJ7XTnGPEgyZ/T6E0h4deyPjC0s+hoK
VsgmTkGWTlPOR1T9YAmHZtcNqfhnLSg3FznIxNs66+2zyd3WMzvLiiskMLmy8oaN/nfWWzNKs+UE
eRlPBB+C7sYf7p25nv0=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
cKg6xiqfr+orbyUsUaCxZqKLE5EpRYpajepUVRi+dP7gWmFfL7yY3t1lCVYCiVh/FUVxd2uXQspc
Gon2s9GzKtX88C4fscHT9qNBsc4omMRlgu8R8NIRNEh8ec+XQdAWhflNvO+S94PelEYV8emdHCqq
Q9Cr1MadZlR7wEeCRCuFKi4PaLBlpAK8zkygElYOMUGgjsVZvLDJNhX/iFYLn1aTCFzbNCZp+Iyp
5BwsoBNqYmPOPIdWtIm8oNXhKsSFjVQyrTYOfoh8ClwKjRajpKWb0EMMGVE7EAJxkIkI4HCwTo2H
w3sCqRtxxvSOO5mQ5sGWhBqWpqpiOkZZegI/MA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
HR6eiYy9OqqpQ9R8NXDlJUniU+lMpneMFDcblhpu44iiPumCCXdg3iuYaedt0aSfc5ota3FFPGnq
J3FjJidx0fSCXWgowvWLUqk3R6cLmt8mGrmHW1qZZQt5xKvgcOGqXw5lE3RC0dgqH2rFXa0VLX5p
XjFdtY00P6Wqt+/jaFU=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
lsJtNMPlJDjbGfF1KGT1S8uyY328H3qXggwiECeDU93QmB4/XFbLcLJidBKE3HUbyrPvnE9l4y3V
Lh/hzuzpxM776+RUThViZa79Xc5IFRBDJIuAB/qbQHcUge1XIUhBpci1D2Soy3aXkyULgDqDKEZC
0oFPDK5wTU0wEkA7AP+LfkCpoI0tGpY1aK+OUr4v+yK3Z5ARtP5x1yx2GV8nPq+mRe9D/UcaIPhS
6mPZUACOz6Zf8W929WuD7FQ9XMhsU5ID9sLlezf/hpqE2Q8vUKeOsMckUPMy22oTsyjXF7qLsN5N
hCJR90EmPsHTg5g7nkedQh2RlA/THzwcwIQyiQ==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
h0jmpjl/TVUJj2U2gtnxyDXgONQNLjEO2LW969g7gkO4QiLijxDGB0qcBSDa045W/U6/k0h0biYl
iqCklgVSFZlT1SzAjo0CpJtvPz86EFMmbXjmHYOehGFnj+yO8xj/NLQ5QQb21b95svW8DHoyvF4i
Z9oR+c/EHLvdpcBSc1qLGaZZCmZBjIBqwZEXDqbqinveDvXGhC5nWBl3HM0uuDPTXdAdVmXIYUEO
oY3LFH9hFuTkLJar+OIEjRZvC1n9jiQQ30ToHz6iwUuXPp1M3IoFbGSiXIGT3S7kU06GSNLdC/Gg
GyLlSz19MbrlS+5M/eOoiDSzdFsols7KRUHZgQ==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_07", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QOAv6hgg2uUyzVyjjzaQmPTY5dhXAUfcUBCJUFilaaqM3kqJ+FkcpRM7tvZjDSMhFecKhopAbkz/
rGMgrR8bJRxjqIocBbCbtsQem9xDaE8xh2FzTNbW4VY8sKWf/VE2pM1AuIFs6TmQxNO8JSXBNq6R
TpQ6eZpuJIyUfHzeU23RjSgbXVYHcVO0gC/FtYlC8WZ8dgSJVtm+Nl+7MJygiRtpZNQBi855U7Wb
Hbn4bwen5+sYHfsEgjVCsL3b8WcoR0MKazlcqczW2Wgxuznd+bTwzPVn74NRUKD5/Af1HfRSKLnp
V6fsTZux6+coqowKGe168tKBzCVkubD5/C+5uw==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
kzX1H0x57lHCyIENnsaVX1gx51DpxvjirURUu+06WzmwPFpjjXGN5GGWxP7ZjZtyHDNqHiIJp2X5
AjyK0fboMbPcsHvAYnjxA3o78DRY8mDfpITVzFS2+irUiOyFjp2WVsgAAvw7QFK0mshhTfsG9zwY
fHuf8ZS8LyToXnCNNe7QU+3M00sNLqacemjAJyZiR2eIdwXyaIGZP0FxOYAlpUaU1g+QGZ+Uk2oH
n35h33L90dkMj72BgMpD3ejivS31WQr4APr0yS5NGLEc1sqgoUg5K+O3TRM7/AcomBQ40GzWRG38
3zVOV2ZoA2V6uFAS09J6N8x2x6l2UsX98KMTnw==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
yVVEr7mNuvyG9DPvKAMCqZmrpmUv6VsuwPFJgMsyFgb9Rlbqz5Ykq8aQzOuThmAo8yoZhSITKm4I
jruKwjXwzBNMppxubmcPEyO1fBvHu662Xl3iHWXYMh26gO08F+QdQTmNamv0OxoBpZ9JO4E/jiXU
m1/fk9UDfdBbb6oXE8hOMaRrhIfoCUGtgXx65uyFAtTJA63U2lbMHXVdBDXkW8Zx2HuGB2rRTGIX
vlr4ncfpStACOIiP2j01FwLlFlFIML7jMtjzWqZ3slagW0HBkDdGj7cSc1TO2NX6LMeJq9SyjVvg
GIaLTSu7B65L723ZfZHqO9NFMfksVz8xbj2lBUH3FjP+320KAzr4deRA/MOTUfwug04Q4jacYkyX
VsV1B4yiPk/VHhX/aK/IGvsYOKNpQBAubj8mI7JASi87Dd4PQaSW03GVB6k9r7I3PUvHJjFj7gxA
s/ETS1BrIjFmgyeocIwiOCZkaWyZzzt/qiJ4rNuTNlNoYERHehquyi3o

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
nccyD12xuxM1OzVnlJB15tgIH3zS0MbtC49mfCzzzTw4h0h9/BeP4hpTMzK2GRl1Q8LMw5UR+CCs
NLT0XgqT9jMfkn8UgWrRrJDUI1JgB8Ok8Eb7jqFwM9MwOM67yHXTmBU0xFFyB8lALiebTTNNWLQq
5Ugx/vy71o2mrJ5/Q/bDmVUM0GeUgJopOw3Su/kqWSf6ID7Fyu8AwlZ8xO+3xZTtg5b+pX4AZTvx
NLmYX1Tz/QQHy+yF39jpWpcX1zbjvmlZqQYtFhg+46xsX+6LlH52asuZrtzngJAiKA2c8WFbGd13
nbCsnXXQCNcEsbw6hYrwOUR7dxU0nPRSz8vcAw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
C5Yv+Bx0leAGeLVDBUToKvgGotf8cVLIUbktZAFGL4Uf3oum++hqdmdea9GgexkzgIdcnrBS2JF/
Pfay/eXIwgQyc9GrxtZEFCqnqUfGDry3KIclf5MWt3llsOwukKvgCtniYdHgo2hdQ6HH5RHNLHUQ
b9m7xODRb/ZoSwrS212VXiyBQ8N7plZ1Bz6grrh5UOgKx1MusgKRusxxkI6jTVRuSE7uZ57Cx0u0
ExDogu4BW0XjOTow1rGe/ovKd9i+KScycY+HyzsjkfYyAqS3RDybzHTMKgB6PyGa16T5vpDCEeqD
vgJb/33vDXKxNrf67xnpIwCBytHx7tAhozJYWQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
IRfZsfpn7BZP5f78lkCuUcoPsG3fHAzsqmrJ65EBMLM2l2pN6Rlf3PwWNmx/ESocje9F0g1gH5+L
95SKYUk8dd9efOefyEvPbfemfGjM7OqMv6I87XCdgD2aHTiQIIWa/iYptT/MPEfB+mVQSZjmqiUw
EbPrPnhWCSC5lsH8ah2nqp93WAd69fju3LgAdmdupbT+qL3SZnq65ZD4j3/5UZWBdzYoCO6hNZ5g
qsqTjXVOC7hWVAmIT8XxjyE1yOGNYA1n3PgjmqDQKWQl1lxkxI5WTd13doueCfvQrWdoJfHJH7wI
L/3npFIPoMHQppEUaZq1wSRQ6sCUbAdZpy4/jA==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 7776)
`pragma protect data_block
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
KH6dav6Z1BiX83nA/AGSBvHBivwodYpO
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
