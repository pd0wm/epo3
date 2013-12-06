
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of clearandshift is

   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component na310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component no310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component mu111
      port( A, B, S : in std_logic;  Y : out std_logic);
   end component;
   
   component ex210
      port( A, B : in std_logic;  Y : out std_logic);
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
      shift_col_2_port, shift_col_1_port, shift_col_0_port, next_state_3_port, 
      next_state_2_port, next_state_0_port, n_row_3_port, n_row_2_port, 
      n_row_1_port, n_row_0_port, n_col_2_port, n_col_1_port, n_col_0_port, 
      n_shift_row_3_port, n_shift_row_2_port, n_shift_row_1_port, 
      n_shift_row_0_port, n_shift_col_2_port, n_shift_col_1_port, 
      n_shift_col_0_port, N55, N58, N61, N64, N67, N70, N73, N76, N79, N82, n1,
      n169, n170, n171, n172, n173, n174, n175, n176, n177, n178, n179, n180, 
      n181, n182, n183, n184, n185, n186, n187, n188, n189, n190, n191, n192, 
      n193, n194, n195, n196, n197, n198, n199, n200, n201, n202, n203, n204, 
      n205, n206, n207, n208, n209, n210, n211, n212, n213, n214, n215, n216, 
      n217, n218, n219, n220, n221, n222, n223, n224, n225, n226, n227, n228, 
      n229, n230, n231, n232, n233, n234, n235, n236, n237, n238, n239, n240, 
      n241, n242, n243, n244, n245, n246, n247, n248, n249, n250, n251, n252, 
      n253, n254, n255, n256, n257, n258, n259, n260, n261, n262, n263, n264, 
      n265, n266, n267, n268, n269, n270, n271, n272, n273, n274, n275, n276, 
      n277, n278, n279, n280, n281, n282, n283, n284, n285, n286, n287, n288, 
      n289, n290, n291, n292, n293, n294, n295, n296, n297, n298, n299, n300, 
      n301, n302, n303, n304, n305, n306, n307, n308, n309, n310, n311, n312, 
      n313, n314, n315, n316, n317, n318, n319, n320, n321, n322, n323, n324, 
      n325, n326, n327, n328, n329, n330, n331, n332, n333, n334, n335, n336, 
      n337, n338, n339, n340, n341, n342, n343, n344, n345, n346, n347, n348, 
      n349, n350, n351, n352, n353, n354, n355, n356, n357, n358 : std_logic;

begin
   
   ram_out_tri_enable_reg : dfn10 port map( D => n195, CK => clk, Q => N55);
   ram_addr_tri_enable_reg_7_inst : dfn10 port map( D => n196, CK => clk, Q => 
                           N58);
   ram_addr_tri_enable_reg_6_inst : dfn10 port map( D => n197, CK => clk, Q => 
                           N61);
   ram_addr_tri_enable_reg_5_inst : dfn10 port map( D => n198, CK => clk, Q => 
                           N64);
   ram_addr_tri_enable_reg_4_inst : dfn10 port map( D => n199, CK => clk, Q => 
                           N67);
   ram_addr_tri_enable_reg_3_inst : dfn10 port map( D => n200, CK => clk, Q => 
                           N70);
   ram_addr_tri_enable_reg_2_inst : dfn10 port map( D => n201, CK => clk, Q => 
                           N73);
   ram_addr_tri_enable_reg_1_inst : dfn10 port map( D => n202, CK => clk, Q => 
                           N76);
   ram_addr_tri_enable_reg_0_inst : dfn10 port map( D => n203, CK => clk, Q => 
                           N79);
   ram_write_tri_enable_reg : dfn10 port map( D => n204, CK => clk, Q => N82);
   shift_row_reg_0_inst : dfr11 port map( D => n_shift_row_0_port, R => n207, 
                           CK => clk, Q => shift_row_0_port);
   shift_row_reg_3_inst : dfr11 port map( D => n_shift_row_3_port, R => n207, 
                           CK => clk, Q => shift_row_3_port);
   state_reg_1_inst : dfr11 port map( D => n192, R => n205, CK => clk, Q => 
                           state_1_port);
   state_reg_2_inst : dfr11 port map( D => next_state_2_port, R => n205, CK => 
                           clk, Q => state_2_port);
   row_reg_0_inst : dfr11 port map( D => n_row_0_port, R => n205, CK => clk, Q 
                           => row_0_port);
   row_reg_1_inst : dfr11 port map( D => n_row_1_port, R => n205, CK => clk, Q 
                           => row_1_port);
   row_reg_2_inst : dfr11 port map( D => n_row_2_port, R => n205, CK => clk, Q 
                           => row_2_port);
   state_reg_3_inst : dfr11 port map( D => next_state_3_port, R => n205, CK => 
                           clk, Q => state_3_port);
   shift_col_reg_0_inst : dfr11 port map( D => n_shift_col_0_port, R => n205, 
                           CK => clk, Q => shift_col_0_port);
   state_reg_0_inst : dfr11 port map( D => next_state_0_port, R => n205, CK => 
                           clk, Q => state_0_port);
   ready_reg : dfn10 port map( D => n191, CK => clk, Q => ready);
   col_reg_0_inst : dfr11 port map( D => n_col_0_port, R => n205, CK => clk, Q 
                           => col_0_port);
   col_reg_1_inst : dfr11 port map( D => n_col_1_port, R => n205, CK => clk, Q 
                           => col_1_port);
   col_reg_2_inst : dfr11 port map( D => n_col_2_port, R => n205, CK => clk, Q 
                           => col_2_port);
   row_reg_3_inst : dfr11 port map( D => n_row_3_port, R => n205, CK => clk, Q 
                           => row_3_port);
   shift_col_reg_1_inst : dfr11 port map( D => n_shift_col_1_port, R => n205, 
                           CK => clk, Q => shift_col_1_port);
   shift_col_reg_2_inst : dfr11 port map( D => n_shift_col_2_port, R => n205, 
                           CK => clk, Q => shift_col_2_port);
   score_reg : dfr11 port map( D => n194, R => n205, CK => clk, Q => score);
   shift_row_reg_2_inst : dfr11 port map( D => n_shift_row_2_port, R => n207, 
                           CK => clk, Q => shift_row_2_port);
   shift_row_reg_1_inst : dfr11 port map( D => n_shift_row_1_port, R => n205, 
                           CK => clk, Q => shift_row_1_port);
   ram_write_tri2 : tinv10 port map( A => n1, E => n189, Y => ram_write);
   ram_addr_tri2_0_inst : tinv10 port map( A => n1, E => n188, Y => ram_addr(0)
                           );
   ram_addr_tri2_1_inst : tinv10 port map( A => n1, E => n187, Y => ram_addr(1)
                           );
   ram_addr_tri2_2_inst : tinv10 port map( A => n1, E => n186, Y => ram_addr(2)
                           );
   ram_addr_tri2_3_inst : tinv10 port map( A => n1, E => n185, Y => ram_addr(3)
                           );
   ram_addr_tri2_4_inst : tinv10 port map( A => n1, E => n184, Y => ram_addr(4)
                           );
   ram_addr_tri2_5_inst : tinv10 port map( A => n1, E => n183, Y => ram_addr(5)
                           );
   ram_addr_tri2_6_inst : tinv10 port map( A => n1, E => n182, Y => ram_addr(6)
                           );
   ram_addr_tri2_7_inst : tinv10 port map( A => n1, E => n181, Y => ram_addr(7)
                           );
   ram_out_tri2 : tinv10 port map( A => n1, E => n180, Y => ram_out);
   ram_addr_tri_0_inst : tinv10 port map( A => n179, E => n172, Y => 
                           ram_addr(0));
   ram_addr_tri_1_inst : tinv10 port map( A => n178, E => n172, Y => 
                           ram_addr(1));
   ram_addr_tri_2_inst : tinv10 port map( A => n177, E => n172, Y => 
                           ram_addr(2));
   ram_addr_tri_3_inst : tinv10 port map( A => n176, E => n172, Y => 
                           ram_addr(3));
   ram_addr_tri_4_inst : tinv10 port map( A => n175, E => n172, Y => 
                           ram_addr(4));
   ram_addr_tri_5_inst : tinv10 port map( A => n174, E => n172, Y => 
                           ram_addr(5));
   ram_addr_tri_6_inst : tinv10 port map( A => n173, E => n172, Y => 
                           ram_addr(6));
   ram_addr_tri_7_inst : tinv10 port map( A => n1, E => n172, Y => ram_addr(7))
                           ;
   ram_write_tri : tinv10 port map( A => n171, E => n172, Y => ram_write);
   ram_out_tri : tinv10 port map( A => n169, E => n170, Y => ram_out);
   n1 <= '1';
   U224 : na210 port map( A => n206, B => n190, Y => n191);
   U225 : iv110 port map( A => n193, Y => n190);
   U226 : iv110 port map( A => n206, Y => n207);
   U227 : na310 port map( A => n208, B => n209, C => n210, Y => 
                           next_state_3_port);
   U228 : no210 port map( A => n211, B => n212, Y => n210);
   U229 : no210 port map( A => n213, B => n214, Y => n212);
   U230 : no210 port map( A => n215, B => n216, Y => n211);
   U231 : na310 port map( A => n217, B => n218, C => n219, Y => 
                           next_state_2_port);
   U232 : no210 port map( A => n220, B => n221, Y => n219);
   U233 : iv110 port map( A => n222, Y => n221);
   U234 : na210 port map( A => n213, B => n194, Y => n222);
   U235 : na310 port map( A => n223, B => n224, C => n225, Y => n213);
   U236 : no210 port map( A => row_1_port, B => row_0_port, Y => n225);
   U237 : no210 port map( A => n226, B => n227, Y => n220);
   U238 : na210 port map( A => ram_in, B => n228, Y => n218);
   U239 : na310 port map( A => n229, B => n230, C => n231, Y => 
                           next_state_0_port);
   U240 : no310 port map( A => n232, B => n233, C => n234, Y => n231);
   U241 : iv110 port map( A => n235, Y => n229);
   U242 : na210 port map( A => n236, B => n237, Y => n235);
   U243 : na210 port map( A => n193, B => start, Y => n237);
   U244 : na310 port map( A => n238, B => n239, C => n215, Y => n236);
   U245 : no310 port map( A => n240, B => n241, C => n242, Y => n215);
   U246 : na310 port map( A => n243, B => n244, C => n245, Y => 
                           n_shift_row_3_port);
   U247 : na210 port map( A => row_3_port, B => n194, Y => n245);
   U248 : na210 port map( A => n246, B => n247, Y => n244);
   U249 : na210 port map( A => shift_row_3_port, B => n248, Y => n243);
   U250 : na310 port map( A => n249, B => n250, C => n251, Y => 
                           n_shift_row_2_port);
   U251 : na210 port map( A => row_2_port, B => n194, Y => n251);
   U252 : na210 port map( A => shift_row_2_port, B => n248, Y => n250);
   U253 : na210 port map( A => n246, B => n252, Y => n249);
   U254 : na310 port map( A => n253, B => n254, C => n255, Y => 
                           n_shift_row_1_port);
   U255 : na210 port map( A => row_1_port, B => n194, Y => n255);
   U256 : na210 port map( A => shift_row_1_port, B => n256, Y => n254);
   U257 : na210 port map( A => n257, B => n258, Y => n256);
   U258 : na210 port map( A => shift_row_0_port, B => n246, Y => n258);
   U259 : na210 port map( A => n246, B => n259, Y => n253);
   U260 : iv110 port map( A => n260, Y => n246);
   U261 : na210 port map( A => n261, B => n262, Y => n_shift_row_0_port);
   U262 : na210 port map( A => row_0_port, B => n194, Y => n262);
   U263 : mu111 port map( A => n260, B => n257, S => shift_row_0_port, Y => 
                           n261);
   U264 : iv110 port map( A => n248, Y => n257);
   U265 : na310 port map( A => n263, B => n208, C => n264, Y => n248);
   U266 : na210 port map( A => n265, B => state_0_port, Y => n260);
   U267 : mu111 port map( A => n266, B => n267, S => n242, Y => 
                           n_shift_col_2_port);
   U268 : no310 port map( A => n240, B => n268, C => n241, Y => n267);
   U269 : na210 port map( A => n269, B => n270, Y => n266);
   U270 : na210 port map( A => n271, B => n240, Y => n270);
   U271 : mu111 port map( A => n272, B => n273, S => n240, Y => 
                           n_shift_col_1_port);
   U272 : no210 port map( A => n268, B => n241, Y => n273);
   U273 : iv110 port map( A => n269, Y => n272);
   U274 : no210 port map( A => n274, B => n275, Y => n269);
   U275 : no210 port map( A => n268, B => shift_col_0_port, Y => n275);
   U276 : iv110 port map( A => n271, Y => n268);
   U277 : mu111 port map( A => n274, B => n271, S => n241, Y => 
                           n_shift_col_0_port);
   U278 : na210 port map( A => n264, B => n209, Y => n271);
   U279 : iv110 port map( A => n276, Y => n209);
   U280 : na210 port map( A => n265, B => n277, Y => n264);
   U281 : na210 port map( A => n171, B => n263, Y => n274);
   U282 : na210 port map( A => n278, B => n279, Y => n_row_3_port);
   U283 : na310 port map( A => row_2_port, B => row_1_port, C => n280, Y => 
                           n279);
   U284 : na210 port map( A => row_3_port, B => n281, Y => n278);
   U285 : na210 port map( A => n282, B => n283, Y => n281);
   U286 : mu111 port map( A => n284, B => n285, S => n223, Y => n_row_2_port);
   U287 : no210 port map( A => n286, B => n287, Y => n285);
   U288 : na210 port map( A => n288, B => n289, Y => n284);
   U289 : na210 port map( A => n290, B => n286, Y => n289);
   U290 : iv110 port map( A => n291, Y => n288);
   U291 : mu111 port map( A => n291, B => n280, S => n286, Y => n_row_1_port);
   U292 : iv110 port map( A => n287, Y => n280);
   U293 : na210 port map( A => n233, B => row_0_port, Y => n287);
   U294 : na210 port map( A => n282, B => n292, Y => n291);
   U295 : na210 port map( A => n290, B => n293, Y => n292);
   U296 : iv110 port map( A => n294, Y => n282);
   U297 : mu111 port map( A => n294, B => n233, S => n293, Y => n_row_0_port);
   U298 : no210 port map( A => n283, B => n295, Y => n233);
   U299 : na310 port map( A => n296, B => n227, C => n297, Y => n294);
   U300 : na210 port map( A => n295, B => n290, Y => n296);
   U301 : iv110 port map( A => n283, Y => n290);
   U302 : na210 port map( A => n298, B => state_1_port, Y => n283);
   U303 : no310 port map( A => n286, B => n293, C => n299, Y => n295);
   U304 : na210 port map( A => row_2_port, B => row_3_port, Y => n299);
   U305 : na210 port map( A => n300, B => n301, Y => n_col_2_port);
   U306 : na310 port map( A => col_1_port, B => col_0_port, C => n302, Y => 
                           n301);
   U307 : na210 port map( A => col_2_port, B => n303, Y => n300);
   U308 : na210 port map( A => n297, B => n304, Y => n303);
   U309 : mu111 port map( A => n305, B => n306, S => n307, Y => n_col_1_port);
   U310 : no210 port map( A => n308, B => n304, Y => n306);
   U311 : na210 port map( A => n297, B => n309, Y => n305);
   U312 : na210 port map( A => n302, B => n308, Y => n309);
   U313 : iv110 port map( A => n310, Y => n297);
   U314 : mu111 port map( A => n310, B => n302, S => n308, Y => n_col_0_port);
   U315 : iv110 port map( A => n304, Y => n302);
   U316 : na210 port map( A => n234, B => n226, Y => n304);
   U317 : na310 port map( A => col_1_port, B => col_0_port, C => col_2_port, Y 
                           => n226);
   U318 : na310 port map( A => n311, B => n312, C => n313, Y => n310);
   U319 : iv110 port map( A => n206, Y => n205);
   U320 : na210 port map( A => n206, B => n189, Y => n204);
   U321 : na210 port map( A => n206, B => n188, Y => n203);
   U322 : na210 port map( A => n206, B => n187, Y => n202);
   U323 : na210 port map( A => n206, B => n186, Y => n201);
   U324 : na210 port map( A => n206, B => n185, Y => n200);
   U325 : na210 port map( A => n206, B => n184, Y => n199);
   U326 : na210 port map( A => n206, B => n183, Y => n198);
   U327 : na210 port map( A => n206, B => n182, Y => n197);
   U328 : na210 port map( A => n206, B => n181, Y => n196);
   U329 : na210 port map( A => n206, B => n180, Y => n195);
   U330 : no210 port map( A => n314, B => reset, Y => n206);
   U331 : iv110 port map( A => start, Y => n314);
   U332 : no310 port map( A => state_0_port, B => state_1_port, C => n315, Y =>
                           n193);
   U333 : na310 port map( A => n311, B => n230, C => n316, Y => n192);
   U334 : no310 port map( A => n317, B => n276, C => n318, Y => n316);
   U335 : no210 port map( A => n208, B => n239, Y => n318);
   U336 : no210 port map( A => n277, B => n216, Y => n276);
   U337 : no210 port map( A => n319, B => n320, Y => n230);
   U338 : no210 port map( A => n312, B => ram_in, Y => n320);
   U339 : no210 port map( A => n216, B => state_0_port, Y => n319);
   U340 : iv110 port map( A => n321, Y => n216);
   U341 : iv110 port map( A => n322, Y => n311);
   U342 : na210 port map( A => n214, B => n323, Y => n322);
   U343 : na210 port map( A => n298, B => n324, Y => n323);
   U344 : iv110 port map( A => N82, Y => n189);
   U345 : iv110 port map( A => N79, Y => n188);
   U346 : iv110 port map( A => N76, Y => n187);
   U347 : iv110 port map( A => N73, Y => n186);
   U348 : iv110 port map( A => N70, Y => n185);
   U349 : iv110 port map( A => N67, Y => n184);
   U350 : iv110 port map( A => N64, Y => n183);
   U351 : iv110 port map( A => N61, Y => n182);
   U352 : iv110 port map( A => N58, Y => n181);
   U353 : iv110 port map( A => N55, Y => n180);
   U354 : no210 port map( A => n325, B => n326, Y => n179);
   U355 : no210 port map( A => n313, B => n241, Y => n326);
   U356 : iv110 port map( A => shift_col_0_port, Y => n241);
   U357 : no210 port map( A => n327, B => n308, Y => n325);
   U358 : iv110 port map( A => col_0_port, Y => n308);
   U359 : no210 port map( A => n328, B => n329, Y => n178);
   U360 : no210 port map( A => n313, B => n240, Y => n329);
   U361 : iv110 port map( A => shift_col_1_port, Y => n240);
   U362 : no210 port map( A => n327, B => n307, Y => n328);
   U363 : iv110 port map( A => col_1_port, Y => n307);
   U364 : no210 port map( A => n330, B => n331, Y => n177);
   U365 : no210 port map( A => n313, B => n242, Y => n331);
   U366 : iv110 port map( A => shift_col_2_port, Y => n242);
   U367 : no210 port map( A => n327, B => n332, Y => n330);
   U368 : iv110 port map( A => col_2_port, Y => n332);
   U369 : no210 port map( A => n333, B => n334, Y => n176);
   U370 : mu111 port map( A => n317, B => n170, S => shift_row_0_port, Y => 
                           n334);
   U371 : no210 port map( A => n327, B => n293, Y => n333);
   U372 : iv110 port map( A => row_0_port, Y => n293);
   U373 : no310 port map( A => n335, B => n336, C => n337, Y => n175);
   U374 : iv110 port map( A => n338, Y => n337);
   U375 : na210 port map( A => n170, B => shift_row_1_port, Y => n338);
   U376 : no210 port map( A => n217, B => n339, Y => n336);
   U377 : ex210 port map( A => shift_row_1_port, B => shift_row_0_port, Y => 
                           n339);
   U378 : no210 port map( A => n327, B => n286, Y => n335);
   U379 : iv110 port map( A => row_1_port, Y => n286);
   U380 : no310 port map( A => n340, B => n341, C => n342, Y => n174);
   U381 : no210 port map( A => n343, B => n344, Y => n342);
   U382 : no210 port map( A => n327, B => n223, Y => n341);
   U383 : iv110 port map( A => row_2_port, Y => n223);
   U384 : iv110 port map( A => n345, Y => n340);
   U385 : na210 port map( A => n317, B => n252, Y => n345);
   U386 : ex210 port map( A => shift_row_2_port, B => n259, Y => n252);
   U387 : no310 port map( A => n346, B => n347, C => n348, Y => n173);
   U388 : no210 port map( A => n327, B => n224, Y => n348);
   U389 : iv110 port map( A => row_3_port, Y => n224);
   U390 : no310 port map( A => n194, B => n349, C => n234, Y => n327);
   U391 : iv110 port map( A => n350, Y => n347);
   U392 : na210 port map( A => n317, B => n247, Y => n350);
   U393 : na210 port map( A => n239, B => n351, Y => n247);
   U394 : na210 port map( A => shift_row_3_port, B => n352, Y => n351);
   U395 : na210 port map( A => n259, B => n344, Y => n352);
   U396 : na310 port map( A => n344, B => n353, C => n259, Y => n239);
   U397 : no210 port map( A => shift_row_1_port, B => shift_row_0_port, Y => 
                           n259);
   U398 : iv110 port map( A => shift_row_2_port, Y => n344);
   U399 : no210 port map( A => n343, B => n353, Y => n346);
   U400 : iv110 port map( A => shift_row_3_port, Y => n353);
   U401 : na310 port map( A => n313, B => n312, C => n354, Y => n172);
   U402 : no310 port map( A => n234, B => n298, C => n194, Y => n354);
   U403 : iv110 port map( A => n214, Y => n194);
   U404 : na310 port map( A => state_0_port, B => n324, C => n355, Y => n214);
   U405 : no210 port map( A => n315, B => n277, Y => n298);
   U406 : iv110 port map( A => n227, Y => n234);
   U407 : na310 port map( A => n277, B => n324, C => n355, Y => n227);
   U408 : iv110 port map( A => n228, Y => n312);
   U409 : no310 port map( A => n324, B => state_0_port, C => n315, Y => n228);
   U410 : no210 port map( A => n317, B => n170, Y => n313);
   U411 : iv110 port map( A => n217, Y => n317);
   U412 : no210 port map( A => n232, B => n265, Y => n217);
   U413 : no310 port map( A => state_1_port, B => state_2_port, C => n356, Y =>
                           n265);
   U414 : iv110 port map( A => n263, Y => n232);
   U415 : na310 port map( A => state_1_port, B => n277, C => n355, Y => n263);
   U416 : na310 port map( A => state_1_port, B => n315, C => n357, Y => n171);
   U417 : mu111 port map( A => n356, B => n358, S => n277, Y => n357);
   U418 : iv110 port map( A => state_0_port, Y => n277);
   U419 : iv110 port map( A => n349, Y => n315);
   U420 : no210 port map( A => state_2_port, B => state_3_port, Y => n349);
   U421 : iv110 port map( A => n343, Y => n170);
   U422 : no210 port map( A => n238, B => n321, Y => n343);
   U423 : no310 port map( A => n324, B => state_2_port, C => n356, Y => n321);
   U424 : iv110 port map( A => state_3_port, Y => n356);
   U425 : iv110 port map( A => state_1_port, Y => n324);
   U426 : iv110 port map( A => n208, Y => n238);
   U427 : na310 port map( A => state_0_port, B => state_1_port, C => n355, Y =>
                           n208);
   U428 : no210 port map( A => n358, B => state_3_port, Y => n355);
   U429 : iv110 port map( A => state_2_port, Y => n358);
   U430 : na210 port map( A => ram_in, B => state_2_port, Y => n169);

end synthesised;



