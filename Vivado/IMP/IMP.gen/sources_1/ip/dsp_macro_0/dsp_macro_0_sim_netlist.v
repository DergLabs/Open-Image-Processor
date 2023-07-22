// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
// Date        : Sun Jul 16 03:29:33 2023
// Host        : DESKTOP-U9NB2CD running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/johnh/Desktop/IMP/IMP.gen/sources_1/ip/dsp_macro_0/dsp_macro_0_sim_netlist.v
// Design      : dsp_macro_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tfgg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "dsp_macro_0,dsp_macro_v1_0_2,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dsp_macro_v1_0_2,Vivado 2022.1" *) 
(* NotValidForBitStream *)
module dsp_macro_0
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
  dsp_macro_0_dsp_macro_v1_0_2 U0
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
Q8HXFSSleK+7gXpfNH6FQRvlDebNzdCWgwWg6T4eRO9GSZSzfL+SILE+sFXtY0b0X98Qgt6hOcw0
O3X6EKiBiPslk0HeiYUmvSh4qABAEpwv8skJ4LPfF6cHqz2KQ1lyByew0AkOn5gskRAq7FxUTxKV
Ao29ZZTce8NMj//SgmltiFXVqLIDD870F/1jtH3lp3522MXN4dlukkmqcRCHXA1oRvei99PG9ff9
fOUk41Op0WySGBWAB9Ax6WGq4ZH1Ekjrwb5C3z2VbSxq3lOxqIt4advPJb2+8Iwm4u2yzxSf0Jjp
kjvD8tWcceMBogaOr+hYq4NNUmmxnN8s/HGBYw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
13yL2RoCyq59MiFF2PRp3/PVJenyODBpkaBNUiDIQyoLya7pxLayrOfTAa/HnZ6+6ucvRhT4JWWB
vRZlva/NBMR7L01XoTnZFi2aDr0Fyh09nvnLoWYq+uBizTUziG0QxX7Ccnj8P+Yh0ydW3wbpl7U6
To4CmrTi5nyY3CXria0DwfBo4gKj6o/fkrfv11TOT/kIdUhf6vtlS/3SQmPgLX2ZYO/LBWW4zGx6
EofmD7S4HecgYyxGOgg1Knkz6BQntGN66IkgYyLhSy3Y2vC2Fx2PoCFqb+zqRa9JmFhaZguOyOl6
L003XkfpzER4s+VNlytk+xmBjUjz2OP/1QQ8OA==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 48240)
`pragma protect data_block
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
ScF5IV4+Edg97sQmWjCW7FHA
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
