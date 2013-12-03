
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of controller is

   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component iv110
      port( A : in std_logic;  Y : out std_logic);
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
   
   component mu111
      port( A, B, S : in std_logic;  Y : out std_logic);
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
   
   signal cur_state_5_port, cur_state_4_port, cur_state_3_port, 
      cur_state_2_port, cur_state_1_port, cur_state_0_port, cur_piece_2_port, 
      cur_piece_1_port, cur_piece_0_port, cur_x_2_port, cur_x_1_port, 
      cur_x_0_port, cur_y_3_port, cur_y_2_port, cur_y_1_port, cur_y_0_port, 
      cur_y_new_3_port, cur_y_new_2_port, cur_y_new_1_port, cur_y_new_0_port, 
      cur_rot_1_port, cur_rot_0_port, next_state_5_port, next_state_4_port, 
      next_state_3_port, next_state_2_port, next_state_1_port, 
      next_state_0_port, cur_lut_x_2_port, cur_lut_x_1_port, cur_lut_x_0_port, 
      cur_lut_y_3_port, cur_lut_y_2_port, cur_lut_y_1_port, cur_lut_y_0_port, 
      cur_lut_rot_1_port, cur_lut_rot_0_port, cur_lut_piece_type_2_port, 
      cur_lut_piece_type_1_port, cur_lut_piece_type_0_port, cur_lut_start, 
      cur_new_piece, cur_check_start, cur_draw_erase_draw, cur_draw_erase_start
      , cur_clear_shift_start, cur_draw_score_draw, cur_timer_1_time_7_port, 
      cur_timer_1_time_6_port, cur_timer_1_time_5_port, cur_timer_1_time_4_port
      , cur_timer_1_time_3_port, cur_timer_1_time_2_port, 
      cur_timer_1_time_1_port, cur_timer_1_time_0_port, cur_timer_1_start, 
      cur_timer_1_reset, cur_timer_2_time_7_port, cur_timer_2_time_6_port, 
      cur_timer_2_time_5_port, cur_timer_2_time_4_port, cur_timer_2_time_3_port
      , cur_timer_2_time_2_port, cur_timer_2_time_1_port, 
      cur_timer_2_time_0_port, cur_timer_2_start, cur_timer_2_reset, n478, n479
      , n480, n481, n482, n483, n484, n485, n486, n487, n488, n489, n490, n491,
      n492, n493, n494, n495, n496, n497, n498, n499, n500, n501, n502, n503, 
      n504, n505, n506, n507, n508, n509, n510, n511, n512, n513, n514, n515, 
      n516, n517, n518, n519, n520, n521, n522, n523, n524, n525, n526, n527, 
      n528, n529, n530, n531, n532, n542, n543, n544, n545, n546, n547, n548, 
      n549, n550, n551, n552, n553, n554, n555, n556, n557, n558, n559, n560, 
      n561, n562, n563, n564, n565, n566, n567, n568, n569, n570, n571, n572, 
      n573, n574, n575, n576, n577, n578, n579, n580, n581, n582, n583, n584, 
      n585, n586, n587, n588, n589, n590, n591, n592, n593, n594, n595, n596, 
      n597, n598, n599, n600, n601, n602, n603, n604, n605, n606, n607, n608, 
      n609, n610, n611, n612, n613, n614, n615, n616, n617, n618, n619, n620, 
      n621, n622, n623, n624, n625, n626, n627, n628, n629, n630, n631, n632, 
      n633, n634, n635, n636, n637, n638, n639, n640, n641, n642, n643, n644, 
      n645, n646, n647, n648, n649, n650, n651, n652, n653, n654, n655, n656, 
      n657, n658, n659, n660, n661, n662, n663, n664, n665, n666, n667, n668, 
      n669, n670, n671, n672, n673, n674, n675, n676, n677, n678, n679, n680, 
      n681, n682, n683, n684, n685, n686, n687, n688, n689, n690, n691, n692, 
      n693, n694, n695, n696, n697, n698, n699, n700, n701, n702, n703, n704, 
      n705, n706, n707, n708, n709, n710, n711, n712, n713, n714, n715, n716, 
      n717, n718, n719, n720, n721, n722, n723, n724, n725, n726, n727, n728, 
      n729, n730, n731, n732, n733, n734, n735, n736, n737, n738, n739, n740, 
      n741, n742, n743, n744, n745, n746, n747, n748, n749, n750, n751, n752, 
      n753, n754, n755, n756, n757, n758, n759, n760, n761, n762, n763, n764, 
      n765, n766, n767, n768, n769, n770, n771, n772, n773, n774, n775, n776, 
      n777, n778, n779, n780, n781, n782, n783, n784, n785, n786, n787, n788, 
      n789, n790, n791, n792, n793, n794, n795, n796, n797, n798, n799, n800, 
      n801, n802, n803, n804, n805, n806, n807, n808, n809, n810, n811, n812, 
      n813, n814, n815, n816, n817, n818, n819, n820, n821, n822, n823, n824, 
      n825, n826, n827, n828, n829, n830, n831, n832, n833, n834, n835, n836, 
      n837, n838, n839, n840, n841, n842, n843, n844, n845, n846, n847, n848, 
      n849, n850, n851, n852, n853, n854, n855, n856, n857, n858, n859, n860, 
      n861, n862, n863, n864, n865, n866, n867, n868, n869, n870, n871, n872, 
      n873, n874, n875, n876, n877, n878, n879, n880, n881, n882, n883, n884, 
      n885, n886, n887, n888, n889, n890, n891, n892, n893, n894, n895, n896, 
      n897, n898, n899, n900, n901, n902, n903, n904, n905, n906, n907, n908, 
      n909, n910, n911, n912, n913, n914, n915, n916, n917, n918, n919, n920, 
      n921, n922, n923, n924, n925, n926, n927, n928, n929, n930, n931, n932, 
      n933, n934, n935, n936, n937, n938, n939, n940, n941, n942, n943, n944, 
      n945, n946, n947, n948, n949, n950, n951, n952, n953, n954, n955, n956, 
      n957, n958, n959, n960, n961, n962, n963, n964, n965, n966, n967, n968, 
      n969, n970, n971, n972, n973, n974, n975, n976, n977, n978, n979, n980, 
      n981, n982, n983, n984, n985, n986, n987, n988, n989, n990, n991, n992, 
      n993, n994, n995, n996 : std_logic;

begin
   
   cur_state_reg_0_inst : dfr11 port map( D => next_state_0_port, R => rst, CK 
                           => clk, Q => cur_state_0_port);
   cur_state_reg_4_inst : dfr11 port map( D => next_state_4_port, R => rst, CK 
                           => clk, Q => cur_state_4_port);
   cur_state_reg_3_inst : dfr11 port map( D => next_state_3_port, R => rst, CK 
                           => clk, Q => cur_state_3_port);
   cur_state_reg_1_inst : dfr11 port map( D => next_state_1_port, R => rst, CK 
                           => clk, Q => cur_state_1_port);
   cur_state_reg_2_inst : dfr11 port map( D => next_state_2_port, R => rst, CK 
                           => clk, Q => cur_state_2_port);
   cur_state_reg_5_inst : dfr11 port map( D => next_state_5_port, R => rst, CK 
                           => clk, Q => cur_state_5_port);
   cur_timer_2_reset_reg : dfn10 port map( D => n532, CK => clk, Q => 
                           cur_timer_2_reset);
   cur_piece_reg_2_inst : dfn10 port map( D => n531, CK => clk, Q => 
                           cur_piece_2_port);
   cur_piece_reg_1_inst : dfn10 port map( D => n530, CK => clk, Q => 
                           cur_piece_1_port);
   cur_piece_reg_0_inst : dfn10 port map( D => n529, CK => clk, Q => 
                           cur_piece_0_port);
   cur_x_reg_2_inst : dfn10 port map( D => n528, CK => clk, Q => cur_x_2_port);
   cur_x_reg_1_inst : dfn10 port map( D => n527, CK => clk, Q => cur_x_1_port);
   cur_x_reg_0_inst : dfn10 port map( D => n526, CK => clk, Q => cur_x_0_port);
   cur_y_new_reg_0_inst : dfn10 port map( D => n525, CK => clk, Q => 
                           cur_y_new_0_port);
   cur_y_reg_0_inst : dfn10 port map( D => n524, CK => clk, Q => cur_y_0_port);
   cur_y_new_reg_1_inst : dfn10 port map( D => n523, CK => clk, Q => 
                           cur_y_new_1_port);
   cur_y_reg_1_inst : dfn10 port map( D => n522, CK => clk, Q => cur_y_1_port);
   cur_y_new_reg_2_inst : dfn10 port map( D => n521, CK => clk, Q => 
                           cur_y_new_2_port);
   cur_y_reg_2_inst : dfn10 port map( D => n520, CK => clk, Q => cur_y_2_port);
   cur_y_new_reg_3_inst : dfn10 port map( D => n519, CK => clk, Q => 
                           cur_y_new_3_port);
   cur_y_reg_3_inst : dfn10 port map( D => n518, CK => clk, Q => cur_y_3_port);
   cur_rot_reg_1_inst : dfn10 port map( D => n517, CK => clk, Q => 
                           cur_rot_1_port);
   cur_rot_reg_0_inst : dfn10 port map( D => n516, CK => clk, Q => 
                           cur_rot_0_port);
   cur_lut_x_reg_2_inst : dfn10 port map( D => n515, CK => clk, Q => 
                           cur_lut_x_2_port);
   cur_lut_x_reg_1_inst : dfn10 port map( D => n514, CK => clk, Q => 
                           cur_lut_x_1_port);
   cur_lut_x_reg_0_inst : dfn10 port map( D => n513, CK => clk, Q => 
                           cur_lut_x_0_port);
   cur_lut_y_reg_3_inst : dfn10 port map( D => n512, CK => clk, Q => 
                           cur_lut_y_3_port);
   cur_lut_y_reg_2_inst : dfn10 port map( D => n511, CK => clk, Q => 
                           cur_lut_y_2_port);
   cur_lut_y_reg_1_inst : dfn10 port map( D => n510, CK => clk, Q => 
                           cur_lut_y_1_port);
   cur_lut_y_reg_0_inst : dfn10 port map( D => n509, CK => clk, Q => 
                           cur_lut_y_0_port);
   cur_lut_rot_reg_1_inst : dfn10 port map( D => n508, CK => clk, Q => 
                           cur_lut_rot_1_port);
   cur_lut_rot_reg_0_inst : dfn10 port map( D => n507, CK => clk, Q => 
                           cur_lut_rot_0_port);
   cur_lut_piece_type_reg_2_inst : dfn10 port map( D => n506, CK => clk, Q => 
                           cur_lut_piece_type_2_port);
   cur_lut_piece_type_reg_1_inst : dfn10 port map( D => n505, CK => clk, Q => 
                           cur_lut_piece_type_1_port);
   cur_lut_piece_type_reg_0_inst : dfn10 port map( D => n504, CK => clk, Q => 
                           cur_lut_piece_type_0_port);
   cur_lut_start_reg : dfn10 port map( D => n503, CK => clk, Q => cur_lut_start
                           );
   cur_new_piece_reg : dfn10 port map( D => n502, CK => clk, Q => cur_new_piece
                           );
   cur_check_start_reg : dfn10 port map( D => n501, CK => clk, Q => 
                           cur_check_start);
   cur_draw_erase_draw_reg : dfn10 port map( D => n500, CK => clk, Q => 
                           cur_draw_erase_draw);
   cur_draw_erase_start_reg : dfn10 port map( D => n499, CK => clk, Q => 
                           cur_draw_erase_start);
   cur_clear_shift_start_reg : dfn10 port map( D => n498, CK => clk, Q => 
                           cur_clear_shift_start);
   cur_draw_score_draw_reg : dfn10 port map( D => n497, CK => clk, Q => 
                           cur_draw_score_draw);
   cur_timer_1_time_reg_7_inst : dfn10 port map( D => n496, CK => clk, Q => 
                           cur_timer_1_time_7_port);
   cur_timer_1_time_reg_6_inst : dfn10 port map( D => n495, CK => clk, Q => 
                           cur_timer_1_time_6_port);
   cur_timer_1_time_reg_5_inst : dfn10 port map( D => n494, CK => clk, Q => 
                           cur_timer_1_time_5_port);
   cur_timer_1_time_reg_4_inst : dfn10 port map( D => n493, CK => clk, Q => 
                           cur_timer_1_time_4_port);
   cur_timer_1_time_reg_3_inst : dfn10 port map( D => n492, CK => clk, Q => 
                           cur_timer_1_time_3_port);
   cur_timer_1_time_reg_2_inst : dfn10 port map( D => n491, CK => clk, Q => 
                           cur_timer_1_time_2_port);
   cur_timer_1_time_reg_1_inst : dfn10 port map( D => n490, CK => clk, Q => 
                           cur_timer_1_time_1_port);
   cur_timer_1_time_reg_0_inst : dfn10 port map( D => n489, CK => clk, Q => 
                           cur_timer_1_time_0_port);
   cur_timer_1_start_reg : dfn10 port map( D => n488, CK => clk, Q => 
                           cur_timer_1_start);
   cur_timer_1_reset_reg : dfn10 port map( D => n487, CK => clk, Q => 
                           cur_timer_1_reset);
   cur_timer_2_time_reg_7_inst : dfn10 port map( D => n486, CK => clk, Q => 
                           cur_timer_2_time_7_port);
   cur_timer_2_time_reg_6_inst : dfn10 port map( D => n485, CK => clk, Q => 
                           cur_timer_2_time_6_port);
   cur_timer_2_time_reg_5_inst : dfn10 port map( D => n484, CK => clk, Q => 
                           cur_timer_2_time_5_port);
   cur_timer_2_time_reg_4_inst : dfn10 port map( D => n483, CK => clk, Q => 
                           cur_timer_2_time_4_port);
   cur_timer_2_time_reg_3_inst : dfn10 port map( D => n482, CK => clk, Q => 
                           cur_timer_2_time_3_port);
   cur_timer_2_time_reg_2_inst : dfn10 port map( D => n481, CK => clk, Q => 
                           cur_timer_2_time_2_port);
   cur_timer_2_time_reg_1_inst : dfn10 port map( D => n480, CK => clk, Q => 
                           cur_timer_2_time_1_port);
   cur_timer_2_time_reg_0_inst : dfn10 port map( D => n479, CK => clk, Q => 
                           cur_timer_2_time_0_port);
   cur_timer_2_start_reg : dfn10 port map( D => n478, CK => clk, Q => 
                           cur_timer_2_start);
   U580 : iv110 port map( A => rst, Y => n542);
   U581 : iv110 port map( A => n543, Y => timer_2_time(7));
   U582 : iv110 port map( A => n544, Y => timer_2_time(6));
   U583 : na210 port map( A => n545, B => n546, Y => timer_2_time(5));
   U584 : na210 port map( A => cur_timer_2_time_5_port, B => n547, Y => n546);
   U585 : na210 port map( A => n545, B => n548, Y => timer_2_time(4));
   U586 : na210 port map( A => cur_timer_2_time_4_port, B => n547, Y => n548);
   U587 : na210 port map( A => n545, B => n549, Y => timer_2_time(3));
   U588 : na210 port map( A => cur_timer_2_time_3_port, B => n547, Y => n549);
   U589 : na210 port map( A => n545, B => n550, Y => timer_2_time(2));
   U590 : na210 port map( A => cur_timer_2_time_2_port, B => n547, Y => n550);
   U591 : iv110 port map( A => n551, Y => timer_2_time(1));
   U592 : iv110 port map( A => n552, Y => timer_2_time(0));
   U593 : na210 port map( A => n553, B => n554, Y => timer_2_start);
   U594 : na210 port map( A => cur_timer_2_start, B => n555, Y => n554);
   U595 : iv110 port map( A => n556, Y => n555);
   U596 : na210 port map( A => n557, B => n558, Y => timer_2_reset);
   U597 : na210 port map( A => cur_timer_2_reset, B => n559, Y => n558);
   U598 : iv110 port map( A => n560, Y => timer_1_time(7));
   U599 : iv110 port map( A => n561, Y => timer_1_time(6));
   U600 : na210 port map( A => n562, B => n563, Y => timer_1_time(5));
   U601 : na210 port map( A => cur_timer_1_time_5_port, B => n564, Y => n563);
   U602 : na210 port map( A => n562, B => n565, Y => timer_1_time(4));
   U603 : na210 port map( A => cur_timer_1_time_4_port, B => n564, Y => n565);
   U604 : na210 port map( A => n562, B => n566, Y => timer_1_time(3));
   U605 : na210 port map( A => cur_timer_1_time_3_port, B => n564, Y => n566);
   U606 : na210 port map( A => n562, B => n567, Y => timer_1_time(2));
   U607 : na210 port map( A => cur_timer_1_time_2_port, B => n564, Y => n567);
   U608 : iv110 port map( A => n568, Y => n562);
   U609 : iv110 port map( A => n569, Y => timer_1_time(1));
   U610 : iv110 port map( A => n570, Y => timer_1_time(0));
   U611 : na210 port map( A => n571, B => n572, Y => timer_1_start);
   U612 : na210 port map( A => cur_timer_1_start, B => n573, Y => n572);
   U613 : na210 port map( A => n557, B => n574, Y => timer_1_reset);
   U614 : na210 port map( A => cur_timer_1_reset, B => n575, Y => n574);
   U615 : na310 port map( A => n576, B => n577, C => n578, Y => 
                           next_state_5_port);
   U616 : no210 port map( A => n579, B => n580, Y => n578);
   U617 : na210 port map( A => n581, B => n582, Y => n580);
   U618 : na310 port map( A => cur_state_0_port, B => n583, C => n584, Y => 
                           n581);
   U619 : na310 port map( A => n585, B => n586, C => n587, Y => n583);
   U620 : no310 port map( A => n588, B => inputs(5), C => inputs(4), Y => n587)
                           ;
   U621 : iv110 port map( A => n589, Y => n588);
   U622 : no210 port map( A => inputs(7), B => inputs(6), Y => n589);
   U623 : no210 port map( A => inputs(3), B => inputs(2), Y => n586);
   U624 : no210 port map( A => inputs(1), B => inputs(0), Y => n585);
   U625 : no210 port map( A => timer_2_done, B => n590, Y => n579);
   U626 : na210 port map( A => n591, B => n592, Y => n577);
   U627 : na310 port map( A => n593, B => n594, C => n595, Y => 
                           next_state_4_port);
   U628 : no310 port map( A => n596, B => n597, C => n598, Y => n595);
   U629 : no210 port map( A => clear_shift_ready, B => n599, Y => n598);
   U630 : no210 port map( A => n600, B => n592, Y => n596);
   U631 : iv110 port map( A => timer_1_done, Y => n592);
   U632 : no210 port map( A => n601, B => n602, Y => n593);
   U633 : iv110 port map( A => n603, Y => next_state_3_port);
   U634 : no310 port map( A => n604, B => n602, C => n605, Y => n603);
   U635 : iv110 port map( A => n606, Y => n605);
   U636 : no310 port map( A => n607, B => n608, C => n609, Y => n606);
   U637 : na310 port map( A => n610, B => n611, C => n612, Y => 
                           next_state_2_port);
   U638 : no310 port map( A => n613, B => n609, C => n614, Y => n612);
   U639 : no210 port map( A => n615, B => n616, Y => n614);
   U640 : no210 port map( A => n590, B => n617, Y => n609);
   U641 : iv110 port map( A => timer_2_done, Y => n617);
   U642 : na310 port map( A => n618, B => n571, C => n619, Y => n613);
   U643 : no310 port map( A => n620, B => n621, C => n622, Y => n611);
   U644 : iv110 port map( A => n576, Y => n620);
   U645 : no210 port map( A => n623, B => n624, Y => n576);
   U646 : no210 port map( A => n625, B => n626, Y => n624);
   U647 : no210 port map( A => n627, B => n628, Y => n610);
   U648 : na310 port map( A => n629, B => n630, C => n631, Y => 
                           next_state_1_port);
   U649 : no310 port map( A => n632, B => n584, C => n633, Y => n631);
   U650 : no210 port map( A => n634, B => n635, Y => n633);
   U651 : iv110 port map( A => n636, Y => n584);
   U652 : na210 port map( A => n618, B => n637, Y => n632);
   U653 : no210 port map( A => n638, B => n639, Y => n630);
   U654 : no210 port map( A => timer_1_done, B => n600, Y => n638);
   U655 : no210 port map( A => n604, B => n640, Y => n629);
   U656 : na310 port map( A => n641, B => n642, C => n643, Y => n604);
   U657 : no310 port map( A => n627, B => n644, C => n645, Y => n643);
   U658 : no210 port map( A => n646, B => n597, Y => n642);
   U659 : iv110 port map( A => n647, Y => n597);
   U660 : iv110 port map( A => n648, Y => n646);
   U661 : no210 port map( A => n649, B => n650, Y => n641);
   U662 : no210 port map( A => check_empty, B => n651, Y => n650);
   U663 : no210 port map( A => cur_state_0_port, B => n636, Y => n649);
   U664 : na310 port map( A => n652, B => n653, C => n654, Y => 
                           next_state_0_port);
   U665 : iv110 port map( A => n655, Y => n654);
   U666 : na310 port map( A => n656, B => n657, C => n658, Y => n655);
   U667 : na210 port map( A => n659, B => draw_erase_ready, Y => n658);
   U668 : na210 port map( A => n660, B => n661, Y => n657);
   U669 : no310 port map( A => n662, B => n591, C => n663, Y => n656);
   U670 : no210 port map( A => n664, B => n665, Y => n663);
   U671 : iv110 port map( A => check_ready, Y => n664);
   U672 : iv110 port map( A => n600, Y => n591);
   U673 : no210 port map( A => n666, B => n623, Y => n653);
   U674 : na310 port map( A => n667, B => n668, C => n669, Y => n623);
   U675 : na210 port map( A => check_empty, B => n670, Y => n669);
   U676 : no210 port map( A => n640, B => n671, Y => n652);
   U677 : mu111 port map( A => n672, B => n673, S => n635, Y => n671);
   U678 : na210 port map( A => n618, B => n674, Y => n672);
   U679 : na310 port map( A => n675, B => n676, C => n677, Y => n640);
   U680 : na210 port map( A => clear_shift_ready, B => n678, Y => n677);
   U681 : na210 port map( A => n679, B => n680, Y => new_piece);
   U682 : na210 port map( A => cur_new_piece, B => n681, Y => n680);
   U683 : iv110 port map( A => n682, Y => n681);
   U684 : na210 port map( A => n683, B => n684, Y => n532);
   U685 : na210 port map( A => cur_timer_2_reset, B => n685, Y => n684);
   U686 : na210 port map( A => n686, B => n542, Y => n685);
   U687 : iv110 port map( A => n559, Y => n686);
   U688 : na210 port map( A => n688, B => n689, Y => n559);
   U689 : na210 port map( A => n690, B => n691, Y => n531);
   U690 : na210 port map( A => next_piece(2), B => n692, Y => n691);
   U691 : na210 port map( A => cur_piece_2_port, B => n693, Y => n690);
   U692 : na210 port map( A => n694, B => n695, Y => n530);
   U693 : na210 port map( A => next_piece(1), B => n692, Y => n695);
   U694 : na210 port map( A => cur_piece_1_port, B => n693, Y => n694);
   U695 : na210 port map( A => n696, B => n697, Y => n529);
   U696 : na210 port map( A => next_piece(0), B => n692, Y => n697);
   U697 : iv110 port map( A => n698, Y => n692);
   U698 : na210 port map( A => cur_piece_0_port, B => n693, Y => n696);
   U699 : na310 port map( A => n699, B => n700, C => n701, Y => n693);
   U700 : no210 port map( A => rst, B => n702, Y => n701);
   U701 : iv110 port map( A => n703, Y => n528);
   U702 : na210 port map( A => n704, B => cur_x_2_port, Y => n703);
   U703 : na210 port map( A => n705, B => n706, Y => n527);
   U704 : na210 port map( A => cur_x_1_port, B => n704, Y => n706);
   U705 : na210 port map( A => n705, B => n707, Y => n526);
   U706 : na210 port map( A => cur_x_0_port, B => n704, Y => n707);
   U707 : na310 port map( A => n699, B => n708, C => n709, Y => n704);
   U708 : no210 port map( A => rst, B => n710, Y => n709);
   U709 : na210 port map( A => n711, B => n542, Y => n705);
   U710 : na210 port map( A => n712, B => n713, Y => n525);
   U711 : na210 port map( A => cur_y_new_0_port, B => n714, Y => n713);
   U712 : na210 port map( A => n715, B => n716, Y => n712);
   U713 : iv110 port map( A => n717, Y => n716);
   U714 : mu111 port map( A => cur_y_0_port, B => n717, S => n687, Y => n524);
   U715 : na210 port map( A => n718, B => n719, Y => n523);
   U716 : na210 port map( A => n715, B => n720, Y => n719);
   U717 : ex210 port map( A => n717, B => n721, Y => n720);
   U718 : na210 port map( A => cur_y_new_1_port, B => n714, Y => n718);
   U719 : mu111 port map( A => cur_y_1_port, B => n721, S => n687, Y => n522);
   U720 : na210 port map( A => n722, B => n723, Y => n521);
   U721 : na210 port map( A => n724, B => n715, Y => n723);
   U722 : ex210 port map( A => n725, B => n726, Y => n724);
   U723 : na210 port map( A => cur_y_new_2_port, B => n714, Y => n722);
   U724 : mu111 port map( A => cur_y_2_port, B => n727, S => n687, Y => n520);
   U725 : na210 port map( A => n728, B => n729, Y => n519);
   U726 : na210 port map( A => n730, B => n715, Y => n729);
   U727 : no210 port map( A => n731, B => rst, Y => n715);
   U728 : ex210 port map( A => n732, B => n733, Y => n730);
   U729 : no210 port map( A => n726, B => n725, Y => n733);
   U730 : na210 port map( A => n717, B => n721, Y => n725);
   U731 : iv110 port map( A => n727, Y => n726);
   U732 : na210 port map( A => cur_y_new_3_port, B => n714, Y => n728);
   U733 : na310 port map( A => n734, B => n735, C => n736, Y => n714);
   U734 : no310 port map( A => n662, B => rst, C => n673, Y => n736);
   U735 : iv110 port map( A => n634, Y => n673);
   U736 : no210 port map( A => n737, B => n738, Y => n734);
   U737 : mu111 port map( A => cur_y_3_port, B => n732, S => n687, Y => n518);
   U738 : no210 port map( A => n739, B => n740, Y => n517);
   U739 : iv110 port map( A => cur_rot_1_port, Y => n740);
   U740 : no210 port map( A => n739, B => n741, Y => n516);
   U741 : iv110 port map( A => cur_rot_0_port, Y => n741);
   U742 : no310 port map( A => n742, B => rst, C => n743, Y => n739);
   U743 : na210 port map( A => n744, B => n745, Y => n743);
   U744 : na210 port map( A => n746, B => n747, Y => n515);
   U745 : na210 port map( A => cur_lut_x_2_port, B => n748, Y => n747);
   U746 : na210 port map( A => n749, B => cur_x_2_port, Y => n746);
   U747 : na210 port map( A => n750, B => n751, Y => n514);
   U748 : na210 port map( A => cur_lut_x_1_port, B => n748, Y => n751);
   U749 : na210 port map( A => n749, B => cur_x_1_port, Y => n750);
   U750 : na210 port map( A => n752, B => n753, Y => n513);
   U751 : na210 port map( A => cur_lut_x_0_port, B => n748, Y => n753);
   U752 : na210 port map( A => n749, B => cur_x_0_port, Y => n752);
   U753 : na210 port map( A => n754, B => n755, Y => n512);
   U754 : na210 port map( A => n756, B => n542, Y => n755);
   U755 : na210 port map( A => cur_lut_y_3_port, B => n748, Y => n754);
   U756 : na210 port map( A => n757, B => n758, Y => n511);
   U757 : na210 port map( A => n759, B => n542, Y => n758);
   U758 : na210 port map( A => cur_lut_y_2_port, B => n748, Y => n757);
   U759 : na210 port map( A => n760, B => n761, Y => n510);
   U760 : na210 port map( A => n762, B => n542, Y => n761);
   U761 : na210 port map( A => cur_lut_y_1_port, B => n748, Y => n760);
   U762 : na210 port map( A => n763, B => n764, Y => n509);
   U763 : na210 port map( A => n765, B => n542, Y => n764);
   U764 : na210 port map( A => cur_lut_y_0_port, B => n748, Y => n763);
   U765 : na210 port map( A => n766, B => n767, Y => n508);
   U766 : na210 port map( A => cur_lut_rot_1_port, B => n748, Y => n767);
   U767 : na210 port map( A => n749, B => cur_rot_1_port, Y => n766);
   U768 : na210 port map( A => n768, B => n769, Y => n507);
   U769 : na210 port map( A => cur_lut_rot_0_port, B => n748, Y => n769);
   U770 : na210 port map( A => n749, B => cur_rot_0_port, Y => n768);
   U771 : na210 port map( A => n770, B => n771, Y => n506);
   U772 : na210 port map( A => cur_lut_piece_type_2_port, B => n748, Y => n771)
                           ;
   U773 : na210 port map( A => n749, B => cur_piece_2_port, Y => n770);
   U774 : na210 port map( A => n772, B => n773, Y => n505);
   U775 : na210 port map( A => cur_lut_piece_type_1_port, B => n748, Y => n773)
                           ;
   U776 : na210 port map( A => n749, B => cur_piece_1_port, Y => n772);
   U777 : na210 port map( A => n774, B => n775, Y => n504);
   U778 : na210 port map( A => cur_lut_piece_type_0_port, B => n748, Y => n775)
                           ;
   U779 : na210 port map( A => n776, B => n542, Y => n748);
   U780 : na210 port map( A => n749, B => cur_piece_0_port, Y => n774);
   U781 : na310 port map( A => n777, B => n778, C => n779, Y => n503);
   U782 : na210 port map( A => cur_lut_start, B => n780, Y => n779);
   U783 : iv110 port map( A => n781, Y => n780);
   U784 : no210 port map( A => n782, B => rst, Y => n781);
   U785 : iv110 port map( A => n749, Y => n778);
   U786 : no210 port map( A => rst, B => n783, Y => n749);
   U787 : na310 port map( A => n635, B => n542, C => n784, Y => n777);
   U788 : na210 port map( A => n698, B => n785, Y => n502);
   U789 : na210 port map( A => cur_new_piece, B => n786, Y => n785);
   U790 : na210 port map( A => n682, B => n542, Y => n786);
   U791 : no310 port map( A => n787, B => n788, C => n789, Y => n682);
   U792 : na310 port map( A => n790, B => n637, C => n744, Y => n789);
   U793 : na210 port map( A => n791, B => n542, Y => n698);
   U794 : na210 port map( A => n792, B => n793, Y => n501);
   U795 : na210 port map( A => cur_check_start, B => n794, Y => n793);
   U796 : na210 port map( A => n795, B => n542, Y => n794);
   U797 : na210 port map( A => n796, B => n542, Y => n792);
   U798 : iv110 port map( A => n797, Y => n796);
   U799 : na210 port map( A => n798, B => n799, Y => n500);
   U800 : na210 port map( A => cur_draw_erase_draw, B => n800, Y => n799);
   U801 : na210 port map( A => n745, B => n542, Y => n800);
   U802 : na210 port map( A => n742, B => n542, Y => n798);
   U803 : iv110 port map( A => n801, Y => n742);
   U804 : na210 port map( A => n802, B => n803, Y => n499);
   U805 : na210 port map( A => cur_draw_erase_start, B => n804, Y => n803);
   U806 : iv110 port map( A => n805, Y => n804);
   U807 : no210 port map( A => n806, B => rst, Y => n805);
   U808 : na210 port map( A => n807, B => n542, Y => n802);
   U809 : na210 port map( A => n808, B => n809, Y => n498);
   U810 : na210 port map( A => cur_clear_shift_start, B => n810, Y => n809);
   U811 : na210 port map( A => n811, B => n687, Y => n810);
   U812 : iv110 port map( A => n812, Y => n811);
   U813 : na210 port map( A => n813, B => n687, Y => n808);
   U814 : na210 port map( A => n814, B => n815, Y => n497);
   U815 : na210 port map( A => cur_draw_score_draw, B => rst, Y => n815);
   U816 : na210 port map( A => n560, B => n816, Y => n496);
   U817 : na210 port map( A => rst, B => cur_timer_1_time_7_port, Y => n816);
   U818 : na210 port map( A => cur_timer_1_time_7_port, B => n564, Y => n560);
   U819 : na210 port map( A => n561, B => n817, Y => n495);
   U820 : na210 port map( A => rst, B => cur_timer_1_time_6_port, Y => n817);
   U821 : na210 port map( A => cur_timer_1_time_6_port, B => n564, Y => n561);
   U822 : na210 port map( A => n818, B => n819, Y => n494);
   U823 : na210 port map( A => cur_timer_1_time_5_port, B => n820, Y => n819);
   U824 : na210 port map( A => n818, B => n821, Y => n493);
   U825 : na210 port map( A => cur_timer_1_time_4_port, B => n820, Y => n821);
   U826 : na210 port map( A => n818, B => n822, Y => n492);
   U827 : na210 port map( A => cur_timer_1_time_3_port, B => n820, Y => n822);
   U828 : na210 port map( A => n818, B => n823, Y => n491);
   U829 : na210 port map( A => cur_timer_1_time_2_port, B => n820, Y => n823);
   U830 : iv110 port map( A => n824, Y => n820);
   U831 : no210 port map( A => n564, B => rst, Y => n824);
   U832 : na210 port map( A => n568, B => n687, Y => n818);
   U833 : na310 port map( A => n582, B => n648, C => n545, Y => n568);
   U834 : na210 port map( A => n569, B => n825, Y => n490);
   U835 : na210 port map( A => rst, B => cur_timer_1_time_1_port, Y => n825);
   U836 : na210 port map( A => cur_timer_1_time_1_port, B => n564, Y => n569);
   U837 : na210 port map( A => n570, B => n826, Y => n489);
   U838 : na210 port map( A => rst, B => cur_timer_1_time_0_port, Y => n826);
   U839 : na210 port map( A => cur_timer_1_time_0_port, B => n564, Y => n570);
   U840 : na310 port map( A => n827, B => n828, C => n829, Y => n564);
   U841 : na210 port map( A => n830, B => n831, Y => n488);
   U842 : na210 port map( A => cur_timer_1_start, B => n832, Y => n831);
   U843 : na210 port map( A => n833, B => n687, Y => n832);
   U844 : iv110 port map( A => n573, Y => n833);
   U845 : na310 port map( A => n829, B => n797, C => n834, Y => n573);
   U846 : no310 port map( A => n835, B => n836, C => n837, Y => n829);
   U847 : na310 port map( A => n838, B => n618, C => n839, Y => n837);
   U848 : iv110 port map( A => n840, Y => n835);
   U849 : iv110 port map( A => n841, Y => n830);
   U850 : no210 port map( A => n571, B => rst, Y => n841);
   U851 : na210 port map( A => n683, B => n842, Y => n487);
   U852 : na210 port map( A => cur_timer_1_reset, B => n843, Y => n842);
   U853 : iv110 port map( A => n844, Y => n843);
   U854 : no210 port map( A => n575, B => rst, Y => n844);
   U855 : na310 port map( A => n838, B => n553, C => n845, Y => n575);
   U856 : no210 port map( A => n836, B => n846, Y => n845);
   U857 : iv110 port map( A => n688, Y => n846);
   U858 : no310 port map( A => n847, B => n601, C => n848, Y => n688);
   U859 : na210 port map( A => n667, B => n590, Y => n848);
   U860 : na210 port map( A => n849, B => n687, Y => n683);
   U861 : na210 port map( A => n543, B => n850, Y => n486);
   U862 : na210 port map( A => rst, B => cur_timer_2_time_7_port, Y => n850);
   U863 : na210 port map( A => cur_timer_2_time_7_port, B => n547, Y => n543);
   U864 : na210 port map( A => n544, B => n851, Y => n485);
   U865 : na210 port map( A => rst, B => cur_timer_2_time_6_port, Y => n851);
   U866 : na210 port map( A => cur_timer_2_time_6_port, B => n547, Y => n544);
   U867 : na210 port map( A => n852, B => n853, Y => n484);
   U868 : na210 port map( A => cur_timer_2_time_5_port, B => n854, Y => n853);
   U869 : na210 port map( A => n852, B => n855, Y => n483);
   U870 : na210 port map( A => cur_timer_2_time_4_port, B => n854, Y => n855);
   U871 : na210 port map( A => n852, B => n856, Y => n482);
   U872 : na210 port map( A => cur_timer_2_time_3_port, B => n854, Y => n856);
   U873 : na210 port map( A => n852, B => n857, Y => n481);
   U874 : na210 port map( A => cur_timer_2_time_2_port, B => n854, Y => n857);
   U875 : iv110 port map( A => n858, Y => n854);
   U876 : no210 port map( A => n547, B => rst, Y => n858);
   U877 : iv110 port map( A => n859, Y => n852);
   U878 : no210 port map( A => n545, B => rst, Y => n859);
   U879 : no210 port map( A => n711, B => n849, Y => n545);
   U880 : iv110 port map( A => n557, Y => n849);
   U881 : na210 port map( A => n551, B => n860, Y => n480);
   U882 : na210 port map( A => rst, B => cur_timer_2_time_1_port, Y => n860);
   U883 : na210 port map( A => cur_timer_2_time_1_port, B => n547, Y => n551);
   U884 : na210 port map( A => n552, B => n861, Y => n479);
   U885 : na210 port map( A => rst, B => cur_timer_2_time_0_port, Y => n861);
   U886 : na210 port map( A => cur_timer_2_time_0_port, B => n547, Y => n552);
   U887 : na310 port map( A => n689, B => n840, C => n862, Y => n547);
   U888 : no210 port map( A => n710, B => n863, Y => n862);
   U889 : no310 port map( A => n601, B => n678, C => n666, Y => n840);
   U890 : iv110 port map( A => n599, Y => n678);
   U891 : na310 port map( A => n864, B => n744, C => n790, Y => n601);
   U892 : no310 port map( A => n865, B => n866, C => n867, Y => n790);
   U893 : iv110 port map( A => n868, Y => n866);
   U894 : na210 port map( A => n869, B => n870, Y => n478);
   U895 : na210 port map( A => cur_timer_2_start, B => n871, Y => n870);
   U896 : na210 port map( A => n556, B => n687, Y => n871);
   U897 : no310 port map( A => n872, B => n738, C => n873, Y => n556);
   U898 : na310 port map( A => n838, B => n874, C => n582, Y => n873);
   U899 : na310 port map( A => n875, B => n876, C => n877, Y => n738);
   U900 : no210 port map( A => n878, B => n813, Y => n877);
   U901 : na210 port map( A => n879, B => n880, Y => n872);
   U902 : na210 port map( A => n881, B => n687, Y => n869);
   U903 : iv110 port map( A => rst, Y => n687);
   U904 : iv110 port map( A => n553, Y => n881);
   U905 : na210 port map( A => n882, B => n883, Y => lut_y(3));
   U906 : na210 port map( A => cur_lut_y_3_port, B => n884, Y => n883);
   U907 : iv110 port map( A => n756, Y => n882);
   U908 : na210 port map( A => n885, B => n886, Y => n756);
   U909 : na210 port map( A => n732, B => n887, Y => n886);
   U910 : na210 port map( A => n888, B => n889, Y => n732);
   U911 : na210 port map( A => cur_y_new_3_port, B => n608, Y => n889);
   U912 : na210 port map( A => cur_y_3_port, B => n890, Y => n888);
   U913 : na210 port map( A => n662, B => cur_y_new_3_port, Y => n885);
   U914 : na210 port map( A => n891, B => n892, Y => lut_y(2));
   U915 : na210 port map( A => cur_lut_y_2_port, B => n884, Y => n892);
   U916 : iv110 port map( A => n759, Y => n891);
   U917 : na210 port map( A => n893, B => n894, Y => n759);
   U918 : na210 port map( A => n727, B => n887, Y => n894);
   U919 : na210 port map( A => n895, B => n896, Y => n727);
   U920 : na210 port map( A => cur_y_new_2_port, B => n608, Y => n896);
   U921 : na210 port map( A => cur_y_2_port, B => n890, Y => n895);
   U922 : na210 port map( A => n662, B => cur_y_new_2_port, Y => n893);
   U923 : na210 port map( A => n897, B => n898, Y => lut_y(1));
   U924 : na210 port map( A => cur_lut_y_1_port, B => n884, Y => n898);
   U925 : iv110 port map( A => n762, Y => n897);
   U926 : na210 port map( A => n899, B => n900, Y => n762);
   U927 : na210 port map( A => n721, B => n887, Y => n900);
   U928 : na210 port map( A => n901, B => n902, Y => n721);
   U929 : na210 port map( A => cur_y_new_1_port, B => n608, Y => n902);
   U930 : na210 port map( A => cur_y_1_port, B => n890, Y => n901);
   U931 : na210 port map( A => n662, B => cur_y_new_1_port, Y => n899);
   U932 : na210 port map( A => n903, B => n904, Y => lut_y(0));
   U933 : na210 port map( A => cur_lut_y_0_port, B => n884, Y => n904);
   U934 : iv110 port map( A => n765, Y => n903);
   U935 : na210 port map( A => n905, B => n906, Y => n765);
   U936 : na210 port map( A => n717, B => n887, Y => n906);
   U937 : na210 port map( A => n907, B => n908, Y => n717);
   U938 : na210 port map( A => n608, B => cur_y_new_0_port, Y => n908);
   U939 : no210 port map( A => n676, B => lut_error, Y => n608);
   U940 : na210 port map( A => cur_y_0_port, B => n890, Y => n907);
   U941 : na310 port map( A => n708, B => n909, C => n910, Y => n890);
   U942 : no310 port map( A => n639, B => n788, C => n710, Y => n910);
   U943 : iv110 port map( A => n689, Y => n788);
   U944 : no210 port map( A => n836, B => n737, Y => n689);
   U945 : na310 port map( A => n911, B => n616, C => n912, Y => n836);
   U946 : iv110 port map( A => n913, Y => n616);
   U947 : iv110 port map( A => n628, Y => n909);
   U948 : na210 port map( A => n879, B => n914, Y => n628);
   U949 : na210 port map( A => lut_error, B => n865, Y => n914);
   U950 : iv110 port map( A => n867, Y => n879);
   U951 : na210 port map( A => n662, B => cur_y_new_0_port, Y => n905);
   U952 : na210 port map( A => n915, B => n916, Y => lut_x(2));
   U953 : na210 port map( A => cur_x_2_port, B => n917, Y => n916);
   U954 : na210 port map( A => cur_lut_x_2_port, B => n884, Y => n915);
   U955 : na210 port map( A => n918, B => n919, Y => lut_x(1));
   U956 : na210 port map( A => cur_x_1_port, B => n917, Y => n919);
   U957 : na210 port map( A => cur_lut_x_1_port, B => n884, Y => n918);
   U958 : na210 port map( A => n920, B => n921, Y => lut_x(0));
   U959 : na210 port map( A => cur_x_0_port, B => n917, Y => n921);
   U960 : na210 port map( A => cur_lut_x_0_port, B => n884, Y => n920);
   U961 : na310 port map( A => n922, B => n923, C => n783, Y => lut_start);
   U962 : na210 port map( A => n784, B => n635, Y => n923);
   U963 : iv110 port map( A => lut_ready, Y => n635);
   U964 : na210 port map( A => cur_lut_start, B => n782, Y => n922);
   U965 : na210 port map( A => n924, B => n925, Y => lut_rot(1));
   U966 : na210 port map( A => cur_rot_1_port, B => n917, Y => n925);
   U967 : na210 port map( A => cur_lut_rot_1_port, B => n884, Y => n924);
   U968 : na210 port map( A => n926, B => n927, Y => lut_rot(0));
   U969 : na210 port map( A => cur_rot_0_port, B => n917, Y => n927);
   U970 : na210 port map( A => cur_lut_rot_0_port, B => n884, Y => n926);
   U971 : na210 port map( A => n928, B => n929, Y => lut_piece_type(2));
   U972 : na210 port map( A => cur_piece_2_port, B => n917, Y => n929);
   U973 : na210 port map( A => cur_lut_piece_type_2_port, B => n884, Y => n928)
                           ;
   U974 : na210 port map( A => n930, B => n931, Y => lut_piece_type(1));
   U975 : na210 port map( A => cur_piece_1_port, B => n917, Y => n931);
   U976 : na210 port map( A => cur_lut_piece_type_1_port, B => n884, Y => n930)
                           ;
   U977 : na210 port map( A => n932, B => n933, Y => lut_piece_type(0));
   U978 : na210 port map( A => cur_piece_0_port, B => n917, Y => n933);
   U979 : iv110 port map( A => n783, Y => n917);
   U980 : no210 port map( A => n887, B => n662, Y => n783);
   U981 : iv110 port map( A => n934, Y => n662);
   U982 : na210 port map( A => n912, B => n637, Y => n887);
   U983 : na210 port map( A => cur_lut_piece_type_0_port, B => n884, Y => n932)
                           ;
   U984 : iv110 port map( A => n776, Y => n884);
   U985 : no210 port map( A => n782, B => n784, Y => n776);
   U986 : na210 port map( A => n634, B => n674, Y => n784);
   U987 : na310 port map( A => n935, B => n936, C => n937, Y => n782);
   U988 : no310 port map( A => n938, B => n939, C => n940, Y => n937);
   U989 : iv110 port map( A => n731, Y => n940);
   U990 : na210 port map( A => n941, B => n679, Y => n938);
   U991 : no210 port map( A => n737, B => n942, Y => n936);
   U992 : no210 port map( A => n639, B => n787, Y => n935);
   U993 : iv110 port map( A => n700, Y => n787);
   U994 : no310 port map( A => n943, B => n711, C => n944, Y => n700);
   U995 : na210 port map( A => n648, B => n618, Y => n944);
   U996 : iv110 port map( A => n675, Y => n711);
   U997 : iv110 port map( A => n708, Y => n943);
   U998 : no210 port map( A => n945, B => n863, Y => n708);
   U999 : iv110 port map( A => n827, Y => n863);
   U1000 : no310 port map( A => n946, B => n670, C => n607, Y => n827);
   U1001 : iv110 port map( A => n651, Y => n670);
   U1002 : iv110 port map( A => n814, Y => draw_score_draw);
   U1003 : na210 port map( A => cur_draw_score_draw, B => n947, Y => n814);
   U1004 : na310 port map( A => n744, B => n801, C => n745, Y => n947);
   U1005 : na210 port map( A => n948, B => n949, Y => draw_erase_start);
   U1006 : na210 port map( A => cur_draw_erase_start, B => n806, Y => n949);
   U1007 : iv110 port map( A => n807, Y => n948);
   U1008 : na310 port map( A => n950, B => n744, C => n594, Y => n807);
   U1009 : iv110 port map( A => n645, Y => n594);
   U1010 : na210 port map( A => n951, B => n801, Y => n645);
   U1011 : na210 port map( A => n939, B => n625, Y => n951);
   U1012 : na210 port map( A => n659, B => n625, Y => n950);
   U1013 : iv110 port map( A => draw_erase_ready, Y => n625);
   U1014 : na210 port map( A => n801, B => n952, Y => draw_erase_draw);
   U1015 : na210 port map( A => cur_draw_erase_draw, B => n953, Y => n952);
   U1016 : iv110 port map( A => n745, Y => n953);
   U1017 : no310 port map( A => n806, B => n939, C => n659, Y => n745);
   U1018 : na210 port map( A => n647, B => n868, Y => n659);
   U1019 : iv110 port map( A => n626, Y => n939);
   U1020 : na210 port map( A => n913, B => n954, Y => n626);
   U1021 : na310 port map( A => n955, B => n956, C => n957, Y => n806);
   U1022 : no310 port map( A => n958, B => n865, C => n959, Y => n957);
   U1023 : iv110 port map( A => n676, Y => n865);
   U1024 : na210 port map( A => n864, B => n582, Y => n958);
   U1025 : no210 port map( A => n644, B => n867, Y => n956);
   U1026 : no210 port map( A => n602, B => n960, Y => n955);
   U1027 : na210 port map( A => n912, B => n674, Y => n602);
   U1028 : na210 port map( A => n913, B => n660, Y => n674);
   U1029 : no210 port map( A => n878, B => n961, Y => n912);
   U1030 : na210 port map( A => n962, B => n660, Y => n801);
   U1031 : iv110 port map( A => n963, Y => n660);
   U1032 : no210 port map( A => n964, B => n965, Y => n963);
   U1033 : na210 port map( A => n864, B => n966, Y => clear_shift_start);
   U1034 : na210 port map( A => cur_clear_shift_start, B => n812, Y => n966);
   U1035 : na210 port map( A => n735, B => n699, Y => n812);
   U1036 : iv110 port map( A => n967, Y => n699);
   U1037 : iv110 port map( A => n960, Y => n735);
   U1038 : na210 port map( A => n880, B => n557, Y => n960);
   U1039 : no310 port map( A => n666, B => n946, C => n847, Y => n880);
   U1040 : iv110 port map( A => n968, Y => n847);
   U1041 : no310 port map( A => n710, B => n607, C => n969, Y => n968);
   U1042 : na310 port map( A => n675, B => n651, C => n599, Y => n969);
   U1043 : na310 port map( A => n797, B => n665, C => n571, Y => n607);
   U1044 : na310 port map( A => n618, B => n648, C => n828, Y => n710);
   U1045 : iv110 port map( A => n667, Y => n946);
   U1046 : na210 port map( A => n590, B => n970, Y => n666);
   U1047 : na210 port map( A => n797, B => n971, Y => check_start);
   U1048 : na210 port map( A => cur_check_start, B => n972, Y => n971);
   U1049 : iv110 port map( A => n795, Y => n972);
   U1050 : no310 port map( A => n967, B => n945, C => n973, Y => n795);
   U1051 : na310 port map( A => n834, B => n571, C => n618, Y => n973);
   U1052 : na210 port map( A => n661, B => n974, Y => n618);
   U1053 : na210 port map( A => n975, B => n954, Y => n571);
   U1054 : no310 port map( A => n976, B => n621, C => n977, Y => n834);
   U1055 : na310 port map( A => n667, B => n665, C => n651, Y => n977);
   U1056 : na210 port map( A => n965, B => n978, Y => n651);
   U1057 : na210 port map( A => n975, B => n965, Y => n665);
   U1058 : na210 port map( A => n954, B => n978, Y => n667);
   U1059 : iv110 port map( A => n828, Y => n621);
   U1060 : no210 port map( A => n702, B => n791, Y => n828);
   U1061 : iv110 port map( A => n679, Y => n791);
   U1062 : na210 port map( A => n979, B => n954, Y => n679);
   U1063 : na210 port map( A => n637, B => n941, Y => n702);
   U1064 : na210 port map( A => n964, B => n661, Y => n941);
   U1065 : na210 port map( A => n964, B => n979, Y => n637);
   U1066 : na210 port map( A => n648, B => n675, Y => n976);
   U1067 : na210 port map( A => n979, B => n965, Y => n675);
   U1068 : na210 port map( A => n661, B => n954, Y => n648);
   U1069 : no210 port map( A => n980, B => n981, Y => n661);
   U1070 : na310 port map( A => n590, B => n599, C => n982, Y => n945);
   U1071 : no210 port map( A => n813, B => n627, Y => n982);
   U1072 : na210 port map( A => n557, B => n970, Y => n627);
   U1073 : na210 port map( A => n974, B => n975, Y => n970);
   U1074 : na210 port map( A => n964, B => n978, Y => n557);
   U1075 : iv110 port map( A => n864, Y => n813);
   U1076 : na210 port map( A => n974, B => n978, Y => n864);
   U1077 : no210 port map( A => n983, B => n984, Y => n978);
   U1078 : na210 port map( A => n985, B => n965, Y => n599);
   U1079 : na210 port map( A => n964, B => n975, Y => n590);
   U1080 : no210 port map( A => n981, B => n984, Y => n975);
   U1081 : na210 port map( A => cur_state_3_port, B => n986, Y => n984);
   U1082 : na310 port map( A => n875, B => n876, C => n987, Y => n967);
   U1083 : no310 port map( A => n867, B => n878, C => n737, Y => n987);
   U1084 : na310 port map( A => n839, B => n582, C => n838, Y => n737);
   U1085 : no210 port map( A => n959, B => n622, Y => n838);
   U1086 : na210 port map( A => n647, B => n988, Y => n622);
   U1087 : na210 port map( A => n962, B => n964, Y => n988);
   U1088 : na210 port map( A => n913, B => n974, Y => n647);
   U1089 : na310 port map( A => n636, B => n668, C => n600, Y => n959);
   U1090 : na310 port map( A => n965, B => cur_state_0_port, C => n989, Y => 
                           n600);
   U1091 : na310 port map( A => n964, B => cur_state_0_port, C => n989, Y => 
                           n668);
   U1092 : na210 port map( A => n989, B => n954, Y => n636);
   U1093 : na210 port map( A => n962, B => n974, Y => n582);
   U1094 : iv110 port map( A => n644, Y => n839);
   U1095 : na210 port map( A => n553, B => n874, Y => n644);
   U1096 : na310 port map( A => n965, B => n990, C => n989, Y => n874);
   U1097 : na310 port map( A => n964, B => n990, C => n989, Y => n553);
   U1098 : no210 port map( A => n991, B => n980, Y => n989);
   U1099 : iv110 port map( A => n619, Y => n878);
   U1100 : na210 port map( A => n962, B => n954, Y => n619);
   U1101 : na310 port map( A => n634, B => n731, C => n934, Y => n867);
   U1102 : na210 port map( A => n985, B => n964, Y => n934);
   U1103 : na210 port map( A => n992, B => n954, Y => n731);
   U1104 : na210 port map( A => n992, B => n964, Y => n634);
   U1105 : iv110 port map( A => n615, Y => n964);
   U1106 : na210 port map( A => cur_state_2_port, B => n993, Y => n615);
   U1107 : iv110 port map( A => n639, Y => n876);
   U1108 : na210 port map( A => n744, B => n868, Y => n639);
   U1109 : na210 port map( A => n985, B => n954, Y => n868);
   U1110 : no210 port map( A => n993, B => cur_state_2_port, Y => n954);
   U1111 : iv110 port map( A => cur_state_1_port, Y => n993);
   U1112 : na210 port map( A => n992, B => n965, Y => n744);
   U1113 : no310 port map( A => n961, B => n913, C => n942, Y => n875);
   U1114 : na210 port map( A => n676, B => n911, Y => n942);
   U1115 : na210 port map( A => n962, B => n965, Y => n911);
   U1116 : no210 port map( A => cur_state_2_port, B => cur_state_1_port, Y => 
                           n965);
   U1117 : no310 port map( A => n983, B => n994, C => n986, Y => n962);
   U1118 : na210 port map( A => n985, B => n974, Y => n676);
   U1119 : no310 port map( A => n981, B => cur_state_3_port, C => n986, Y => 
                           n985);
   U1120 : no310 port map( A => n981, B => n994, C => n986, Y => n913);
   U1121 : na210 port map( A => n991, B => n990, Y => n981);
   U1122 : iv110 port map( A => cur_state_0_port, Y => n990);
   U1123 : no210 port map( A => n995, B => n996, Y => n961);
   U1124 : iv110 port map( A => n992, Y => n995);
   U1125 : no310 port map( A => n983, B => cur_state_3_port, C => n986, Y => 
                           n992);
   U1126 : na210 port map( A => n974, B => n979, Y => n797);
   U1127 : no210 port map( A => n980, B => n983, Y => n979);
   U1128 : na210 port map( A => cur_state_0_port, B => n991, Y => n983);
   U1129 : iv110 port map( A => cur_state_5_port, Y => n991);
   U1130 : na210 port map( A => n986, B => n994, Y => n980);
   U1131 : iv110 port map( A => cur_state_3_port, Y => n994);
   U1132 : iv110 port map( A => cur_state_4_port, Y => n986);
   U1133 : iv110 port map( A => n996, Y => n974);
   U1134 : na210 port map( A => cur_state_2_port, B => cur_state_1_port, Y => 
                           n996);

end synthesised;



