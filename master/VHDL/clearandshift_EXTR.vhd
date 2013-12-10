-- Generated by: xvhdl 2.49 31-Jul-2008
-- Date: 3-Dec-13 12:07:44
-- Path: /home/sandervandijk/EPO3/ClearAndShift/test

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
LIBRARY CellsLib;
USE CellsLib.CellsLib_DECL_PACK.all;

-- user directives added from .sls2vhdl


ARCHITECTURE extracted OF Clearandshift IS

  SIGNAL n231: STD_LOGIC;
  SIGNAL n365: STD_LOGIC;
  SIGNAL n259: STD_LOGIC;
  SIGNAL n260: STD_LOGIC;
  SIGNAL n261: STD_LOGIC;
  SIGNAL n_shift_row_2_port: STD_LOGIC;
  SIGNAL n183: STD_LOGIC;
  SIGNAL n228: STD_LOGIC;
  SIGNAL n230: STD_LOGIC;
  SIGNAL next_state_1_port: STD_LOGIC;
  SIGNAL n364: STD_LOGIC;
  SIGNAL n200: STD_LOGIC;
  SIGNAL n332: STD_LOGIC;
  SIGNAL n303: STD_LOGIC;
  SIGNAL n333: STD_LOGIC;
  SIGNAL n306: STD_LOGIC;
  SIGNAL n337: STD_LOGIC;
  SIGNAL n201: STD_LOGIC;
  SIGNAL N_55: STD_LOGIC;
  SIGNAL n335: STD_LOGIC;
  SIGNAL n334: STD_LOGIC;
  SIGNAL n336: STD_LOGIC;
  SIGNAL n186: STD_LOGIC;
  SIGNAL n301: STD_LOGIC;
  SIGNAL n210: STD_LOGIC;
  SIGNAL next_state_2_port: STD_LOGIC;
  SIGNAL n_shift_row_3_port: STD_LOGIC;
  SIGNAL n182: STD_LOGIC;
  SIGNAL N_58: STD_LOGIC;
  SIGNAL n309: STD_LOGIC;
  SIGNAL n222: STD_LOGIC;
  SIGNAL n254: STD_LOGIC;
  SIGNAL n253: STD_LOGIC;
  SIGNAL n202: STD_LOGIC;
  SIGNAL n311: STD_LOGIC;
  SIGNAL n308: STD_LOGIC;
  SIGNAL n269: STD_LOGIC;
  SIGNAL n221: STD_LOGIC;
  SIGNAL n_row_1_port: STD_LOGIC;
  SIGNAL n255: STD_LOGIC;
  SIGNAL n256: STD_LOGIC;
  SIGNAL n267: STD_LOGIC;
  SIGNAL n268: STD_LOGIC;
  SIGNAL n_col_2_port: STD_LOGIC;
  SIGNAL n_shift_row_0_port: STD_LOGIC;
  SIGNAL n211: STD_LOGIC;
  SIGNAL n203: STD_LOGIC;
  SIGNAL N_61: STD_LOGIC;
  SIGNAL n300: STD_LOGIC;
  SIGNAL n212: STD_LOGIC;
  SIGNAL n_row_3_port: STD_LOGIC;
  SIGNAL n213: STD_LOGIC;
  SIGNAL n184: STD_LOGIC;
  SIGNAL n286: STD_LOGIC;
  SIGNAL n329: STD_LOGIC;
  SIGNAL N_64: STD_LOGIC;
  SIGNAL n219: STD_LOGIC;
  SIGNAL n317: STD_LOGIC;
  SIGNAL n204: STD_LOGIC;
  SIGNAL n287: STD_LOGIC;
  SIGNAL n330: STD_LOGIC;
  SIGNAL n338: STD_LOGIC;
  SIGNAL n339: STD_LOGIC;
  SIGNAL n214: STD_LOGIC;
  SIGNAL n288: STD_LOGIC;
  SIGNAL n181: STD_LOGIC;
  SIGNAL n206: STD_LOGIC;
  SIGNAL n174: STD_LOGIC;
  SIGNAL N_67: STD_LOGIC;
  SIGNAL n314: STD_LOGIC;
  SIGNAL n272: STD_LOGIC;
  SIGNAL n191: STD_LOGIC;
  SIGNAL shift_row_3_port: STD_LOGIC;
  SIGNAL n313: STD_LOGIC;
  SIGNAL n185: STD_LOGIC;
  SIGNAL n_col_1_port: STD_LOGIC;
  SIGNAL n_shift_col_1_port: STD_LOGIC;
  SIGNAL n_col_0_port: STD_LOGIC;
  SIGNAL N_73: STD_LOGIC;
  SIGNAL n218: STD_LOGIC;
  SIGNAL n190: STD_LOGIC;
  SIGNAL n280: STD_LOGIC;
  SIGNAL n205: STD_LOGIC;
  SIGNAL n229: STD_LOGIC;
  SIGNAL n344: STD_LOGIC;
  SIGNAL n281: STD_LOGIC;
  SIGNAL n328: STD_LOGIC;
  SIGNAL n341: STD_LOGIC;
  SIGNAL n207: STD_LOGIC;
  SIGNAL shift_row_0_port: STD_LOGIC;
  SIGNAL n342: STD_LOGIC;
  SIGNAL N_70: STD_LOGIC;
  SIGNAL n282: STD_LOGIC;
  SIGNAL n343: STD_LOGIC;
  SIGNAL n176: STD_LOGIC;
  SIGNAL n189: STD_LOGIC;
  SIGNAL n192: STD_LOGIC;
  SIGNAL n_shift_row_1_port: STD_LOGIC;
  SIGNAL n283: STD_LOGIC;
  SIGNAL n258: STD_LOGIC;
  SIGNAL n180: STD_LOGIC;
  SIGNAL n263: STD_LOGIC;
  SIGNAL n299: STD_LOGIC;
  SIGNAL n319: STD_LOGIC;
  SIGNAL n249: STD_LOGIC;
  SIGNAL n351: STD_LOGIC;
  SIGNAL n266: STD_LOGIC;
  SIGNAL n264: STD_LOGIC;
  SIGNAL n320: STD_LOGIC;
  SIGNAL n340: STD_LOGIC;
  SIGNAL N_76: STD_LOGIC;
  SIGNAL n273: STD_LOGIC;
  SIGNAL n289: STD_LOGIC;
  SIGNAL n321: STD_LOGIC;
  SIGNAL n_shift_col_2_port: STD_LOGIC;
  SIGNAL shift_row_1_port: STD_LOGIC;
  SIGNAL row_1_port: STD_LOGIC;
  SIGNAL n175: STD_LOGIC;
  SIGNAL n193: STD_LOGIC;
  SIGNAL n265: STD_LOGIC;
  SIGNAL n208: STD_LOGIC;
  SIGNAL n348: STD_LOGIC;
  SIGNAL n285: STD_LOGIC;
  SIGNAL n349: STD_LOGIC;
  SIGNAL n350: STD_LOGIC;
  SIGNAL n347: STD_LOGIC;
  SIGNAL n274: STD_LOGIC;
  SIGNAL n238: STD_LOGIC;
  SIGNAL n216: STD_LOGIC;
  SIGNAL n298: STD_LOGIC;
  SIGNAL n224: STD_LOGIC;
  SIGNAL n327: STD_LOGIC;
  SIGNAL n188: STD_LOGIC;
  SIGNAL n276: STD_LOGIC;
  SIGNAL n179: STD_LOGIC;
  SIGNAL n277: STD_LOGIC;
  SIGNAL n209: STD_LOGIC;
  SIGNAL n346: STD_LOGIC;
  SIGNAL N_79: STD_LOGIC;
  SIGNAL n234: STD_LOGIC;
  SIGNAL n307: STD_LOGIC;
  SIGNAL n270: STD_LOGIC;
  SIGNAL n315: STD_LOGIC;
  SIGNAL shift_row_2_port: STD_LOGIC;
  SIGNAL n354: STD_LOGIC;
  SIGNAL n278: STD_LOGIC;
  SIGNAL n290: STD_LOGIC;
  SIGNAL n236: STD_LOGIC;
  SIGNAL n194: STD_LOGIC;
  SIGNAL n235: STD_LOGIC;
  SIGNAL n305: STD_LOGIC;
  SIGNAL n237: STD_LOGIC;
  SIGNAL n248: STD_LOGIC;
  SIGNAL n316: STD_LOGIC;
  SIGNAL n240: STD_LOGIC;
  SIGNAL n352: STD_LOGIC;
  SIGNAL n353: STD_LOGIC;
  SIGNAL n262: STD_LOGIC;
  SIGNAL n225: STD_LOGIC;
  SIGNAL row_3_port: STD_LOGIC;
  SIGNAL n241: STD_LOGIC;
  SIGNAL n345: STD_LOGIC;
  SIGNAL n284: STD_LOGIC;
  SIGNAL row_2_port: STD_LOGIC;
  SIGNAL n247: STD_LOGIC;
  SIGNAL N_82: STD_LOGIC;
  SIGNAL n302: STD_LOGIC;
  SIGNAL n291: STD_LOGIC;
  SIGNAL next_state_0_port: STD_LOGIC;
  SIGNAL n246: STD_LOGIC;
  SIGNAL n358: STD_LOGIC;
  SIGNAL n310: STD_LOGIC;
  SIGNAL n232: STD_LOGIC;
  SIGNAL n257: STD_LOGIC;
  SIGNAL n252: STD_LOGIC;
  SIGNAL n331: STD_LOGIC;
  SIGNAL n_row_2_port: STD_LOGIC;
  SIGNAL n318: STD_LOGIC;
  SIGNAL n359: STD_LOGIC;
  SIGNAL n292: STD_LOGIC;
  SIGNAL n304: STD_LOGIC;
  SIGNAL n_row_0_port: STD_LOGIC;
  SIGNAL n355: STD_LOGIC;
  SIGNAL n356: STD_LOGIC;
  SIGNAL n242: STD_LOGIC;
  SIGNAL n357: STD_LOGIC;
  SIGNAL n217: STD_LOGIC;
  SIGNAL n199: STD_LOGIC;
  SIGNAL n297: STD_LOGIC;
  SIGNAL n243: STD_LOGIC;
  SIGNAL n187: STD_LOGIC;
  SIGNAL n293: STD_LOGIC;
  SIGNAL col_1_port: STD_LOGIC;
  SIGNAL shift_col_1_port: STD_LOGIC;
  SIGNAL col_0_port: STD_LOGIC;
  SIGNAL n279: STD_LOGIC;
  SIGNAL col_2_port: STD_LOGIC;
  SIGNAL n177: STD_LOGIC;
  SIGNAL n295: STD_LOGIC;
  SIGNAL shift_col_2_port: STD_LOGIC;
  SIGNAL n251: STD_LOGIC;
  SIGNAL n178: STD_LOGIC;
  SIGNAL n275: STD_LOGIC;
  SIGNAL n296: STD_LOGIC;
  SIGNAL n223: STD_LOGIC;
  SIGNAL n294: STD_LOGIC;
  SIGNAL n312: STD_LOGIC;
  SIGNAL n245: STD_LOGIC;
  SIGNAL n233: STD_LOGIC;
  SIGNAL n239: STD_LOGIC;
  SIGNAL n363: STD_LOGIC;
  SIGNAL n361: STD_LOGIC;
  SIGNAL n244: STD_LOGIC;
  SIGNAL n271: STD_LOGIC;
  SIGNAL state_0_port: STD_LOGIC;
  SIGNAL state_3_port: STD_LOGIC;
  SIGNAL n_shift_col_0_port: STD_LOGIC;
  SIGNAL n250: STD_LOGIC;
  SIGNAL state_1_port: STD_LOGIC;
  SIGNAL n323: STD_LOGIC;
  SIGNAL n226: STD_LOGIC;
  SIGNAL n326: STD_LOGIC;
  SIGNAL state_2_port: STD_LOGIC;
  SIGNAL n324: STD_LOGIC;
  SIGNAL n360: STD_LOGIC;
  SIGNAL n215: STD_LOGIC;
  SIGNAL n227: STD_LOGIC;
  SIGNAL n325: STD_LOGIC;
  SIGNAL n362: STD_LOGIC;
  SIGNAL n197: STD_LOGIC;
  SIGNAL n220: STD_LOGIC;
  SIGNAL n322: STD_LOGIC;
  SIGNAL row_0_port: STD_LOGIC;
  SIGNAL n196: STD_LOGIC;
  SIGNAL n198: STD_LOGIC;
  SIGNAL n195: STD_LOGIC;
  SIGNAL shift_col_0_port: STD_LOGIC;

  SIGNAL ram_out_int: STD_LOGIC;
  SIGNAL ram_addr_int: STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL ram_write_int: STD_LOGIC;
  SIGNAL score_int: STD_LOGIC;
  SIGNAL ready_int: STD_LOGIC;

  SIGNAL vdd: STD_LOGIC;
BEGIN
  vdd <= '1';

  ram_out <= ram_out_int;
  ram_addr <= ram_addr_int;
  ram_write <= ram_write_int;
  score <= score_int;
  ready <= ready_int;


  U271: na310 PORT MAP (n275, n233, n276, n274);
  U269: na310 PORT MAP (n218, n271, n272, n258);
  U261: na310 PORT MAP (n263, n264, n265, n_shift_row_1_port);
  U257: na310 PORT MAP (n259, n260, n261, n_shift_row_2_port);
  U252: na310 PORT MAP (n253, n254, n255, n_shift_row_3_port);
  U248: na310 PORT MAP (n246, n247, n248, n240);
  U245: na310 PORT MAP (state_1_port, n225, n245, n241);
  U243: na310 PORT MAP (n240, n241, n242, n234);
  U241: na310 PORT MAP (n235, n236, n237, next_state_0_port);
  U237: na310 PORT MAP (n228, n229, n230, next_state_1_port);
  U229: na310 PORT MAP (n210, n211, n212, next_state_2_port);
  U427: na310 PORT MAP (state_1_port, state_3_port, n365, n326);
  U418: na310 PORT MAP (n226, n360, state_0_port, n320);
  U412: na310 PORT MAP (state_3_port, state_0_port, n361, n271);
  U410: na310 PORT MAP (state_1_port, n360, state_2_port, n218);
  U385: na310 PORT MAP (n348, n349, n350, n347);
  U339: na310 PORT MAP (shift_col_1_port, shift_col_0_port, shift_col_2_port, n233);
  U335: na310 PORT MAP (n323, n324, n325, n197);
  U322: na310 PORT MAP (col_1_port, col_0_port, col_2_port, n223);
  U318: na310 PORT MAP (n319, n320, n321, n318);
  U309: na310 PORT MAP (col_1_port, col_0_port, n310, n309);
  U300: na310 PORT MAP (n303, n224, n304, n302);
  U270: na210 PORT MAP (n273, n274, n_shift_col_2_port);
  U266: na210 PORT MAP (row_0_port, n199, n268);
  U265: na210 PORT MAP (n267, n268, n_shift_row_0_port);
  U264: na210 PORT MAP (shift_row_1_port, n258, n263);
  U263: na210 PORT MAP (n266, n220, n264);
  U262: na210 PORT MAP (row_1_port, n199, n265);
  U260: na210 PORT MAP (shift_row_2_port, n258, n259);
  U259: na210 PORT MAP (n220, n262, n260);
  U258: na210 PORT MAP (row_2_port, n199, n261);
  U256: na210 PORT MAP (shift_row_3_port, n258, n253);
  U254: na210 PORT MAP (n220, n256, n254);
  U253: na210 PORT MAP (row_3_port, n199, n255);
  U250: na210 PORT MAP (start, n198, n236);
  U244: na210 PORT MAP (n243, n244, n242);
  U432: na210 PORT MAP (n364, n363, n272);
  U430: na210 PORT MAP (n246, ram_in, n174);
  U424: na210 PORT MAP (n364, state_2_port, n285);
  U423: na210 PORT MAP (n176, n285, n175);
  U420: na210 PORT MAP (n244, n360, n227);
  U415: na210 PORT MAP (n363, n244, n362);
  U395: na210 PORT MAP (n175, shift_row_2_port, n348);
  U405: na210 PORT MAP (n331, n321, n177);
  U391: na210 PORT MAP (n346, n270, n354);
  U389: na210 PORT MAP (n352, n353, n262);
  U390: na210 PORT MAP (shift_row_2_port, n354, n353);
  U388: na210 PORT MAP (n340, n262, n349);
  U386: na210 PORT MAP (n351, row_2_port, n350);
  U381: na210 PORT MAP (n340, n266, n344);
  U347: na210 PORT MAP (n296, n298, n328);
  U345: na210 PORT MAP (n232, state_2_port, n217);
  U343: na210 PORT MAP (n216, n199, n327);
  U342: na210 PORT MAP (n285, n327, n239);
  U340: na210 PORT MAP (n243, state_0_port, n324);
  U332: na210 PORT MAP (n322, n185, n200);
  U331: na210 PORT MAP (n322, n186, n201);
  U330: na210 PORT MAP (n322, n187, n202);
  U329: na210 PORT MAP (n322, n188, n203);
  U328: na210 PORT MAP (n322, n189, n204);
  U327: na210 PORT MAP (n322, n190, n205);
  U326: na210 PORT MAP (n322, n191, n206);
  U325: na210 PORT MAP (n322, n192, n207);
  U324: na210 PORT MAP (n322, n193, n208);
  U323: na210 PORT MAP (n322, n194, n209);
  U321: na210 PORT MAP (n251, n223, n312);
  U319: na210 PORT MAP (n307, n244, n319);
  U315: na210 PORT MAP (n310, n316, n317);
  U314: na210 PORT MAP (n304, n317, n313);
  U311: na210 PORT MAP (n304, n312, n311);
  U310: na210 PORT MAP (col_2_port, n311, n308);
  U308: na210 PORT MAP (n308, n309, n_col_2_port);
  U307: na210 PORT MAP (n307, state_0_port, n290);
  U306: na210 PORT MAP (row_2_port, row_3_port, n306);
  U295: na210 PORT MAP (n295, n298, n301);
  U294: na210 PORT MAP (n289, n301, n297);
  U302: na210 PORT MAP (n305, n295, n303);
  U290: na210 PORT MAP (n295, n296, n294);
  U289: na210 PORT MAP (n293, n294, n292);
  U287: na210 PORT MAP (n291, row_2_port, n286);
  U286: na210 PORT MAP (n289, n290, n288);
  U285: na210 PORT MAP (row_3_port, n288, n287);
  U284: na210 PORT MAP (n286, n287, n_row_3_port);
  U283: na210 PORT MAP (n285, n271, n275);
  U282: na210 PORT MAP (n176, n218, n279);
  U277: na210 PORT MAP (n275, n284, n283);
  U276: na210 PORT MAP (n282, n283, n281);
  U274: na210 PORT MAP (shift_col_2_port, n279, n273);
  U273: na210 PORT MAP (shift_col_1_port, shift_col_0_port, n278);
  U272: na210 PORT MAP (n277, n278, n276);
  U268: mu111 PORT MAP (n258, n220, n270, n269);
  U249: mu111 PORT MAP (n246, n249, n250, n238);
  U374: mu111 PORT MAP (n175, n340, n270, n339);
  U317: mu111 PORT MAP (n310, n318, col_0_port, n_col_0_port);
  U312: mu111 PORT MAP (n313, n314, n315, n_col_1_port);
  U299: mu111 PORT MAP (n252, n302, row_0_port, n_row_0_port);
  U293: mu111 PORT MAP (n300, n297, row_1_port, n_row_1_port);
  U288: mu111 PORT MAP (n291, n292, row_2_port, n_row_2_port);
  U281: mu111 PORT MAP (n275, n279, shift_col_0_port, n_shift_col_0_port);
  U275: mu111 PORT MAP (n280, n281, shift_col_1_port, n_shift_col_1_port);
  U267: iv110 PORT MAP (n269, n267);
  U255: iv110 PORT MAP (n257, n256);
  U247: iv110 PORT MAP (ram_in, n225);
  U246: iv110 PORT MAP (n227, n245);
  U240: iv110 PORT MAP (n234, n228);
  U227: iv110 PORT MAP (n195, n196);
  U435: iv110 PORT MAP (state_3_port, n360);
  U433: iv110 PORT MAP (state_2_port, n363);
  U431: iv110 PORT MAP (n272, n246);
  U429: iv110 PORT MAP (state_0_port, n244);
  U426: iv110 PORT MAP (n326, n249);
  U422: iv110 PORT MAP (state_1_port, n226);
  U417: iv110 PORT MAP (n320, n232);
  U411: iv110 PORT MAP (n271, n219);
  U409: iv110 PORT MAP (n218, n243);
  U398: iv110 PORT MAP (n175, n345);
  U407: iv110 PORT MAP (n358, n340);
  U394: iv110 PORT MAP (n248, n352);
  U404: iv110 PORT MAP (row_3_port, n359);
  U393: iv110 PORT MAP (shift_row_1_port, n346);
  U392: iv110 PORT MAP (shift_row_0_port, n270);
  U402: iv110 PORT MAP (shift_row_3_port, n247);
  U387: iv110 PORT MAP (n331, n351);
  U384: iv110 PORT MAP (n347, n179);
  U379: iv110 PORT MAP (row_1_port, n296);
  U380: iv110 PORT MAP (n344, n342);
  U376: iv110 PORT MAP (row_0_port, n298);
  U372: iv110 PORT MAP (col_2_port, n337);
  U370: iv110 PORT MAP (shift_col_2_port, n277);
  U367: iv110 PORT MAP (col_1_port, n315);
  U365: iv110 PORT MAP (shift_col_1_port, n334);
  U362: iv110 PORT MAP (col_0_port, n316);
  U360: iv110 PORT MAP (shift_col_0_port, n284);
  U357: iv110 PORT MAP (N_55, n185);
  U356: iv110 PORT MAP (N_58, n186);
  U355: iv110 PORT MAP (N_61, n187);
  U354: iv110 PORT MAP (N_64, n188);
  U353: iv110 PORT MAP (N_67, n189);
  U352: iv110 PORT MAP (N_70, n190);
  U351: iv110 PORT MAP (N_73, n191);
  U350: iv110 PORT MAP (N_76, n192);
  U349: iv110 PORT MAP (N_79, n193);
  U348: iv110 PORT MAP (N_82, n194);
  U344: iv110 PORT MAP (n217, n199);
  U341: iv110 PORT MAP (n239, n323);
  U338: iv110 PORT MAP (n233, n250);
  U333: iv110 PORT MAP (reset, n322);
  U320: iv110 PORT MAP (n312, n310);
  U316: iv110 PORT MAP (n318, n304);
  U298: iv110 PORT MAP (n252, n299);
  U296: iv110 PORT MAP (n302, n289);
  U303: iv110 PORT MAP (n290, n295);
  U301: iv110 PORT MAP (n251, n224);
  U291: iv110 PORT MAP (n297, n293);
  U280: iv110 PORT MAP (n275, n229);
  U278: iv110 PORT MAP (n279, n282);
  U251: no210 PORT MAP (n251, n252, n235);
  U239: no210 PORT MAP (n176, n233, n231);
  U235: no210 PORT MAP (n223, n224, n222);
  U234: no210 PORT MAP (n221, n222, n210);
  U233: no210 PORT MAP (n219, n220, n211);
  U232: no210 PORT MAP (state_0_port, n218, n213);
  U231: no210 PORT MAP (n216, n217, n214);
  U228: no210 PORT MAP (reset, n198, n195);
  U428: no210 PORT MAP (state_2_port, n244, n365);
  U425: no210 PORT MAP (n246, n249, n176);
  U413: no210 PORT MAP (state_2_port, state_1_port, n361);
  U399: no210 PORT MAP (n358, n257, n356);
  U397: no210 PORT MAP (n345, n247, n357);
  U406: no210 PORT MAP (n340, n175, n321);
  U403: no210 PORT MAP (n331, n359, n355);
  U383: no210 PORT MAP (n345, n346, n341);
  U378: no210 PORT MAP (n331, n296, n343);
  U375: no210 PORT MAP (n331, n298, n338);
  U373: no210 PORT MAP (n338, n339, n181);
  U371: no210 PORT MAP (n331, n337, n335);
  U369: no210 PORT MAP (n321, n277, n336);
  U368: no210 PORT MAP (n335, n336, n182);
  U366: no210 PORT MAP (n331, n315, n332);
  U364: no210 PORT MAP (n321, n334, n333);
  U363: no210 PORT MAP (n332, n333, n183);
  U361: no210 PORT MAP (n331, n316, n329);
  U359: no210 PORT MAP (n321, n284, n330);
  U358: no210 PORT MAP (n329, n330, n184);
  U337: no210 PORT MAP (n250, n326, n215);
  U336: no210 PORT MAP (n246, n215, n325);
  U313: no210 PORT MAP (n316, n312, n314);
  U297: no210 PORT MAP (n298, n299, n300);
  U304: no210 PORT MAP (n290, n305, n252);
  U279: no210 PORT MAP (n229, n284, n280);
  shift_row_reg_1_inst: dfr11 PORT MAP (n_shift_row_1_port, reset, clk, shift_row_1_port);
  state_reg_1_inst: dfr11 PORT MAP (next_state_1_port, reset, clk, state_1_port);
  shift_col_reg_2_inst: dfr11 PORT MAP (n_shift_col_2_port, reset, clk, shift_col_2_port);
  score_reg: dfr11 PORT MAP (n199, reset, clk, score_int);
  row_reg_0_inst: dfr11 PORT MAP (n_row_0_port, reset, clk, row_0_port);
  row_reg_3_inst: dfr11 PORT MAP (n_row_3_port, reset, clk, row_3_port);
  col_reg_1_inst: dfr11 PORT MAP (n_col_1_port, reset, clk, col_1_port);
  shift_row_reg_2_inst: dfr11 PORT MAP (n_shift_row_2_port, reset, clk, shift_row_2_port);
  state_reg_2_inst: dfr11 PORT MAP (next_state_2_port, reset, clk, state_2_port);
  shift_col_reg_0_inst: dfr11 PORT MAP (n_shift_col_0_port, reset, clk, shift_col_0_port);
  row_reg_1_inst: dfr11 PORT MAP (n_row_1_port, reset, clk, row_1_port);
  col_reg_2_inst: dfr11 PORT MAP (n_col_2_port, reset, clk, col_2_port);
  shift_row_reg_0_inst: dfr11 PORT MAP (n_shift_row_0_port, reset, clk, shift_row_0_port);
  state_reg_0_inst: dfr11 PORT MAP (next_state_0_port, reset, clk, state_0_port);
  shift_row_reg_3_inst: dfr11 PORT MAP (n_shift_row_3_port, reset, clk, shift_row_3_port);
  state_reg_3_inst: dfr11 PORT MAP (n197, reset, clk, state_3_port);
  shift_col_reg_1_inst: dfr11 PORT MAP (n_shift_col_1_port, reset, clk, shift_col_1_port);
  row_reg_2_inst: dfr11 PORT MAP (n_row_2_port, reset, clk, row_2_port);
  col_reg_0_inst: dfr11 PORT MAP (n_col_0_port, reset, clk, col_0_port);
  U242: no310 PORT MAP (n238, n234, n239, n237);
  U238: no310 PORT MAP (n231, n232, n220, n230);
  U236: no310 PORT MAP (n225, n226, n227, n221);
  U230: no310 PORT MAP (n213, n214, n215, n212);
  U434: no310 PORT MAP (state_0_port, state_1_port, n360, n364);
  U421: no310 PORT MAP (state_2_port, state_3_port, n226, n307);
  U419: no310 PORT MAP (n227, state_1_port, n363, n251);
  U416: no310 PORT MAP (n307, n251, n232, n331);
  U414: no310 PORT MAP (n226, n360, n362, n220);
  U408: no310 PORT MAP (n220, n219, n243, n358);
  U396: no310 PORT MAP (n355, n356, n357, n178);
  U401: no310 PORT MAP (shift_row_1_port, shift_row_2_port, shift_row_0_port, n248);
  U377: no310 PORT MAP (n341, n342, n343, n180);
  U346: no310 PORT MAP (row_2_port, row_3_port, n328, n216);
  U334: no310 PORT MAP (state_1_port, state_2_port, n227, n198);
  U305: no310 PORT MAP (n296, n298, n306, n305);
  U292: no310 PORT MAP (n296, n298, n299, n291);
  ram_write_tri2: tinv10 PORT MAP (vdd, n194, ram_write_int);
  ram_addr_tri_0_inst: tinv10 PORT MAP (n184, n177, ram_addr_int(0));
  ram_addr_tri_3_inst: tinv10 PORT MAP (n181, n177, ram_addr_int(3));
  ram_addr_tri_6_inst: tinv10 PORT MAP (n178, n177, ram_addr_int(6));
  ram_addr_tri2_2_inst: tinv10 PORT MAP (vdd, n191, ram_addr_int(2));
  ram_addr_tri2_5_inst: tinv10 PORT MAP (vdd, n188, ram_addr_int(5));
  ram_out_tri2: tinv10 PORT MAP (vdd, n185, ram_out_int);
  ram_addr_tri_1_inst: tinv10 PORT MAP (n183, n177, ram_addr_int(1));
  ram_addr_tri_4_inst: tinv10 PORT MAP (n180, n177, ram_addr_int(4));
  ram_addr_tri2_0_inst: tinv10 PORT MAP (vdd, n193, ram_addr_int(0));
  ram_addr_tri_7_inst: tinv10 PORT MAP (vdd, n177, ram_addr_int(7));
  ram_addr_tri2_3_inst: tinv10 PORT MAP (vdd, n190, ram_addr_int(3));
  ram_addr_tri2_6_inst: tinv10 PORT MAP (vdd, n187, ram_addr_int(6));
  ram_write_tri: tinv10 PORT MAP (n176, n177, ram_write_int);
  ram_out_tri: tinv10 PORT MAP (n174, n175, ram_out_int);
  ram_addr_tri_2_inst: tinv10 PORT MAP (n182, n177, ram_addr_int(2));
  ram_addr_tri_5_inst: tinv10 PORT MAP (n179, n177, ram_addr_int(5));
  ram_addr_tri2_1_inst: tinv10 PORT MAP (vdd, n192, ram_addr_int(1));
  ram_addr_tri2_4_inst: tinv10 PORT MAP (vdd, n189, ram_addr_int(4));
  ram_addr_tri2_7_inst: tinv10 PORT MAP (vdd, n186, ram_addr_int(7));
  ram_addr_tri_enable_reg_1_inst: dfn10 PORT MAP (n207, clk, N_76);
  ram_addr_tri_enable_reg_4_inst: dfn10 PORT MAP (n204, clk, N_67);
  ram_addr_tri_enable_reg_7_inst: dfn10 PORT MAP (n201, clk, N_58);
  ram_write_tri_enable_reg: dfn10 PORT MAP (n209, clk, N_82);
  ready_reg: dfn10 PORT MAP (n196, clk, ready_int);
  ram_out_tri_enable_reg: dfn10 PORT MAP (n200, clk, N_55);
  ram_addr_tri_enable_reg_2_inst: dfn10 PORT MAP (n206, clk, N_73);
  ram_addr_tri_enable_reg_5_inst: dfn10 PORT MAP (n203, clk, N_64);
  ram_addr_tri_enable_reg_0_inst: dfn10 PORT MAP (n208, clk, N_79);
  ram_addr_tri_enable_reg_3_inst: dfn10 PORT MAP (n205, clk, N_70);
  ram_addr_tri_enable_reg_6_inst: dfn10 PORT MAP (n202, clk, N_61);
  U400: ex210 PORT MAP (n247, n248, n257);
  U382: ex210 PORT MAP (n270, shift_row_1_port, n266);

END extracted;



