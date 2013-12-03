
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of clearandshift is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component no310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component na310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component ex210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component mu111
      port( A, B, S : in std_logic;  Y : out std_logic);
   end component;
   
   component tinv10
      port( A, E : in std_logic;  Y : out std_logic);
   end component;
   
   component dfr11
      port( D, R, CK : in std_logic;  Q : out std_logic);
   end component;
   
   component dfn10
      port( D, CK : in std_logic;  Q : out std_logic);
   end component;
   
   signal state_3_port, state_2_port, state_1_port, state_0_port, row_3_port, 
      row_2_port, row_1_port, row_0_port, col_2_port, col_1_port, col_0_port, 
      shift_row_3_port, shift_row_2_port, shift_row_1_port, shift_row_0_port, 
      shift_col_2_port, shift_col_1_port, shift_col_0_port, next_state_2_port, 
      next_state_1_port, next_state_0_port, n_row_3_port, n_row_2_port, 
      n_row_1_port, n_row_0_port, n_col_2_port, n_col_1_port, n_col_0_port, 
      n_shift_row_3_port, n_shift_row_2_port, n_shift_row_1_port, 
      n_shift_row_0_port, n_shift_col_2_port, n_shift_col_1_port, 
      n_shift_col_0_port, N55, N58, N61, N64, N67, N70, N73, N76, N79, N82, n1,
      n174, n175, n176, n177, n178, n179, n180, n181, n182, n183, n184, n185, 
      n186, n187, n188, n189, n190, n191, n192, n193, n194, n195, n196, n197, 
      n198, n199, n200, n201, n202, n203, n204, n205, n206, n207, n208, n209, 
      n210, n211, n212, n213, n214, n215, n216, n217, n218, n219, n220, n221, 
      n222, n223, n224, n225, n226, n227, n228, n229, n230, n231, n232, n233, 
      n234, n235, n236, n237, n238, n239, n240, n241, n242, n243, n244, n245, 
      n246, n247, n248, n249, n250, n251, n252, n253, n254, n255, n256, n257, 
      n258, n259, n260, n261, n262, n263, n264, n265, n266, n267, n268, n269, 
      n270, n271, n272, n273, n274, n275, n276, n277, n278, n279, n280, n281, 
      n282, n283, n284, n285, n286, n287, n288, n289, n290, n291, n292, n293, 
      n294, n295, n296, n297, n298, n299, n300, n301, n302, n303, n304, n305, 
      n306, n307, n308, n309, n310, n311, n312, n313, n314, n315, n316, n317, 
      n318, n319, n320, n321, n322, n323, n324, n325, n326, n327, n328, n329, 
      n330, n331, n332, n333, n334, n335, n336, n337, n338, n339, n340, n341, 
      n342, n343, n344, n345, n346, n347, n348, n349, n350, n351, n352, n353, 
      n354, n355, n356, n357, n358, n359, n360, n361, n362, n363, n364, n365 : 
      std_logic;

begin
   
   ram_out_tri_enable_reg : dfn10 port map( D => n200, CK => clk, Q => N55);
   ram_addr_tri_enable_reg_7_inst : dfn10 port map( D => n201, CK => clk, Q => 
                           N58);
   ram_addr_tri_enable_reg_6_inst : dfn10 port map( D => n202, CK => clk, Q => 
                           N61);
   ram_addr_tri_enable_reg_5_inst : dfn10 port map( D => n203, CK => clk, Q => 
                           N64);
   ram_addr_tri_enable_reg_4_inst : dfn10 port map( D => n204, CK => clk, Q => 
                           N67);
   ram_addr_tri_enable_reg_3_inst : dfn10 port map( D => n205, CK => clk, Q => 
                           N70);
   ram_addr_tri_enable_reg_2_inst : dfn10 port map( D => n206, CK => clk, Q => 
                           N73);
   ram_addr_tri_enable_reg_1_inst : dfn10 port map( D => n207, CK => clk, Q => 
                           N76);
   ram_addr_tri_enable_reg_0_inst : dfn10 port map( D => n208, CK => clk, Q => 
                           N79);
   ram_write_tri_enable_reg : dfn10 port map( D => n209, CK => clk, Q => N82);
   shift_row_reg_0_inst : dfr11 port map( D => n_shift_row_0_port, R => reset, 
                           CK => clk, Q => shift_row_0_port);
   shift_row_reg_1_inst : dfr11 port map( D => n_shift_row_1_port, R => reset, 
                           CK => clk, Q => shift_row_1_port);
   shift_row_reg_2_inst : dfr11 port map( D => n_shift_row_2_port, R => reset, 
                           CK => clk, Q => shift_row_2_port);
   state_reg_0_inst : dfr11 port map( D => next_state_0_port, R => reset, CK =>
                           clk, Q => state_0_port);
   row_reg_0_inst : dfr11 port map( D => n_row_0_port, R => reset, CK => clk, Q
                           => row_0_port);
   state_reg_3_inst : dfr11 port map( D => n197, R => reset, CK => clk, Q => 
                           state_3_port);
   shift_col_reg_1_inst : dfr11 port map( D => n_shift_col_1_port, R => reset, 
                           CK => clk, Q => shift_col_1_port);
   state_reg_2_inst : dfr11 port map( D => next_state_2_port, R => reset, CK =>
                           clk, Q => state_2_port);
   state_reg_1_inst : dfr11 port map( D => next_state_1_port, R => reset, CK =>
                           clk, Q => state_1_port);
   col_reg_0_inst : dfr11 port map( D => n_col_0_port, R => reset, CK => clk, Q
                           => col_0_port);
   col_reg_1_inst : dfr11 port map( D => n_col_1_port, R => reset, CK => clk, Q
                           => col_1_port);
   col_reg_2_inst : dfr11 port map( D => n_col_2_port, R => reset, CK => clk, Q
                           => col_2_port);
   ready_reg : dfn10 port map( D => n196, CK => clk, Q => ready);
   shift_col_reg_0_inst : dfr11 port map( D => n_shift_col_0_port, R => reset, 
                           CK => clk, Q => shift_col_0_port);
   shift_col_reg_2_inst : dfr11 port map( D => n_shift_col_2_port, R => reset, 
                           CK => clk, Q => shift_col_2_port);
   row_reg_3_inst : dfr11 port map( D => n_row_3_port, R => reset, CK => clk, Q
                           => row_3_port);
   row_reg_1_inst : dfr11 port map( D => n_row_1_port, R => reset, CK => clk, Q
                           => row_1_port);
   row_reg_2_inst : dfr11 port map( D => n_row_2_port, R => reset, CK => clk, Q
                           => row_2_port);
   shift_row_reg_3_inst : dfr11 port map( D => n_shift_row_3_port, R => reset, 
                           CK => clk, Q => shift_row_3_port);
   score_reg : dfr11 port map( D => n199, R => reset, CK => clk, Q => score);
   ram_write_tri2 : tinv10 port map( A => n1, E => n194, Y => ram_write);
   ram_addr_tri2_0_inst : tinv10 port map( A => n1, E => n193, Y => ram_addr(0)
                           );
   ram_addr_tri2_1_inst : tinv10 port map( A => n1, E => n192, Y => ram_addr(1)
                           );
   ram_addr_tri2_2_inst : tinv10 port map( A => n1, E => n191, Y => ram_addr(2)
                           );
   ram_addr_tri2_3_inst : tinv10 port map( A => n1, E => n190, Y => ram_addr(3)
                           );
   ram_addr_tri2_4_inst : tinv10 port map( A => n1, E => n189, Y => ram_addr(4)
                           );
   ram_addr_tri2_5_inst : tinv10 port map( A => n1, E => n188, Y => ram_addr(5)
                           );
   ram_addr_tri2_6_inst : tinv10 port map( A => n1, E => n187, Y => ram_addr(6)
                           );
   ram_addr_tri2_7_inst : tinv10 port map( A => n1, E => n186, Y => ram_addr(7)
                           );
   ram_out_tri2 : tinv10 port map( A => n1, E => n185, Y => ram_out);
   ram_addr_tri_0_inst : tinv10 port map( A => n184, E => n177, Y => 
                           ram_addr(0));
   ram_addr_tri_1_inst : tinv10 port map( A => n183, E => n177, Y => 
                           ram_addr(1));
   ram_addr_tri_2_inst : tinv10 port map( A => n182, E => n177, Y => 
                           ram_addr(2));
   ram_addr_tri_3_inst : tinv10 port map( A => n181, E => n177, Y => 
                           ram_addr(3));
   ram_addr_tri_4_inst : tinv10 port map( A => n180, E => n177, Y => 
                           ram_addr(4));
   ram_addr_tri_5_inst : tinv10 port map( A => n179, E => n177, Y => 
                           ram_addr(5));
   ram_addr_tri_6_inst : tinv10 port map( A => n178, E => n177, Y => 
                           ram_addr(6));
   ram_addr_tri_7_inst : tinv10 port map( A => n1, E => n177, Y => ram_addr(7))
                           ;
   ram_write_tri : tinv10 port map( A => n176, E => n177, Y => ram_write);
   ram_out_tri : tinv10 port map( A => n174, E => n175, Y => ram_out);
   n1 <= '1';
   U227 : iv110 port map( A => n195, Y => n196);
   U228 : no210 port map( A => reset, B => n198, Y => n195);
   U229 : na310 port map( A => n210, B => n211, C => n212, Y => 
                           next_state_2_port);
   U230 : no310 port map( A => n213, B => n214, C => n215, Y => n212);
   U231 : no210 port map( A => n216, B => n217, Y => n214);
   U232 : no210 port map( A => state_0_port, B => n218, Y => n213);
   U233 : no210 port map( A => n219, B => n220, Y => n211);
   U234 : no210 port map( A => n221, B => n222, Y => n210);
   U235 : no210 port map( A => n223, B => n224, Y => n222);
   U236 : no310 port map( A => n225, B => n226, C => n227, Y => n221);
   U237 : na310 port map( A => n228, B => n229, C => n230, Y => 
                           next_state_1_port);
   U238 : no310 port map( A => n231, B => n232, C => n220, Y => n230);
   U239 : no210 port map( A => n176, B => n233, Y => n231);
   U240 : iv110 port map( A => n234, Y => n228);
   U241 : na310 port map( A => n235, B => n236, C => n237, Y => 
                           next_state_0_port);
   U242 : no310 port map( A => n238, B => n234, C => n239, Y => n237);
   U243 : na310 port map( A => n240, B => n241, C => n242, Y => n234);
   U244 : na210 port map( A => n243, B => n244, Y => n242);
   U245 : na310 port map( A => state_1_port, B => n225, C => n245, Y => n241);
   U246 : iv110 port map( A => n227, Y => n245);
   U247 : iv110 port map( A => ram_in, Y => n225);
   U248 : na310 port map( A => n246, B => n247, C => n248, Y => n240);
   U249 : mu111 port map( A => n246, B => n249, S => n250, Y => n238);
   U250 : na210 port map( A => start, B => n198, Y => n236);
   U251 : no210 port map( A => n251, B => n252, Y => n235);
   U252 : na310 port map( A => n253, B => n254, C => n255, Y => 
                           n_shift_row_3_port);
   U253 : na210 port map( A => row_3_port, B => n199, Y => n255);
   U254 : na210 port map( A => n220, B => n256, Y => n254);
   U255 : iv110 port map( A => n257, Y => n256);
   U256 : na210 port map( A => shift_row_3_port, B => n258, Y => n253);
   U257 : na310 port map( A => n259, B => n260, C => n261, Y => 
                           n_shift_row_2_port);
   U258 : na210 port map( A => row_2_port, B => n199, Y => n261);
   U259 : na210 port map( A => n220, B => n262, Y => n260);
   U260 : na210 port map( A => shift_row_2_port, B => n258, Y => n259);
   U261 : na310 port map( A => n263, B => n264, C => n265, Y => 
                           n_shift_row_1_port);
   U262 : na210 port map( A => row_1_port, B => n199, Y => n265);
   U263 : na210 port map( A => n266, B => n220, Y => n264);
   U264 : na210 port map( A => shift_row_1_port, B => n258, Y => n263);
   U265 : na210 port map( A => n267, B => n268, Y => n_shift_row_0_port);
   U266 : na210 port map( A => row_0_port, B => n199, Y => n268);
   U267 : iv110 port map( A => n269, Y => n267);
   U268 : mu111 port map( A => n258, B => n220, S => n270, Y => n269);
   U269 : na310 port map( A => n218, B => n271, C => n272, Y => n258);
   U270 : na210 port map( A => n273, B => n274, Y => n_shift_col_2_port);
   U271 : na310 port map( A => n275, B => n233, C => n276, Y => n274);
   U272 : na210 port map( A => n277, B => n278, Y => n276);
   U273 : na210 port map( A => shift_col_1_port, B => shift_col_0_port, Y => 
                           n278);
   U274 : na210 port map( A => shift_col_2_port, B => n279, Y => n273);
   U275 : mu111 port map( A => n280, B => n281, S => shift_col_1_port, Y => 
                           n_shift_col_1_port);
   U276 : na210 port map( A => n282, B => n283, Y => n281);
   U277 : na210 port map( A => n275, B => n284, Y => n283);
   U278 : iv110 port map( A => n279, Y => n282);
   U279 : no210 port map( A => n229, B => n284, Y => n280);
   U280 : iv110 port map( A => n275, Y => n229);
   U281 : mu111 port map( A => n275, B => n279, S => shift_col_0_port, Y => 
                           n_shift_col_0_port);
   U282 : na210 port map( A => n176, B => n218, Y => n279);
   U283 : na210 port map( A => n285, B => n271, Y => n275);
   U284 : na210 port map( A => n286, B => n287, Y => n_row_3_port);
   U285 : na210 port map( A => row_3_port, B => n288, Y => n287);
   U286 : na210 port map( A => n289, B => n290, Y => n288);
   U287 : na210 port map( A => n291, B => row_2_port, Y => n286);
   U288 : mu111 port map( A => n291, B => n292, S => row_2_port, Y => 
                           n_row_2_port);
   U289 : na210 port map( A => n293, B => n294, Y => n292);
   U290 : na210 port map( A => n295, B => n296, Y => n294);
   U291 : iv110 port map( A => n297, Y => n293);
   U292 : no310 port map( A => n296, B => n298, C => n299, Y => n291);
   U293 : mu111 port map( A => n300, B => n297, S => row_1_port, Y => 
                           n_row_1_port);
   U294 : na210 port map( A => n289, B => n301, Y => n297);
   U295 : na210 port map( A => n295, B => n298, Y => n301);
   U296 : iv110 port map( A => n302, Y => n289);
   U297 : no210 port map( A => n298, B => n299, Y => n300);
   U298 : iv110 port map( A => n252, Y => n299);
   U299 : mu111 port map( A => n252, B => n302, S => row_0_port, Y => 
                           n_row_0_port);
   U300 : na310 port map( A => n303, B => n224, C => n304, Y => n302);
   U301 : iv110 port map( A => n251, Y => n224);
   U302 : na210 port map( A => n305, B => n295, Y => n303);
   U303 : iv110 port map( A => n290, Y => n295);
   U304 : no210 port map( A => n290, B => n305, Y => n252);
   U305 : no310 port map( A => n296, B => n298, C => n306, Y => n305);
   U306 : na210 port map( A => row_2_port, B => row_3_port, Y => n306);
   U307 : na210 port map( A => n307, B => state_0_port, Y => n290);
   U308 : na210 port map( A => n308, B => n309, Y => n_col_2_port);
   U309 : na310 port map( A => col_1_port, B => col_0_port, C => n310, Y => 
                           n309);
   U310 : na210 port map( A => col_2_port, B => n311, Y => n308);
   U311 : na210 port map( A => n304, B => n312, Y => n311);
   U312 : mu111 port map( A => n313, B => n314, S => n315, Y => n_col_1_port);
   U313 : no210 port map( A => n316, B => n312, Y => n314);
   U314 : na210 port map( A => n304, B => n317, Y => n313);
   U315 : na210 port map( A => n310, B => n316, Y => n317);
   U316 : iv110 port map( A => n318, Y => n304);
   U317 : mu111 port map( A => n310, B => n318, S => col_0_port, Y => 
                           n_col_0_port);
   U318 : na310 port map( A => n319, B => n320, C => n321, Y => n318);
   U319 : na210 port map( A => n307, B => n244, Y => n319);
   U320 : iv110 port map( A => n312, Y => n310);
   U321 : na210 port map( A => n251, B => n223, Y => n312);
   U322 : na310 port map( A => col_1_port, B => col_0_port, C => col_2_port, Y 
                           => n223);
   U323 : na210 port map( A => n322, B => n194, Y => n209);
   U324 : na210 port map( A => n322, B => n193, Y => n208);
   U325 : na210 port map( A => n322, B => n192, Y => n207);
   U326 : na210 port map( A => n322, B => n191, Y => n206);
   U327 : na210 port map( A => n322, B => n190, Y => n205);
   U328 : na210 port map( A => n322, B => n189, Y => n204);
   U329 : na210 port map( A => n322, B => n188, Y => n203);
   U330 : na210 port map( A => n322, B => n187, Y => n202);
   U331 : na210 port map( A => n322, B => n186, Y => n201);
   U332 : na210 port map( A => n322, B => n185, Y => n200);
   U333 : iv110 port map( A => reset, Y => n322);
   U334 : no310 port map( A => state_1_port, B => state_2_port, C => n227, Y =>
                           n198);
   U335 : na310 port map( A => n323, B => n324, C => n325, Y => n197);
   U336 : no210 port map( A => n246, B => n215, Y => n325);
   U337 : no210 port map( A => n250, B => n326, Y => n215);
   U338 : iv110 port map( A => n233, Y => n250);
   U339 : na310 port map( A => shift_col_1_port, B => shift_col_0_port, C => 
                           shift_col_2_port, Y => n233);
   U340 : na210 port map( A => n243, B => state_0_port, Y => n324);
   U341 : iv110 port map( A => n239, Y => n323);
   U342 : na210 port map( A => n285, B => n327, Y => n239);
   U343 : na210 port map( A => n216, B => n199, Y => n327);
   U344 : iv110 port map( A => n217, Y => n199);
   U345 : na210 port map( A => n232, B => state_2_port, Y => n217);
   U346 : no310 port map( A => row_2_port, B => row_3_port, C => n328, Y => 
                           n216);
   U347 : na210 port map( A => n296, B => n298, Y => n328);
   U348 : iv110 port map( A => N82, Y => n194);
   U349 : iv110 port map( A => N79, Y => n193);
   U350 : iv110 port map( A => N76, Y => n192);
   U351 : iv110 port map( A => N73, Y => n191);
   U352 : iv110 port map( A => N70, Y => n190);
   U353 : iv110 port map( A => N67, Y => n189);
   U354 : iv110 port map( A => N64, Y => n188);
   U355 : iv110 port map( A => N61, Y => n187);
   U356 : iv110 port map( A => N58, Y => n186);
   U357 : iv110 port map( A => N55, Y => n185);
   U358 : no210 port map( A => n329, B => n330, Y => n184);
   U359 : no210 port map( A => n321, B => n284, Y => n330);
   U360 : iv110 port map( A => shift_col_0_port, Y => n284);
   U361 : no210 port map( A => n331, B => n316, Y => n329);
   U362 : iv110 port map( A => col_0_port, Y => n316);
   U363 : no210 port map( A => n332, B => n333, Y => n183);
   U364 : no210 port map( A => n321, B => n334, Y => n333);
   U365 : iv110 port map( A => shift_col_1_port, Y => n334);
   U366 : no210 port map( A => n331, B => n315, Y => n332);
   U367 : iv110 port map( A => col_1_port, Y => n315);
   U368 : no210 port map( A => n335, B => n336, Y => n182);
   U369 : no210 port map( A => n321, B => n277, Y => n336);
   U370 : iv110 port map( A => shift_col_2_port, Y => n277);
   U371 : no210 port map( A => n331, B => n337, Y => n335);
   U372 : iv110 port map( A => col_2_port, Y => n337);
   U373 : no210 port map( A => n338, B => n339, Y => n181);
   U374 : mu111 port map( A => n175, B => n340, S => n270, Y => n339);
   U375 : no210 port map( A => n331, B => n298, Y => n338);
   U376 : iv110 port map( A => row_0_port, Y => n298);
   U377 : no310 port map( A => n341, B => n342, C => n343, Y => n180);
   U378 : no210 port map( A => n331, B => n296, Y => n343);
   U379 : iv110 port map( A => row_1_port, Y => n296);
   U380 : iv110 port map( A => n344, Y => n342);
   U381 : na210 port map( A => n340, B => n266, Y => n344);
   U382 : ex210 port map( A => n270, B => shift_row_1_port, Y => n266);
   U383 : no210 port map( A => n345, B => n346, Y => n341);
   U384 : iv110 port map( A => n347, Y => n179);
   U385 : na310 port map( A => n348, B => n349, C => n350, Y => n347);
   U386 : na210 port map( A => n351, B => row_2_port, Y => n350);
   U387 : iv110 port map( A => n331, Y => n351);
   U388 : na210 port map( A => n340, B => n262, Y => n349);
   U389 : na210 port map( A => n352, B => n353, Y => n262);
   U390 : na210 port map( A => shift_row_2_port, B => n354, Y => n353);
   U391 : na210 port map( A => n346, B => n270, Y => n354);
   U392 : iv110 port map( A => shift_row_0_port, Y => n270);
   U393 : iv110 port map( A => shift_row_1_port, Y => n346);
   U394 : iv110 port map( A => n248, Y => n352);
   U395 : na210 port map( A => n175, B => shift_row_2_port, Y => n348);
   U396 : no310 port map( A => n355, B => n356, C => n357, Y => n178);
   U397 : no210 port map( A => n345, B => n247, Y => n357);
   U398 : iv110 port map( A => n175, Y => n345);
   U399 : no210 port map( A => n358, B => n257, Y => n356);
   U400 : ex210 port map( A => n247, B => n248, Y => n257);
   U401 : no310 port map( A => shift_row_1_port, B => shift_row_2_port, C => 
                           shift_row_0_port, Y => n248);
   U402 : iv110 port map( A => shift_row_3_port, Y => n247);
   U403 : no210 port map( A => n331, B => n359, Y => n355);
   U404 : iv110 port map( A => row_3_port, Y => n359);
   U405 : na210 port map( A => n331, B => n321, Y => n177);
   U406 : no210 port map( A => n340, B => n175, Y => n321);
   U407 : iv110 port map( A => n358, Y => n340);
   U408 : no310 port map( A => n220, B => n219, C => n243, Y => n358);
   U409 : iv110 port map( A => n218, Y => n243);
   U410 : na310 port map( A => state_1_port, B => n360, C => state_2_port, Y =>
                           n218);
   U411 : iv110 port map( A => n271, Y => n219);
   U412 : na310 port map( A => state_3_port, B => state_0_port, C => n361, Y =>
                           n271);
   U413 : no210 port map( A => state_2_port, B => state_1_port, Y => n361);
   U414 : no310 port map( A => n226, B => n360, C => n362, Y => n220);
   U415 : na210 port map( A => n363, B => n244, Y => n362);
   U416 : no310 port map( A => n307, B => n251, C => n232, Y => n331);
   U417 : iv110 port map( A => n320, Y => n232);
   U418 : na310 port map( A => n226, B => n360, C => state_0_port, Y => n320);
   U419 : no310 port map( A => n227, B => state_1_port, C => n363, Y => n251);
   U420 : na210 port map( A => n244, B => n360, Y => n227);
   U421 : no310 port map( A => state_2_port, B => state_3_port, C => n226, Y =>
                           n307);
   U422 : iv110 port map( A => state_1_port, Y => n226);
   U423 : na210 port map( A => n176, B => n285, Y => n175);
   U424 : na210 port map( A => n364, B => state_2_port, Y => n285);
   U425 : no210 port map( A => n246, B => n249, Y => n176);
   U426 : iv110 port map( A => n326, Y => n249);
   U427 : na310 port map( A => state_1_port, B => state_3_port, C => n365, Y =>
                           n326);
   U428 : no210 port map( A => state_2_port, B => n244, Y => n365);
   U429 : iv110 port map( A => state_0_port, Y => n244);
   U430 : na210 port map( A => n246, B => ram_in, Y => n174);
   U431 : iv110 port map( A => n272, Y => n246);
   U432 : na210 port map( A => n364, B => n363, Y => n272);
   U433 : iv110 port map( A => state_2_port, Y => n363);
   U434 : no310 port map( A => state_0_port, B => state_1_port, C => n360, Y =>
                           n364);
   U435 : iv110 port map( A => state_3_port, Y => n360);

end synthesised;



