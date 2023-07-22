// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
// Date        : Sat Jul 15 18:08:39 2023
// Host        : DESKTOP-U9NB2CD running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/johnh/Desktop/IMP/IMP.gen/sources_1/ip/dsp_a_mult_b/dsp_a_mult_b_sim_netlist.v
// Design      : dsp_a_mult_b
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tfgg484-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "dsp_a_mult_b,dsp_macro_v1_0_2,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dsp_macro_v1_0_2,Vivado 2022.1" *) 
(* NotValidForBitStream *)
module dsp_a_mult_b
   (CLK,
    A,
    B,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF p_intf:pcout_intf:carrycascout_intf:carryout_intf:bcout_intf:acout_intf:concat_intf:d_intf:c_intf:b_intf:a_intf:bcin_intf:acin_intf:pcin_intf:carryin_intf:carrycascin_intf:sel_intf, ASSOCIATED_RESET SCLR:SCLRD:SCLRA:SCLRB:SCLRCONCAT:SCLRC:SCLRM:SCLRP:SCLRSEL, ASSOCIATED_CLKEN CE:CED:CED1:CED2:CED3:CEA:CEA1:CEA2:CEA3:CEA4:CEB:CEB1:CEB2:CEB3:CEB4:CECONCAT:CECONCAT3:CECONCAT4:CECONCAT5:CEC:CEC1:CEC2:CEC3:CEC4:CEC5:CEM:CEP:CESEL:CESEL1:CESEL2:CESEL3:CESEL4:CESEL5, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [23:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [17:0]B;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [41:0]P;

  wire [23:0]A;
  wire [17:0]B;
  wire CLK;
  wire [41:0]P;
  wire NLW_U0_CARRYCASCOUT_UNCONNECTED;
  wire NLW_U0_CARRYOUT_UNCONNECTED;
  wire [29:0]NLW_U0_ACOUT_UNCONNECTED;
  wire [17:0]NLW_U0_BCOUT_UNCONNECTED;
  wire [47:0]NLW_U0_PCOUT_UNCONNECTED;

  (* C_A_WIDTH = "24" *) 
  (* C_B_WIDTH = "18" *) 
  (* C_CONCAT_WIDTH = "48" *) 
  (* C_CONSTANT_1 = "1" *) 
  (* C_C_WIDTH = "48" *) 
  (* C_D_WIDTH = "18" *) 
  (* C_HAS_A = "1" *) 
  (* C_HAS_ACIN = "0" *) 
  (* C_HAS_ACOUT = "0" *) 
  (* C_HAS_B = "1" *) 
  (* C_HAS_BCIN = "0" *) 
  (* C_HAS_BCOUT = "0" *) 
  (* C_HAS_C = "0" *) 
  (* C_HAS_CARRYCASCIN = "0" *) 
  (* C_HAS_CARRYCASCOUT = "0" *) 
  (* C_HAS_CARRYIN = "0" *) 
  (* C_HAS_CARRYOUT = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_CEA = "0" *) 
  (* C_HAS_CEB = "0" *) 
  (* C_HAS_CEC = "0" *) 
  (* C_HAS_CECONCAT = "0" *) 
  (* C_HAS_CED = "0" *) 
  (* C_HAS_CEM = "0" *) 
  (* C_HAS_CEP = "0" *) 
  (* C_HAS_CESEL = "0" *) 
  (* C_HAS_CONCAT = "0" *) 
  (* C_HAS_D = "0" *) 
  (* C_HAS_INDEP_CE = "0" *) 
  (* C_HAS_INDEP_SCLR = "0" *) 
  (* C_HAS_PCIN = "0" *) 
  (* C_HAS_PCOUT = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SCLRA = "0" *) 
  (* C_HAS_SCLRB = "0" *) 
  (* C_HAS_SCLRC = "0" *) 
  (* C_HAS_SCLRCONCAT = "0" *) 
  (* C_HAS_SCLRD = "0" *) 
  (* C_HAS_SCLRM = "0" *) 
  (* C_HAS_SCLRP = "0" *) 
  (* C_HAS_SCLRSEL = "0" *) 
  (* C_LATENCY = "-1" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_OPMODES = "000100100000010100000000" *) 
  (* C_P_LSB = "0" *) 
  (* C_P_MSB = "41" *) 
  (* C_REG_CONFIG = "00000000000011000011000001000100" *) 
  (* C_SEL_WIDTH = "0" *) 
  (* C_SQUARE_FCN = "0" *) 
  (* C_TEST_CORE = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  dsp_a_mult_b_dsp_macro_v1_0_2 U0
       (.A(A),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_U0_ACOUT_UNCONNECTED[29:0]),
        .B(B),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_U0_BCOUT_UNCONNECTED[17:0]),
        .C({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_U0_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYOUT(NLW_U0_CARRYOUT_UNCONNECTED),
        .CE(1'b1),
        .CEA(1'b1),
        .CEA1(1'b1),
        .CEA2(1'b1),
        .CEA3(1'b1),
        .CEA4(1'b1),
        .CEB(1'b1),
        .CEB1(1'b1),
        .CEB2(1'b1),
        .CEB3(1'b1),
        .CEB4(1'b1),
        .CEC(1'b1),
        .CEC1(1'b1),
        .CEC2(1'b1),
        .CEC3(1'b1),
        .CEC4(1'b1),
        .CEC5(1'b1),
        .CECONCAT(1'b1),
        .CECONCAT3(1'b1),
        .CECONCAT4(1'b1),
        .CECONCAT5(1'b1),
        .CED(1'b1),
        .CED1(1'b1),
        .CED2(1'b1),
        .CED3(1'b1),
        .CEM(1'b1),
        .CEP(1'b1),
        .CESEL(1'b1),
        .CESEL1(1'b1),
        .CESEL2(1'b1),
        .CESEL3(1'b1),
        .CESEL4(1'b1),
        .CESEL5(1'b1),
        .CLK(CLK),
        .CONCAT({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .P(P),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(NLW_U0_PCOUT_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .SCLRA(1'b0),
        .SCLRB(1'b0),
        .SCLRC(1'b0),
        .SCLRCONCAT(1'b0),
        .SCLRD(1'b0),
        .SCLRM(1'b0),
        .SCLRP(1'b0),
        .SCLRSEL(1'b0),
        .SEL(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2022.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
hpQi2e575oxFDL0FfhJYpDn2Z7sr/nCnfofAXr4j6Wi2vcOZfA2l2OkTdSKknlCSp6IMPD0eHZFM
aqMcygijtcMSA03ISV3kqHHp6+6oDzDybrWzXpDWrpQKeOX5VzAspaQybgWvz7dCX6vIokYXlC1k
HUUc+Du4UI3rcjanmTM=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
l5Q7g8QwNFxeXCSTeheUamCwYPHM4YRouugZB2FHLf01oaJDP5uN23NV6E3v4oxWaqnwKPUJb6ww
S6HJw8IgqJ5bVE1Xxl9jan3gyYu6tvE3H7alei7rN4gPadbFjLwAOlT6rszsd8JmjY+RD4h43dTR
Zp7/llkBHrde+C2qQdNOUEnkeT14NQClMpKoSNITi5yQOix+5cI3q+T7Bqn65O7aGCfBgvuREshq
6Gfo74CtoCbwTuSUjdbmLYwI/MFnWOS6en7x+ia+WKqWj9YrWjfUCy8txj8hZjb4sCPQKFzN8UwT
nLeLrDWqea92fbJoN/EDhnmuuPBTW/1cBNBBlA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
YLmdwWwVwjwR7xxsZJO6nTeZvEpSyl5/kFiTBVICsMw7Wyk8IZioDZLx2d1A/HiRyrVNhlIRXScN
VrWPhFB2yYVCoJPXf0KqD1f50Y9dNOdsiZSkX+V5kuGZyPAquml/+eRBcgSZigDcNqhOBDVIVKUg
5MJsRWevOd9XaTlKW+U=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
cHrHwj/OHXOSxE2scD822kVW7wJExChuOsnxBy9RNdjkQgteHHV6YsvR0emQtlJ0GIZNiz11himX
S/ittbr8jl+aDkB03CHSCLjzLJk7xBdvkwTjogb4CJ9cZd5DvBCIIdqtba9zEzZfLzyhkLQySHma
JrNGvEFKiEPTG629+wy8W7rsXcMA0L8tC+NomPSJYkWzdCeAqRfAd/DyYStpNndscgPmfn2gc7q/
Fj2twMI6DAlvyACIArrTd0F5q4RwkwFHHeQ6aJPNrcj5o09ZDDyo+QRssr0nboYYK6iIjNKX4pQr
ejdysDKPOiVLgegrye5keqnwenqRzl3uJpV/6w==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
nnbbI+BwyID4XoMrizSDP+jbZllz3yV1mmv6KNslMVw0sxrXKbrk408TmRsjvNSSuvhV51xndPA2
FU/wKzy7/AMDxbCMLjCG3u6MmyP2CX0pkDA3BTOIP1RCGzoDoEb83gFGy4nFfeR1pJFfhq9ds51u
juJObeDYjLjaaSktbcxa2wjR8foiPfeQsrERLidvnNNkPysqj7W5ZcFAw0ZPMd/v13jyfN/jqn1i
QmYQT4M7dy8otwubi6E5mHTAgo3FK9AXEahtK94r4/ZYi/nn0T6yS29la85vqokrwRum3oLIDWW4
RrHLa8e7Pot3ZVGSSDWbMhExi6pkElaBXKnLsQ==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_07", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
DAVdpP5vGcRTzrsFkjJ/uBmxnMYLnU6Yd1VGi3fICAEptToeKbjoM56Fqf/3+Cfd8mfBpvgkqcJO
pfY+YpKNjL2yDpjlxxyMkEha+w2YGizKz0pAEtp70R41DcKB7TvEJA7tJYxqftSlwsGGvwPUrYMC
nbXyJjNoHZ2Ll4Ozu3UZTmP03QzndDIDfmdippWBWBHYOjJtPviLjF1/hizxHax1JTVRawer9Qjr
HVuUQeDxcxrsc02s9iZ/r6iZWZQDgBP5bsxT8EeY4hH3/P58fA9+6lZu6oVDvJeudszCZD1TgyY2
KuYShAnut6vR6Ik+oRDL3Hrp5SQoaOCW524EgA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
cKq1TGNuFnDKKcBOyi8e1K8ly+eMeHwVdchpbd+bxxXMpqSnkHpq5kg4iZw9cOYtpKuvS93u2hah
ZNVZf+4AH7FVHFnFtRlIXfTsZnd5cE411yuLelJz1nvpouBPk7pt4Z/iOqTD48yppmHZkkqCOu29
ESLnvCcvKtfqQCX0+hx8dGU2iXc8AovJo7YCt39ZO+Xjc1N6WfC6UJyy/KkYF1qcgNkPu0nKcBwg
JCpUlwfdmeO4oAb0dJxEVi3AyWCWb1zGThxsmDj0x6jY/ymMeDRNma0QdAWnClawUQy80EPah4x3
J4u57yx6daysrYXraEuhL1xsZb4XFB+14K6Njw==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
Re5fDPZ8EQVPdNEo11DCLuZaBRdc/VJLcPQkEfqHqXr8o7UCTkVHRnYup0/sMrR05rUbcVrX+y26
Zm7KX2M2vi9JNxUdyt8DzqkHtoWjd8ox70Md9MGyYeK44bwvM8my4DW2Wm9Lk9226xF4Qa0n3IIl
lQZWxrNI6H9XjV/BNrqFj+kBeNadHP5ihUPb2EmxXSwdgLkT1zMcUhQaMDxOBzIuAbkRYta/q8za
AzYQt1W3dqFUaiUUjlCj9fYcR8ZBMFpbp3Apje8nX5mVtAmk75DBgu5i8CjYvqpT/iziDeqqtahB
/arsycohVQ1PiCF7Z8siPzsiQym0WVpsiwGZmrCyuy8bykKzLnvUGHATPxXLzSpbh8sZvrGIu0b+
hmoM0a1pF7D2SjJJWLZnJJbzkOramPWLCkoXbMc+KgHQ6OpD1ow3bhmMLg8ZbTRMgJGpfxDNkXyK
+Skb1VkCste5U4nHFrKo7krNZZ2/wytN2CSUdkzF1wfY+K/4CzgnUCs2

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
XVWUvZ/UpZ29GMy3XnymX67etmlfLX1Nc5lDCe3Fkh1pzSH0ihbTk0WE9uNfxhCf8deTSeul9LJH
AFPTiQiwkrIU9UQwnfo2xygbWbM3s3AF164xHmX2eegveVO7/ody+W2VwPqhx0nJzF7H2mOI+gFd
H9ZbDirzJXmOb6XX4H4UPFI2jCKk0g8k6n9hkO9ubyQWCValHZ4jd5SyFcQBUKMRosgR3zEL/FrT
9GeJty67V/+tdnWLZB42pnIHq13SObBDE6IhE6u0tLa6y0E5k3ZGicrRPFS2UKq7MQhtPlqMAqv/
4JCNyt5Ii3Brz3T2/Q78DbSBTS/xrLj8akB0xA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Vi4OGfDJfZqEmBrQEGza868zNnV5YM1xvTPq00I76PkQuYVk32RXQDhh0/IYKtu8XMPjK/TITxuH
69CHGJ/keAQQusJj/kMi3nRRuDcL7AlvfW7uPcMM+3UOKjY9TjvCvLo7a5ZRKw7QYQjlSRSPUUMU
XhgD/uuDjDxhskW3KEfT53bnHfyQN++EOJ7jXrhA/FX4LnAg7uCRckhEifaLCuIYOY6V0Y9VGS94
FDzPQjAKYHLYnMxFgjRyFou7TY4adXo3KRdWzMoYkzxVoeq2q1Q0VyR+cl+QThr7VdXX8DS5IIZM
5iVsi1NxCzc7nkd67Vu+UlvU02u6vPvzoncORg==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
yVglLrndMnC/XwcwYVhWQSqo2QsmpflvKLvyrCb1jUH/lOEGSbcLoSM/6KPsM2jqkPpdC3wvfyQk
yaOff7MW4EKVY+ko0Yw7uhWxjPWGbhIGhZuSL+VFOBf2AEfYa7jLmiNyBus0k4o6YcALZoP8AbYr
WGWsYZMc0zYfwPKFwyZXeVAPJForHQzO8pukopRWnSojzpMv1fRZTjbuL8qg2kxuTeYIVjcqvJdM
KytNwtB8qpNj/by03sc4RsLUxuhdUOkhdwcpM6IjdIsduOMZ+WYi/2fc16qvBPc5vvHbb8E9G84x
Et+nJglHHl2uLto5KzfJYDGYfRqyAtrDedSPzg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 48256)
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
