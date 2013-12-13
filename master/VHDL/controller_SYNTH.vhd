
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of controller is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component na310
      port( A, B, C : in std_logic;  Y : out std_logic);
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
   
   component ex210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component dfn10
      port( D, CK : in std_logic;  Q : out std_logic);
   end component;
   
   component dfr11
      port( D, R, CK : in std_logic;  Q : out std_logic);
   end component;
   
   component controller_move
      port( clk, rst : in std_logic;  x, y, rot, add_sub, draw_erase_draw, 
            draw_erase_start : out std_logic;  draw_erase_ready, start : in 
            std_logic;  ready : out std_logic;  inputs : in std_logic_vector (3
            downto 0);  drop, check_ready : in std_logic;  check_start : out 
            std_logic;  check_empty : in std_logic);
   end component;
   
   component controller_calc
      port( old_x : in std_logic_vector (2 downto 0);  old_y : in 
            std_logic_vector (3 downto 0);  old_rot : in std_logic_vector (1 
            downto 0);  new_x : out std_logic_vector (2 downto 0);  new_y : out
            std_logic_vector (3 downto 0);  new_rot : out std_logic_vector (1 
            downto 0);  add_sub, rot, x, y : in std_logic);
   end component;
   
   signal lut_piece_type_2_port, lut_piece_type_1_port, lut_piece_type_0_port, 
      lut_x_2_port, lut_x_1_port, lut_x_0_port, lut_y_3_port, lut_y_2_port, 
      lut_y_1_port, lut_y_0_port, lut_rot_1_port, lut_rot_0_port, cur_x_2_port,
      cur_x_1_port, cur_x_0_port, cur_y_3_port, cur_y_2_port, cur_y_1_port, 
      cur_y_0_port, cur_rot_1_port, cur_rot_0_port, add_sub, rot, x, move_x, 
      move_y, move_rot, move_add_sub, move_draw_erase_draw, 
      move_draw_erase_start, move_ready, move_check_start, cur_state_4_port, 
      cur_state_3_port, cur_state_2_port, cur_state_1_port, cur_state_0_port, 
      cur_future_piece_2_port, cur_future_piece_1_port, cur_future_piece_0_port
      , next_state_4_port, next_state_3_port, next_state_2_port, 
      next_state_1_port, next_state_0_port, cur_timer_1_time, cur_timer_1_start
      , cur_timer_1_reset, n267, n268, n269, n270, clear_shift_start_port, 
      lut_next_piece_port, new_piece_port, n274, draw_score_draw_port, n276, 
      n277, n278, n279, n280, n281, n282, n283, n284, n285, n286, n287, n288, 
      n289, n290, n291, n292, n293, n294, n295, n296, n297, n298, n299, n300, 
      n301, n302, n303, n304, n305, n306, n307, n308, n309, n310, n311, n312, 
      n313, n314, n315, n316, n317, n318, n319, n320, n321, n322, n323, n324, 
      n325, n326, n327, n328, n329, n330, n331, n332, n333, n334, n335, n336, 
      n337, n338, n339, n340, n341, n342, n343, n344, n345, n346, n347, n348, 
      n349, n350, n351, n352, n353, n354, n355, n356, n357, n358, n359, n360, 
      n361, n362, n363, n364, n365, n366, n367, n368, n369, n370, n371, n372, 
      n373, n374, n375, n376, n377, n378, n379, n380, n381, n382, n383, n384, 
      n385, n386, n387, n388, n389, n390, n391, n392, n393, n394, n395, n396, 
      n397, n398, n399, n400, n401, n402, n403, n404, n405, n406, n407, n408, 
      n409, n410, n411, n412, n413, n414, n415, n416, n417, n418, n419, n420, 
      n421, n422, n423, n424, n425, n426, n427, n428, n429, n430, n431, n432, 
      n433, n434, n435, n436, n437, n438, n439, n440, n441, n442, n443, n444, 
      n445, n446, n447, n448, n449, n450, n451, n452, n453, n454, n455, n456, 
      n457, n458, n459, n460, n461, n462, n463, n464, n465, n466, n467, n468, 
      n469, n470, n471, n472, n473, n474, n475, n476, n477, n478, n479, n480, 
      n481, n482, n483, n484, n485, n486, n487, n488, n489, n490, n491, n492, 
      n493, n494, n495, n496, n497, n498, n499, n500, n501, n502, n503, n504, 
      n505, n506, n507, n508, n509, n510, n511, n512, n513, n514, n515, n516, 
      n517, n518, n519, n520, n521, n522, n523, n524, n525, n526, n527, n528, 
      n529, n530, n531, n532, n533, n534, n535, n536, n537, n538, n539, n540, 
      n541, n542, n543, n544, n545, n546, n547, n548, n549, n550 : std_logic;

begin
   lut_piece_type <= ( lut_piece_type_2_port, lut_piece_type_1_port, 
      lut_piece_type_0_port );
   lut_next_piece <= lut_next_piece_port;
   lut_x <= ( lut_x_2_port, lut_x_1_port, lut_x_0_port );
   lut_y <= ( lut_y_3_port, lut_y_2_port, lut_y_1_port, lut_y_0_port );
   lut_rot <= ( lut_rot_1_port, lut_rot_0_port );
   new_piece <= new_piece_port;
   clear_shift_start <= clear_shift_start_port;
   draw_score_draw <= draw_score_draw_port;
   
   calc_pm : controller_calc port map( old_x(2) => cur_x_2_port, old_x(1) => 
                           cur_x_1_port, old_x(0) => cur_x_0_port, old_y(3) => 
                           cur_y_3_port, old_y(2) => cur_y_2_port, old_y(1) => 
                           cur_y_1_port, old_y(0) => cur_y_0_port, old_rot(1) 
                           => cur_rot_1_port, old_rot(0) => cur_rot_0_port, 
                           new_x(2) => lut_x_2_port, new_x(1) => lut_x_1_port, 
                           new_x(0) => lut_x_0_port, new_y(3) => lut_y_3_port, 
                           new_y(2) => lut_y_2_port, new_y(1) => lut_y_1_port, 
                           new_y(0) => lut_y_0_port, new_rot(1) => 
                           lut_rot_1_port, new_rot(0) => lut_rot_0_port, 
                           add_sub => add_sub, rot => rot, x => x, y => n270);
   move_pm : controller_move port map( clk => clk, rst => rst, x => move_x, y 
                           => move_y, rot => move_rot, add_sub => move_add_sub,
                           draw_erase_draw => move_draw_erase_draw, 
                           draw_erase_start => move_draw_erase_start, 
                           draw_erase_ready => draw_erase_ready, start => n274,
                           ready => move_ready, inputs(3) => inputs(3), 
                           inputs(2) => inputs(2), inputs(1) => inputs(1), 
                           inputs(0) => inputs(0), drop => n276, check_ready =>
                           check_ready, check_start => move_check_start, 
                           check_empty => check_empty);
   cur_timer_1_time_reg : dfn10 port map( D => n269, CK => clk, Q => 
                           cur_timer_1_time);
   cur_state_reg_3_inst : dfr11 port map( D => next_state_3_port, R => rst, CK 
                           => clk, Q => cur_state_3_port);
   cur_y_reg_3_inst : dfn10 port map( D => n291, CK => clk, Q => cur_y_3_port);
   cur_state_reg_2_inst : dfr11 port map( D => next_state_2_port, R => rst, CK 
                           => clk, Q => cur_state_2_port);
   cur_state_reg_0_inst : dfr11 port map( D => next_state_0_port, R => rst, CK 
                           => clk, Q => cur_state_0_port);
   cur_state_reg_1_inst : dfr11 port map( D => next_state_1_port, R => rst, CK 
                           => clk, Q => cur_state_1_port);
   cur_state_reg_4_inst : dfr11 port map( D => next_state_4_port, R => rst, CK 
                           => clk, Q => cur_state_4_port);
   cur_y_reg_2_inst : dfn10 port map( D => n285, CK => clk, Q => cur_y_2_port);
   cur_y_reg_1_inst : dfn10 port map( D => n286, CK => clk, Q => cur_y_1_port);
   cur_y_reg_0_inst : dfn10 port map( D => n287, CK => clk, Q => cur_y_0_port);
   cur_timer_1_reset_reg : dfn10 port map( D => n268, CK => clk, Q => 
                           cur_timer_1_reset);
   cur_rot_reg_0_inst : dfn10 port map( D => n284, CK => clk, Q => 
                           cur_rot_0_port);
   cur_rot_reg_1_inst : dfn10 port map( D => n283, CK => clk, Q => 
                           cur_rot_1_port);
   cur_x_reg_2_inst : dfn10 port map( D => n288, CK => clk, Q => cur_x_2_port);
   cur_x_reg_1_inst : dfn10 port map( D => n289, CK => clk, Q => cur_x_1_port);
   cur_x_reg_0_inst : dfn10 port map( D => n290, CK => clk, Q => cur_x_0_port);
   cur_piece_reg_2_inst : dfn10 port map( D => n280, CK => clk, Q => 
                           lut_piece_type_2_port);
   cur_future_piece_reg_2_inst : dfn10 port map( D => n277, CK => clk, Q => 
                           cur_future_piece_2_port);
   cur_piece_reg_1_inst : dfn10 port map( D => n281, CK => clk, Q => 
                           lut_piece_type_1_port);
   cur_future_piece_reg_1_inst : dfn10 port map( D => n278, CK => clk, Q => 
                           cur_future_piece_1_port);
   cur_piece_reg_0_inst : dfn10 port map( D => n282, CK => clk, Q => 
                           lut_piece_type_0_port);
   cur_future_piece_reg_0_inst : dfn10 port map( D => n279, CK => clk, Q => 
                           cur_future_piece_0_port);
   cur_timer_1_start_reg : dfn10 port map( D => n267, CK => clk, Q => 
                           cur_timer_1_start);
   U306 : iv110 port map( A => n292, Y => x);
   U307 : na210 port map( A => n293, B => move_x, Y => n292);
   U308 : na210 port map( A => n294, B => n295, Y => timer_1_time);
   U309 : na210 port map( A => cur_timer_1_time, B => n296, Y => n295);
   U310 : iv110 port map( A => n297, Y => n296);
   U311 : na210 port map( A => n298, B => n299, Y => timer_1_start);
   U312 : na210 port map( A => cur_timer_1_start, B => n300, Y => n299);
   U313 : iv110 port map( A => n301, Y => n298);
   U314 : na210 port map( A => n302, B => n303, Y => timer_1_reset);
   U315 : na210 port map( A => cur_timer_1_reset, B => n304, Y => n303);
   U316 : iv110 port map( A => n305, Y => n304);
   U317 : iv110 port map( A => n306, Y => n302);
   U318 : iv110 port map( A => n307, Y => rot);
   U319 : na210 port map( A => n293, B => move_rot, Y => n307);
   U320 : na310 port map( A => n308, B => n309, C => n310, Y => 
                           next_state_4_port);
   U321 : no310 port map( A => n311, B => n312, C => n313, Y => n310);
   U322 : no210 port map( A => n314, B => n315, Y => n313);
   U323 : no210 port map( A => n316, B => n317, Y => n312);
   U324 : no210 port map( A => n318, B => n319, Y => n316);
   U325 : no210 port map( A => move_ready, B => n320, Y => n318);
   U326 : no210 port map( A => n321, B => n322, Y => n309);
   U327 : no210 port map( A => n323, B => n324, Y => n308);
   U328 : no310 port map( A => n325, B => cur_timer_1_time, C => n326, Y => 
                           n324);
   U329 : no210 port map( A => n327, B => n328, Y => n323);
   U330 : na310 port map( A => n329, B => n330, C => n331, Y => 
                           next_state_3_port);
   U331 : no310 port map( A => n332, B => n333, C => n334, Y => n331);
   U332 : no310 port map( A => n325, B => n335, C => n326, Y => n334);
   U333 : no210 port map( A => n336, B => n337, Y => n332);
   U334 : no210 port map( A => n338, B => n339, Y => n336);
   U335 : iv110 port map( A => n340, Y => n329);
   U336 : na310 port map( A => n341, B => n342, C => n343, Y => 
                           next_state_2_port);
   U337 : no310 port map( A => n344, B => n345, C => n340, Y => n343);
   U338 : na310 port map( A => n346, B => n347, C => n348, Y => n340);
   U339 : no210 port map( A => n349, B => n350, Y => n348);
   U340 : no310 port map( A => n351, B => n328, C => n352, Y => n350);
   U341 : iv110 port map( A => n327, Y => n352);
   U342 : no310 port map( A => n353, B => n354, C => n355, Y => n327);
   U343 : iv110 port map( A => n356, Y => n355);
   U344 : no210 port map( A => n357, B => n358, Y => n356);
   U345 : ex210 port map( A => lut_y_1_port, B => cur_y_1_port, Y => n358);
   U346 : ex210 port map( A => lut_y_3_port, B => cur_y_3_port, Y => n357);
   U347 : ex210 port map( A => cur_y_0_port, B => lut_y_0_port, Y => n354);
   U348 : ex210 port map( A => cur_y_2_port, B => lut_y_2_port, Y => n353);
   U349 : na310 port map( A => n359, B => n325, C => new_piece_port, Y => n347)
                           ;
   U350 : na210 port map( A => draw_score_ready, B => draw_score_draw_port, Y 
                           => n346);
   U351 : no210 port map( A => n360, B => n361, Y => n345);
   U352 : iv110 port map( A => clear_shift_start_port, Y => n360);
   U353 : no210 port map( A => n362, B => n363, Y => n341);
   U354 : no210 port map( A => n364, B => n365, Y => n362);
   U355 : no310 port map( A => n339, B => lut_next_piece_port, C => n366, Y => 
                           n364);
   U356 : no210 port map( A => check_ready, B => n367, Y => n366);
   U357 : na310 port map( A => n368, B => n369, C => n370, Y => n339);
   U358 : na210 port map( A => n371, B => n372, Y => n370);
   U359 : na310 port map( A => n373, B => n374, C => n375, Y => 
                           next_state_1_port);
   U360 : no310 port map( A => n376, B => n377, C => n378, Y => n375);
   U361 : no210 port map( A => n320, B => n351, Y => n377);
   U362 : na210 port map( A => n379, B => n380, Y => n376);
   U363 : na210 port map( A => n381, B => n382, Y => n380);
   U364 : na210 port map( A => n383, B => draw_erase_ready, Y => n379);
   U365 : no210 port map( A => n384, B => n385, Y => n374);
   U366 : no210 port map( A => cur_timer_1_time, B => n386, Y => n385);
   U367 : no310 port map( A => n387, B => n367, C => n388, Y => n384);
   U368 : no210 port map( A => n389, B => n363, Y => n373);
   U369 : no210 port map( A => inputs(4), B => n326, Y => n363);
   U370 : no210 port map( A => n390, B => n391, Y => n389);
   U371 : no310 port map( A => n392, B => n274, C => n393, Y => n390);
   U372 : no210 port map( A => draw_erase_ready, B => n394, Y => n393);
   U373 : na310 port map( A => n395, B => n396, C => n397, Y => 
                           next_state_0_port);
   U374 : no310 port map( A => n398, B => n344, C => n378, Y => n397);
   U375 : na310 port map( A => n399, B => n400, C => n401, Y => n378);
   U376 : iv110 port map( A => n311, Y => n401);
   U377 : na310 port map( A => n402, B => n403, C => n404, Y => n311);
   U378 : na210 port map( A => n405, B => n406, Y => n403);
   U379 : iv110 port map( A => n407, Y => n406);
   U380 : na210 port map( A => draw_erase_ready, B => n371, Y => n402);
   U381 : na310 port map( A => n359, B => n325, C => n333, Y => n399);
   U382 : iv110 port map( A => n408, Y => n333);
   U383 : iv110 port map( A => inputs(4), Y => n325);
   U384 : na210 port map( A => n409, B => n410, Y => n344);
   U385 : na210 port map( A => n338, B => n388, Y => n410);
   U386 : iv110 port map( A => check_empty, Y => n388);
   U387 : na210 port map( A => n330, B => n411, Y => n398);
   U388 : na210 port map( A => timer_1_done, B => n321, Y => n411);
   U389 : na210 port map( A => n412, B => draw_erase_ready, Y => n330);
   U390 : no310 port map( A => n413, B => n414, C => n322, Y => n396);
   U391 : no310 port map( A => n415, B => n335, C => n382, Y => n322);
   U392 : iv110 port map( A => inputs(5), Y => n382);
   U393 : iv110 port map( A => cur_timer_1_time, Y => n335);
   U394 : no210 port map( A => n416, B => n417, Y => n395);
   U395 : no210 port map( A => n418, B => n419, Y => n417);
   U396 : no310 port map( A => n420, B => n421, C => n392, Y => n418);
   U397 : na210 port map( A => n422, B => n368, Y => n392);
   U398 : na210 port map( A => n423, B => n314, Y => n368);
   U399 : iv110 port map( A => n319, Y => n422);
   U400 : na310 port map( A => n424, B => n425, C => n426, Y => n319);
   U401 : no210 port map( A => n405, B => n371, Y => n426);
   U402 : na210 port map( A => n338, B => n387, Y => n425);
   U403 : iv110 port map( A => check_ready, Y => n387);
   U404 : na210 port map( A => clear_shift_start_port, B => n361, Y => n424);
   U405 : iv110 port map( A => clear_shift_ready, Y => n361);
   U406 : no210 port map( A => n427, B => n428, Y => n416);
   U407 : no210 port map( A => inputs(4), B => n314, Y => n428);
   U408 : iv110 port map( A => n359, Y => n314);
   U409 : no210 port map( A => n407, B => inputs(5), Y => n359);
   U410 : na210 port map( A => n429, B => n430, Y => n407);
   U411 : no210 port map( A => inputs(3), B => inputs(2), Y => n430);
   U412 : no210 port map( A => inputs(1), B => inputs(0), Y => n429);
   U413 : no210 port map( A => n431, B => new_piece_port, Y => n427);
   U414 : no210 port map( A => n432, B => n433, Y => n431);
   U415 : na210 port map( A => n434, B => n435, Y => n291);
   U416 : na210 port map( A => n436, B => lut_y_3_port, Y => n435);
   U417 : na210 port map( A => cur_y_3_port, B => n437, Y => n434);
   U418 : na310 port map( A => n438, B => n439, C => n440, Y => n290);
   U419 : na210 port map( A => lut_x_0_port, B => n441, Y => n439);
   U420 : na210 port map( A => cur_x_0_port, B => n442, Y => n438);
   U421 : na310 port map( A => n443, B => n444, C => n440, Y => n289);
   U422 : na210 port map( A => n412, B => n445, Y => n440);
   U423 : iv110 port map( A => n394, Y => n412);
   U424 : na210 port map( A => lut_x_1_port, B => n441, Y => n444);
   U425 : na210 port map( A => cur_x_1_port, B => n442, Y => n443);
   U426 : na210 port map( A => n446, B => n447, Y => n288);
   U427 : na210 port map( A => lut_x_2_port, B => n441, Y => n447);
   U428 : no210 port map( A => n448, B => n449, Y => n441);
   U429 : na210 port map( A => cur_x_2_port, B => n442, Y => n446);
   U430 : na210 port map( A => n445, B => n450, Y => n442);
   U431 : iv110 port map( A => n449, Y => n445);
   U432 : no210 port map( A => n451, B => n452, Y => n449);
   U433 : no310 port map( A => n453, B => n372, C => n454, Y => n452);
   U434 : na210 port map( A => n328, B => n409, Y => n454);
   U435 : na210 port map( A => n455, B => n456, Y => n287);
   U436 : na210 port map( A => n436, B => lut_y_0_port, Y => n456);
   U437 : na210 port map( A => cur_y_0_port, B => n437, Y => n455);
   U438 : na210 port map( A => n457, B => n458, Y => n286);
   U439 : na210 port map( A => n436, B => lut_y_1_port, Y => n458);
   U440 : na210 port map( A => cur_y_1_port, B => n437, Y => n457);
   U441 : na210 port map( A => n459, B => n460, Y => n285);
   U442 : na210 port map( A => n436, B => lut_y_2_port, Y => n460);
   U443 : no310 port map( A => n351, B => n328, C => n453, Y => n436);
   U444 : na210 port map( A => cur_y_2_port, B => n437, Y => n459);
   U445 : na310 port map( A => n461, B => n462, C => n463, Y => n437);
   U446 : no210 port map( A => n293, B => n421, Y => n463);
   U447 : no210 port map( A => move_ready, B => n328, Y => n421);
   U448 : na210 port map( A => n464, B => n465, Y => n284);
   U449 : na310 port map( A => n451, B => n414, C => lut_rot_0_port, Y => n465)
                           ;
   U450 : na210 port map( A => cur_rot_0_port, B => n466, Y => n464);
   U451 : na210 port map( A => n467, B => n468, Y => n283);
   U452 : na310 port map( A => n451, B => n414, C => lut_rot_1_port, Y => n468)
                           ;
   U453 : iv110 port map( A => n448, Y => n414);
   U454 : na210 port map( A => move_ready, B => n293, Y => n448);
   U455 : na210 port map( A => cur_rot_1_port, B => n466, Y => n467);
   U456 : na210 port map( A => n451, B => n450, Y => n466);
   U457 : na210 port map( A => n293, B => n351, Y => n450);
   U458 : iv110 port map( A => move_ready, Y => n351);
   U459 : no310 port map( A => n453, B => n276, C => n469, Y => n451);
   U460 : na310 port map( A => n470, B => n471, C => n472, Y => n282);
   U461 : na210 port map( A => lut_piece_type_0_port, B => n473, Y => n472);
   U462 : na210 port map( A => cur_future_piece_0_port, B => n474, Y => n471);
   U463 : na210 port map( A => next_piece(0), B => n475, Y => n470);
   U464 : na310 port map( A => n476, B => n477, C => n478, Y => n281);
   U465 : na210 port map( A => lut_piece_type_1_port, B => n473, Y => n478);
   U466 : na210 port map( A => cur_future_piece_1_port, B => n474, Y => n477);
   U467 : na210 port map( A => next_piece(1), B => n475, Y => n476);
   U468 : na310 port map( A => n479, B => n480, C => n481, Y => n280);
   U469 : na210 port map( A => lut_piece_type_2_port, B => n473, Y => n481);
   U470 : na210 port map( A => cur_future_piece_2_port, B => n474, Y => n480);
   U471 : no210 port map( A => n473, B => n461, Y => n474);
   U472 : iv110 port map( A => n469, Y => n461);
   U473 : na210 port map( A => n394, B => n409, Y => n469);
   U474 : na210 port map( A => next_piece(2), B => n475, Y => n479);
   U475 : no210 port map( A => n473, B => n482, Y => n475);
   U476 : na310 port map( A => n483, B => n320, C => n462, Y => n473);
   U477 : iv110 port map( A => n453, Y => n462);
   U478 : na310 port map( A => n484, B => n369, C => n485, Y => n453);
   U479 : no310 port map( A => new_piece_port, B => rst, C => n405, Y => n485);
   U480 : iv110 port map( A => n486, Y => n484);
   U481 : na210 port map( A => lut_next_piece_port, B => n372, Y => n483);
   U482 : na310 port map( A => n487, B => n488, C => n489, Y => n279);
   U483 : na210 port map( A => cur_future_piece_0_port, B => n490, Y => n489);
   U484 : na210 port map( A => n491, B => next_piece(0), Y => n488);
   U485 : na210 port map( A => n492, B => lut_piece_type_0_port, Y => n487);
   U486 : na310 port map( A => n493, B => n494, C => n495, Y => n278);
   U487 : na210 port map( A => cur_future_piece_1_port, B => n490, Y => n495);
   U488 : na210 port map( A => n491, B => next_piece(1), Y => n494);
   U489 : na210 port map( A => n492, B => lut_piece_type_1_port, Y => n493);
   U490 : na310 port map( A => n496, B => n497, C => n498, Y => n277);
   U491 : na210 port map( A => cur_future_piece_2_port, B => n490, Y => n498);
   U492 : na210 port map( A => n491, B => next_piece(2), Y => n497);
   U493 : no210 port map( A => n490, B => n499, Y => n491);
   U494 : na210 port map( A => n492, B => lut_piece_type_2_port, Y => n496);
   U495 : no210 port map( A => n490, B => n394, Y => n492);
   U496 : iv110 port map( A => n500, Y => n490);
   U497 : no310 port map( A => n486, B => n501, C => n502, Y => n500);
   U498 : na210 port map( A => n503, B => n504, Y => n502);
   U499 : na210 port map( A => lut_next_piece_port, B => n505, Y => n504);
   U500 : na210 port map( A => n482, B => draw_erase_ready, Y => n505);
   U501 : na310 port map( A => n506, B => n404, C => n507, Y => n486);
   U502 : no310 port map( A => n423, B => n321, C => n349, Y => n507);
   U503 : no210 port map( A => n508, B => n509, Y => n404);
   U504 : no210 port map( A => n371, B => n510, Y => n506);
   U505 : iv110 port map( A => n511, Y => n371);
   U506 : no210 port map( A => n328, B => n512, Y => n270);
   U507 : iv110 port map( A => move_y, Y => n512);
   U508 : na210 port map( A => n513, B => n514, Y => n269);
   U509 : na210 port map( A => cur_timer_1_time, B => n515, Y => n514);
   U510 : na210 port map( A => n297, B => n503, Y => n515);
   U511 : no310 port map( A => n423, B => n321, C => n516, Y => n297);
   U512 : iv110 port map( A => n315, Y => n423);
   U513 : na210 port map( A => n517, B => n518, Y => n315);
   U514 : na210 port map( A => n519, B => n503, Y => n513);
   U515 : iv110 port map( A => n294, Y => n519);
   U516 : no310 port map( A => n520, B => n349, C => n521, Y => n294);
   U517 : na210 port map( A => n522, B => n499, Y => n521);
   U518 : iv110 port map( A => n400, Y => n349);
   U519 : no210 port map( A => n523, B => n391, Y => n520);
   U520 : na210 port map( A => n524, B => n525, Y => n268);
   U521 : na210 port map( A => cur_timer_1_reset, B => n526, Y => n525);
   U522 : na210 port map( A => n305, B => n503, Y => n526);
   U523 : no310 port map( A => new_piece_port, B => n508, C => n516, Y => n305)
                           ;
   U524 : na210 port map( A => n527, B => n528, Y => n516);
   U525 : na310 port map( A => n365, B => n317, C => cur_state_1_port, Y => 
                           n528);
   U526 : na210 port map( A => n306, B => n503, Y => n524);
   U527 : na210 port map( A => n400, B => n529, Y => n306);
   U528 : na210 port map( A => n509, B => n391, Y => n529);
   U529 : iv110 port map( A => n523, Y => n509);
   U530 : na210 port map( A => n517, B => n365, Y => n523);
   U531 : na210 port map( A => n518, B => n530, Y => n400);
   U532 : na210 port map( A => n531, B => n532, Y => n267);
   U533 : na210 port map( A => cur_timer_1_start, B => n533, Y => n532);
   U534 : na210 port map( A => n534, B => n503, Y => n533);
   U535 : iv110 port map( A => n300, Y => n534);
   U536 : na310 port map( A => n535, B => n499, C => n527, Y => n300);
   U537 : no310 port map( A => n501, B => lut_next_piece_port, C => n510, Y => 
                           n527);
   U538 : na310 port map( A => n386, B => n408, C => n536, Y => n510);
   U539 : no210 port map( A => clear_shift_start_port, B => n338, Y => n536);
   U540 : iv110 port map( A => n367, Y => n338);
   U541 : na310 port map( A => n537, B => cur_state_4_port, C => n538, Y => 
                           n408);
   U542 : no210 port map( A => cur_state_3_port, B => cur_state_0_port, Y => 
                           n538);
   U543 : no210 port map( A => n381, B => n413, Y => n386);
   U544 : iv110 port map( A => n326, Y => n413);
   U545 : na310 port map( A => n391, B => n365, C => n530, Y => n326);
   U546 : iv110 port map( A => n415, Y => n381);
   U547 : na210 port map( A => n539, B => n518, Y => n415);
   U548 : na310 port map( A => n409, B => n369, C => n540, Y => n501);
   U549 : no210 port map( A => n274, B => n405, Y => n540);
   U550 : no210 port map( A => n541, B => n542, Y => n405);
   U551 : na210 port map( A => n537, B => n530, Y => n409);
   U552 : iv110 port map( A => new_piece_port, Y => n499);
   U553 : no210 port map( A => n433, B => n541, Y => new_piece_port);
   U554 : na210 port map( A => n517, B => cur_state_1_port, Y => n535);
   U555 : na210 port map( A => n301, B => n503, Y => n531);
   U556 : iv110 port map( A => rst, Y => n503);
   U557 : na310 port map( A => n511, B => n522, C => n342, Y => n301);
   U558 : na210 port map( A => n321, B => n543, Y => n342);
   U559 : iv110 port map( A => timer_1_done, Y => n543);
   U560 : no310 port map( A => n317, B => n542, C => n419, Y => n321);
   U561 : iv110 port map( A => n508, Y => n522);
   U562 : no310 port map( A => n542, B => cur_state_0_port, C => n317, Y => 
                           n508);
   U563 : na210 port map( A => n394, B => n482, Y => lut_next_piece_port);
   U564 : iv110 port map( A => n369, Y => draw_score_draw_port);
   U565 : na310 port map( A => n544, B => n337, C => n537, Y => n369);
   U566 : na310 port map( A => n545, B => n511, C => n546, Y => 
                           draw_erase_start);
   U567 : iv110 port map( A => n420, Y => n546);
   U568 : na210 port map( A => n394, B => n547, Y => n420);
   U569 : na210 port map( A => n383, B => n372, Y => n547);
   U570 : iv110 port map( A => draw_erase_ready, Y => n372);
   U571 : iv110 port map( A => n482, Y => n383);
   U572 : na210 port map( A => n537, B => n539, Y => n482);
   U573 : no210 port map( A => n541, B => cur_state_3_port, Y => n539);
   U574 : na210 port map( A => move_draw_erase_start, B => n274, Y => n545);
   U575 : na310 port map( A => n511, B => n394, C => n548, Y => draw_erase_draw
                           );
   U576 : na210 port map( A => move_draw_erase_draw, B => n274, Y => n548);
   U577 : na310 port map( A => n544, B => n337, C => n518, Y => n394);
   U578 : no210 port map( A => n365, B => n391, Y => n518);
   U579 : iv110 port map( A => n432, Y => n544);
   U580 : na310 port map( A => cur_state_1_port, B => n365, C => n530, Y => 
                           n511);
   U581 : no210 port map( A => n337, B => n432, Y => n530);
   U582 : no310 port map( A => n317, B => cur_state_0_port, C => n433, Y => 
                           clear_shift_start_port);
   U583 : na210 port map( A => n367, B => n549, Y => check_start);
   U584 : na210 port map( A => move_check_start, B => n274, Y => n549);
   U585 : iv110 port map( A => n320, Y => n274);
   U586 : no210 port map( A => n276, B => n293, Y => n320);
   U587 : na210 port map( A => n537, B => n517, Y => n367);
   U588 : no210 port map( A => n337, B => n541, Y => n517);
   U589 : na210 port map( A => cur_state_0_port, B => n317, Y => n541);
   U590 : no210 port map( A => n365, B => cur_state_1_port, Y => n537);
   U591 : na210 port map( A => n328, B => n550, Y => add_sub);
   U592 : na210 port map( A => move_add_sub, B => n293, Y => n550);
   U593 : no210 port map( A => n432, B => n542, Y => n293);
   U594 : na310 port map( A => n365, B => n337, C => cur_state_1_port, Y => 
                           n542);
   U595 : na210 port map( A => n317, B => n419, Y => n432);
   U596 : iv110 port map( A => n276, Y => n328);
   U597 : no310 port map( A => n419, B => n317, C => n433, Y => n276);
   U598 : na310 port map( A => n365, B => n337, C => n391, Y => n433);
   U599 : iv110 port map( A => cur_state_1_port, Y => n391);
   U600 : iv110 port map( A => cur_state_3_port, Y => n337);
   U601 : iv110 port map( A => cur_state_2_port, Y => n365);
   U602 : iv110 port map( A => cur_state_4_port, Y => n317);
   U603 : iv110 port map( A => cur_state_0_port, Y => n419);

end synthesised;



