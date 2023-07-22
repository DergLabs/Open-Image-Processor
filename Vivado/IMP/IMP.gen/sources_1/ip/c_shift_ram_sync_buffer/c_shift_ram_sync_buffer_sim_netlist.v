// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
// Date        : Thu Jul 20 03:08:29 2023
// Host        : DESKTOP-U9NB2CD running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/johnh/Desktop/IMP/IMP.gen/sources_1/ip/c_shift_ram_sync_buffer/c_shift_ram_sync_buffer_sim_netlist.v
// Design      : c_shift_ram_sync_buffer
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tfgg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "c_shift_ram_sync_buffer,c_shift_ram_v12_0_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_shift_ram_v12_0_14,Vivado 2022.1" *) 
(* NotValidForBitStream *)
module c_shift_ram_sync_buffer
   (D,
    CLK,
    CE,
    Q);
  (* x_interface_info = "xilinx.com:signal:data:1.0 d_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME d_intf, LAYERED_METADATA undef" *) input [0:0]D;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF q_intf:sinit_intf:sset_intf:d_intf:a_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* x_interface_parameter = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_HIGH" *) input CE;
  (* x_interface_info = "xilinx.com:signal:data:1.0 q_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME q_intf, LAYERED_METADATA undef" *) output [0:0]Q;

  wire CE;
  wire CLK;
  wire [0:0]D;
  wire [0:0]Q;

  (* c_addr_width = "4" *) 
  (* c_ainit_val = "0" *) 
  (* c_default_data = "0" *) 
  (* c_depth = "44" *) 
  (* c_elaboration_dir = "./" *) 
  (* c_has_a = "0" *) 
  (* c_has_ce = "1" *) 
  (* c_has_sclr = "0" *) 
  (* c_has_sinit = "0" *) 
  (* c_has_sset = "0" *) 
  (* c_mem_init_file = "no_coe_file_loaded" *) 
  (* c_opt_goal = "0" *) 
  (* c_parser_type = "0" *) 
  (* c_read_mif = "0" *) 
  (* c_reg_last_bit = "1" *) 
  (* c_shift_type = "0" *) 
  (* c_sinit_val = "0" *) 
  (* c_sync_enable = "0" *) 
  (* c_sync_priority = "1" *) 
  (* c_verbosity = "0" *) 
  (* c_width = "1" *) 
  (* c_xdevicefamily = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  c_shift_ram_sync_buffer_c_shift_ram_v12_0_14 U0
       (.A({1'b0,1'b0,1'b0,1'b0}),
        .CE(CE),
        .CLK(CLK),
        .D(D),
        .Q(Q),
        .SCLR(1'b0),
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
mk8X+1phlG7gw5lY+0LAeU0AF/iAy2yTqODKOZ+7hPcXXpDUocMKKYf9jYw3C7aA8t+JxXRYYaa5
n0M/80c8fb+FrEPsLSqnlQJjq/c+vLvPGhC7mxrsPAMoQxMwQbo8b05c4AuERPjIRlo0/j0CP2B+
Hy1Ea0iMhSheAJKsKgQ=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
K0lYMeHVJ211v8tLKMnvdSgt7jx5QkpszqOGWq86bxE6ihwrznb0ejyLiuNnXxq4J3jGnqcmojfd
CFUUznbZXt4C+kAho9Yi79CskMlRDt7os4ZW7qM35HmFFPeFE2Gm46OAQOMmFiBykrurqt+WtqiG
wEWWSlxiJm04VkCTdCk/2cqaU1tXHH7VZ4EPVRHy8S8pxaMol18S5UvEzhNqerEEtQE+qF4rLFyf
DcWD/s/ppZNfvxFgCdUxsCCCeBQvoVLHtS8rRI1+yTe9LhU2HlzesafdCJunVWFgj15m5CNg+y28
+QyDEvtCXGiczH3aNFulDUKAT9T4RA8cuXg/VA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
WyBsSe9xImpII09lemPSXEFpdH/7CQMoaEgyNHs8YMamjk1D+QlQe34c5P8pvujthlNA+3SSD4yK
8CAnPRW4MPCDLTYZFIoVIj0pW3KJA71DOYVBYIrj3zcgikJ4o4mazFZ/ItLh7v2CcKZFJVwjY9mh
81egVp8Tvgz4i5hJmXQ=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
KtHM7+OZ+pV++cr62yXVz8bzlvBhPEp3ai9HkK3pxYsQ6ARnlEJtaDwTleFUiArLXwQzK2OEBjk+
SFLfWh3/Nw0YzjdynXjfew+Ab373Xbwr778/O4zgRwxsI+clNecwXxfQoh9YKSvhCVhxwEXhGR21
xXdk1CK2kW48Frj+rUUP8kuthZlbuOLNav2+1I7F/BFtv81AeIMlcFjZ4ls6dCVcz0rWG8q5CkRA
v0IZ7ooKjGVnznwLYyxcnxmEQxB3I5f51FM5GZXBNT+GpqaKUOjXq/1Df2RzF1vwNBYpvZPkLcgV
VzxvRDhz09vQhRyQZPnu/eUrPTc9dLyGe4ADMw==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
FXfiKuPqRSw7HIHYCHu4toA0seCy9p9uq2foLR5gDWufAXX5R+bCEVt87JHY4LwPS+X72MAWgban
AhrRb3BJyw4Zo/kQJOnYc31YHZm9kuulqi1B9XU+nseZ5gRmiu9zr83lBKJRGzbWgSNcxdP2Eefg
MVEeVu5Tv4OBdjr9r2uyMroFvijlSLt34WYcja6+YSpxS/RlT5IrgixRsKYvA16AcsxOnffekbWU
PKX22FZZ7xGfNjlXGBZRK7Ml9ymIClz9Oh03jagNJMj705STil4jpHxalzF4bNCKDjwgSYsUvxiB
OShc3ZfopV1fgYZiinc/tdkpaaQcAAiVN5YlOA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_07", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
LNa/GGFd7zHi9Yl4lg3TqNZSj4WniZo4rT5Rk8hLDnubvd6g2ijrPkX6NhgnHANfd+I/z3RYvamM
uuywOG5uDnt7r9YPLSsC2QN/TTWOsZyN79m2UiJEXIBGGpfHq+2KvjVBNGaj/9BII9C+sETrzA+x
ZKi8rOaRg0atWctfTK1DPkIS0cK2bHua78Bcd5aiIcc0UDzeOuUB0xBNxLOVgTAR8h+Sya3ZKNwl
qgF5+esnkeyL93lEJA8vi5Z+IG3bTvYnPKvUZ2Cg9ppIkZQI/Jh1cpmcEG4nSYBIRzfL5vsJpMCd
iDy6Wabo19vt+Ge89GqFYVoroaRW0pMQqCbduA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
g8wLsHyZo7i/daKgYHiCq/pD+wAhQybzOe/GtcDDb+gtdPdZymgZEkJDAq8YvBm9S1l+qNYevJXL
1ATnhjGZQJEoBjvq2umErDd+xL762C8ieFwnd/VSDUmXMsLffZwDPUwMfSLkn4pA2lAAbT/5FL92
BTn8jcQfP/hJ5PWeZEFQOdWXrJirhPgbE+o3AFO5kD9RgDnr5hFQCOI0//BORpBVsLUet4RPXIyc
2JbMVH94v0l8evlZ3xYdJi5ybgHVIBRGgGpWii0W2hcBR/oS7a6LBRzhRXsbV3BWqzx2cDfrPEC8
M+xxlKChVwZ6gjZ6lLkHDPZIQAPWvxGoHa3MsA==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
hvk27LOgH7Dr8x9PxKCCetHqEHRrm5ErWwHzddiu1x1qwN2iwo3lzAYBccZXcMZCC8+2b+qoxQoz
79jQN0NDie/XRC37l5cpVeHlGBSw1BnfdgzQC9HoS9zfOA5ZrMycW5qYKvPkrpFyGr9Hiyyi0Q6t
QbGVGegGnnMl53fvYt2j3NXrXOKOr3aYBfnyu1tU4iuCapEG6xNH5mhrD3TzMnsH8L/qETK+bYzs
S+mBod8huV5kthm4Ef4HzoiWdlyjww1KiDG+UQhoAAg2NK1uj0syjfvZWGYSnY2eAB0rV+ApjptM
jJCOFarpgK4lFEigj97cRFveeeuJ8di1G6Z0h51eO/XgeLMVvY2EWvAVU6fIvLubrvLvEXSOJM0W
am8K+nUlvwnmSwhtKo902Kl7zvawjLFB3ET9wikDMQUrmUT4dgomDTdIKW+IuGIPJ3637UB5Vjc2
tMQ5bqJZGBIVM0dmyX683MAaXg+INTKk+iO6eu/Tz1alGFl7p4KT2C6C

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Jq5j6wObV/zfjrx9kI+45oAjCZDuELSiaD+MB51gC2fhob27GZlRKO4aiOx46Gdy+psoy4aSffEX
S0clEPAfCNUpaCF5ylaruHxqLfhenSOGwrCSGmTa/QiAdche2v182iJxjM1qge/5/SKARyAAQOXi
Mvx3eVO3iyTqQu+w8LxUEeSnQF47euh9/TKZ5GEentCCxhxZoQ7ZnB1XeyIeITNLTL+4XYl8PBXM
jzyTd66DwEncZ5pCe/5Ql9MkFzAsHO9KvN2+vvIUUt/X4q5/+k3vclbF9BAcc6RWfYjD73Ky+xqG
TePbgaw8vKO0iUpW/EcxiRfBZAjv/+sK2fCn0g==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
TWCmDtJj3ZoKLy6QGULbi4X8j/Gog/9pe//mKWSPsJOknrZVFsP2sIi5QBWTd0GS0fWdSK+abObg
6yTfd1NXzXKWRrR+0rjEy8kaTBdlqay9c6Y2hWQK5uRBm3XeEFXHoaFfnpj4trwC3l9CcE5lKn/r
jLAWJlHpUWfRKlP+h4jHSFrbNKg6jyX1dD32LXAarjNfRyS0hUoQ4wRaP4usbMtY0TBoCigXoL3w
rKHMDGK50jRMXN5YlVJVoHdXJCBc98XAj9EOSY1tZy1st1t8nh4jt62NbOJ3o0J22DqcnWo/uoex
KRoIYRQkWars86F686SVJ8QIMo3jblCFLqHzsw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
3PvCTAnV5mgdu5umFgBRE09Am5ase1R0MK0mMNnvREv75Kc4OLUE/7TtIHX2umOgPr0uYXu7gYXX
d0fkkWwL1B2TzI+FlSSPbDJoizFHdJDffQkAgNh0ooVrJ9NzsEHjBMnZ3E66oThZ7PjQjntB8YRo
ckeLQybEvzLoW6u842PqB4BnylOOKoIPVVixFhOe0+cimpvUL59GA+uaAQIZIPJDQrTKT23D611U
zjXFAabS/pjOVbe3WM/oGoTcUcI3HLqdXqppdmFA55MIKNISEXr7dTOyykssLxeAgptU0kSBdOJr
gu5ZnB6yqJ/am2dU6t7agBAuuHVBA91TVbODYw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 7760)
`pragma protect data_block
+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
mYB2bLvpqyY=
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
