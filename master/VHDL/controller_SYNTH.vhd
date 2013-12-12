
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
   
   component na310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component mu111
      port( A, B, S : in std_logic;  Y : out std_logic);
   end component;
   
   component no310
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
   
   signal X_Logic0_port, lut_piece_type_2_port, lut_piece_type_1_port, 
      lut_piece_type_0_port, lut_next_piece_port, lut_x_2_port, lut_x_1_port, 
      lut_x_0_port, lut_y_3_port, lut_y_2_port, lut_y_1_port, lut_y_0_port, 
      lut_rot_1_port, lut_rot_0_port, y_port, new_piece_port, 
      clear_shift_start_port, move_x, move_rot, move_add_sub, 
      move_draw_erase_draw, move_draw_erase_start, move_start, move_ready, 
      move_check_start, cur_state_5_port, cur_state_4_port, cur_state_3_port, 
      cur_state_2_port, cur_state_1_port, cur_state_0_port, 
      cur_future_piece_2_port, cur_future_piece_1_port, cur_future_piece_0_port
      , next_state_5_port, next_state_4_port, next_state_3_port, 
      next_state_2_port, next_state_1_port, next_state_0_port, cur_timer_1_time
      , cur_timer_1_start, cur_timer_1_reset, n353, n354, n355, 
      draw_score_draw_port, n359, n360, n361, n362, n363, n364, n365, n366, 
      n367, n368, n369, n370, n371, n372, n373, n374, n375, n376, n377, n378, 
      n379, n380, n381, n382, n383, n384, n385, n386, n387, n388, n389, n390, 
      n391, n392, n393, n394, n395, n396, n397, n398, n399, n400, n401, n402, 
      n403, n404, n405, n406, n407, n408, n409, n410, n411, n412, n413, n414, 
      n415, n416, n417, n418, n419, n420, n421, n422, n423, n424, n425, n426, 
      n427, n428, n429, n430, n431, n432, n433, n434, n435, n436, n437, n438, 
      n439, n440, n441, n442, n443, n444, n445, n446, n447, n448, n449, n450, 
      n451, n452, n453, n454, n455, n456, n457, n458, n459, n460, n461, n462, 
      n463, n464, n465, n466, n467, n468, n469, n470, n471, n472, n473, n474, 
      n475, n476, n477, n478, n479, n480, n481, n482, n483, n484, n485, n486, 
      n487, n488, n489, n490, n491, n492, n493, n494, n495, n496, n497, n498, 
      n499, n500, n501, n502, n503, n504, n505, n506, n507, n508, n509, n510, 
      n511, n512, n513, n514, n515, n516, n517, n518, n519, n520, n521, n522, 
      n523, n524, n525, n526, n527, n528, n529, n530, n531, n532, n533, n534, 
      n535, n536, n537, n538, n539, n540, n541, n542, n543, n544, n545, n546, 
      n547, n548, n549, n550, n551, n552, n553, n554, n555, n556, n557, n558, 
      n559, n560, n561, n562, n563, n564, n565, n566, n567, n568, n569, n570, 
      n571, n572, n573, n574, n575, n576, n577, n578, n579, n580, n581, n582, 
      n583, n584, n585, n586, n587, n588, n589, n590, n591, n592, n593, n594, 
      n595, n596, n597, n598, n599, n600, n601, n602, n603, n604, n605, n606, 
      n607, n608, n609, n610, n611, n612, n613, n614, n615, n616, n617, n618, 
      n619, n620, n621, n622, n623, n624, n625, n626, n627, n628, n629, n630, 
      n631, n632, n633, n634, n635, n636, n637, n638, n639, n640, n641, n642, 
      n643, n644, n645, n646, n647, n648, n649, n650, n651, n652, n653, n654, 
      n655, n656, n657, n658, n659, n660, n661, n662, n663, n664, n665, n666, 
      n667, n668, n669, n670, n671, n672, n673, n674, n675, n676, n677, n678, 
      n679, n680, n681, n682, n683, n684, n685, n686, n687, n688, n689, n690, 
      n691, n692, n693, n694, n695, n696, n697, n698, n699, n700, n701, n702, 
      n703, n704, n705, n706, n707, n708, n709, n710, n711, n712, n713, n714, 
      n715, n716, n717, n718, n719, n720, n721, n722, n723 : std_logic;

begin
   lut_piece_type <= ( lut_piece_type_2_port, lut_piece_type_1_port, 
      lut_piece_type_0_port );
   lut_next_piece <= lut_next_piece_port;
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
                           draw_erase_ready => X_Logic0_port, start => 
                           move_start, ready => move_ready, inputs(3) => 
                           inputs(3), inputs(2) => inputs(2), inputs(1) => 
                           inputs(1), inputs(0) => inputs(0), check_ready => 
                           X_Logic0_port, check_start => move_check_start, 
                           check_empty => check_empty);
   X_Logic0_port <= '0';
   cur_timer_1_time_reg : dfn10 port map( D => n355, CK => clk, Q => 
                           cur_timer_1_time);
   cur_state_reg_4_inst : dfr11 port map( D => next_state_4_port, R => rst, CK 
                           => clk, Q => cur_state_4_port);
   cur_state_reg_1_inst : dfr11 port map( D => next_state_1_port, R => rst, CK 
                           => clk, Q => cur_state_1_port);
   cur_state_reg_3_inst : dfr11 port map( D => next_state_3_port, R => rst, CK 
                           => clk, Q => cur_state_3_port);
   cur_state_reg_0_inst : dfr11 port map( D => next_state_0_port, R => rst, CK 
                           => clk, Q => cur_state_0_port);
   cur_state_reg_5_inst : dfr11 port map( D => next_state_5_port, R => rst, CK 
                           => clk, Q => cur_state_5_port);
   cur_state_reg_2_inst : dfr11 port map( D => next_state_2_port, R => rst, CK 
                           => clk, Q => cur_state_2_port);
   cur_timer_1_reset_reg : dfn10 port map( D => n354, CK => clk, Q => 
                           cur_timer_1_reset);
   cur_piece_reg_2_inst : dfn10 port map( D => n362, CK => clk, Q => 
                           lut_piece_type_2_port);
   cur_future_piece_reg_2_inst : dfn10 port map( D => n359, CK => clk, Q => 
                           cur_future_piece_2_port);
   cur_piece_reg_1_inst : dfn10 port map( D => n363, CK => clk, Q => 
                           lut_piece_type_1_port);
   cur_future_piece_reg_1_inst : dfn10 port map( D => n360, CK => clk, Q => 
                           cur_future_piece_1_port);
   cur_piece_reg_0_inst : dfn10 port map( D => n364, CK => clk, Q => 
                           lut_piece_type_0_port);
   cur_future_piece_reg_0_inst : dfn10 port map( D => n361, CK => clk, Q => 
                           cur_future_piece_0_port);
   cur_y_reg_3_inst : dfn10 port map( D => n370, CK => clk, Q => lut_y_3_port);
   cur_y_reg_2_inst : dfn10 port map( D => n369, CK => clk, Q => lut_y_2_port);
   cur_y_reg_1_inst : dfn10 port map( D => n368, CK => clk, Q => lut_y_1_port);
   cur_y_reg_0_inst : dfn10 port map( D => n367, CK => clk, Q => lut_y_0_port);
   cur_rot_reg_1_inst : dfn10 port map( D => n366, CK => clk, Q => 
                           lut_rot_1_port);
   cur_rot_reg_0_inst : dfn10 port map( D => n365, CK => clk, Q => 
                           lut_rot_0_port);
   cur_x_reg_2_inst : dfn10 port map( D => n373, CK => clk, Q => lut_x_2_port);
   cur_x_reg_0_inst : dfn10 port map( D => n372, CK => clk, Q => lut_x_0_port);
   cur_x_reg_1_inst : dfn10 port map( D => n371, CK => clk, Q => lut_x_1_port);
   cur_timer_1_start_reg : dfn10 port map( D => n353, CK => clk, Q => 
                           cur_timer_1_start);
   U394 : iv110 port map( A => n374, Y => x);
   U395 : na210 port map( A => move_start, B => move_x, Y => n374);
   U396 : na210 port map( A => n375, B => n376, Y => timer_1_time);
   U397 : na210 port map( A => cur_timer_1_time, B => n377, Y => n376);
   U398 : na210 port map( A => n378, B => n379, Y => timer_1_start);
   U399 : na210 port map( A => cur_timer_1_start, B => n380, Y => n379);
   U400 : na210 port map( A => n381, B => n382, Y => timer_1_reset);
   U401 : na210 port map( A => cur_timer_1_reset, B => n383, Y => n382);
   U402 : iv110 port map( A => n384, Y => rot);
   U403 : na210 port map( A => move_start, B => move_rot, Y => n384);
   U404 : na310 port map( A => n385, B => n386, C => n387, Y => 
                           next_state_5_port);
   U405 : no310 port map( A => n388, B => n389, C => n390, Y => n387);
   U406 : no210 port map( A => n391, B => n392, Y => n390);
   U407 : no210 port map( A => n393, B => n394, Y => n391);
   U408 : na210 port map( A => n395, B => n396, Y => n388);
   U409 : no210 port map( A => n397, B => n398, Y => n386);
   U410 : no210 port map( A => timer_1_done, B => n399, Y => n398);
   U411 : no210 port map( A => check_empty, B => n400, Y => n397);
   U412 : no210 port map( A => n401, B => n402, Y => n385);
   U413 : na310 port map( A => n403, B => n404, C => n405, Y => 
                           next_state_4_port);
   U414 : no310 port map( A => n406, B => n407, C => n408, Y => n405);
   U415 : iv110 port map( A => n409, Y => n408);
   U416 : na210 port map( A => n410, B => n411, Y => n406);
   U417 : na210 port map( A => n412, B => n413, Y => n411);
   U418 : na210 port map( A => draw_erase_ready, B => n414, Y => n410);
   U419 : no210 port map( A => n415, B => n416, Y => n404);
   U420 : no210 port map( A => n417, B => n418, Y => n403);
   U421 : no210 port map( A => n419, B => n420, Y => n418);
   U422 : no210 port map( A => n421, B => n414, Y => n419);
   U423 : no310 port map( A => n422, B => cur_timer_1_time, C => n423, Y => 
                           n417);
   U424 : na310 port map( A => n424, B => n425, C => n426, Y => 
                           next_state_3_port);
   U425 : no310 port map( A => n427, B => n428, C => n429, Y => n426);
   U426 : na210 port map( A => n430, B => n431, Y => n429);
   U427 : na310 port map( A => n432, B => n433, C => n381, Y => n427);
   U428 : na210 port map( A => n434, B => n435, Y => n433);
   U429 : na210 port map( A => n436, B => cur_timer_1_time, Y => n432);
   U430 : no310 port map( A => n437, B => n438, C => n415, Y => n425);
   U431 : na210 port map( A => n399, B => n439, Y => n437);
   U432 : no310 port map( A => n440, B => n441, C => n442, Y => n424);
   U433 : no210 port map( A => n443, B => n444, Y => n442);
   U434 : no210 port map( A => n445, B => n446, Y => n443);
   U435 : no210 port map( A => draw_erase_ready, B => n447, Y => n445);
   U436 : no210 port map( A => n448, B => n449, Y => n440);
   U437 : no210 port map( A => n450, B => n451, Y => n448);
   U438 : na310 port map( A => n452, B => n453, C => n454, Y => 
                           next_state_2_port);
   U439 : no210 port map( A => n455, B => n456, Y => n454);
   U440 : na310 port map( A => n457, B => n458, C => n459, Y => n456);
   U441 : iv110 port map( A => n460, Y => n457);
   U442 : na310 port map( A => n461, B => n462, C => n463, Y => n455);
   U443 : na210 port map( A => draw_score_draw_port, B => n464, Y => n462);
   U444 : iv110 port map( A => draw_score_ready, Y => n464);
   U445 : no310 port map( A => n465, B => n389, C => n466, Y => n453);
   U446 : iv110 port map( A => n467, Y => n466);
   U447 : na210 port map( A => n468, B => move_ready, Y => n467);
   U448 : no210 port map( A => n469, B => n470, Y => n465);
   U449 : iv110 port map( A => n435, Y => n469);
   U450 : no310 port map( A => n471, B => n472, C => n473, Y => n452);
   U451 : no210 port map( A => n449, B => n447, Y => n473);
   U452 : no210 port map( A => n423, B => n422, Y => n472);
   U453 : no210 port map( A => n474, B => n396, Y => n471);
   U454 : na310 port map( A => n475, B => n476, C => n477, Y => 
                           next_state_1_port);
   U455 : no310 port map( A => n478, B => n479, C => n407, Y => n477);
   U456 : na310 port map( A => n480, B => n481, C => n482, Y => n407);
   U457 : no310 port map( A => n483, B => n484, C => n441, Y => n482);
   U458 : no210 port map( A => n485, B => n435, Y => n483);
   U459 : no210 port map( A => n486, B => n434, Y => n485);
   U460 : na210 port map( A => n487, B => check_ready, Y => n481);
   U461 : na210 port map( A => draw_score_ready, B => draw_score_draw_port, Y 
                           => n480);
   U462 : na210 port map( A => n459, B => n430, Y => n478);
   U463 : no210 port map( A => n488, B => n489, Y => n430);
   U464 : no210 port map( A => n423, B => inputs(4), Y => n489);
   U465 : iv110 port map( A => n490, Y => n459);
   U466 : na310 port map( A => n491, B => n492, C => n493, Y => n490);
   U467 : no310 port map( A => n494, B => n495, C => n496, Y => n493);
   U468 : no210 port map( A => n400, B => n474, Y => n494);
   U469 : na210 port map( A => n412, B => n497, Y => n492);
   U470 : no310 port map( A => n498, B => n499, C => n500, Y => n476);
   U471 : no210 port map( A => inputs(5), B => n501, Y => n500);
   U472 : no210 port map( A => n502, B => n503, Y => n499);
   U473 : no210 port map( A => n393, B => n421, Y => n502);
   U474 : na210 port map( A => n504, B => n458, Y => n421);
   U475 : no210 port map( A => n487, B => n505, Y => n458);
   U476 : no210 port map( A => n506, B => draw_erase_ready, Y => n505);
   U477 : iv110 port map( A => n446, Y => n504);
   U478 : na310 port map( A => n507, B => n508, C => n509, Y => n446);
   U479 : no210 port map( A => n510, B => n511, Y => n509);
   U480 : na210 port map( A => n512, B => n513, Y => n507);
   U481 : iv110 port map( A => clear_shift_ready, Y => n513);
   U482 : no210 port map( A => draw_erase_ready, B => n514, Y => n393);
   U483 : no210 port map( A => cur_timer_1_time, B => n515, Y => n498);
   U484 : no210 port map( A => n516, B => n517, Y => n475);
   U485 : no210 port map( A => check_empty, B => n396, Y => n517);
   U486 : na310 port map( A => n518, B => n519, C => n520, Y => 
                           next_state_0_port);
   U487 : no310 port map( A => n521, B => n436, C => n522, Y => n520);
   U488 : no210 port map( A => n523, B => n524, Y => n522);
   U489 : no210 port map( A => n525, B => n435, Y => n523);
   U490 : na210 port map( A => n526, B => n422, Y => n435);
   U491 : iv110 port map( A => inputs(4), Y => n422);
   U492 : iv110 port map( A => n527, Y => n521);
   U493 : no310 port map( A => n416, B => new_piece_port, C => n496, Y => n527)
                           ;
   U494 : no310 port map( A => n402, B => n528, C => n529, Y => n519);
   U495 : no210 port map( A => n530, B => n449, Y => n529);
   U496 : no210 port map( A => n531, B => n532, Y => n530);
   U497 : iv110 port map( A => n533, Y => n532);
   U498 : no210 port map( A => n534, B => n535, Y => n531);
   U499 : no210 port map( A => n536, B => n537, Y => n528);
   U500 : no210 port map( A => draw_score_draw_port, B => n394, Y => n536);
   U501 : na310 port map( A => n538, B => n539, C => n540, Y => n394);
   U502 : no210 port map( A => n541, B => n510, Y => n540);
   U503 : no210 port map( A => n542, B => move_ready, Y => n510);
   U504 : iv110 port map( A => n468, Y => n542);
   U505 : na210 port map( A => n543, B => n449, Y => n539);
   U506 : na210 port map( A => n487, B => n544, Y => n538);
   U507 : iv110 port map( A => check_ready, Y => n544);
   U508 : na310 port map( A => n491, B => n545, C => n431, Y => n402);
   U509 : iv110 port map( A => n546, Y => n431);
   U510 : na210 port map( A => n547, B => n548, Y => n546);
   U511 : na210 port map( A => n549, B => n550, Y => n548);
   U512 : na210 port map( A => check_ready, B => n541, Y => n545);
   U513 : na210 port map( A => n551, B => n413, Y => n491);
   U514 : no210 port map( A => n428, B => n460, Y => n518);
   U515 : na210 port map( A => n409, B => n552, Y => n460);
   U516 : na210 port map( A => clear_shift_ready, B => n512, Y => n552);
   U517 : no310 port map( A => n553, B => n438, C => n479, Y => n409);
   U518 : na310 port map( A => n554, B => n555, C => n556, Y => n479);
   U519 : no310 port map( A => n557, B => n558, C => n559, Y => n556);
   U520 : no210 port map( A => n508, B => n449, Y => n559);
   U521 : iv110 port map( A => draw_erase_ready, Y => n449);
   U522 : no310 port map( A => n560, B => n561, C => n562, Y => n558);
   U523 : no210 port map( A => n563, B => n564, Y => n557);
   U524 : no210 port map( A => n565, B => n566, Y => n554);
   U525 : iv110 port map( A => n567, Y => n566);
   U526 : iv110 port map( A => n568, Y => n438);
   U527 : na310 port map( A => n569, B => cur_timer_1_time, C => inputs(5), Y 
                           => n568);
   U528 : no210 port map( A => n570, B => n399, Y => n553);
   U529 : iv110 port map( A => timer_1_done, Y => n570);
   U530 : na210 port map( A => n400, B => n571, Y => n428);
   U531 : na210 port map( A => n511, B => n526, Y => n571);
   U532 : iv110 port map( A => n572, Y => n526);
   U533 : na210 port map( A => n573, B => n574, Y => n572);
   U534 : no310 port map( A => inputs(2), B => inputs(5), C => inputs(3), Y => 
                           n574);
   U535 : no210 port map( A => inputs(1), B => inputs(0), Y => n573);
   U536 : na210 port map( A => n575, B => n413, Y => n400);
   U537 : na210 port map( A => n576, B => n577, Y => n373);
   U538 : na210 port map( A => calc_x(2), B => n578, Y => n577);
   U539 : na210 port map( A => lut_x_2_port, B => n579, Y => n576);
   U540 : na210 port map( A => n580, B => n581, Y => n372);
   U541 : na210 port map( A => calc_x(0), B => n578, Y => n581);
   U542 : iv110 port map( A => n582, Y => n580);
   U543 : mu111 port map( A => n416, B => lut_x_0_port, S => n579, Y => n582);
   U544 : na210 port map( A => n583, B => n584, Y => n371);
   U545 : na210 port map( A => calc_x(1), B => n578, Y => n584);
   U546 : no210 port map( A => n555, B => n579, Y => n578);
   U547 : iv110 port map( A => n585, Y => n583);
   U548 : mu111 port map( A => n416, B => lut_x_1_port, S => n579, Y => n585);
   U549 : na210 port map( A => n586, B => n587, Y => n370);
   U550 : na210 port map( A => calc_y(3), B => n588, Y => n587);
   U551 : na210 port map( A => lut_y_3_port, B => n589, Y => n586);
   U552 : na210 port map( A => n590, B => n591, Y => n369);
   U553 : na210 port map( A => calc_y(2), B => n588, Y => n591);
   U554 : na210 port map( A => lut_y_2_port, B => n589, Y => n590);
   U555 : na210 port map( A => n592, B => n593, Y => n368);
   U556 : na210 port map( A => calc_y(1), B => n588, Y => n593);
   U557 : na210 port map( A => lut_y_1_port, B => n589, Y => n592);
   U558 : na210 port map( A => n594, B => n595, Y => n367);
   U559 : na210 port map( A => calc_y(0), B => n588, Y => n595);
   U560 : no210 port map( A => n589, B => n396, Y => n588);
   U561 : na210 port map( A => lut_y_0_port, B => n589, Y => n594);
   U562 : na210 port map( A => n555, B => n596, Y => n589);
   U563 : na210 port map( A => n597, B => n598, Y => n596);
   U564 : na310 port map( A => n599, B => n600, C => n601, Y => n597);
   U565 : no210 port map( A => n416, B => n474, Y => n601);
   U566 : iv110 port map( A => check_empty, Y => n474);
   U567 : iv110 port map( A => n602, Y => n416);
   U568 : mu111 port map( A => n603, B => lut_rot_1_port, S => n598, Y => n366)
                           ;
   U569 : no210 port map( A => n604, B => n555, Y => n603);
   U570 : iv110 port map( A => calc_rot(1), Y => n604);
   U571 : mu111 port map( A => n605, B => lut_rot_0_port, S => n598, Y => n365)
                           ;
   U572 : na210 port map( A => n606, B => n602, Y => n598);
   U573 : iv110 port map( A => n579, Y => n606);
   U574 : na310 port map( A => n600, B => n396, C => n599, Y => n579);
   U575 : iv110 port map( A => n607, Y => n599);
   U576 : na310 port map( A => n608, B => n609, C => n610, Y => n607);
   U577 : no310 port map( A => n516, B => new_piece_port, C => n468, Y => n610)
                           ;
   U578 : no210 port map( A => n611, B => n612, Y => n468);
   U579 : na210 port map( A => n613, B => n439, Y => new_piece_port);
   U580 : no210 port map( A => n614, B => n612, Y => n516);
   U581 : no210 port map( A => n615, B => n551, Y => n614);
   U582 : no210 port map( A => n616, B => n555, Y => n605);
   U583 : iv110 port map( A => calc_rot(0), Y => n616);
   U584 : na310 port map( A => n617, B => n618, C => n619, Y => n364);
   U585 : na210 port map( A => lut_piece_type_0_port, B => n620, Y => n619);
   U586 : na210 port map( A => next_piece(0), B => n621, Y => n618);
   U587 : na210 port map( A => cur_future_piece_0_port, B => n622, Y => n617);
   U588 : na310 port map( A => n623, B => n624, C => n625, Y => n363);
   U589 : na210 port map( A => lut_piece_type_1_port, B => n620, Y => n625);
   U590 : na210 port map( A => next_piece(1), B => n621, Y => n624);
   U591 : na210 port map( A => cur_future_piece_1_port, B => n622, Y => n623);
   U592 : na310 port map( A => n626, B => n627, C => n628, Y => n362);
   U593 : na210 port map( A => lut_piece_type_2_port, B => n620, Y => n628);
   U594 : na210 port map( A => next_piece(2), B => n621, Y => n627);
   U595 : no210 port map( A => n439, B => n620, Y => n621);
   U596 : na210 port map( A => cur_future_piece_2_port, B => n622, Y => n626);
   U597 : no210 port map( A => n620, B => n463, Y => n622);
   U598 : iv110 port map( A => n629, Y => n463);
   U599 : na310 port map( A => n630, B => n600, C => n631, Y => n620);
   U600 : no310 port map( A => n486, B => y_port, C => move_start, Y => n631);
   U601 : no310 port map( A => n632, B => n450, C => n633, Y => n600);
   U602 : iv110 port map( A => n634, Y => n632);
   U603 : no210 port map( A => n496, B => n635, Y => n630);
   U604 : iv110 port map( A => n608, Y => n635);
   U605 : no310 port map( A => n636, B => n637, C => n638, Y => n608);
   U606 : na310 port map( A => n639, B => n640, C => n641, Y => n361);
   U607 : na210 port map( A => cur_future_piece_0_port, B => n642, Y => n641);
   U608 : na210 port map( A => n643, B => next_piece(0), Y => n640);
   U609 : na210 port map( A => n644, B => lut_piece_type_0_port, Y => n639);
   U610 : na310 port map( A => n645, B => n646, C => n647, Y => n360);
   U611 : na210 port map( A => cur_future_piece_1_port, B => n642, Y => n647);
   U612 : na210 port map( A => n643, B => next_piece(1), Y => n646);
   U613 : na210 port map( A => n644, B => lut_piece_type_1_port, Y => n645);
   U614 : na310 port map( A => n648, B => n649, C => n650, Y => n359);
   U615 : na210 port map( A => cur_future_piece_2_port, B => n642, Y => n650);
   U616 : na210 port map( A => n643, B => next_piece(2), Y => n649);
   U617 : no210 port map( A => n613, B => n642, Y => n643);
   U618 : iv110 port map( A => n486, Y => n613);
   U619 : na210 port map( A => n644, B => lut_piece_type_2_port, Y => n648);
   U620 : no210 port map( A => n642, B => n602, Y => n644);
   U621 : na310 port map( A => n651, B => n564, C => n652, Y => n642);
   U622 : no210 port map( A => n633, B => n638, Y => n652);
   U623 : na310 port map( A => n653, B => n654, C => n655, Y => n638);
   U624 : no310 port map( A => n412, B => n484, C => n511, Y => n655);
   U625 : no210 port map( A => rst, B => n565, Y => n653);
   U626 : na210 port map( A => n656, B => n657, Y => n355);
   U627 : na210 port map( A => cur_timer_1_time, B => n658, Y => n657);
   U628 : na210 port map( A => n659, B => n660, Y => n658);
   U629 : iv110 port map( A => n377, Y => n659);
   U630 : na210 port map( A => n378, B => n661, Y => n377);
   U631 : iv110 port map( A => n662, Y => n378);
   U632 : na210 port map( A => n663, B => n660, Y => n656);
   U633 : iv110 port map( A => n375, Y => n663);
   U634 : no310 port map( A => n495, B => n484, C => n664, Y => n375);
   U635 : iv110 port map( A => n395, Y => n495);
   U636 : na210 port map( A => n665, B => n666, Y => n354);
   U637 : na210 port map( A => cur_timer_1_reset, B => n667, Y => n666);
   U638 : na210 port map( A => n668, B => n660, Y => n667);
   U639 : iv110 port map( A => n383, Y => n668);
   U640 : na310 port map( A => n669, B => n651, C => n670, Y => n383);
   U641 : no310 port map( A => n629, B => n412, C => n664, Y => n670);
   U642 : iv110 port map( A => n671, Y => n664);
   U643 : iv110 port map( A => n672, Y => n651);
   U644 : iv110 port map( A => n633, Y => n669);
   U645 : na210 port map( A => n395, B => n567, Y => n633);
   U646 : na210 port map( A => n497, B => n673, Y => n395);
   U647 : na210 port map( A => n674, B => n660, Y => n665);
   U648 : iv110 port map( A => n381, Y => n674);
   U649 : no210 port map( A => n484, B => n675, Y => n381);
   U650 : no210 port map( A => n676, B => n535, Y => n675);
   U651 : no210 port map( A => n563, B => n677, Y => n484);
   U652 : na210 port map( A => n678, B => n679, Y => n353);
   U653 : na210 port map( A => cur_timer_1_start, B => n680, Y => n679);
   U654 : na210 port map( A => n681, B => n660, Y => n680);
   U655 : iv110 port map( A => n380, Y => n681);
   U656 : na210 port map( A => n661, B => n671, Y => n380);
   U657 : no210 port map( A => n486, B => n565, Y => n671);
   U658 : no210 port map( A => n682, B => n612, Y => n565);
   U659 : no210 port map( A => n611, B => n563, Y => n486);
   U660 : no310 port map( A => n629, B => n511, C => n672, Y => n661);
   U661 : na310 port map( A => n683, B => n634, C => n684, Y => n672);
   U662 : no310 port map( A => lut_next_piece_port, B => y_port, C => 
                           move_start, Y => n684);
   U663 : no310 port map( A => n389, B => n434, C => n685, Y => n634);
   U664 : na210 port map( A => n399, B => n547, Y => n685);
   U665 : na310 port map( A => cur_state_5_port, B => cur_state_0_port, C => 
                           n686, Y => n547);
   U666 : na210 port map( A => n673, B => n413, Y => n399);
   U667 : iv110 port map( A => n470, Y => n434);
   U668 : na310 port map( A => cur_state_5_port, B => n537, C => n686, Y => 
                           n470);
   U669 : no210 port map( A => n450, B => n636, Y => n683);
   U670 : na310 port map( A => n687, B => n515, C => n688, Y => n636);
   U671 : no310 port map( A => n689, B => draw_score_draw_port, C => n487, Y =>
                           n688);
   U672 : iv110 port map( A => n690, Y => n487);
   U673 : no210 port map( A => n691, B => n563, Y => n689);
   U674 : no210 port map( A => n549, B => n692, Y => n691);
   U675 : no210 port map( A => n436, B => n569, Y => n515);
   U676 : iv110 port map( A => n501, Y => n569);
   U677 : na210 port map( A => n412, B => n525, Y => n501);
   U678 : iv110 port map( A => n676, Y => n412);
   U679 : iv110 port map( A => n423, Y => n436);
   U680 : na310 port map( A => n497, B => n693, C => n694, Y => n423);
   U681 : iv110 port map( A => n695, Y => n687);
   U682 : na210 port map( A => n696, B => n461, Y => n695);
   U683 : no310 port map( A => n441, B => clear_shift_start_port, C => n697, Y 
                           => n461);
   U684 : iv110 port map( A => n508, Y => n697);
   U685 : na210 port map( A => n692, B => n413, Y => n696);
   U686 : na210 port map( A => n564, B => n682, Y => n692);
   U687 : no210 port map( A => n698, B => n612, Y => n511);
   U688 : na210 port map( A => n602, B => n564, Y => n629);
   U689 : na210 port map( A => n575, B => n497, Y => n602);
   U690 : iv110 port map( A => n682, Y => n575);
   U691 : na210 port map( A => n662, B => n660, Y => n678);
   U692 : iv110 port map( A => rst, Y => n660);
   U693 : na210 port map( A => n567, B => n654, Y => n662);
   U694 : na310 port map( A => n413, B => n392, C => n694, Y => n654);
   U695 : na210 port map( A => n699, B => n413, Y => n567);
   U696 : na310 port map( A => n700, B => n439, C => n701, Y => 
                           lut_next_piece_port);
   U697 : iv110 port map( A => n637, Y => n701);
   U698 : na310 port map( A => n506, B => n702, C => n447, Y => n637);
   U699 : na210 port map( A => n686, B => n693, Y => n439);
   U700 : no210 port map( A => n611, B => n535, Y => draw_score_draw_port);
   U701 : na310 port map( A => n703, B => n704, C => n705, Y => 
                           draw_erase_start);
   U702 : no210 port map( A => n451, B => n706, Y => n705);
   U703 : na210 port map( A => n506, B => n508, Y => n451);
   U704 : na210 port map( A => n549, B => n413, Y => n508);
   U705 : iv110 port map( A => n698, Y => n549);
   U706 : iv110 port map( A => n543, Y => n506);
   U707 : no210 port map( A => n611, B => n561, Y => n543);
   U708 : na210 port map( A => move_draw_erase_start, B => move_start, Y => 
                           n704);
   U709 : no210 port map( A => n496, B => n441, Y => n703);
   U710 : no210 port map( A => n535, B => n677, Y => n441);
   U711 : iv110 port map( A => n700, Y => n496);
   U712 : na210 port map( A => n615, B => n413, Y => n700);
   U713 : iv110 port map( A => n561, Y => n413);
   U714 : na210 port map( A => n707, B => n708, Y => draw_erase_draw);
   U715 : na210 port map( A => move_draw_erase_draw, B => move_start, Y => n708
                           );
   U716 : iv110 port map( A => n706, Y => n707);
   U717 : na310 port map( A => n514, B => n709, C => n710, Y => n706);
   U718 : no310 port map( A => n711, B => n488, C => n389, Y => n710);
   U719 : no210 port map( A => n712, B => n713, Y => n389);
   U720 : mu111 port map( A => n612, B => n535, S => n537, Y => n712);
   U721 : iv110 port map( A => n702, Y => n488);
   U722 : na210 port map( A => n686, B => n714, Y => n702);
   U723 : no210 port map( A => n560, B => n563, Y => n686);
   U724 : no210 port map( A => n561, B => n676, Y => n711);
   U725 : na210 port map( A => n694, B => n714, Y => n676);
   U726 : na210 port map( A => n551, B => n550, Y => n709);
   U727 : iv110 port map( A => n414, Y => n514);
   U728 : na210 port map( A => n533, B => n447, Y => n414);
   U729 : na310 port map( A => n525, B => n693, C => n694, Y => n447);
   U730 : iv110 port map( A => n560, Y => n694);
   U731 : na210 port map( A => cur_state_3_port, B => n420, Y => n560);
   U732 : iv110 port map( A => cur_state_4_port, Y => n420);
   U733 : no210 port map( A => n450, B => n715, Y => n533);
   U734 : no210 port map( A => n682, B => n563, Y => n715);
   U735 : na310 port map( A => cur_state_4_port, B => n444, C => n693, Y => 
                           n682);
   U736 : no210 port map( A => n612, B => n534, Y => n450);
   U737 : iv110 port map( A => n716, Y => clear_shift_start_port);
   U738 : no210 port map( A => n415, B => n512, Y => n716);
   U739 : no210 port map( A => n698, B => n535, Y => n512);
   U740 : na310 port map( A => cur_state_4_port, B => cur_state_3_port, C => 
                           n693, Y => n698);
   U741 : no210 port map( A => n612, B => n677, Y => n415);
   U742 : na310 port map( A => n717, B => n690, C => n609, Y => check_start);
   U743 : na210 port map( A => n551, B => n497, Y => n690);
   U744 : iv110 port map( A => n564, Y => n551);
   U745 : na310 port map( A => n714, B => n444, C => cur_state_4_port, Y => 
                           n564);
   U746 : iv110 port map( A => cur_state_3_port, Y => n444);
   U747 : na210 port map( A => move_check_start, B => move_start, Y => n717);
   U748 : na210 port map( A => n718, B => n719, Y => add_sub);
   U749 : iv110 port map( A => y_port, Y => n719);
   U750 : na210 port map( A => n609, B => n396, Y => y_port);
   U751 : na210 port map( A => n673, B => n550, Y => n396);
   U752 : iv110 port map( A => n563, Y => n550);
   U753 : no210 port map( A => n713, B => n537, Y => n673);
   U754 : no210 port map( A => n541, B => n401, Y => n609);
   U755 : no210 port map( A => n561, B => n677, Y => n401);
   U756 : na310 port map( A => cur_state_3_port, B => n714, C => 
                           cur_state_4_port, Y => n677);
   U757 : na210 port map( A => cur_state_2_port, B => cur_state_1_port, Y => 
                           n561);
   U758 : no210 port map( A => n563, B => n534, Y => n541);
   U759 : iv110 port map( A => n699, Y => n534);
   U760 : no210 port map( A => n713, B => cur_state_0_port, Y => n699);
   U761 : na210 port map( A => cur_state_5_port, B => n720, Y => n713);
   U762 : na210 port map( A => n503, B => n721, Y => n563);
   U763 : na210 port map( A => move_add_sub, B => move_start, Y => n718);
   U764 : na210 port map( A => n722, B => n555, Y => move_start);
   U765 : na210 port map( A => n615, B => n497, Y => n555);
   U766 : iv110 port map( A => n535, Y => n497);
   U767 : na210 port map( A => cur_state_2_port, B => n503, Y => n535);
   U768 : iv110 port map( A => cur_state_1_port, Y => n503);
   U769 : iv110 port map( A => n524, Y => n615);
   U770 : na210 port map( A => n525, B => n723, Y => n722);
   U771 : na210 port map( A => n611, B => n524, Y => n723);
   U772 : na210 port map( A => n693, B => n720, Y => n524);
   U773 : iv110 port map( A => n562, Y => n693);
   U774 : na210 port map( A => n392, B => n537, Y => n562);
   U775 : iv110 port map( A => cur_state_5_port, Y => n392);
   U776 : na210 port map( A => n720, B => n714, Y => n611);
   U777 : no210 port map( A => n537, B => cur_state_5_port, Y => n714);
   U778 : iv110 port map( A => cur_state_0_port, Y => n537);
   U779 : no210 port map( A => cur_state_3_port, B => cur_state_4_port, Y => 
                           n720);
   U780 : iv110 port map( A => n612, Y => n525);
   U781 : na210 port map( A => cur_state_1_port, B => n721, Y => n612);
   U782 : iv110 port map( A => cur_state_2_port, Y => n721);

end synthesised;



