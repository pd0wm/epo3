
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of controller is

   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
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
   
   component dfn10
      port( D, CK : in std_logic;  Q : out std_logic);
   end component;
   
   component dfr11
      port( D, R, CK : in std_logic;  Q : out std_logic);
   end component;
   
   signal lut_piece_type_2_port, lut_piece_type_1_port, lut_piece_type_0_port, 
      lut_x_2_port, lut_x_1_port, lut_x_0_port, lut_y_3_port, lut_y_2_port, 
      lut_y_1_port, lut_y_0_port, lut_rot_1_port, lut_rot_0_port, y_port, 
      draw_erase_draw_port, draw_score_draw_port, cur_state_5_port, 
      cur_state_4_port, cur_state_3_port, cur_state_2_port, cur_state_1_port, 
      cur_state_0_port, cur_future_piece_2_port, cur_future_piece_1_port, 
      cur_future_piece_0_port, next_state_5_port, next_state_4_port, 
      next_state_3_port, next_state_2_port, next_state_1_port, 
      next_state_0_port, cur_timer_1_time, cur_timer_1_start, cur_timer_1_reset
      , inv_inputs_5_port, inv_inputs_4_port, inv_inputs_3_port, 
      inv_inputs_2_port, inv_inputs_1_port, inv_inputs_0_port, n373, n374, n375
      , n376, n377, n378, n379, n380, n381, check_start_port, 
      lut_next_piece_port, n386, n387, n388, n389, n390, n391, n392, n393, n394
      , n395, n396, n397, n398, n399, n400, n401, n402, n403, n404, n405, n406,
      n407, n408, n409, n410, n411, n412, n413, n414, n415, n416, n417, n418, 
      n419, n420, n421, n422, n423, n424, n425, n426, n427, n428, n429, n430, 
      n431, n432, n433, n434, n435, n436, n437, n438, n439, n440, n441, n442, 
      n443, n444, n445, n446, n447, n448, n449, n450, n451, n452, n453, n454, 
      n455, n456, n457, n458, n459, n460, n461, n462, n463, n464, n465, n466, 
      n467, n468, n469, n470, n471, n472, n473, n474, n475, n476, n477, n478, 
      n479, n480, n481, n482, n483, n484, n485, n486, n487, n488, n489, n490, 
      n491, n492, n493, n494, n495, n496, n497, n498, n499, n500, n501, n502, 
      n503, n504, n505, n506, n507, n508, n509, n510, n511, n512, n513, n514, 
      n515, n516, n517, n518, n519, n520, n521, n522, n523, n524, n525, n526, 
      n527, n528, n529, n530, n531, n532, n533, n534, n535, n536, n537, n538, 
      n539, n540, n541, n542, n543, n544, n545, n546, n547, n548, n549, n550, 
      n551, n552, n553, n554, n555, n556, n557, n558, n559, n560, n561, n562, 
      n563, n564, n565, n566, n567, n568, n569, n570, n571, n572, n573, n574, 
      n575, n576, n577, n578, n579, n580, n581, n582, n583, n584, n585, n586, 
      n587, n588, n589, n590, n591, n592, n593, n594, n595, n596, n597, n598, 
      n599, n600, n601, n602, n603, n604, n605, n606, n607, n608, n609, n610, 
      n611, n612, n613, n614, n615, n616, n617, n618, n619, n620, n621, n622, 
      n623, n624, n625, n626, n627, n628, n629, n630, n631, n632, n633, n634, 
      n635, n636, n637, n638, n639, n640, n641, n642, n643, n644, n645, n646, 
      n647, n648, n649, n650, n651, n652, n653, n654, n655, n656, n657, n658, 
      n659, n660, n661, n662, n663, n664, n665, n666, n667, n668, n669, n670, 
      n671, n672, n673, n674, n675, n676, n677, n678, n679, n680, n681, n682, 
      n683, n684, n685, n686, n687, n688, n689, n690, n691, n692, n693, n694, 
      n695, n696, n697, n698, n699, n700, n701, n702, n703, n704, n705, n706, 
      n707, n708, n709, n710, n711, n712, n713, n714, n715, n716, n717, n718, 
      n719, n720, n721, n722, n723, n724, n725, n726, n727, n728, n729, n730, 
      n731, n732, n733, n734, n735, n736, n737, n738, n739, n740, n741, n742, 
      n743, n744, n745 : std_logic;

begin
   lut_piece_type <= ( lut_piece_type_2_port, lut_piece_type_1_port, 
      lut_piece_type_0_port );
   lut_next_piece <= lut_next_piece_port;
   lut_x <= ( lut_x_2_port, lut_x_1_port, lut_x_0_port );
   lut_y <= ( lut_y_3_port, lut_y_2_port, lut_y_1_port, lut_y_0_port );
   lut_rot <= ( lut_rot_1_port, lut_rot_0_port );
   y <= y_port;
   check_start <= check_start_port;
   draw_erase_draw <= draw_erase_draw_port;
   draw_score_draw <= draw_score_draw_port;
   
   inv_inputs_reg_5_inst : dfn10 port map( D => n381, CK => clk, Q => 
                           inv_inputs_5_port);
   inv_inputs_reg_4_inst : dfn10 port map( D => n380, CK => clk, Q => 
                           inv_inputs_4_port);
   inv_inputs_reg_3_inst : dfn10 port map( D => n379, CK => clk, Q => 
                           inv_inputs_3_port);
   inv_inputs_reg_2_inst : dfn10 port map( D => n378, CK => clk, Q => 
                           inv_inputs_2_port);
   inv_inputs_reg_1_inst : dfn10 port map( D => n377, CK => clk, Q => 
                           inv_inputs_1_port);
   inv_inputs_reg_0_inst : dfn10 port map( D => n376, CK => clk, Q => 
                           inv_inputs_0_port);
   cur_timer_1_time_reg : dfn10 port map( D => n375, CK => clk, Q => 
                           cur_timer_1_time);
   cur_state_reg_2_inst : dfr11 port map( D => next_state_2_port, R => rst, CK 
                           => clk, Q => cur_state_2_port);
   cur_state_reg_1_inst : dfr11 port map( D => next_state_1_port, R => rst, CK 
                           => clk, Q => cur_state_1_port);
   cur_state_reg_0_inst : dfr11 port map( D => next_state_0_port, R => rst, CK 
                           => clk, Q => cur_state_0_port);
   cur_state_reg_3_inst : dfr11 port map( D => next_state_3_port, R => rst, CK 
                           => clk, Q => cur_state_3_port);
   cur_state_reg_5_inst : dfr11 port map( D => next_state_5_port, R => rst, CK 
                           => clk, Q => cur_state_5_port);
   cur_state_reg_4_inst : dfr11 port map( D => next_state_4_port, R => rst, CK 
                           => clk, Q => cur_state_4_port);
   cur_x_reg_1_inst : dfn10 port map( D => n398, CK => clk, Q => lut_x_1_port);
   cur_x_reg_0_inst : dfn10 port map( D => n399, CK => clk, Q => lut_x_0_port);
   cur_x_reg_2_inst : dfn10 port map( D => n400, CK => clk, Q => lut_x_2_port);
   cur_piece_reg_2_inst : dfn10 port map( D => n389, CK => clk, Q => 
                           lut_piece_type_2_port);
   cur_future_piece_reg_2_inst : dfn10 port map( D => n386, CK => clk, Q => 
                           cur_future_piece_2_port);
   cur_piece_reg_1_inst : dfn10 port map( D => n390, CK => clk, Q => 
                           lut_piece_type_1_port);
   cur_future_piece_reg_1_inst : dfn10 port map( D => n387, CK => clk, Q => 
                           cur_future_piece_1_port);
   cur_piece_reg_0_inst : dfn10 port map( D => n391, CK => clk, Q => 
                           lut_piece_type_0_port);
   cur_future_piece_reg_0_inst : dfn10 port map( D => n388, CK => clk, Q => 
                           cur_future_piece_0_port);
   cur_y_reg_3_inst : dfn10 port map( D => n397, CK => clk, Q => lut_y_3_port);
   cur_y_reg_2_inst : dfn10 port map( D => n396, CK => clk, Q => lut_y_2_port);
   cur_y_reg_1_inst : dfn10 port map( D => n395, CK => clk, Q => lut_y_1_port);
   cur_y_reg_0_inst : dfn10 port map( D => n394, CK => clk, Q => lut_y_0_port);
   cur_rot_reg_1_inst : dfn10 port map( D => n393, CK => clk, Q => 
                           lut_rot_1_port);
   cur_rot_reg_0_inst : dfn10 port map( D => n392, CK => clk, Q => 
                           lut_rot_0_port);
   cur_timer_1_start_reg : dfn10 port map( D => n374, CK => clk, Q => 
                           cur_timer_1_start);
   cur_timer_1_reset_reg : dfn10 port map( D => n373, CK => clk, Q => 
                           cur_timer_1_reset);
   U419 : no210 port map( A => n401, B => n402, Y => x);
   U420 : no210 port map( A => inputs(0), B => inputs(1), Y => n402);
   U421 : na210 port map( A => n403, B => n404, Y => timer_1_time);
   U422 : na210 port map( A => cur_timer_1_time, B => n405, Y => n404);
   U423 : iv110 port map( A => n406, Y => n405);
   U424 : na210 port map( A => n407, B => n408, Y => timer_1_start);
   U425 : na210 port map( A => cur_timer_1_start, B => n409, Y => n408);
   U426 : iv110 port map( A => n410, Y => n409);
   U427 : na210 port map( A => n411, B => n412, Y => timer_1_reset);
   U428 : na210 port map( A => cur_timer_1_reset, B => n413, Y => n412);
   U429 : iv110 port map( A => n414, Y => n413);
   U430 : iv110 port map( A => n415, Y => n411);
   U431 : no210 port map( A => n401, B => n416, Y => rot);
   U432 : no210 port map( A => inputs(2), B => inputs(3), Y => n416);
   U433 : na310 port map( A => n417, B => n418, C => n419, Y => 
                           next_state_5_port);
   U434 : no310 port map( A => n420, B => n421, C => n422, Y => n419);
   U435 : iv110 port map( A => n423, Y => n422);
   U436 : na310 port map( A => inv_inputs_5_port, B => cur_timer_1_time, C => 
                           n424, Y => n423);
   U437 : no210 port map( A => n425, B => n426, Y => n417);
   U438 : na310 port map( A => n427, B => n428, C => n429, Y => 
                           next_state_4_port);
   U439 : no310 port map( A => n430, B => n431, C => n432, Y => n429);
   U440 : no210 port map( A => n433, B => n434, Y => n432);
   U441 : iv110 port map( A => draw_score_ready, Y => n434);
   U442 : no310 port map( A => n435, B => timer_1_done, C => n436, Y => n431);
   U443 : na310 port map( A => n437, B => n438, C => n439, Y => n430);
   U444 : na210 port map( A => n440, B => n441, Y => n439);
   U445 : no210 port map( A => n442, B => n443, Y => n428);
   U446 : no210 port map( A => n444, B => n445, Y => n427);
   U447 : na310 port map( A => n446, B => n447, C => n448, Y => 
                           next_state_3_port);
   U448 : no310 port map( A => n449, B => draw_score_draw_port, C => 
                           check_start_port, Y => n448);
   U449 : na210 port map( A => n450, B => n451, Y => n449);
   U450 : na210 port map( A => n452, B => draw_erase_ready, Y => n450);
   U451 : no210 port map( A => n453, B => n454, Y => n447);
   U452 : iv110 port map( A => n455, Y => n453);
   U453 : no210 port map( A => n456, B => n457, Y => n446);
   U454 : na310 port map( A => n458, B => n459, C => n460, Y => 
                           next_state_2_port);
   U455 : no310 port map( A => n461, B => n462, C => n463, Y => n460);
   U456 : na310 port map( A => n464, B => n465, C => n418, Y => n461);
   U457 : iv110 port map( A => n466, Y => n418);
   U458 : na310 port map( A => n467, B => n468, C => n469, Y => n466);
   U459 : no210 port map( A => n470, B => n471, Y => n469);
   U460 : na210 port map( A => n472, B => n473, Y => n468);
   U461 : iv110 port map( A => clear_shift_ready, Y => n473);
   U462 : na210 port map( A => n474, B => n475, Y => n467);
   U463 : no310 port map( A => n476, B => n477, C => n478, Y => n459);
   U464 : no210 port map( A => n479, B => n480, Y => n478);
   U465 : no210 port map( A => n481, B => n451, Y => n476);
   U466 : no310 port map( A => n482, B => n483, C => n484, Y => n458);
   U467 : no210 port map( A => n485, B => n486, Y => n483);
   U468 : na310 port map( A => n487, B => n488, C => n489, Y => 
                           next_state_1_port);
   U469 : no210 port map( A => n490, B => n491, Y => n489);
   U470 : na310 port map( A => n492, B => n493, C => n494, Y => n491);
   U471 : na210 port map( A => n495, B => draw_erase_ready, Y => n494);
   U472 : na210 port map( A => n496, B => n497, Y => n493);
   U473 : na210 port map( A => n498, B => n499, Y => n497);
   U474 : na210 port map( A => n500, B => n479, Y => n492);
   U475 : na210 port map( A => inv_inputs_4_port, B => cur_timer_1_time, Y => 
                           n479);
   U476 : na310 port map( A => n501, B => n502, C => n503, Y => n490);
   U477 : no210 port map( A => n504, B => n440, Y => n503);
   U478 : iv110 port map( A => n433, Y => n504);
   U479 : no310 port map( A => n505, B => n506, C => n507, Y => n488);
   U480 : iv110 port map( A => n508, Y => n507);
   U481 : na210 port map( A => n477, B => check_ready, Y => n508);
   U482 : no210 port map( A => check_empty, B => n451, Y => n505);
   U483 : no310 port map( A => n462, B => n426, C => n457, Y => n487);
   U484 : na310 port map( A => n509, B => n510, C => n511, Y => n457);
   U485 : no310 port map( A => n512, B => n471, C => n513, Y => n511);
   U486 : na210 port map( A => n514, B => n515, Y => n512);
   U487 : no210 port map( A => n516, B => n484, Y => n510);
   U488 : no210 port map( A => n517, B => n481, Y => n516);
   U489 : no210 port map( A => n443, B => n518, Y => n509);
   U490 : mu111 port map( A => n519, B => n520, S => draw_erase_ready, Y => 
                           n518);
   U491 : no210 port map( A => n521, B => n522, Y => n520);
   U492 : na210 port map( A => n523, B => n524, Y => n443);
   U493 : na210 port map( A => n424, B => n525, Y => n524);
   U494 : na210 port map( A => inv_inputs_5_port, B => cur_timer_1_time, Y => 
                           n525);
   U495 : iv110 port map( A => n526, Y => n523);
   U496 : na210 port map( A => n527, B => n528, Y => n426);
   U497 : iv110 port map( A => n529, Y => n462);
   U498 : no310 port map( A => n530, B => n531, C => n532, Y => n529);
   U499 : no210 port map( A => n481, B => n533, Y => n532);
   U500 : iv110 port map( A => check_empty, Y => n481);
   U501 : na310 port map( A => n534, B => n535, C => n536, Y => 
                           next_state_0_port);
   U502 : no310 port map( A => n537, B => n463, C => n538, Y => n536);
   U503 : mu111 port map( A => n477, B => n539, S => check_ready, Y => n538);
   U504 : no210 port map( A => n540, B => n485, Y => n539);
   U505 : no210 port map( A => n541, B => n542, Y => n540);
   U506 : na310 port map( A => n543, B => n544, C => n545, Y => n463);
   U507 : no310 port map( A => n546, B => n424, C => n547, Y => n545);
   U508 : iv110 port map( A => n501, Y => n547);
   U509 : na210 port map( A => n452, B => n548, Y => n501);
   U510 : iv110 port map( A => n549, Y => n424);
   U511 : na210 port map( A => n550, B => n514, Y => n546);
   U512 : no210 port map( A => n551, B => n552, Y => n544);
   U513 : no210 port map( A => check_empty, B => n517, Y => n552);
   U514 : no310 port map( A => n553, B => n436, C => n435, Y => n551);
   U515 : iv110 port map( A => timer_1_done, Y => n553);
   U516 : no210 port map( A => n526, B => n445, Y => n543);
   U517 : na310 port map( A => n554, B => n555, C => n556, Y => n445);
   U518 : na310 port map( A => n557, B => n558, C => n559, Y => n526);
   U519 : no210 port map( A => n560, B => n561, Y => n559);
   U520 : na310 port map( A => n562, B => n563, C => n564, Y => n537);
   U521 : iv110 port map( A => n444, Y => n564);
   U522 : na310 port map( A => n565, B => n566, C => n455, Y => n444);
   U523 : na210 port map( A => n567, B => n498, Y => n455);
   U524 : na210 port map( A => n568, B => n569, Y => n567);
   U525 : na210 port map( A => n496, B => n499, Y => n569);
   U526 : iv110 port map( A => inv_inputs_4_port, Y => n499);
   U527 : iv110 port map( A => n570, Y => n496);
   U528 : na210 port map( A => draw_erase_ready, B => n530, Y => n568);
   U529 : na210 port map( A => n571, B => n498, Y => n563);
   U530 : no210 port map( A => n572, B => inv_inputs_5_port, Y => n498);
   U531 : iv110 port map( A => n441, Y => n572);
   U532 : no310 port map( A => inv_inputs_0_port, B => inv_inputs_1_port, C => 
                           n573, Y => n441);
   U533 : iv110 port map( A => n574, Y => n573);
   U534 : no210 port map( A => inv_inputs_3_port, B => inv_inputs_2_port, Y => 
                           n574);
   U535 : na210 port map( A => n474, B => n542, Y => n562);
   U536 : no310 port map( A => n575, B => n421, C => n576, Y => n535);
   U537 : iv110 port map( A => n577, Y => n576);
   U538 : no210 port map( A => n533, B => check_empty, Y => n421);
   U539 : iv110 port map( A => n515, Y => n575);
   U540 : na210 port map( A => clear_shift_ready, B => n472, Y => n515);
   U541 : no310 port map( A => n578, B => n440, C => n579, Y => n534);
   U542 : no210 port map( A => draw_score_ready, B => n433, Y => n579);
   U543 : no210 port map( A => n580, B => n548, Y => n578);
   U544 : iv110 port map( A => draw_erase_ready, Y => n548);
   U545 : no310 port map( A => n581, B => n495, C => n582, Y => n580);
   U546 : na310 port map( A => n583, B => n502, C => n584, Y => n581);
   U547 : iv110 port map( A => n438, Y => new_piece);
   U548 : na210 port map( A => n585, B => n586, Y => n400);
   U549 : na210 port map( A => calc_x(2), B => n587, Y => n586);
   U550 : na210 port map( A => lut_x_2_port, B => n588, Y => n585);
   U551 : na210 port map( A => n589, B => n590, Y => n399);
   U552 : na210 port map( A => calc_x(0), B => n587, Y => n590);
   U553 : mu111 port map( A => n437, B => n591, S => n588, Y => n589);
   U554 : iv110 port map( A => lut_x_0_port, Y => n591);
   U555 : na210 port map( A => n592, B => n593, Y => n398);
   U556 : na210 port map( A => calc_x(1), B => n587, Y => n593);
   U557 : no210 port map( A => n550, B => n588, Y => n587);
   U558 : mu111 port map( A => n437, B => n594, S => n588, Y => n592);
   U559 : iv110 port map( A => lut_x_1_port, Y => n594);
   U560 : na210 port map( A => n595, B => n596, Y => n397);
   U561 : na210 port map( A => calc_y(3), B => n597, Y => n596);
   U562 : na210 port map( A => lut_y_3_port, B => n598, Y => n595);
   U563 : na210 port map( A => n599, B => n600, Y => n396);
   U564 : na210 port map( A => calc_y(2), B => n597, Y => n600);
   U565 : na210 port map( A => lut_y_2_port, B => n598, Y => n599);
   U566 : na210 port map( A => n601, B => n602, Y => n395);
   U567 : na210 port map( A => calc_y(1), B => n597, Y => n602);
   U568 : na210 port map( A => lut_y_1_port, B => n598, Y => n601);
   U569 : na210 port map( A => n603, B => n604, Y => n394);
   U570 : na210 port map( A => calc_y(0), B => n597, Y => n604);
   U571 : no210 port map( A => n598, B => n451, Y => n597);
   U572 : na210 port map( A => lut_y_0_port, B => n598, Y => n603);
   U573 : na210 port map( A => n550, B => n605, Y => n598);
   U574 : na210 port map( A => n606, B => n607, Y => n605);
   U575 : na310 port map( A => check_empty, B => n464, C => n608, Y => n606);
   U576 : iv110 port map( A => n609, Y => n550);
   U577 : mu111 port map( A => n610, B => lut_rot_1_port, S => n607, Y => n393)
                           ;
   U578 : iv110 port map( A => n611, Y => n610);
   U579 : na210 port map( A => calc_rot(1), B => n609, Y => n611);
   U580 : mu111 port map( A => n612, B => lut_rot_0_port, S => n607, Y => n392)
                           ;
   U581 : na210 port map( A => n613, B => n437, Y => n607);
   U582 : iv110 port map( A => n588, Y => n613);
   U583 : na310 port map( A => n451, B => n577, C => n608, Y => n588);
   U584 : no310 port map( A => n614, B => n615, C => n616, Y => n608);
   U585 : na310 port map( A => n566, B => n438, C => n584, Y => n616);
   U586 : no210 port map( A => n513, B => n617, Y => n438);
   U587 : no210 port map( A => n435, B => n486, Y => n617);
   U588 : iv110 port map( A => n618, Y => n612);
   U589 : na210 port map( A => calc_rot(0), B => n609, Y => n618);
   U590 : na310 port map( A => n619, B => n620, C => n621, Y => n391);
   U591 : na210 port map( A => lut_piece_type_0_port, B => n622, Y => n621);
   U592 : na210 port map( A => cur_future_piece_0_port, B => n623, Y => n620);
   U593 : na210 port map( A => next_piece(0), B => n624, Y => n619);
   U594 : na310 port map( A => n625, B => n626, C => n627, Y => n390);
   U595 : na210 port map( A => lut_piece_type_1_port, B => n622, Y => n627);
   U596 : na210 port map( A => cur_future_piece_1_port, B => n623, Y => n626);
   U597 : na210 port map( A => next_piece(1), B => n624, Y => n625);
   U598 : na310 port map( A => n628, B => n629, C => n630, Y => n389);
   U599 : na210 port map( A => lut_piece_type_2_port, B => n622, Y => n630);
   U600 : na210 port map( A => cur_future_piece_2_port, B => n623, Y => n629);
   U601 : no210 port map( A => n622, B => n464, Y => n623);
   U602 : na210 port map( A => next_piece(2), B => n624, Y => n628);
   U603 : no210 port map( A => n622, B => n486, Y => n624);
   U604 : na310 port map( A => n631, B => n632, C => n633, Y => n622);
   U605 : no210 port map( A => n513, B => n634, Y => n633);
   U606 : na310 port map( A => n635, B => n636, C => n637, Y => n388);
   U607 : na210 port map( A => cur_future_piece_0_port, B => n638, Y => n637);
   U608 : na210 port map( A => n639, B => lut_piece_type_0_port, Y => n636);
   U609 : na210 port map( A => n640, B => next_piece(0), Y => n635);
   U610 : na310 port map( A => n641, B => n642, C => n643, Y => n387);
   U611 : na210 port map( A => cur_future_piece_1_port, B => n638, Y => n643);
   U612 : na210 port map( A => n639, B => lut_piece_type_1_port, Y => n642);
   U613 : na210 port map( A => n640, B => next_piece(1), Y => n641);
   U614 : na310 port map( A => n644, B => n645, C => n646, Y => n386);
   U615 : na210 port map( A => cur_future_piece_2_port, B => n638, Y => n646);
   U616 : na210 port map( A => n639, B => lut_piece_type_2_port, Y => n645);
   U617 : no210 port map( A => n638, B => n437, Y => n639);
   U618 : na210 port map( A => n640, B => next_piece(2), Y => n644);
   U619 : no210 port map( A => n647, B => n638, Y => n640);
   U620 : na310 port map( A => n577, B => n648, C => n631, Y => n638);
   U621 : no310 port map( A => n425, B => n609, C => n614, Y => n631);
   U622 : na310 port map( A => n649, B => n650, C => n651, Y => n614);
   U623 : no310 port map( A => n652, B => rst, C => n571, Y => n651);
   U624 : na210 port map( A => n558, B => n653, Y => n652);
   U625 : no210 port map( A => n654, B => n655, Y => n650);
   U626 : no210 port map( A => n656, B => n415, Y => n649);
   U627 : iv110 port map( A => lut_next_piece_port, Y => n648);
   U628 : mu111 port map( A => inputs(5), B => inv_inputs_5_port, S => rst, Y 
                           => n381);
   U629 : mu111 port map( A => inputs(4), B => inv_inputs_4_port, S => rst, Y 
                           => n380);
   U630 : mu111 port map( A => inputs(3), B => inv_inputs_3_port, S => rst, Y 
                           => n379);
   U631 : mu111 port map( A => inputs(2), B => inv_inputs_2_port, S => rst, Y 
                           => n378);
   U632 : mu111 port map( A => inputs(1), B => inv_inputs_1_port, S => rst, Y 
                           => n377);
   U633 : mu111 port map( A => inputs(0), B => inv_inputs_0_port, S => rst, Y 
                           => n376);
   U634 : na210 port map( A => n657, B => n658, Y => n375);
   U635 : na210 port map( A => cur_timer_1_time, B => n659, Y => n658);
   U636 : na210 port map( A => n406, B => n660, Y => n659);
   U637 : no310 port map( A => n656, B => n571, C => n661, Y => n406);
   U638 : na210 port map( A => n662, B => n660, Y => n657);
   U639 : iv110 port map( A => n403, Y => n662);
   U640 : no310 port map( A => n513, B => n663, C => n664, Y => n403);
   U641 : na210 port map( A => n528, B => n653, Y => n664);
   U642 : iv110 port map( A => n647, Y => n513);
   U643 : na210 port map( A => n665, B => n666, Y => n374);
   U644 : na210 port map( A => cur_timer_1_start, B => n667, Y => n666);
   U645 : na210 port map( A => n410, B => n660, Y => n667);
   U646 : no210 port map( A => n668, B => n571, Y => n410);
   U647 : iv110 port map( A => n527, Y => n571);
   U648 : na210 port map( A => n669, B => n474, Y => n527);
   U649 : na210 port map( A => n656, B => n660, Y => n665);
   U650 : iv110 port map( A => n407, Y => n656);
   U651 : no210 port map( A => n670, B => n561, Y => n407);
   U652 : no210 port map( A => n522, B => n671, Y => n561);
   U653 : na210 port map( A => n672, B => n673, Y => n373);
   U654 : na210 port map( A => cur_timer_1_reset, B => n674, Y => n673);
   U655 : na210 port map( A => n414, B => n660, Y => n674);
   U656 : no310 port map( A => n670, B => n471, C => n668, Y => n414);
   U657 : na310 port map( A => n647, B => n558, C => n675, Y => n668);
   U658 : iv110 port map( A => n661, Y => n675);
   U659 : na310 port map( A => n464, B => n401, C => n676, Y => n661);
   U660 : no310 port map( A => n655, B => lut_next_piece_port, C => n425, Y => 
                           n676);
   U661 : na210 port map( A => n677, B => n451, Y => n425);
   U662 : iv110 port map( A => n615, Y => n677);
   U663 : na210 port map( A => n678, B => n679, Y => n615);
   U664 : na310 port map( A => n680, B => n681, C => n682, Y => n655);
   U665 : no210 port map( A => n683, B => n684, Y => n682);
   U666 : na310 port map( A => n549, B => n570, C => n685, Y => n684);
   U667 : na310 port map( A => n686, B => n474, C => n687, Y => n570);
   U668 : no210 port map( A => cur_state_0_port, B => n688, Y => n687);
   U669 : na210 port map( A => n689, B => n474, Y => n549);
   U670 : na310 port map( A => n690, B => n691, C => n502, Y => n683);
   U671 : iv110 port map( A => draw_score_draw_port, Y => n691);
   U672 : no310 port map( A => n440, B => n692, C => n530, Y => n681);
   U673 : no210 port map( A => n521, B => n693, Y => n440);
   U674 : no310 port map( A => n482, B => n420, C => n442, Y => n680);
   U675 : na310 port map( A => n533, B => n694, C => n695, Y => n442);
   U676 : no210 port map( A => n500, B => n477, Y => n695);
   U677 : iv110 port map( A => n480, Y => n500);
   U678 : na210 port map( A => n696, B => n474, Y => n480);
   U679 : na210 port map( A => n689, B => n697, Y => n533);
   U680 : na310 port map( A => n565, B => n698, C => n699, Y => n420);
   U681 : no210 port map( A => n475, B => n700, Y => n699);
   U682 : iv110 port map( A => n514, Y => n700);
   U683 : na210 port map( A => n696, B => n697, Y => n514);
   U684 : na210 port map( A => n474, B => n701, Y => n565);
   U685 : na210 port map( A => n702, B => n703, Y => n701);
   U686 : na310 port map( A => cur_state_0_port, B => cur_state_5_port, C => 
                           n686, Y => n703);
   U687 : na210 port map( A => n704, B => n705, Y => n482);
   U688 : na210 port map( A => n706, B => n707, Y => n705);
   U689 : iv110 port map( A => n456, Y => n464);
   U690 : na210 port map( A => n577, B => n437, Y => n456);
   U691 : na210 port map( A => n696, B => n708, Y => n437);
   U692 : na210 port map( A => n689, B => n708, Y => n577);
   U693 : iv110 port map( A => n663, Y => n558);
   U694 : no210 port map( A => n522, B => n485, Y => n663);
   U695 : na210 port map( A => n474, B => n706, Y => n647);
   U696 : iv110 port map( A => n653, Y => n471);
   U697 : na210 port map( A => n697, B => n709, Y => n653);
   U698 : na210 port map( A => n557, B => n556, Y => n670);
   U699 : na210 port map( A => n689, B => n707, Y => n556);
   U700 : na210 port map( A => n669, B => n697, Y => n557);
   U701 : na210 port map( A => n415, B => n660, Y => n672);
   U702 : iv110 port map( A => rst, Y => n660);
   U703 : na210 port map( A => n554, B => n528, Y => n415);
   U704 : na210 port map( A => n474, B => n709, Y => n528);
   U705 : na210 port map( A => n710, B => n707, Y => n554);
   U706 : na310 port map( A => n711, B => n566, C => n632, Y => 
                           lut_next_piece_port);
   U707 : na210 port map( A => n697, B => n712, Y => n711);
   U708 : na210 port map( A => n433, B => n713, Y => draw_score_draw_port);
   U709 : na210 port map( A => n712, B => n708, Y => n713);
   U710 : na210 port map( A => n697, B => n542, Y => n433);
   U711 : na310 port map( A => n704, B => n632, C => n714, Y => 
                           draw_erase_start);
   U712 : no310 port map( A => n531, B => draw_erase_draw_port, C => n470, Y =>
                           n714);
   U713 : iv110 port map( A => n502, Y => n470);
   U714 : na210 port map( A => n669, B => n707, Y => n502);
   U715 : iv110 port map( A => n698, Y => n531);
   U716 : na210 port map( A => n707, B => n709, Y => n698);
   U717 : iv110 port map( A => n484, Y => n632);
   U718 : na210 port map( A => n584, B => n715, Y => n484);
   U719 : na210 port map( A => n697, B => n706, Y => n715);
   U720 : na210 port map( A => n697, B => n716, Y => n584);
   U721 : no210 port map( A => n495, B => n717, Y => n704);
   U722 : no210 port map( A => n521, B => n486, Y => n717);
   U723 : no210 port map( A => n718, B => n671, Y => n495);
   U724 : iv110 port map( A => n542, Y => n718);
   U725 : na310 port map( A => n719, B => n678, C => n720, Y => 
                           draw_erase_draw_port);
   U726 : no310 port map( A => n634, B => n560, C => n452, Y => n720);
   U727 : iv110 port map( A => n694, Y => n452);
   U728 : na210 port map( A => n696, B => n707, Y => n694);
   U729 : no310 port map( A => n721, B => n722, C => n723, Y => n696);
   U730 : iv110 port map( A => n685, Y => n560);
   U731 : na210 port map( A => n710, B => n708, Y => n685);
   U732 : iv110 port map( A => n566, Y => n634);
   U733 : na310 port map( A => n474, B => n724, C => n686, Y => n566);
   U734 : na210 port map( A => n725, B => n721, Y => n724);
   U735 : iv110 port map( A => n521, Y => n474);
   U736 : no210 port map( A => n454, B => n519, Y => n678);
   U737 : iv110 port map( A => n583, Y => n519);
   U738 : na210 port map( A => n669, B => n708, Y => n583);
   U739 : no310 port map( A => n726, B => cur_state_0_port, C => n722, Y => 
                           n669);
   U740 : iv110 port map( A => n465, Y => n454);
   U741 : no210 port map( A => n727, B => n582, Y => n465);
   U742 : no210 port map( A => n435, B => n702, Y => n582);
   U743 : no210 port map( A => n436, B => n485, Y => n727);
   U744 : no210 port map( A => n530, B => n506, Y => n719);
   U745 : no210 port map( A => n728, B => n671, Y => n506);
   U746 : no210 port map( A => n706, B => n689, Y => n728);
   U747 : no310 port map( A => n725, B => n722, C => n723, Y => n689);
   U748 : no210 port map( A => n693, B => n671, Y => n530);
   U749 : iv110 port map( A => n690, Y => clear_shift_start);
   U750 : no210 port map( A => n472, B => n729, Y => n690);
   U751 : no210 port map( A => n521, B => n436, Y => n729);
   U752 : iv110 port map( A => n475, Y => n436);
   U753 : na210 port map( A => n730, B => n731, Y => n521);
   U754 : no210 port map( A => n671, B => n702, Y => n472);
   U755 : iv110 port map( A => n541, Y => n702);
   U756 : na310 port map( A => n732, B => n733, C => n734, Y => 
                           check_start_port);
   U757 : no210 port map( A => n692, B => n477, Y => n734);
   U758 : no210 port map( A => n522, B => n435, Y => n477);
   U759 : na210 port map( A => n686, B => n735, Y => n522);
   U760 : iv110 port map( A => n736, Y => n686);
   U761 : iv110 port map( A => n555, Y => n692);
   U762 : na210 port map( A => n710, B => n697, Y => n555);
   U763 : iv110 port map( A => n435, Y => n697);
   U764 : na210 port map( A => cur_state_2_port, B => cur_state_3_port, Y => 
                           n435);
   U765 : no210 port map( A => n736, B => n725, Y => n710);
   U766 : na210 port map( A => cur_state_4_port, B => n722, Y => n736);
   U767 : iv110 port map( A => n737, Y => add_sub);
   U768 : no210 port map( A => n738, B => y_port, Y => n737);
   U769 : na210 port map( A => n733, B => n451, Y => y_port);
   U770 : na210 port map( A => n708, B => n709, Y => n451);
   U771 : no310 port map( A => n726, B => cur_state_1_port, C => n739, Y => 
                           n709);
   U772 : iv110 port map( A => n740, Y => n733);
   U773 : na210 port map( A => n741, B => n679, Y => n740);
   U774 : na210 port map( A => n541, B => n708, Y => n679);
   U775 : no310 port map( A => cur_state_0_port, B => cur_state_1_port, C => 
                           n726, Y => n541);
   U776 : na210 port map( A => n707, B => n475, Y => n741);
   U777 : no310 port map( A => n739, B => n726, C => n722, Y => n475);
   U778 : na210 port map( A => cur_state_5_port, B => n723, Y => n726);
   U779 : no210 port map( A => n742, B => n401, Y => n738);
   U780 : no210 port map( A => n654, B => n609, Y => n401);
   U781 : no210 port map( A => n693, B => n485, Y => n609);
   U782 : iv110 port map( A => n716, Y => n693);
   U783 : no310 port map( A => n722, B => cur_state_4_port, C => n725, Y => 
                           n716);
   U784 : iv110 port map( A => cur_state_1_port, Y => n722);
   U785 : na210 port map( A => n732, B => n517, Y => n654);
   U786 : na210 port map( A => n706, B => n708, Y => n517);
   U787 : no310 port map( A => cur_state_1_port, B => cur_state_4_port, C => 
                           n721, Y => n706);
   U788 : iv110 port map( A => n743, Y => n732);
   U789 : na210 port map( A => n744, B => n745, Y => n743);
   U790 : na210 port map( A => n542, B => n708, Y => n745);
   U791 : iv110 port map( A => n485, Y => n708);
   U792 : na210 port map( A => cur_state_3_port, B => n730, Y => n485);
   U793 : iv110 port map( A => cur_state_2_port, Y => n730);
   U794 : no310 port map( A => cur_state_1_port, B => cur_state_4_port, C => 
                           n725, Y => n542);
   U795 : na210 port map( A => n739, B => n688, Y => n725);
   U796 : iv110 port map( A => cur_state_0_port, Y => n739);
   U797 : na210 port map( A => n712, B => n707, Y => n744);
   U798 : iv110 port map( A => n671, Y => n707);
   U799 : na210 port map( A => cur_state_2_port, B => n731, Y => n671);
   U800 : iv110 port map( A => cur_state_3_port, Y => n731);
   U801 : iv110 port map( A => n486, Y => n712);
   U802 : na310 port map( A => cur_state_1_port, B => n723, C => n735, Y => 
                           n486);
   U803 : iv110 port map( A => n721, Y => n735);
   U804 : na210 port map( A => cur_state_0_port, B => n688, Y => n721);
   U805 : iv110 port map( A => cur_state_5_port, Y => n688);
   U806 : iv110 port map( A => cur_state_4_port, Y => n723);
   U807 : no210 port map( A => inputs(3), B => inputs(1), Y => n742);

end synthesised;



