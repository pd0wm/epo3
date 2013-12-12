
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of controller is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component no310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component na310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component dfn10
      port( D, CK : in std_logic;  Q : out std_logic);
   end component;
   
   component dfr11
      port( D, R, CK : in std_logic;  Q : out std_logic);
   end component;
   
   component controller_move
      port( clk, rst : in std_logic;  x, rot, add_sub, draw_erase_draw, 
            draw_erase_start : out std_logic;  draw_erase_ready, start : in 
            std_logic;  ready : out std_logic;  inputs : in std_logic_vector (3
            downto 0);  check_ready : in std_logic;  check_start : out 
            std_logic;  check_empty : in std_logic);
   end component;
   
   signal lut_piece_type_2_port, lut_piece_type_1_port, lut_piece_type_0_port, 
      lut_x_2_port, lut_x_1_port, lut_x_0_port, lut_y_3_port, lut_y_2_port, 
      lut_y_1_port, lut_y_0_port, lut_rot_1_port, lut_rot_0_port, y_port, 
      new_piece_port, clear_shift_start_port, move_x, move_rot, move_add_sub, 
      move_draw_erase_draw, move_draw_erase_start, move_start, move_ready, 
      move_check_start, cur_state_5_port, cur_state_4_port, cur_state_3_port, 
      cur_state_2_port, cur_state_1_port, cur_state_0_port, 
      cur_future_piece_2_port, cur_future_piece_1_port, cur_future_piece_0_port
      , next_state_5_port, next_state_4_port, next_state_3_port, 
      next_state_2_port, next_state_1_port, next_state_0_port, cur_timer_1_time
      , cur_timer_1_start, cur_timer_1_reset, n352, n353, n354, 
      draw_score_draw_port, n358, n359, n360, n361, n362, n363, n364, n365, 
      n366, n367, n368, n369, n370, n371, n372, n373, n374, n375, n376, n377, 
      n378, n379, n380, n381, n382, n383, n384, n385, n386, n387, n388, n389, 
      n390, n391, n392, n393, n394, n395, n396, n397, n398, n399, n400, n401, 
      n402, n403, n404, n405, n406, n407, n408, n409, n410, n411, n412, n413, 
      n414, n415, n416, n417, n418, n419, n420, n421, n422, n423, n424, n425, 
      n426, n427, n428, n429, n430, n431, n432, n433, n434, n435, n436, n437, 
      n438, n439, n440, n441, n442, n443, n444, n445, n446, n447, n448, n449, 
      n450, n451, n452, n453, n454, n455, n456, n457, n458, n459, n460, n461, 
      n462, n463, n464, n465, n466, n467, n468, n469, n470, n471, n472, n473, 
      n474, n475, n476, n477, n478, n479, n480, n481, n482, n483, n484, n485, 
      n486, n487, n488, n489, n490, n491, n492, n493, n494, n495, n496, n497, 
      n498, n499, n500, n501, n502, n503, n504, n505, n506, n507, n508, n509, 
      n510, n511, n512, n513, n514, n515, n516, n517, n518, n519, n520, n521, 
      n522, n523, n524, n525, n526, n527, n528, n529, n530, n531, n532, n533, 
      n534, n535, n536, n537, n538, n539, n540, n541, n542, n543, n544, n545, 
      n546, n547, n548, n549, n550, n551, n552, n553, n554, n555, n556, n557, 
      n558, n559, n560, n561, n562, n563, n564, n565, n566, n567, n568, n569, 
      n570, n571, n572, n573, n574, n575, n576, n577, n578, n579, n580, n581, 
      n582, n583, n584, n585, n586, n587, n588, n589, n590, n591, n592, n593, 
      n594, n595, n596, n597, n598, n599, n600, n601, n602, n603, n604, n605, 
      n606, n607, n608, n609, n610, n611, n612, n613, n614, n615, n616, n617, 
      n618, n619, n620, n621, n622, n623, n624, n625, n626, n627, n628, n629, 
      n630, n631, n632, n633, n634, n635, n636, n637, n638, n639, n640, n641, 
      n642, n643, n644, n645, n646, n647, n648, n649, n650, n651, n652, n653, 
      n654, n655, n656, n657, n658, n659, n660, n661, n662, n663, n664, n665, 
      n666, n667, n668, n669, n670, n671, n672, n673, n674, n675, n676, n677, 
      n678, n679, n680, n681, n682, n683, n684, n685, n686, n687, n688, n689, 
      n690, n691, n692, n693, n694, n695, n696, n697, n698, n699, n700, n701, 
      n702, n703, n704, n705, n706, n707, n708, n709, n710, n711, n712, n713, 
      n714, n715, n716, n717, n718, n719, n720, n721, n722, n723 : std_logic;

begin
   lut_piece_type <= ( lut_piece_type_2_port, lut_piece_type_1_port, 
      lut_piece_type_0_port );
   lut_x <= ( lut_x_2_port, lut_x_1_port, lut_x_0_port );
   lut_y <= ( lut_y_3_port, lut_y_2_port, lut_y_1_port, lut_y_0_port );
   lut_rot <= ( lut_rot_1_port, lut_rot_0_port );
   y <= y_port;
   new_piece <= new_piece_port;
   clear_shift_start <= clear_shift_start_port;
   draw_score_draw <= draw_score_draw_port;
   
   move_pm : controller_move port map( clk => clk, rst => rst, x => move_x, rot
                           => move_rot, add_sub => move_add_sub, 
                           draw_erase_draw => move_draw_erase_draw, 
                           draw_erase_start => move_draw_erase_start, 
                           draw_erase_ready => draw_erase_ready, start => 
                           move_start, ready => move_ready, inputs(3) => 
                           inputs(3), inputs(2) => inputs(2), inputs(1) => 
                           inputs(1), inputs(0) => inputs(0), check_ready => 
                           check_ready, check_start => move_check_start, 
                           check_empty => check_empty);
   cur_timer_1_time_reg : dfn10 port map( D => n354, CK => clk, Q => 
                           cur_timer_1_time);
   cur_state_reg_1_inst : dfr11 port map( D => next_state_1_port, R => rst, CK 
                           => clk, Q => cur_state_1_port);
   cur_state_reg_2_inst : dfr11 port map( D => next_state_2_port, R => rst, CK 
                           => clk, Q => cur_state_2_port);
   cur_state_reg_3_inst : dfr11 port map( D => next_state_3_port, R => rst, CK 
                           => clk, Q => cur_state_3_port);
   cur_state_reg_4_inst : dfr11 port map( D => next_state_4_port, R => rst, CK 
                           => clk, Q => cur_state_4_port);
   cur_state_reg_5_inst : dfr11 port map( D => next_state_5_port, R => rst, CK 
                           => clk, Q => cur_state_5_port);
   cur_state_reg_0_inst : dfr11 port map( D => next_state_0_port, R => rst, CK 
                           => clk, Q => cur_state_0_port);
   cur_rot_reg_1_inst : dfn10 port map( D => n364, CK => clk, Q => 
                           lut_rot_1_port);
   cur_rot_reg_0_inst : dfn10 port map( D => n365, CK => clk, Q => 
                           lut_rot_0_port);
   cur_y_reg_3_inst : dfn10 port map( D => n369, CK => clk, Q => lut_y_3_port);
   cur_y_reg_2_inst : dfn10 port map( D => n368, CK => clk, Q => lut_y_2_port);
   cur_y_reg_1_inst : dfn10 port map( D => n367, CK => clk, Q => lut_y_1_port);
   cur_y_reg_0_inst : dfn10 port map( D => n366, CK => clk, Q => lut_y_0_port);
   cur_x_reg_2_inst : dfn10 port map( D => n370, CK => clk, Q => lut_x_2_port);
   cur_x_reg_0_inst : dfn10 port map( D => n371, CK => clk, Q => lut_x_0_port);
   cur_x_reg_1_inst : dfn10 port map( D => n372, CK => clk, Q => lut_x_1_port);
   cur_piece_reg_2_inst : dfn10 port map( D => n361, CK => clk, Q => 
                           lut_piece_type_2_port);
   cur_future_piece_reg_2_inst : dfn10 port map( D => n358, CK => clk, Q => 
                           cur_future_piece_2_port);
   cur_piece_reg_1_inst : dfn10 port map( D => n362, CK => clk, Q => 
                           lut_piece_type_1_port);
   cur_future_piece_reg_1_inst : dfn10 port map( D => n359, CK => clk, Q => 
                           cur_future_piece_1_port);
   cur_piece_reg_0_inst : dfn10 port map( D => n363, CK => clk, Q => 
                           lut_piece_type_0_port);
   cur_future_piece_reg_0_inst : dfn10 port map( D => n360, CK => clk, Q => 
                           cur_future_piece_0_port);
   cur_timer_1_reset_reg : dfn10 port map( D => n353, CK => clk, Q => 
                           cur_timer_1_reset);
   cur_timer_1_start_reg : dfn10 port map( D => n352, CK => clk, Q => 
                           cur_timer_1_start);
   U393 : iv110 port map( A => n373, Y => x);
   U394 : na210 port map( A => move_start, B => move_x, Y => n373);
   U395 : na210 port map( A => n374, B => n375, Y => timer_1_time);
   U396 : na210 port map( A => cur_timer_1_time, B => n376, Y => n375);
   U397 : iv110 port map( A => n377, Y => n374);
   U398 : na210 port map( A => n378, B => n379, Y => timer_1_start);
   U399 : na210 port map( A => cur_timer_1_start, B => n380, Y => n379);
   U400 : na210 port map( A => n381, B => n382, Y => timer_1_reset);
   U401 : na210 port map( A => cur_timer_1_reset, B => n383, Y => n382);
   U402 : iv110 port map( A => n384, Y => rot);
   U403 : na210 port map( A => move_start, B => move_rot, Y => n384);
   U404 : na310 port map( A => n385, B => n386, C => n387, Y => 
                           next_state_5_port);
   U405 : no310 port map( A => n388, B => n389, C => n390, Y => n387);
   U406 : no210 port map( A => n391, B => n392, Y => n389);
   U407 : no310 port map( A => n393, B => n394, C => n395, Y => n391);
   U408 : no210 port map( A => check_empty, B => n396, Y => n395);
   U409 : no210 port map( A => timer_1_done, B => n397, Y => n393);
   U410 : na210 port map( A => cur_state_5_port, B => n398, Y => n386);
   U411 : na210 port map( A => n399, B => n400, Y => n398);
   U412 : na210 port map( A => n401, B => n402, Y => n400);
   U413 : no210 port map( A => n403, B => n404, Y => n385);
   U414 : na310 port map( A => n405, B => n406, C => n407, Y => 
                           next_state_4_port);
   U415 : no310 port map( A => n408, B => n409, C => n410, Y => n407);
   U416 : iv110 port map( A => n411, Y => n410);
   U417 : na210 port map( A => n412, B => n413, Y => n408);
   U418 : na310 port map( A => n414, B => n415, C => inputs(4), Y => n412);
   U419 : no210 port map( A => n416, B => n417, Y => n406);
   U420 : no210 port map( A => n418, B => n402, Y => n417);
   U421 : no210 port map( A => n419, B => n420, Y => n416);
   U422 : no210 port map( A => n421, B => n422, Y => n419);
   U423 : no210 port map( A => n423, B => n424, Y => n405);
   U424 : na310 port map( A => n425, B => n426, C => n427, Y => 
                           next_state_3_port);
   U425 : no310 port map( A => n428, B => n429, C => n430, Y => n427);
   U426 : na310 port map( A => n431, B => n432, C => n433, Y => n428);
   U427 : na210 port map( A => n414, B => cur_timer_1_time, Y => n431);
   U428 : iv110 port map( A => n434, Y => n426);
   U429 : na310 port map( A => n411, B => n435, C => n436, Y => n434);
   U430 : no310 port map( A => n437, B => n438, C => n439, Y => n425);
   U431 : no210 port map( A => n440, B => n441, Y => n439);
   U432 : iv110 port map( A => n442, Y => n440);
   U433 : no210 port map( A => n443, B => n444, Y => n438);
   U434 : no310 port map( A => n401, B => n445, C => n446, Y => n443);
   U435 : no210 port map( A => clear_shift_ready, B => n447, Y => n445);
   U436 : iv110 port map( A => n448, Y => n437);
   U437 : na210 port map( A => n401, B => draw_erase_ready, Y => n448);
   U438 : na310 port map( A => n449, B => n450, C => n451, Y => 
                           next_state_2_port);
   U439 : no210 port map( A => n452, B => n453, Y => n451);
   U440 : na310 port map( A => n454, B => n455, C => n456, Y => n453);
   U441 : na210 port map( A => move_ready, B => n457, Y => n456);
   U442 : na210 port map( A => n458, B => draw_erase_ready, Y => n455);
   U443 : na210 port map( A => n403, B => check_empty, Y => n454);
   U444 : na310 port map( A => n432, B => n459, C => n460, Y => n452);
   U445 : na210 port map( A => inputs(4), B => n414, Y => n460);
   U446 : na210 port map( A => n461, B => n462, Y => n432);
   U447 : no310 port map( A => n463, B => n464, C => n465, Y => n450);
   U448 : no210 port map( A => draw_score_ready, B => n466, Y => n464);
   U449 : no310 port map( A => n467, B => n468, C => n424, Y => n449);
   U450 : na310 port map( A => n469, B => n470, C => n471, Y => 
                           next_state_1_port);
   U451 : no310 port map( A => n472, B => n430, C => n467, Y => n471);
   U452 : na310 port map( A => n473, B => n474, C => n475, Y => n467);
   U453 : no310 port map( A => n476, B => n477, C => n404, Y => n475);
   U454 : iv110 port map( A => n478, Y => n476);
   U455 : na210 port map( A => check_empty, B => n479, Y => n474);
   U456 : na210 port map( A => n480, B => n481, Y => n430);
   U457 : na210 port map( A => n414, B => n482, Y => n481);
   U458 : iv110 port map( A => inputs(4), Y => n482);
   U459 : iv110 port map( A => n483, Y => n472);
   U460 : no310 port map( A => n484, B => n485, C => n423, Y => n483);
   U461 : na310 port map( A => n486, B => n487, C => n488, Y => n423);
   U462 : no310 port map( A => n489, B => n490, C => n491, Y => n488);
   U463 : iv110 port map( A => n492, Y => n491);
   U464 : no210 port map( A => n493, B => n462, Y => n489);
   U465 : iv110 port map( A => n494, Y => n462);
   U466 : no210 port map( A => n461, B => n495, Y => n493);
   U467 : iv110 port map( A => n496, Y => n461);
   U468 : na210 port map( A => check_ready, B => n497, Y => n487);
   U469 : na210 port map( A => draw_score_ready, B => draw_score_draw_port, Y 
                           => n486);
   U470 : no210 port map( A => n498, B => check_empty, Y => n485);
   U471 : no310 port map( A => n499, B => n500, C => n501, Y => n470);
   U472 : iv110 port map( A => n502, Y => n501);
   U473 : no210 port map( A => n503, B => n504, Y => n499);
   U474 : no210 port map( A => n505, B => n421, Y => n503);
   U475 : na310 port map( A => n506, B => n507, C => n508, Y => n421);
   U476 : no210 port map( A => n497, B => n509, Y => n508);
   U477 : na210 port map( A => n510, B => n511, Y => n507);
   U478 : no210 port map( A => draw_erase_ready, B => n418, Y => n505);
   U479 : iv110 port map( A => n422, Y => n418);
   U480 : no210 port map( A => n512, B => n513, Y => n469);
   U481 : iv110 port map( A => n514, Y => n513);
   U482 : na210 port map( A => n415, B => n515, Y => n514);
   U483 : iv110 port map( A => cur_timer_1_time, Y => n415);
   U484 : no210 port map( A => inputs(5), B => n516, Y => n512);
   U485 : na310 port map( A => n517, B => n518, C => n519, Y => 
                           next_state_0_port);
   U486 : no310 port map( A => n520, B => n479, C => n521, Y => n519);
   U487 : iv110 port map( A => n522, Y => n521);
   U488 : no210 port map( A => n523, B => n409, Y => n522);
   U489 : no310 port map( A => n524, B => inputs(5), C => n525, Y => n523);
   U490 : na310 port map( A => n526, B => n527, C => n528, Y => n520);
   U491 : no210 port map( A => n477, B => n414, Y => n528);
   U492 : iv110 port map( A => n529, Y => n414);
   U493 : iv110 port map( A => new_piece_port, Y => n527);
   U494 : no310 port map( A => n530, B => n531, C => n532, Y => n518);
   U495 : no210 port map( A => n533, B => n534, Y => n532);
   U496 : no210 port map( A => n535, B => n446, Y => n533);
   U497 : na310 port map( A => n536, B => n525, C => n537, Y => n446);
   U498 : na210 port map( A => n497, B => n538, Y => n537);
   U499 : iv110 port map( A => check_ready, Y => n538);
   U500 : na210 port map( A => n458, B => n402, Y => n536);
   U501 : iv110 port map( A => n539, Y => n458);
   U502 : iv110 port map( A => n506, Y => n535);
   U503 : no310 port map( A => n540, B => draw_score_draw_port, C => n468, Y =>
                           n506);
   U504 : na310 port map( A => n541, B => n542, C => n543, Y => n468);
   U505 : na210 port map( A => n544, B => n402, Y => n543);
   U506 : iv110 port map( A => draw_erase_ready, Y => n402);
   U507 : no210 port map( A => n545, B => move_ready, Y => n540);
   U508 : no310 port map( A => n546, B => n494, C => n441, Y => n531);
   U509 : no310 port map( A => inputs(4), B => inputs(5), C => n524, Y => n494)
                           ;
   U510 : na210 port map( A => n547, B => n548, Y => n530);
   U511 : na210 port map( A => draw_erase_ready, B => n549, Y => n548);
   U512 : na210 port map( A => n550, B => n551, Y => n549);
   U513 : na210 port map( A => n552, B => check_ready, Y => n547);
   U514 : no310 port map( A => n424, B => n553, C => n388, Y => n517);
   U515 : no210 port map( A => n447, B => n511, Y => n553);
   U516 : iv110 port map( A => clear_shift_ready, Y => n511);
   U517 : na310 port map( A => n554, B => n436, C => n555, Y => n424);
   U518 : iv110 port map( A => n484, Y => n555);
   U519 : na310 port map( A => n556, B => n557, C => n558, Y => n484);
   U520 : no310 port map( A => n559, B => n560, C => n561, Y => n558);
   U521 : no210 port map( A => n524, B => n541, Y => n559);
   U522 : na210 port map( A => n562, B => n563, Y => n524);
   U523 : no210 port map( A => inputs(3), B => inputs(2), Y => n563);
   U524 : no210 port map( A => inputs(1), B => inputs(0), Y => n562);
   U525 : na210 port map( A => draw_erase_ready, B => n564, Y => n557);
   U526 : na310 port map( A => n565, B => cur_timer_1_time, C => inputs(5), Y 
                           => n436);
   U527 : iv110 port map( A => n516, Y => n565);
   U528 : na310 port map( A => n566, B => n567, C => timer_1_done, Y => n554);
   U529 : na310 port map( A => n568, B => n569, C => n570, Y => n372);
   U530 : na210 port map( A => calc_x(1), B => n571, Y => n569);
   U531 : na210 port map( A => lut_x_1_port, B => n572, Y => n568);
   U532 : na310 port map( A => n573, B => n574, C => n570, Y => n371);
   U533 : na210 port map( A => n409, B => n575, Y => n570);
   U534 : iv110 port map( A => n576, Y => n409);
   U535 : na210 port map( A => calc_x(0), B => n571, Y => n574);
   U536 : na210 port map( A => lut_x_0_port, B => n572, Y => n573);
   U537 : na210 port map( A => n577, B => n578, Y => n370);
   U538 : na210 port map( A => calc_x(2), B => n571, Y => n578);
   U539 : na210 port map( A => lut_x_2_port, B => n572, Y => n577);
   U540 : na210 port map( A => n579, B => n580, Y => n369);
   U541 : na210 port map( A => calc_y(3), B => n581, Y => n580);
   U542 : na210 port map( A => lut_y_3_port, B => n582, Y => n579);
   U543 : na210 port map( A => n583, B => n584, Y => n368);
   U544 : na210 port map( A => calc_y(2), B => n581, Y => n584);
   U545 : na210 port map( A => lut_y_2_port, B => n582, Y => n583);
   U546 : na210 port map( A => n585, B => n586, Y => n367);
   U547 : na210 port map( A => calc_y(1), B => n581, Y => n586);
   U548 : na210 port map( A => lut_y_1_port, B => n582, Y => n585);
   U549 : na210 port map( A => n587, B => n588, Y => n366);
   U550 : na210 port map( A => calc_y(0), B => n581, Y => n588);
   U551 : no210 port map( A => n498, B => n582, Y => n581);
   U552 : na210 port map( A => lut_y_0_port, B => n582, Y => n587);
   U553 : iv110 port map( A => n589, Y => n582);
   U554 : na210 port map( A => n590, B => n591, Y => n589);
   U555 : na310 port map( A => n592, B => check_empty, C => n593, Y => n591);
   U556 : no310 port map( A => n463, B => move_start, C => n594, Y => n593);
   U557 : na310 port map( A => n576, B => n545, C => n575, Y => n590);
   U558 : na210 port map( A => n595, B => n596, Y => n365);
   U559 : na210 port map( A => lut_rot_0_port, B => n597, Y => n596);
   U560 : na210 port map( A => calc_rot(0), B => n571, Y => n595);
   U561 : na210 port map( A => n598, B => n599, Y => n364);
   U562 : na210 port map( A => lut_rot_1_port, B => n597, Y => n599);
   U563 : na210 port map( A => n600, B => n576, Y => n597);
   U564 : iv110 port map( A => n572, Y => n600);
   U565 : na210 port map( A => n575, B => n601, Y => n572);
   U566 : na210 port map( A => n457, B => n602, Y => n601);
   U567 : iv110 port map( A => n545, Y => n457);
   U568 : iv110 port map( A => n603, Y => n575);
   U569 : na210 port map( A => calc_rot(1), B => n571, Y => n598);
   U570 : no310 port map( A => n602, B => n545, C => n603, Y => n571);
   U571 : na310 port map( A => n592, B => n502, C => n604, Y => n603);
   U572 : no210 port map( A => y_port, B => n500, Y => n604);
   U573 : iv110 port map( A => n526, Y => n500);
   U574 : no310 port map( A => n401, B => new_piece_port, C => n605, Y => n592)
                           ;
   U575 : na210 port map( A => n435, B => n606, Y => new_piece_port);
   U576 : iv110 port map( A => move_ready, Y => n602);
   U577 : na310 port map( A => n607, B => n608, C => n609, Y => n363);
   U578 : na210 port map( A => lut_piece_type_0_port, B => n610, Y => n609);
   U579 : na210 port map( A => cur_future_piece_0_port, B => n611, Y => n608);
   U580 : na210 port map( A => next_piece(0), B => n612, Y => n607);
   U581 : na310 port map( A => n613, B => n614, C => n615, Y => n362);
   U582 : na210 port map( A => lut_piece_type_1_port, B => n610, Y => n615);
   U583 : na210 port map( A => cur_future_piece_1_port, B => n611, Y => n614);
   U584 : na210 port map( A => next_piece(1), B => n612, Y => n613);
   U585 : na310 port map( A => n616, B => n617, C => n618, Y => n361);
   U586 : na210 port map( A => lut_piece_type_2_port, B => n610, Y => n618);
   U587 : na210 port map( A => cur_future_piece_2_port, B => n611, Y => n617);
   U588 : no210 port map( A => n610, B => n619, Y => n611);
   U589 : iv110 port map( A => n463, Y => n619);
   U590 : na210 port map( A => next_piece(2), B => n612, Y => n616);
   U591 : no210 port map( A => n435, B => n610, Y => n612);
   U592 : na310 port map( A => n620, B => n621, C => n622, Y => n610);
   U593 : no310 port map( A => n477, B => y_port, C => move_start, Y => n622);
   U594 : iv110 port map( A => n605, Y => n621);
   U595 : na310 port map( A => n539, B => n480, C => n623, Y => n605);
   U596 : no210 port map( A => n495, B => n401, Y => n620);
   U597 : na210 port map( A => n624, B => n625, Y => n401);
   U598 : na310 port map( A => n626, B => n627, C => n628, Y => n360);
   U599 : na210 port map( A => cur_future_piece_0_port, B => n629, Y => n628);
   U600 : na210 port map( A => n630, B => lut_piece_type_0_port, Y => n627);
   U601 : na210 port map( A => n631, B => next_piece(0), Y => n626);
   U602 : na310 port map( A => n632, B => n633, C => n634, Y => n359);
   U603 : na210 port map( A => cur_future_piece_1_port, B => n629, Y => n634);
   U604 : na210 port map( A => n630, B => lut_piece_type_1_port, Y => n633);
   U605 : na210 port map( A => n631, B => next_piece(1), Y => n632);
   U606 : na310 port map( A => n635, B => n636, C => n637, Y => n358);
   U607 : na210 port map( A => cur_future_piece_2_port, B => n629, Y => n637);
   U608 : na210 port map( A => n630, B => lut_piece_type_2_port, Y => n636);
   U609 : no210 port map( A => n629, B => n576, Y => n630);
   U610 : na210 port map( A => n631, B => next_piece(2), Y => n635);
   U611 : no210 port map( A => n606, B => n629, Y => n631);
   U612 : na310 port map( A => n638, B => n502, C => n623, Y => n629);
   U613 : no310 port map( A => n639, B => n640, C => n641, Y => n623);
   U614 : na310 port map( A => n556, B => n642, C => n381, Y => n641);
   U615 : iv110 port map( A => n429, Y => n381);
   U616 : iv110 port map( A => n643, Y => n556);
   U617 : na210 port map( A => n644, B => n645, Y => n643);
   U618 : na210 port map( A => n646, B => n647, Y => n645);
   U619 : na210 port map( A => n648, B => n649, Y => n639);
   U620 : iv110 port map( A => n650, Y => n638);
   U621 : na210 port map( A => n651, B => n652, Y => n354);
   U622 : na210 port map( A => cur_timer_1_time, B => n653, Y => n652);
   U623 : na210 port map( A => n654, B => n648, Y => n653);
   U624 : iv110 port map( A => n376, Y => n654);
   U625 : na310 port map( A => n642, B => n644, C => n655, Y => n376);
   U626 : na210 port map( A => n656, B => n566, Y => n644);
   U627 : no310 port map( A => n560, B => n509, C => n657, Y => n642);
   U628 : iv110 port map( A => n413, Y => n657);
   U629 : na210 port map( A => n377, B => n648, Y => n651);
   U630 : na310 port map( A => n492, B => n649, C => n658, Y => n377);
   U631 : iv110 port map( A => n404, Y => n649);
   U632 : na210 port map( A => n659, B => n660, Y => n353);
   U633 : na210 port map( A => cur_timer_1_reset, B => n661, Y => n660);
   U634 : na210 port map( A => n662, B => n648, Y => n661);
   U635 : iv110 port map( A => n383, Y => n662);
   U636 : na310 port map( A => n655, B => n658, C => n663, Y => n383);
   U637 : no310 port map( A => n404, B => n664, C => n560, Y => n663);
   U638 : no210 port map( A => n665, B => n397, Y => n404);
   U639 : na210 port map( A => n429, B => n648, Y => n659);
   U640 : na210 port map( A => n478, B => n492, Y => n429);
   U641 : na210 port map( A => n394, B => n666, Y => n492);
   U642 : na210 port map( A => n664, B => n667, Y => n478);
   U643 : na210 port map( A => n668, B => n669, Y => n352);
   U644 : na210 port map( A => cur_timer_1_start, B => n670, Y => n669);
   U645 : na210 port map( A => n671, B => n648, Y => n670);
   U646 : iv110 port map( A => n380, Y => n671);
   U647 : na310 port map( A => n658, B => n525, C => n655, Y => n380);
   U648 : no310 port map( A => n650, B => n463, C => n640, Y => n655);
   U649 : na310 port map( A => n672, B => n673, C => n674, Y => n640);
   U650 : no310 port map( A => n675, B => n561, C => n676, Y => n674);
   U651 : no210 port map( A => n441, B => n396, Y => n676);
   U652 : iv110 port map( A => n677, Y => n561);
   U653 : na310 port map( A => n496, B => n466, C => n541, Y => n675);
   U654 : na210 port map( A => n667, B => n678, Y => n541);
   U655 : na310 port map( A => n679, B => n666, C => n680, Y => n496);
   U656 : no210 port map( A => cur_state_0_port, B => n681, Y => n680);
   U657 : no210 port map( A => n465, B => n515, Y => n673);
   U658 : na210 port map( A => n529, B => n516, Y => n515);
   U659 : na210 port map( A => n664, B => n647, Y => n516);
   U660 : na210 port map( A => n656, B => n667, Y => n529);
   U661 : iv110 port map( A => n682, Y => n465);
   U662 : no310 port map( A => n497, B => clear_shift_start_port, C => n390, Y 
                           => n682);
   U663 : iv110 port map( A => n683, Y => n497);
   U664 : no210 port map( A => n684, B => n388, Y => n672);
   U665 : na210 port map( A => n473, B => n685, Y => n388);
   U666 : na210 port map( A => n666, B => n442, Y => n685);
   U667 : na210 port map( A => n686, B => n687, Y => n442);
   U668 : na310 port map( A => cur_state_5_port, B => cur_state_0_port, C => 
                           n679, Y => n687);
   U669 : iv110 port map( A => n688, Y => n679);
   U670 : na210 port map( A => n689, B => n566, Y => n473);
   U671 : iv110 port map( A => n433, Y => n684);
   U672 : no310 port map( A => n479, B => n490, C => n690, Y => n433);
   U673 : no210 port map( A => n392, B => n397, Y => n690);
   U674 : iv110 port map( A => n567, Y => n397);
   U675 : no210 port map( A => n396, B => n392, Y => n479);
   U676 : na210 port map( A => n576, B => n502, Y => n463);
   U677 : na210 port map( A => n689, B => n647, Y => n502);
   U678 : na210 port map( A => n646, B => n667, Y => n576);
   U679 : na310 port map( A => n624, B => n691, C => n692, Y => n650);
   U680 : no210 port map( A => y_port, B => move_start, Y => n692);
   U681 : iv110 port map( A => n693, Y => y_port);
   U682 : no210 port map( A => n564, B => n694, Y => n624);
   U683 : no210 port map( A => n695, B => n696, Y => n694);
   U684 : iv110 port map( A => n509, Y => n525);
   U685 : no210 port map( A => n686, B => n695, Y => n509);
   U686 : no210 port map( A => n495, B => n697, Y => n658);
   U687 : no210 port map( A => n396, B => n695, Y => n697);
   U688 : iv110 port map( A => n647, Y => n695);
   U689 : iv110 port map( A => n646, Y => n396);
   U690 : iv110 port map( A => n606, Y => n495);
   U691 : na210 port map( A => n698, B => n666, Y => n606);
   U692 : na210 port map( A => n699, B => n648, Y => n668);
   U693 : iv110 port map( A => rst, Y => n648);
   U694 : iv110 port map( A => n378, Y => n699);
   U695 : no210 port map( A => n560, B => n700, Y => n378);
   U696 : no310 port map( A => n392, B => cur_state_5_port, C => n688, Y => 
                           n700);
   U697 : no210 port map( A => n696, B => n392, Y => n560);
   U698 : iv110 port map( A => n691, Y => lut_next_piece);
   U699 : no310 port map( A => n701, B => n477, C => n702, Y => n691);
   U700 : na310 port map( A => n625, B => n480, C => n539, Y => n702);
   U701 : iv110 port map( A => n435, Y => n701);
   U702 : na210 port map( A => n656, B => n666, Y => n435);
   U703 : iv110 port map( A => n466, Y => draw_score_draw_port);
   U704 : na210 port map( A => n667, B => n698, Y => n466);
   U705 : na310 port map( A => n703, B => n704, C => n705, Y => 
                           draw_erase_start);
   U706 : no310 port map( A => n490, B => n544, C => n477, Y => n705);
   U707 : no210 port map( A => n546, B => n392, Y => n477);
   U708 : iv110 port map( A => n678, Y => n546);
   U709 : iv110 port map( A => n625, Y => n544);
   U710 : na210 port map( A => n698, B => n566, Y => n625);
   U711 : iv110 port map( A => n459, Y => n490);
   U712 : na210 port map( A => n667, B => n394, Y => n459);
   U713 : no210 port map( A => n564, B => n706, Y => n703);
   U714 : iv110 port map( A => n707, Y => n706);
   U715 : na210 port map( A => move_start, B => move_draw_erase_start, Y => 
                           n707);
   U716 : iv110 port map( A => n542, Y => n564);
   U717 : na210 port map( A => n708, B => n566, Y => n542);
   U718 : na210 port map( A => n704, B => n709, Y => draw_erase_draw);
   U719 : na210 port map( A => move_draw_erase_draw, B => move_start, Y => n709
                           );
   U720 : no310 port map( A => n422, B => n390, C => n710, Y => n704);
   U721 : na310 port map( A => n677, B => n480, C => n413, Y => n710);
   U722 : na210 port map( A => n664, B => n566, Y => n413);
   U723 : na210 port map( A => n664, B => n666, Y => n480);
   U724 : no210 port map( A => n688, B => n711, Y => n664);
   U725 : na210 port map( A => n689, B => n666, Y => n677);
   U726 : na210 port map( A => n712, B => n551, Y => n390);
   U727 : na210 port map( A => n667, B => n713, Y => n551);
   U728 : na210 port map( A => n647, B => n567, Y => n712);
   U729 : na210 port map( A => n550, B => n539, Y => n422);
   U730 : na210 port map( A => n656, B => n647, Y => n539);
   U731 : no210 port map( A => n688, B => n714, Y => n656);
   U732 : na210 port map( A => cur_state_3_port, B => n420, Y => n688);
   U733 : iv110 port map( A => n715, Y => n550);
   U734 : na210 port map( A => n716, B => n717, Y => n715);
   U735 : na210 port map( A => n646, B => n666, Y => n717);
   U736 : no310 port map( A => n420, B => cur_state_3_port, C => n714, Y => 
                           n646);
   U737 : na210 port map( A => n647, B => n713, Y => n716);
   U738 : na210 port map( A => n447, B => n411, Y => clear_shift_start_port);
   U739 : na210 port map( A => n647, B => n394, Y => n411);
   U740 : iv110 port map( A => n510, Y => n447);
   U741 : no210 port map( A => n686, B => n665, Y => n510);
   U742 : iv110 port map( A => n667, Y => n665);
   U743 : iv110 port map( A => n708, Y => n686);
   U744 : no310 port map( A => n420, B => n444, C => n714, Y => n708);
   U745 : na310 port map( A => n718, B => n683, C => n719, Y => check_start);
   U746 : iv110 port map( A => n594, Y => n719);
   U747 : na210 port map( A => n689, B => n667, Y => n683);
   U748 : no210 port map( A => n720, B => cur_state_1_port, Y => n667);
   U749 : no310 port map( A => n711, B => cur_state_3_port, C => n420, Y => 
                           n689);
   U750 : na210 port map( A => move_check_start, B => move_start, Y => n718);
   U751 : na210 port map( A => n721, B => n693, Y => add_sub);
   U752 : no210 port map( A => n594, B => n403, Y => n693);
   U753 : iv110 port map( A => n498, Y => n403);
   U754 : na210 port map( A => n666, B => n567, Y => n498);
   U755 : no310 port map( A => n534, B => n722, C => n681, Y => n567);
   U756 : iv110 port map( A => n441, Y => n666);
   U757 : na210 port map( A => n399, B => n723, Y => n594);
   U758 : na210 port map( A => n394, B => n566, Y => n723);
   U759 : iv110 port map( A => n392, Y => n566);
   U760 : na210 port map( A => cur_state_2_port, B => cur_state_1_port, Y => 
                           n392);
   U761 : no310 port map( A => n444, B => n711, C => n420, Y => n394);
   U762 : iv110 port map( A => n552, Y => n399);
   U763 : no210 port map( A => n696, B => n441, Y => n552);
   U764 : na210 port map( A => n504, B => n720, Y => n441);
   U765 : iv110 port map( A => cur_state_2_port, Y => n720);
   U766 : iv110 port map( A => n713, Y => n696);
   U767 : no310 port map( A => n722, B => cur_state_0_port, C => n681, Y => 
                           n713);
   U768 : na210 port map( A => move_add_sub, B => move_start, Y => n721);
   U769 : na210 port map( A => n545, B => n526, Y => move_start);
   U770 : na210 port map( A => n647, B => n678, Y => n526);
   U771 : no210 port map( A => n714, B => n722, Y => n678);
   U772 : na210 port map( A => n534, B => n681, Y => n714);
   U773 : iv110 port map( A => cur_state_0_port, Y => n534);
   U774 : na210 port map( A => n698, B => n647, Y => n545);
   U775 : no210 port map( A => n504, B => cur_state_2_port, Y => n647);
   U776 : iv110 port map( A => cur_state_1_port, Y => n504);
   U777 : no210 port map( A => n711, B => n722, Y => n698);
   U778 : na210 port map( A => n444, B => n420, Y => n722);
   U779 : iv110 port map( A => cur_state_4_port, Y => n420);
   U780 : iv110 port map( A => cur_state_3_port, Y => n444);
   U781 : na210 port map( A => cur_state_0_port, B => n681, Y => n711);
   U782 : iv110 port map( A => cur_state_5_port, Y => n681);

end synthesised;



