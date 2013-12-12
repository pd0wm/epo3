
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
      lut_y_1_port, lut_y_0_port, lut_rot_1_port, lut_rot_0_port, 
      new_piece_port, cur_state_5_port, cur_state_4_port, cur_state_3_port, 
      cur_state_2_port, cur_state_1_port, cur_state_0_port, 
      cur_future_piece_2_port, cur_future_piece_1_port, cur_future_piece_0_port
      , next_state_5_port, next_state_4_port, next_state_3_port, 
      next_state_2_port, next_state_1_port, next_state_0_port, cur_timer_1_time
      , cur_timer_1_start, cur_timer_1_reset, inv_inputs_5_port, 
      inv_inputs_4_port, inv_inputs_3_port, inv_inputs_2_port, 
      inv_inputs_1_port, inv_inputs_0_port, n363, n364, n365, n366, n367, n368,
      n369, n370, n371, draw_erase_start_port, y_port, check_start_port, 
      lut_next_piece_port, draw_score_draw_port, n378, n379, n380, n381, n382, 
      n383, n384, n385, n386, n387, n388, n389, n390, n391, n392, n393, n394, 
      n395, n396, n397, n398, n399, n400, n401, n402, n403, n404, n405, n406, 
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
      n731, n732, n733, n734, n735, n736, n737 : std_logic;

begin
   lut_piece_type <= ( lut_piece_type_2_port, lut_piece_type_1_port, 
      lut_piece_type_0_port );
   lut_next_piece <= lut_next_piece_port;
   lut_x <= ( lut_x_2_port, lut_x_1_port, lut_x_0_port );
   lut_y <= ( lut_y_3_port, lut_y_2_port, lut_y_1_port, lut_y_0_port );
   lut_rot <= ( lut_rot_1_port, lut_rot_0_port );
   y <= y_port;
   new_piece <= new_piece_port;
   check_start <= check_start_port;
   draw_erase_start <= draw_erase_start_port;
   draw_score_draw <= draw_score_draw_port;
   
   inv_inputs_reg_5_inst : dfn10 port map( D => n371, CK => clk, Q => 
                           inv_inputs_5_port);
   inv_inputs_reg_4_inst : dfn10 port map( D => n370, CK => clk, Q => 
                           inv_inputs_4_port);
   inv_inputs_reg_3_inst : dfn10 port map( D => n369, CK => clk, Q => 
                           inv_inputs_3_port);
   inv_inputs_reg_2_inst : dfn10 port map( D => n368, CK => clk, Q => 
                           inv_inputs_2_port);
   inv_inputs_reg_1_inst : dfn10 port map( D => n367, CK => clk, Q => 
                           inv_inputs_1_port);
   inv_inputs_reg_0_inst : dfn10 port map( D => n366, CK => clk, Q => 
                           inv_inputs_0_port);
   cur_timer_1_time_reg : dfn10 port map( D => n365, CK => clk, Q => 
                           cur_timer_1_time);
   cur_state_reg_5_inst : dfr11 port map( D => next_state_5_port, R => rst, CK 
                           => clk, Q => cur_state_5_port);
   cur_state_reg_3_inst : dfr11 port map( D => next_state_3_port, R => rst, CK 
                           => clk, Q => cur_state_3_port);
   cur_state_reg_1_inst : dfr11 port map( D => next_state_1_port, R => rst, CK 
                           => clk, Q => cur_state_1_port);
   cur_state_reg_4_inst : dfr11 port map( D => next_state_4_port, R => rst, CK 
                           => clk, Q => cur_state_4_port);
   cur_state_reg_0_inst : dfr11 port map( D => next_state_0_port, R => rst, CK 
                           => clk, Q => cur_state_0_port);
   cur_state_reg_2_inst : dfr11 port map( D => next_state_2_port, R => rst, CK 
                           => clk, Q => cur_state_2_port);
   cur_future_piece_reg_2_inst : dfn10 port map( D => n378, CK => clk, Q => 
                           cur_future_piece_2_port);
   cur_piece_reg_2_inst : dfn10 port map( D => n381, CK => clk, Q => 
                           lut_piece_type_2_port);
   cur_future_piece_reg_1_inst : dfn10 port map( D => n379, CK => clk, Q => 
                           cur_future_piece_1_port);
   cur_piece_reg_1_inst : dfn10 port map( D => n382, CK => clk, Q => 
                           lut_piece_type_1_port);
   cur_future_piece_reg_0_inst : dfn10 port map( D => n380, CK => clk, Q => 
                           cur_future_piece_0_port);
   cur_piece_reg_0_inst : dfn10 port map( D => n383, CK => clk, Q => 
                           lut_piece_type_0_port);
   cur_rot_reg_1_inst : dfn10 port map( D => n385, CK => clk, Q => 
                           lut_rot_1_port);
   cur_rot_reg_0_inst : dfn10 port map( D => n384, CK => clk, Q => 
                           lut_rot_0_port);
   cur_x_reg_2_inst : dfn10 port map( D => n392, CK => clk, Q => lut_x_2_port);
   cur_x_reg_1_inst : dfn10 port map( D => n390, CK => clk, Q => lut_x_1_port);
   cur_x_reg_0_inst : dfn10 port map( D => n391, CK => clk, Q => lut_x_0_port);
   cur_y_reg_0_inst : dfn10 port map( D => n386, CK => clk, Q => lut_y_0_port);
   cur_y_reg_1_inst : dfn10 port map( D => n387, CK => clk, Q => lut_y_1_port);
   cur_y_reg_2_inst : dfn10 port map( D => n388, CK => clk, Q => lut_y_2_port);
   cur_y_reg_3_inst : dfn10 port map( D => n389, CK => clk, Q => lut_y_3_port);
   cur_timer_1_start_reg : dfn10 port map( D => n364, CK => clk, Q => 
                           cur_timer_1_start);
   cur_timer_1_reset_reg : dfn10 port map( D => n363, CK => clk, Q => 
                           cur_timer_1_reset);
   U409 : no210 port map( A => n393, B => n394, Y => x);
   U410 : no210 port map( A => inputs(0), B => inputs(1), Y => n394);
   U411 : na210 port map( A => n395, B => n396, Y => timer_1_time);
   U412 : na210 port map( A => cur_timer_1_time, B => n397, Y => n396);
   U413 : iv110 port map( A => n398, Y => n395);
   U414 : na210 port map( A => n399, B => n400, Y => timer_1_start);
   U415 : na210 port map( A => cur_timer_1_start, B => n401, Y => n400);
   U416 : iv110 port map( A => n402, Y => n399);
   U417 : na210 port map( A => n403, B => n404, Y => timer_1_reset);
   U418 : na210 port map( A => cur_timer_1_reset, B => n405, Y => n404);
   U419 : no210 port map( A => n393, B => n406, Y => rot);
   U420 : no210 port map( A => inputs(2), B => inputs(3), Y => n406);
   U421 : na310 port map( A => n407, B => n408, C => n409, Y => 
                           next_state_5_port);
   U422 : no310 port map( A => n410, B => y_port, C => n411, Y => n409);
   U423 : na210 port map( A => n412, B => n413, Y => n410);
   U424 : na310 port map( A => n414, B => cur_timer_1_time, C => 
                           inv_inputs_5_port, Y => n412);
   U425 : iv110 port map( A => n415, Y => n414);
   U426 : iv110 port map( A => n416, Y => n408);
   U427 : no210 port map( A => n417, B => n418, Y => n407);
   U428 : no210 port map( A => n419, B => n420, Y => n417);
   U429 : na310 port map( A => n421, B => n422, C => n423, Y => 
                           next_state_4_port);
   U430 : no310 port map( A => n424, B => n425, C => n426, Y => n423);
   U431 : na310 port map( A => n427, B => n428, C => n429, Y => n424);
   U432 : no310 port map( A => n430, B => n431, C => n432, Y => n422);
   U433 : no210 port map( A => n433, B => n434, Y => n432);
   U434 : no210 port map( A => n435, B => n436, Y => n430);
   U435 : iv110 port map( A => n437, Y => n436);
   U436 : no210 port map( A => n438, B => n439, Y => n421);
   U437 : iv110 port map( A => n440, Y => n438);
   U438 : na210 port map( A => draw_score_draw_port, B => draw_score_ready, Y 
                           => n440);
   U439 : na310 port map( A => n441, B => n442, C => n443, Y => 
                           next_state_3_port);
   U440 : no310 port map( A => n444, B => n445, C => n446, Y => n443);
   U441 : no310 port map( A => n447, B => n448, C => n449, Y => n446);
   U442 : na310 port map( A => n450, B => n451, C => n452, Y => n444);
   U443 : no310 port map( A => n453, B => n454, C => n455, Y => n442);
   U444 : no210 port map( A => timer_1_done, B => n413, Y => n455);
   U445 : no210 port map( A => n456, B => n434, Y => n454);
   U446 : no210 port map( A => n457, B => n458, Y => n456);
   U447 : no210 port map( A => n416, B => n439, Y => n441);
   U448 : na310 port map( A => n459, B => n460, C => n461, Y => n439);
   U449 : no310 port map( A => n462, B => n463, C => n464, Y => n461);
   U450 : no210 port map( A => n465, B => n435, Y => n464);
   U451 : no210 port map( A => n466, B => n467, Y => n465);
   U452 : no210 port map( A => n468, B => n469, Y => n466);
   U453 : no210 port map( A => n469, B => n470, Y => n462);
   U454 : iv110 port map( A => n471, Y => n459);
   U455 : na310 port map( A => n472, B => n473, C => n474, Y => n416);
   U456 : no310 port map( A => n475, B => n476, C => n477, Y => n474);
   U457 : no210 port map( A => n478, B => n479, Y => n472);
   U458 : na310 port map( A => n480, B => n481, C => n482, Y => 
                           next_state_2_port);
   U459 : no310 port map( A => n483, B => n484, C => n485, Y => n482);
   U460 : na210 port map( A => n433, B => n452, Y => n485);
   U461 : na310 port map( A => n486, B => n487, C => inv_inputs_4_port, Y => 
                           n452);
   U462 : iv110 port map( A => cur_timer_1_time, Y => n487);
   U463 : na210 port map( A => n428, B => n488, Y => n484);
   U464 : na310 port map( A => n468, B => n489, C => n490, Y => n483);
   U465 : na210 port map( A => n491, B => n492, Y => n490);
   U466 : no310 port map( A => n493, B => n494, C => n495, Y => n481);
   U467 : no210 port map( A => check_empty, B => n496, Y => n495);
   U468 : no210 port map( A => n497, B => n435, Y => n494);
   U469 : no310 port map( A => n498, B => n471, C => n499, Y => n480);
   U470 : na310 port map( A => n500, B => n501, C => n502, Y => n471);
   U471 : na310 port map( A => n503, B => n504, C => n505, Y => 
                           next_state_1_port);
   U472 : no310 port map( A => n506, B => n507, C => n508, Y => n505);
   U473 : na210 port map( A => n509, B => n510, Y => n508);
   U474 : na310 port map( A => n486, B => cur_timer_1_time, C => 
                           inv_inputs_4_port, Y => n509);
   U475 : iv110 port map( A => n429, Y => n486);
   U476 : no210 port map( A => n511, B => n435, Y => n507);
   U477 : iv110 port map( A => n512, Y => n506);
   U478 : no310 port map( A => n477, B => n445, C => n513, Y => n512);
   U479 : na210 port map( A => n415, B => n514, Y => n513);
   U480 : iv110 port map( A => n515, Y => n445);
   U481 : na210 port map( A => clear_shift_ready, B => n516, Y => n515);
   U482 : no210 port map( A => n433, B => check_empty, Y => n477);
   U483 : no310 port map( A => n517, B => n518, C => n519, Y => n504);
   U484 : no210 port map( A => n447, B => n488, Y => n519);
   U485 : iv110 port map( A => n520, Y => n488);
   U486 : no210 port map( A => n413, B => n521, Y => n518);
   U487 : iv110 port map( A => n522, Y => n413);
   U488 : no210 port map( A => draw_score_ready, B => n450, Y => n517);
   U489 : no310 port map( A => n523, B => n453, C => n499, Y => n503);
   U490 : na310 port map( A => n524, B => n525, C => n526, Y => n499);
   U491 : no310 port map( A => n527, B => n528, C => n529, Y => n526);
   U492 : no210 port map( A => check_empty, B => n530, Y => n528);
   U493 : na210 port map( A => n531, B => n532, Y => n527);
   U494 : na210 port map( A => n533, B => n492, Y => n532);
   U495 : na210 port map( A => n437, B => n435, Y => n531);
   U496 : no310 port map( A => n476, B => n467, C => n534, Y => n525);
   U497 : iv110 port map( A => n535, Y => n524);
   U498 : na210 port map( A => n536, B => n537, Y => n535);
   U499 : na210 port map( A => n538, B => n425, Y => n537);
   U500 : iv110 port map( A => n539, Y => n453);
   U501 : na310 port map( A => n540, B => n541, C => n542, Y => 
                           next_state_0_port);
   U502 : no310 port map( A => n543, B => n544, C => n545, Y => n542);
   U503 : na210 port map( A => n546, B => n547, Y => n545);
   U504 : na210 port map( A => n469, B => n548, Y => n547);
   U505 : na310 port map( A => n470, B => n549, C => n468, Y => n548);
   U506 : iv110 port map( A => n538, Y => n469);
   U507 : no210 port map( A => n420, B => inv_inputs_4_port, Y => n538);
   U508 : na210 port map( A => n458, B => check_empty, Y => n546);
   U509 : iv110 port map( A => n550, Y => n543);
   U510 : no310 port map( A => n425, B => n478, C => n551, Y => n550);
   U511 : no310 port map( A => n498, B => n418, C => n529, Y => n541);
   U512 : na210 port map( A => n460, B => n552, Y => n529);
   U513 : na210 port map( A => n553, B => n554, Y => n552);
   U514 : na210 port map( A => n549, B => n555, Y => n554);
   U515 : na210 port map( A => n556, B => n447, Y => n555);
   U516 : iv110 port map( A => n557, Y => n460);
   U517 : na210 port map( A => n558, B => n559, Y => n557);
   U518 : na210 port map( A => n560, B => n420, Y => n559);
   U519 : iv110 port map( A => n561, Y => n420);
   U520 : no310 port map( A => inv_inputs_0_port, B => inv_inputs_1_port, C => 
                           n562, Y => n561);
   U521 : iv110 port map( A => n563, Y => n562);
   U522 : no310 port map( A => inv_inputs_2_port, B => inv_inputs_5_port, C => 
                           inv_inputs_3_port, Y => n563);
   U523 : na310 port map( A => n564, B => n565, C => n566, Y => n418);
   U524 : na210 port map( A => n467, B => n435, Y => n566);
   U525 : na210 port map( A => n516, B => n567, Y => n564);
   U526 : iv110 port map( A => clear_shift_ready, Y => n567);
   U527 : na310 port map( A => n568, B => n427, C => n569, Y => n498);
   U528 : na210 port map( A => n522, B => n521, Y => n569);
   U529 : iv110 port map( A => timer_1_done, Y => n521);
   U530 : na210 port map( A => n492, B => n570, Y => n568);
   U531 : na210 port map( A => n549, B => n565, Y => n570);
   U532 : no310 port map( A => n571, B => n523, C => n572, Y => n540);
   U533 : mu111 port map( A => n463, B => n520, S => n447, Y => n572);
   U534 : iv110 port map( A => check_ready, Y => n447);
   U535 : na310 port map( A => n573, B => n574, C => n575, Y => n523);
   U536 : no210 port map( A => n576, B => n426, Y => n575);
   U537 : iv110 port map( A => n577, Y => n426);
   U538 : na210 port map( A => n411, B => n435, Y => n574);
   U539 : mu111 port map( A => n578, B => n579, S => n435, Y => n571);
   U540 : iv110 port map( A => draw_erase_ready, Y => n435);
   U541 : na310 port map( A => n468, B => n514, C => n511, Y => n579);
   U542 : no210 port map( A => n479, B => n580, Y => n511);
   U543 : iv110 port map( A => n428, Y => n580);
   U544 : iv110 port map( A => n581, Y => n514);
   U545 : iv110 port map( A => n582, Y => n468);
   U546 : na210 port map( A => n583, B => n584, Y => n392);
   U547 : na210 port map( A => calc_x(2), B => n585, Y => n584);
   U548 : na210 port map( A => lut_x_2_port, B => n586, Y => n583);
   U549 : na210 port map( A => n587, B => n588, Y => n391);
   U550 : na210 port map( A => calc_x(0), B => n585, Y => n588);
   U551 : mu111 port map( A => n589, B => n590, S => n586, Y => n587);
   U552 : iv110 port map( A => lut_x_0_port, Y => n590);
   U553 : na210 port map( A => n591, B => n592, Y => n390);
   U554 : na210 port map( A => calc_x(1), B => n585, Y => n592);
   U555 : no210 port map( A => n489, B => n586, Y => n585);
   U556 : mu111 port map( A => n589, B => n593, S => n586, Y => n591);
   U557 : iv110 port map( A => lut_x_1_port, Y => n593);
   U558 : na210 port map( A => n594, B => n595, Y => n389);
   U559 : na210 port map( A => calc_y(3), B => n596, Y => n595);
   U560 : na210 port map( A => lut_y_3_port, B => n597, Y => n594);
   U561 : na210 port map( A => n598, B => n599, Y => n388);
   U562 : na210 port map( A => calc_y(2), B => n596, Y => n599);
   U563 : na210 port map( A => lut_y_2_port, B => n597, Y => n598);
   U564 : na210 port map( A => n600, B => n601, Y => n387);
   U565 : na210 port map( A => calc_y(1), B => n596, Y => n601);
   U566 : na210 port map( A => lut_y_1_port, B => n597, Y => n600);
   U567 : na210 port map( A => n602, B => n603, Y => n386);
   U568 : na210 port map( A => calc_y(0), B => n596, Y => n603);
   U569 : no210 port map( A => n597, B => n530, Y => n596);
   U570 : na210 port map( A => lut_y_0_port, B => n597, Y => n602);
   U571 : na210 port map( A => n489, B => n604, Y => n597);
   U572 : iv110 port map( A => n605, Y => n604);
   U573 : no210 port map( A => n606, B => n607, Y => n605);
   U574 : no310 port map( A => n434, B => n431, C => n608, Y => n606);
   U575 : iv110 port map( A => check_empty, Y => n434);
   U576 : mu111 port map( A => lut_rot_1_port, B => n609, S => n607, Y => n385)
                           ;
   U577 : no210 port map( A => n489, B => n610, Y => n609);
   U578 : iv110 port map( A => calc_rot(1), Y => n610);
   U579 : mu111 port map( A => lut_rot_0_port, B => n611, S => n607, Y => n384)
                           ;
   U580 : no210 port map( A => n586, B => n431, Y => n607);
   U581 : na210 port map( A => n612, B => n530, Y => n586);
   U582 : iv110 port map( A => n608, Y => n612);
   U583 : na310 port map( A => n613, B => n614, C => n615, Y => n608);
   U584 : no310 port map( A => n616, B => new_piece_port, C => n551, Y => n615)
                           ;
   U585 : na210 port map( A => n536, B => n470, Y => new_piece_port);
   U586 : no210 port map( A => n617, B => n618, Y => n613);
   U587 : no210 port map( A => n489, B => n619, Y => n611);
   U588 : iv110 port map( A => calc_rot(0), Y => n619);
   U589 : na310 port map( A => n620, B => n621, C => n622, Y => n383);
   U590 : na210 port map( A => lut_piece_type_0_port, B => n623, Y => n622);
   U591 : na210 port map( A => cur_future_piece_0_port, B => n624, Y => n621);
   U592 : na210 port map( A => next_piece(0), B => n625, Y => n620);
   U593 : na310 port map( A => n626, B => n627, C => n628, Y => n382);
   U594 : na210 port map( A => lut_piece_type_1_port, B => n623, Y => n628);
   U595 : na210 port map( A => cur_future_piece_1_port, B => n624, Y => n627);
   U596 : na210 port map( A => next_piece(1), B => n625, Y => n626);
   U597 : na310 port map( A => n629, B => n630, C => n631, Y => n381);
   U598 : na210 port map( A => lut_piece_type_2_port, B => n623, Y => n631);
   U599 : na210 port map( A => cur_future_piece_2_port, B => n624, Y => n630);
   U600 : no210 port map( A => n623, B => n539, Y => n624);
   U601 : na210 port map( A => next_piece(2), B => n625, Y => n629);
   U602 : no210 port map( A => n536, B => n623, Y => n625);
   U603 : na210 port map( A => n632, B => n470, Y => n623);
   U604 : na310 port map( A => n633, B => n634, C => n635, Y => n380);
   U605 : na210 port map( A => cur_future_piece_0_port, B => n636, Y => n635);
   U606 : na210 port map( A => n637, B => next_piece(0), Y => n634);
   U607 : na210 port map( A => n638, B => lut_piece_type_0_port, Y => n633);
   U608 : na310 port map( A => n639, B => n640, C => n641, Y => n379);
   U609 : na210 port map( A => cur_future_piece_1_port, B => n636, Y => n641);
   U610 : na210 port map( A => n637, B => next_piece(1), Y => n640);
   U611 : na210 port map( A => n638, B => lut_piece_type_1_port, Y => n639);
   U612 : na310 port map( A => n642, B => n643, C => n644, Y => n378);
   U613 : na210 port map( A => cur_future_piece_2_port, B => n636, Y => n644);
   U614 : na210 port map( A => n637, B => next_piece(2), Y => n643);
   U615 : no210 port map( A => n636, B => n470, Y => n637);
   U616 : na210 port map( A => n638, B => lut_piece_type_2_port, Y => n642);
   U617 : no210 port map( A => n636, B => n589, Y => n638);
   U618 : na310 port map( A => n645, B => n536, C => n632, Y => n636);
   U619 : no310 port map( A => n457, B => draw_erase_start_port, C => n646, Y 
                           => n632);
   U620 : na210 port map( A => n489, B => n647, Y => n646);
   U621 : iv110 port map( A => n617, Y => n647);
   U622 : na210 port map( A => n648, B => n649, Y => n617);
   U623 : iv110 port map( A => n650, Y => n649);
   U624 : na310 port map( A => n651, B => n473, C => n500, Y => n650);
   U625 : iv110 port map( A => n576, Y => n473);
   U626 : no310 port map( A => check_start_port, B => rst, C => n458, Y => n651
                           );
   U627 : no310 port map( A => n652, B => n560, C => n653, Y => n648);
   U628 : na210 port map( A => n502, B => n403, Y => n652);
   U629 : iv110 port map( A => n654, Y => n403);
   U630 : no210 port map( A => n655, B => n656, Y => n502);
   U631 : no210 port map( A => n657, B => n658, Y => n655);
   U632 : iv110 port map( A => n659, Y => n536);
   U633 : mu111 port map( A => inv_inputs_5_port, B => inputs(5), S => n660, Y 
                           => n371);
   U634 : mu111 port map( A => inv_inputs_4_port, B => inputs(4), S => n660, Y 
                           => n370);
   U635 : mu111 port map( A => inv_inputs_3_port, B => inputs(3), S => n660, Y 
                           => n369);
   U636 : mu111 port map( A => inv_inputs_2_port, B => inputs(2), S => n660, Y 
                           => n368);
   U637 : mu111 port map( A => inv_inputs_1_port, B => inputs(1), S => n660, Y 
                           => n367);
   U638 : mu111 port map( A => inv_inputs_0_port, B => inputs(0), S => n660, Y 
                           => n366);
   U639 : na210 port map( A => n661, B => n662, Y => n365);
   U640 : na210 port map( A => cur_timer_1_time, B => n663, Y => n662);
   U641 : iv110 port map( A => n664, Y => n663);
   U642 : no210 port map( A => n397, B => rst, Y => n664);
   U643 : na310 port map( A => n665, B => n666, C => n667, Y => n397);
   U644 : no310 port map( A => n560, B => n668, C => n669, Y => n667);
   U645 : na210 port map( A => n670, B => n671, Y => n666);
   U646 : na210 port map( A => n398, B => n660, Y => n661);
   U647 : na210 port map( A => n672, B => n558, Y => n398);
   U648 : na210 port map( A => n673, B => n674, Y => n364);
   U649 : na210 port map( A => cur_timer_1_start, B => n675, Y => n674);
   U650 : iv110 port map( A => n676, Y => n675);
   U651 : no210 port map( A => n401, B => rst, Y => n676);
   U652 : na310 port map( A => n665, B => n419, C => n677, Y => n401);
   U653 : no210 port map( A => n656, B => n678, Y => n677);
   U654 : iv110 port map( A => n560, Y => n419);
   U655 : no210 port map( A => n679, B => n448, Y => n560);
   U656 : na210 port map( A => n402, B => n660, Y => n673);
   U657 : na310 port map( A => n500, B => n427, C => n680, Y => n402);
   U658 : na210 port map( A => n670, B => n669, Y => n680);
   U659 : iv110 port map( A => n681, Y => n500);
   U660 : na210 port map( A => n682, B => n683, Y => n363);
   U661 : na210 port map( A => cur_timer_1_reset, B => n684, Y => n683);
   U662 : iv110 port map( A => n685, Y => n684);
   U663 : no210 port map( A => n405, B => rst, Y => n685);
   U664 : na310 port map( A => n665, B => n672, C => n686, Y => n405);
   U665 : no210 port map( A => n668, B => n681, Y => n686);
   U666 : no210 port map( A => n687, B => n657, Y => n681);
   U667 : iv110 port map( A => n427, Y => n668);
   U668 : no310 port map( A => n576, B => n656, C => n678, Y => n672);
   U669 : iv110 port map( A => n470, Y => n678);
   U670 : na210 port map( A => n556, B => n688, Y => n470);
   U671 : iv110 port map( A => n449, Y => n556);
   U672 : no210 port map( A => n658, B => n448, Y => n656);
   U673 : no210 port map( A => n657, B => n689, Y => n576);
   U674 : iv110 port map( A => n690, Y => n665);
   U675 : na310 port map( A => n691, B => n692, C => n693, Y => n690);
   U676 : no310 port map( A => n694, B => n695, C => n616, Y => n693);
   U677 : na310 port map( A => n696, B => n539, C => n497, Y => n694);
   U678 : no210 port map( A => n431, B => n551, Y => n539);
   U679 : iv110 port map( A => n645, Y => n551);
   U680 : na210 port map( A => n491, B => n688, Y => n645);
   U681 : iv110 port map( A => n589, Y => n431);
   U682 : na210 port map( A => n533, B => n688, Y => n589);
   U683 : no310 port map( A => n697, B => y_port, C => lut_next_piece_port, Y 
                           => n692);
   U684 : no310 port map( A => n653, B => n463, C => n698, Y => n691);
   U685 : iv110 port map( A => n510, Y => n463);
   U686 : na210 port map( A => n699, B => n700, Y => n653);
   U687 : no310 port map( A => n701, B => n425, C => n476, Y => n700);
   U688 : no210 port map( A => n689, B => n448, Y => n476);
   U689 : no210 port map( A => n687, B => n702, Y => n425);
   U690 : na310 port map( A => n703, B => n450, C => n429, Y => n701);
   U691 : na210 port map( A => n669, B => n688, Y => n429);
   U692 : iv110 port map( A => draw_score_draw_port, Y => n450);
   U693 : no310 port map( A => n704, B => n475, C => n522, Y => n699);
   U694 : no210 port map( A => n689, B => n702, Y => n522);
   U695 : no210 port map( A => n705, B => n702, Y => n475);
   U696 : no210 port map( A => n533, B => n491, Y => n705);
   U697 : na210 port map( A => n415, B => n433, Y => n704);
   U698 : na210 port map( A => n533, B => n670, Y => n433);
   U699 : iv110 port map( A => n679, Y => n533);
   U700 : na310 port map( A => n706, B => cur_state_3_port, C => 
                           cur_state_4_port, Y => n679);
   U701 : na210 port map( A => n707, B => n688, Y => n415);
   U702 : na210 port map( A => n654, B => n660, Y => n682);
   U703 : iv110 port map( A => rst, Y => n660);
   U704 : na210 port map( A => n558, B => n577, Y => n654);
   U705 : na210 port map( A => n707, B => n670, Y => n577);
   U706 : na210 port map( A => n491, B => n553, Y => n558);
   U707 : iv110 port map( A => n451, Y => lut_next_piece_port);
   U708 : no310 port map( A => n493, B => n659, C => n544, Y => n451);
   U709 : iv110 port map( A => n708, Y => n544);
   U710 : no210 port map( A => n709, B => n702, Y => n659);
   U711 : na210 port map( A => n710, B => n711, Y => n493);
   U712 : no210 port map( A => n657, B => n712, Y => draw_score_draw_port);
   U713 : na310 port map( A => n711, B => n713, C => n614, Y => 
                           draw_erase_start_port);
   U714 : iv110 port map( A => n714, Y => n614);
   U715 : na310 port map( A => n497, B => n710, C => n573, Y => n714);
   U716 : no210 port map( A => n697, B => n698, Y => n573);
   U717 : no210 port map( A => n549, B => n657, Y => n698);
   U718 : no210 port map( A => n657, B => n565, Y => n697);
   U719 : iv110 port map( A => n578, Y => n710);
   U720 : no210 port map( A => n712, B => n702, Y => n578);
   U721 : no210 port map( A => n581, B => n411, Y => n497);
   U722 : no210 port map( A => n657, B => n715, Y => n411);
   U723 : no210 port map( A => n449, B => n657, Y => n581);
   U724 : iv110 port map( A => n670, Y => n657);
   U725 : na210 port map( A => n670, B => n716, Y => n711);
   U726 : iv110 port map( A => n713, Y => draw_erase_draw);
   U727 : no210 port map( A => n618, B => n616, Y => n713);
   U728 : iv110 port map( A => n717, Y => n616);
   U729 : no310 port map( A => n467, B => n478, C => n479, Y => n717);
   U730 : no210 port map( A => n687, B => n718, Y => n479);
   U731 : na210 port map( A => n671, B => cur_state_0_port, Y => n687);
   U732 : no210 port map( A => n689, B => n718, Y => n478);
   U733 : na210 port map( A => n671, B => n719, Y => n689);
   U734 : iv110 port map( A => n720, Y => n671);
   U735 : na210 port map( A => n721, B => cur_state_5_port, Y => n720);
   U736 : no210 port map( A => n715, B => n448, Y => n467);
   U737 : na310 port map( A => n708, B => n427, C => n696, Y => n618);
   U738 : iv110 port map( A => n722, Y => n696);
   U739 : na310 port map( A => n428, B => n501, C => n723, Y => n722);
   U740 : no210 port map( A => n582, B => n724, Y => n723);
   U741 : no210 port map( A => n702, B => n549, Y => n724);
   U742 : no210 port map( A => n449, B => n702, Y => n582);
   U743 : na210 port map( A => n707, B => n553, Y => n501);
   U744 : na210 port map( A => n669, B => n492, Y => n428);
   U745 : iv110 port map( A => n658, Y => n669);
   U746 : na310 port map( A => n706, B => n725, C => cur_state_4_port, Y => 
                           n658);
   U747 : na210 port map( A => n707, B => n492, Y => n427);
   U748 : iv110 port map( A => n702, Y => n492);
   U749 : no210 port map( A => n726, B => cur_state_3_port, Y => n707);
   U750 : no210 port map( A => n534, B => n437, Y => n708);
   U751 : no210 port map( A => n709, B => n448, Y => n437);
   U752 : no210 port map( A => n712, B => n448, Y => n534);
   U753 : iv110 port map( A => n703, Y => clear_shift_start);
   U754 : no210 port map( A => n516, B => n727, Y => n703);
   U755 : no210 port map( A => n718, B => n565, Y => n727);
   U756 : no210 port map( A => n718, B => n715, Y => n516);
   U757 : na310 port map( A => n728, B => n510, C => n729, Y => 
                           check_start_port);
   U758 : na210 port map( A => n670, B => n491, Y => n510);
   U759 : no210 port map( A => n726, B => n725, Y => n491);
   U760 : na210 port map( A => cur_state_4_port, B => n730, Y => n726);
   U761 : no210 port map( A => n731, B => cur_state_2_port, Y => n670);
   U762 : iv110 port map( A => n732, Y => add_sub);
   U763 : no210 port map( A => n733, B => y_port, Y => n732);
   U764 : na210 port map( A => n729, B => n530, Y => y_port);
   U765 : iv110 port map( A => n457, Y => n530);
   U766 : no210 port map( A => n448, B => n565, Y => n457);
   U767 : no210 port map( A => n520, B => n734, Y => n729);
   U768 : no210 port map( A => n702, B => n565, Y => n734);
   U769 : na310 port map( A => n735, B => n719, C => cur_state_5_port, Y => 
                           n565);
   U770 : no210 port map( A => n715, B => n702, Y => n520);
   U771 : na210 port map( A => cur_state_2_port, B => n731, Y => n702);
   U772 : iv110 port map( A => cur_state_1_port, Y => n731);
   U773 : na310 port map( A => cur_state_5_port, B => n735, C => 
                           cur_state_0_port, Y => n715);
   U774 : no210 port map( A => n736, B => n393, Y => n733);
   U775 : iv110 port map( A => n695, Y => n393);
   U776 : na310 port map( A => n489, B => n496, C => n728, Y => n695);
   U777 : na210 port map( A => n553, B => n737, Y => n728);
   U778 : na210 port map( A => n449, B => n549, Y => n737);
   U779 : na210 port map( A => n730, B => n735, Y => n549);
   U780 : na210 port map( A => n706, B => n735, Y => n449);
   U781 : no210 port map( A => cur_state_4_port, B => cur_state_3_port, Y => 
                           n735);
   U782 : iv110 port map( A => n448, Y => n553);
   U783 : na210 port map( A => cur_state_2_port, B => cur_state_1_port, Y => 
                           n448);
   U784 : iv110 port map( A => n458, Y => n496);
   U785 : no210 port map( A => n718, B => n712, Y => n458);
   U786 : na210 port map( A => n721, B => n730, Y => n712);
   U787 : no210 port map( A => cur_state_5_port, B => cur_state_0_port, Y => 
                           n730);
   U788 : iv110 port map( A => n688, Y => n718);
   U789 : na210 port map( A => n716, B => n688, Y => n489);
   U790 : no210 port map( A => cur_state_1_port, B => cur_state_2_port, Y => 
                           n688);
   U791 : iv110 port map( A => n709, Y => n716);
   U792 : na210 port map( A => n706, B => n721, Y => n709);
   U793 : no210 port map( A => n725, B => cur_state_4_port, Y => n721);
   U794 : iv110 port map( A => cur_state_3_port, Y => n725);
   U795 : no210 port map( A => n719, B => cur_state_5_port, Y => n706);
   U796 : iv110 port map( A => cur_state_0_port, Y => n719);
   U797 : no210 port map( A => inputs(2), B => inputs(1), Y => n736);

end synthesised;



