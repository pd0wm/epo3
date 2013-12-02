
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

package CONV_PACK_controller is

-- define attributes
attribute ENUM_ENCODING : STRING;

end CONV_PACK_controller;

library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

use work.CONV_PACK_controller.all;

entity controller is

   port( clk, rst : in std_logic;  lut_x : out std_logic_vector (2 downto 0);  
         lut_y : out std_logic_vector (3 downto 0);  lut_rot : out 
         std_logic_vector (1 downto 0);  lut_piece_type : out std_logic_vector 
         (2 downto 0);  lut_ready, lut_error : in std_logic;  lut_start, 
         new_piece : out std_logic;  next_piece : in std_logic_vector (2 downto
         0);  check_empty : in std_logic;  check_start : out std_logic;  
         check_ready : in std_logic;  draw_erase_draw, draw_erase_start : out 
         std_logic;  draw_erase_ready : in std_logic;  clear_shift_start : out 
         std_logic;  clear_shift_ready : in std_logic;  draw_score_draw : out 
         std_logic;  draw_score_ready : in std_logic;  timer_1_time : out 
         std_logic_vector (7 downto 0);  timer_1_start, timer_1_reset : out 
         std_logic;  timer_1_done : in std_logic;  timer_2_time : out 
         std_logic_vector (7 downto 0);  timer_2_start, timer_2_reset : out 
         std_logic;  timer_2_done : in std_logic;  inputs : in std_logic_vector
         (7 downto 0));

end controller;

architecture synthesised of controller is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component na310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
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
   
   component buf40
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component SYNOP_BASIC_FF
      port( next_state, clocked_on, force_00, force_01, force_10, force_11 : in
            std_logic;  Q, QN : out std_logic);
   end component;
   
   component dfr11
      port( D, R, CK : in std_logic;  Q : out std_logic);
   end component;
   
   signal cur_state_5_port, cur_state_4_port, cur_state_3_port, 
      cur_state_2_port, cur_state_1_port, cur_state_0_port, next_state_5_port, 
      next_state_4_port, next_state_3_port, next_state_2_port, 
      next_state_1_port, next_state_0_port, n483, n482, n479, n478, n475, n474,
      n471, n470, n467, n463, n462, n459, n458, n455, n451, n450, n447, n446, 
      n443, n439, n438, n435, n430, n425, n424, n421, n420, n417, n416, n409, 
      n406, n405, n401, n392, n391, n389, n387, n386, n384, n382, n381, n379, 
      n376, n373, n369, n360, n357, n356, n352, n349, n348, n345, n344, n341, 
      n340, n337, n336, n333, n332, n329, n328, n325, n485, n486, n487, n488, 
      n489, n490, n491, n492, n493, n494, n495, n496, n497, n498, n499, n500, 
      n501, n502, n503, n504, n505, n506, n507, n508, n509, n510, n511, n512, 
      n513, n514, n515, n516, n517, n518, n519, n520, n521, n522, n523, n524, 
      n525, n526, n527, n528, n529, n530, n531, n532, n533, n534, n535, n536, 
      n537, n538, n539, n540, n541, n542, n543, n544, n545, n546, n547, n548, 
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
      n897, n898, n899, n_1000, n_1001, n_1002, n_1003, n_1004, n_1005, n_1006,
      n_1007, n_1008, n_1009, n_1010, n_1011, n_1012, n_1013, n_1014, n_1015, 
      n_1016, n_1017, n_1018, n_1019, n_1020, n_1021, n_1022, n_1023, n_1024, 
      n_1025, n_1026, n_1027, n_1028, n_1029, n_1030, n_1031, n_1032, n_1033, 
      n_1034, n_1035, n_1036, n_1037 : std_logic;

begin
   
   cur_state_reg_0_inst : dfr11 port map( D => next_state_0_port, R => rst, CK 
                           => clk, Q => cur_state_0_port);
   cur_state_reg_1_inst : dfr11 port map( D => next_state_1_port, R => rst, CK 
                           => clk, Q => cur_state_1_port);
   cur_state_reg_3_inst : dfr11 port map( D => next_state_3_port, R => rst, CK 
                           => clk, Q => cur_state_3_port);
   cur_state_reg_5_inst : dfr11 port map( D => next_state_5_port, R => rst, CK 
                           => clk, Q => cur_state_5_port);
   cur_state_reg_4_inst : dfr11 port map( D => next_state_4_port, R => rst, CK 
                           => clk, Q => cur_state_4_port);
   cur_state_reg_2_inst : dfr11 port map( D => next_state_2_port, R => rst, CK 
                           => clk, Q => cur_state_2_port);
   lut_x(2) <= '0';
   lut_rot(0) <= '0';
   lut_rot(1) <= '0';
   timer_1_time(7) <= '0';
   timer_1_time(6) <= '0';
   timer_1_time(1) <= '0';
   timer_1_time(0) <= '0';
   draw_score_draw <= '0';
   timer_2_time(0) <= '0';
   timer_2_time(1) <= '0';
   timer_2_time(6) <= '0';
   timer_2_time(7) <= '0';
   next_state_reg_0_inst : SYNOP_BASIC_FF port map( next_state => n714, 
                           clocked_on => n715, force_00 => n804, force_01 => 
                           n328, force_10 => n329, force_11 => n805, Q => 
                           next_state_0_port, QN => n_1000);
   next_state_reg_1_inst : SYNOP_BASIC_FF port map( next_state => n716, 
                           clocked_on => n717, force_00 => n806, force_01 => 
                           n332, force_10 => n333, force_11 => n807, Q => 
                           next_state_1_port, QN => n_1001);
   next_state_reg_3_inst : SYNOP_BASIC_FF port map( next_state => n718, 
                           clocked_on => n719, force_00 => n808, force_01 => 
                           n336, force_10 => n337, force_11 => n809, Q => 
                           next_state_3_port, QN => n_1002);
   next_state_reg_5_inst : SYNOP_BASIC_FF port map( next_state => n720, 
                           clocked_on => n721, force_00 => n810, force_01 => 
                           n340, force_10 => n341, force_11 => n811, Q => 
                           next_state_5_port, QN => n_1003);
   next_state_reg_4_inst : SYNOP_BASIC_FF port map( next_state => n722, 
                           clocked_on => n723, force_00 => n812, force_01 => 
                           n344, force_10 => n345, force_11 => n813, Q => 
                           next_state_4_port, QN => n_1004);
   next_state_reg_2_inst : SYNOP_BASIC_FF port map( next_state => n724, 
                           clocked_on => n725, force_00 => n814, force_01 => 
                           n348, force_10 => n349, force_11 => n815, Q => 
                           next_state_2_port, QN => n_1005);
   timer_2_start_reg : SYNOP_BASIC_FF port map( next_state => n726, clocked_on 
                           => n727, force_00 => n816, force_01 => n352, 
                           force_10 => n890, force_11 => n817, Q => 
                           timer_2_start, QN => n_1006);
   draw_erase_draw_reg : SYNOP_BASIC_FF port map( next_state => n728, 
                           clocked_on => n729, force_00 => n818, force_01 => 
                           n356, force_10 => n357, force_11 => n819, Q => 
                           draw_erase_draw, QN => n_1007);
   check_start_reg : SYNOP_BASIC_FF port map( next_state => n730, clocked_on =>
                           n731, force_00 => n820, force_01 => n494, force_10 
                           => n360, force_11 => n821, Q => check_start, QN => 
                           n_1008);
   timer_2_time_reg_5_inst : SYNOP_BASIC_FF port map( next_state => n732, 
                           clocked_on => n733, force_00 => n822, force_01 => 
                           n494, force_10 => n369, force_11 => n823, Q => 
                           timer_2_time(5), QN => n_1009);
   timer_2_time_reg_4_inst : SYNOP_BASIC_FF port map( next_state => n734, 
                           clocked_on => n735, force_00 => n824, force_01 => 
                           n494, force_10 => n493, force_11 => n825, Q => 
                           timer_2_time(4), QN => n_1010);
   timer_2_time_reg_3_inst : SYNOP_BASIC_FF port map( next_state => n736, 
                           clocked_on => n737, force_00 => n826, force_01 => 
                           n494, force_10 => n493, force_11 => n827, Q => 
                           timer_2_time(3), QN => n_1011);
   timer_2_time_reg_2_inst : SYNOP_BASIC_FF port map( next_state => n738, 
                           clocked_on => n739, force_00 => n828, force_01 => 
                           n494, force_10 => n369, force_11 => n829, Q => 
                           timer_2_time(2), QN => n_1012);
   clear_shift_start_reg : SYNOP_BASIC_FF port map( next_state => n740, 
                           clocked_on => n741, force_00 => n830, force_01 => 
                           n494, force_10 => n373, force_11 => n831, Q => 
                           clear_shift_start, QN => n_1013);
   new_piece_reg : SYNOP_BASIC_FF port map( next_state => n742, clocked_on => 
                           n743, force_00 => n832, force_01 => n376, force_10 
                           => n891, force_11 => n833, Q => new_piece, QN => 
                           n_1014);
   cur_piece_reg_2_inst : SYNOP_BASIC_FF port map( next_state => n744, 
                           clocked_on => n745, force_00 => n834, force_01 => 
                           n381, force_10 => n382, force_11 => n835, Q => n379,
                           QN => n_1015);
   cur_piece_reg_1_inst : SYNOP_BASIC_FF port map( next_state => n746, 
                           clocked_on => n747, force_00 => n836, force_01 => 
                           n386, force_10 => n387, force_11 => n837, Q => n384,
                           QN => n_1016);
   cur_piece_reg_0_inst : SYNOP_BASIC_FF port map( next_state => n748, 
                           clocked_on => n749, force_00 => n838, force_01 => 
                           n391, force_10 => n392, force_11 => n839, Q => n389,
                           QN => n_1017);
   timer_1_time_reg_5_inst : SYNOP_BASIC_FF port map( next_state => n750, 
                           clocked_on => n751, force_00 => n840, force_01 => 
                           n494, force_10 => n491, force_11 => n841, Q => 
                           timer_1_time(5), QN => n_1018);
   timer_1_time_reg_4_inst : SYNOP_BASIC_FF port map( next_state => n752, 
                           clocked_on => n753, force_00 => n842, force_01 => 
                           n494, force_10 => n894, force_11 => n843, Q => 
                           timer_1_time(4), QN => n_1019);
   timer_1_time_reg_3_inst : SYNOP_BASIC_FF port map( next_state => n754, 
                           clocked_on => n755, force_00 => n844, force_01 => 
                           n494, force_10 => n491, force_11 => n845, Q => 
                           timer_1_time(3), QN => n_1020);
   timer_1_time_reg_2_inst : SYNOP_BASIC_FF port map( next_state => n756, 
                           clocked_on => n757, force_00 => n846, force_01 => 
                           n494, force_10 => n894, force_11 => n847, Q => 
                           timer_1_time(2), QN => n_1021);
   timer_1_start_reg : SYNOP_BASIC_FF port map( next_state => n758, clocked_on 
                           => n759, force_00 => n848, force_01 => n405, 
                           force_10 => n406, force_11 => n849, Q => 
                           timer_1_start, QN => n_1022);
   draw_erase_start_reg : SYNOP_BASIC_FF port map( next_state => n760, 
                           clocked_on => n761, force_00 => n850, force_01 => 
                           n409, force_10 => n892, force_11 => n851, Q => 
                           draw_erase_start, QN => n_1023);
   lut_start_reg : SYNOP_BASIC_FF port map( next_state => n762, clocked_on => 
                           n763, force_00 => n852, force_01 => n899, force_10 
                           => n492, force_11 => n853, Q => lut_start, QN => 
                           n_1024);
   lut_piece_type_reg_0_inst : SYNOP_BASIC_FF port map( next_state => n764, 
                           clocked_on => n765, force_00 => n854, force_01 => 
                           n416, force_10 => n417, force_11 => n855, Q => 
                           lut_piece_type(0), QN => n_1025);
   lut_piece_type_reg_1_inst : SYNOP_BASIC_FF port map( next_state => n766, 
                           clocked_on => n767, force_00 => n856, force_01 => 
                           n420, force_10 => n421, force_11 => n857, Q => 
                           lut_piece_type(1), QN => n_1026);
   lut_piece_type_reg_2_inst : SYNOP_BASIC_FF port map( next_state => n768, 
                           clocked_on => n769, force_00 => n858, force_01 => 
                           n424, force_10 => n425, force_11 => n859, Q => 
                           lut_piece_type(2), QN => n_1027);
   lut_x_reg_1_inst : SYNOP_BASIC_FF port map( next_state => n770, clocked_on 
                           => n771, force_00 => n860, force_01 => n430, 
                           force_10 => n492, force_11 => n861, Q => lut_x(1), 
                           QN => n_1028);
   lut_x_reg_0_inst : SYNOP_BASIC_FF port map( next_state => n772, clocked_on 
                           => n773, force_00 => n862, force_01 => n430, 
                           force_10 => n893, force_11 => n863, Q => lut_x(0), 
                           QN => n_1029);
   cur_y_reg_0_inst : SYNOP_BASIC_FF port map( next_state => n774, clocked_on 
                           => n775, force_00 => n864, force_01 => n898, 
                           force_10 => n435, force_11 => n865, Q => n709, QN =>
                           n490);
   new_y_reg_1_inst : SYNOP_BASIC_FF port map( next_state => n776, clocked_on 
                           => n777, force_00 => n866, force_01 => n438, 
                           force_10 => n439, force_11 => n867, Q => n713, QN =>
                           n488);
   cur_y_reg_1_inst : SYNOP_BASIC_FF port map( next_state => n778, clocked_on 
                           => n779, force_00 => n868, force_01 => n897, 
                           force_10 => n443, force_11 => n869, Q => n712, QN =>
                           n_1030);
   lut_y_reg_1_inst : SYNOP_BASIC_FF port map( next_state => n780, clocked_on 
                           => n781, force_00 => n870, force_01 => n446, 
                           force_10 => n447, force_11 => n871, Q => lut_y(1), 
                           QN => n_1031);
   new_y_reg_2_inst : SYNOP_BASIC_FF port map( next_state => n782, clocked_on 
                           => n783, force_00 => n872, force_01 => n450, 
                           force_10 => n451, force_11 => n873, Q => n710, QN =>
                           n487);
   cur_y_reg_2_inst : SYNOP_BASIC_FF port map( next_state => n784, clocked_on 
                           => n785, force_00 => n874, force_01 => n896, 
                           force_10 => n455, force_11 => n875, Q => n711, QN =>
                           n485);
   lut_y_reg_2_inst : SYNOP_BASIC_FF port map( next_state => n786, clocked_on 
                           => n787, force_00 => n876, force_01 => n458, 
                           force_10 => n459, force_11 => n877, Q => lut_y(2), 
                           QN => n_1032);
   new_y_reg_3_inst : SYNOP_BASIC_FF port map( next_state => n788, clocked_on 
                           => n789, force_00 => n878, force_01 => n462, 
                           force_10 => n463, force_11 => n879, Q => n708, QN =>
                           n486);
   cur_y_reg_3_inst : SYNOP_BASIC_FF port map( next_state => n790, clocked_on 
                           => n791, force_00 => n880, force_01 => n895, 
                           force_10 => n467, force_11 => n881, Q => n707, QN =>
                           n_1033);
   lut_y_reg_3_inst : SYNOP_BASIC_FF port map( next_state => n792, clocked_on 
                           => n793, force_00 => n882, force_01 => n470, 
                           force_10 => n471, force_11 => n883, Q => lut_y(3), 
                           QN => n_1034);
   new_y_reg_0_inst : SYNOP_BASIC_FF port map( next_state => n794, clocked_on 
                           => n795, force_00 => n884, force_01 => n474, 
                           force_10 => n475, force_11 => n885, Q => n706, QN =>
                           n489);
   lut_y_reg_0_inst : SYNOP_BASIC_FF port map( next_state => n796, clocked_on 
                           => n797, force_00 => n886, force_01 => n478, 
                           force_10 => n479, force_11 => n887, Q => lut_y(0), 
                           QN => n_1035);
   timer_1_reset_reg : SYNOP_BASIC_FF port map( next_state => n798, clocked_on 
                           => n799, force_00 => n888, force_01 => n482, 
                           force_10 => n483, force_11 => n889, Q => 
                           timer_1_reset, QN => n_1036);
   timer_2_reset_reg : SYNOP_BASIC_FF port map( next_state => n800, clocked_on 
                           => n801, force_00 => n802, force_01 => n325, 
                           force_10 => n483, force_11 => n803, Q => 
                           timer_2_reset, QN => n_1037);
   U487 : iv110 port map( A => n681, Y => n491);
   U488 : iv110 port map( A => n679, Y => n492);
   U489 : na210 port map( A => n507, B => n536, Y => n493);
   U490 : buf40 port map( A => n401, Y => n494);
   U491 : na210 port map( A => n495, B => n496, Y => n899);
   U492 : na210 port map( A => lut_ready, B => n497, Y => n496);
   U493 : na210 port map( A => n498, B => n499, Y => n497);
   U494 : iv110 port map( A => n430, Y => n495);
   U495 : na210 port map( A => n500, B => n501, Y => n898);
   U496 : na210 port map( A => n502, B => n489, Y => n501);
   U497 : na210 port map( A => n500, B => n503, Y => n897);
   U498 : na210 port map( A => n502, B => n488, Y => n503);
   U499 : na210 port map( A => n500, B => n504, Y => n896);
   U500 : na210 port map( A => n502, B => n487, Y => n504);
   U501 : na210 port map( A => n500, B => n505, Y => n895);
   U502 : na210 port map( A => n502, B => n486, Y => n505);
   U503 : na210 port map( A => n502, B => n506, Y => n500);
   U504 : iv110 port map( A => n507, Y => n483);
   U505 : na310 port map( A => n508, B => n509, C => n510, Y => n482);
   U506 : iv110 port map( A => n511, Y => n510);
   U507 : no210 port map( A => n479, B => n512, Y => n478);
   U508 : na210 port map( A => n513, B => n514, Y => n479);
   U509 : na210 port map( A => n709, B => n515, Y => n514);
   U510 : na210 port map( A => n706, B => n516, Y => n513);
   U511 : no210 port map( A => n471, B => n512, Y => n470);
   U512 : na210 port map( A => n517, B => n518, Y => n471);
   U513 : na210 port map( A => n707, B => n515, Y => n518);
   U514 : na210 port map( A => n708, B => n516, Y => n517);
   U515 : no210 port map( A => n486, B => n519, Y => n467);
   U516 : iv110 port map( A => n520, Y => n463);
   U517 : na210 port map( A => n521, B => n522, Y => n520);
   U518 : no210 port map( A => n523, B => n521, Y => n462);
   U519 : ex210 port map( A => n707, B => n524, Y => n521);
   U520 : no210 port map( A => n525, B => n485, Y => n524);
   U521 : no210 port map( A => n459, B => n512, Y => n458);
   U522 : na210 port map( A => n526, B => n527, Y => n459);
   U523 : na210 port map( A => n711, B => n515, Y => n527);
   U524 : na210 port map( A => n710, B => n516, Y => n526);
   U525 : no210 port map( A => n519, B => n487, Y => n455);
   U526 : iv110 port map( A => n528, Y => n451);
   U527 : na210 port map( A => n529, B => n522, Y => n528);
   U528 : no210 port map( A => n523, B => n529, Y => n450);
   U529 : ex210 port map( A => n525, B => n485, Y => n529);
   U530 : na210 port map( A => n712, B => n709, Y => n525);
   U531 : no210 port map( A => n447, B => n512, Y => n446);
   U532 : na210 port map( A => n530, B => n531, Y => n447);
   U533 : na210 port map( A => n712, B => n515, Y => n531);
   U534 : na210 port map( A => n713, B => n516, Y => n530);
   U535 : no210 port map( A => n519, B => n488, Y => n443);
   U536 : mu111 port map( A => n474, B => n475, S => n712, Y => n439);
   U537 : mu111 port map( A => n475, B => n474, S => n712, Y => n438);
   U538 : no210 port map( A => n523, B => n490, Y => n474);
   U539 : no210 port map( A => n523, B => n709, Y => n475);
   U540 : iv110 port map( A => n522, Y => n523);
   U541 : no310 port map( A => n532, B => n533, C => n534, Y => n522);
   U542 : no210 port map( A => n489, B => n519, Y => n435);
   U543 : na210 port map( A => n535, B => n502, Y => n519);
   U544 : na210 port map( A => n536, B => n537, Y => n502);
   U545 : iv110 port map( A => n538, Y => n537);
   U546 : no210 port map( A => n506, B => lut_error, Y => n538);
   U547 : iv110 port map( A => n506, Y => n535);
   U548 : na210 port map( A => n539, B => n540, Y => n506);
   U549 : no210 port map( A => n512, B => n893, Y => n430);
   U550 : no210 port map( A => n425, B => n512, Y => n424);
   U551 : iv110 port map( A => n541, Y => n425);
   U552 : na210 port map( A => n893, B => n379, Y => n541);
   U553 : no210 port map( A => n421, B => n512, Y => n420);
   U554 : iv110 port map( A => n542, Y => n421);
   U555 : na210 port map( A => n893, B => n384, Y => n542);
   U556 : no210 port map( A => n417, B => n512, Y => n416);
   U557 : no210 port map( A => n494, B => n893, Y => n512);
   U558 : iv110 port map( A => n543, Y => n417);
   U559 : na210 port map( A => n893, B => n389, Y => n543);
   U560 : no210 port map( A => n892, B => n544, Y => n409);
   U561 : no210 port map( A => n545, B => n546, Y => n544);
   U562 : no210 port map( A => n547, B => n548, Y => n545);
   U563 : iv110 port map( A => n549, Y => n405);
   U564 : no210 port map( A => n550, B => n352, Y => n549);
   U565 : no210 port map( A => n392, B => n551, Y => n391);
   U566 : no210 port map( A => n552, B => n553, Y => n392);
   U567 : iv110 port map( A => next_piece(0), Y => n552);
   U568 : no210 port map( A => n387, B => n551, Y => n386);
   U569 : no210 port map( A => n554, B => n553, Y => n387);
   U570 : iv110 port map( A => next_piece(1), Y => n554);
   U571 : no210 port map( A => n382, B => n551, Y => n381);
   U572 : no210 port map( A => n555, B => n553, Y => n382);
   U573 : iv110 port map( A => next_piece(2), Y => n555);
   U574 : no210 port map( A => n891, B => n556, Y => n376);
   U575 : no210 port map( A => n557, B => n558, Y => n556);
   U576 : iv110 port map( A => n551, Y => n558);
   U577 : no210 port map( A => n891, B => n494, Y => n551);
   U578 : iv110 port map( A => n553, Y => n891);
   U579 : no210 port map( A => n357, B => n559, Y => n356);
   U580 : no210 port map( A => n892, B => n494, Y => n559);
   U581 : na210 port map( A => n507, B => n560, Y => n352);
   U582 : no210 port map( A => n349, B => n561, Y => n348);
   U583 : na310 port map( A => n562, B => n563, C => n564, Y => n349);
   U584 : no310 port map( A => n565, B => n566, C => n567, Y => n564);
   U585 : no210 port map( A => n568, B => n569, Y => n567);
   U586 : no210 port map( A => n570, B => n571, Y => n568);
   U587 : no310 port map( A => n572, B => lut_error, C => n573, Y => n566);
   U588 : na310 port map( A => n499, B => n574, C => n575, Y => n565);
   U589 : na310 port map( A => n576, B => n577, C => n578, Y => n575);
   U590 : na310 port map( A => n579, B => n580, C => n581, Y => n577);
   U591 : no310 port map( A => n582, B => inputs(5), C => inputs(4), Y => n581)
                           ;
   U592 : iv110 port map( A => n583, Y => n582);
   U593 : no210 port map( A => inputs(7), B => inputs(6), Y => n583);
   U594 : no210 port map( A => inputs(3), B => inputs(2), Y => n580);
   U595 : no210 port map( A => inputs(1), B => inputs(0), Y => n579);
   U596 : iv110 port map( A => n406, Y => n574);
   U597 : no210 port map( A => n584, B => n585, Y => n406);
   U598 : na210 port map( A => n586, B => n539, Y => n499);
   U599 : no210 port map( A => n587, B => n588, Y => n563);
   U600 : no210 port map( A => n589, B => n590, Y => n562);
   U601 : mu111 port map( A => n357, B => n591, S => n592, Y => n590);
   U602 : no210 port map( A => n532, B => n534, Y => n591);
   U603 : iv110 port map( A => n593, Y => n357);
   U604 : no210 port map( A => n345, B => n561, Y => n344);
   U605 : iv110 port map( A => n594, Y => n345);
   U606 : no310 port map( A => n595, B => n596, C => n597, Y => n594);
   U607 : na310 port map( A => n598, B => n599, C => n600, Y => n597);
   U608 : na210 port map( A => n601, B => n602, Y => n600);
   U609 : iv110 port map( A => clear_shift_ready, Y => n601);
   U610 : no210 port map( A => n516, B => n373, Y => n598);
   U611 : no210 port map( A => n603, B => n604, Y => n373);
   U612 : iv110 port map( A => n605, Y => n595);
   U613 : no210 port map( A => n606, B => n607, Y => n605);
   U614 : no210 port map( A => draw_erase_ready, B => n548, Y => n607);
   U615 : no210 port map( A => n608, B => n609, Y => n606);
   U616 : iv110 port map( A => timer_1_done, Y => n609);
   U617 : no210 port map( A => n341, B => n561, Y => n340);
   U618 : na310 port map( A => n610, B => n611, C => n612, Y => n341);
   U619 : no310 port map( A => n613, B => n614, C => n615, Y => n612);
   U620 : no210 port map( A => timer_2_done, B => n616, Y => n615);
   U621 : no210 port map( A => n617, B => n618, Y => n613);
   U622 : na210 port map( A => n619, B => draw_erase_ready, Y => n611);
   U623 : iv110 port map( A => n620, Y => n610);
   U624 : no210 port map( A => n337, B => n561, Y => n336);
   U625 : na310 port map( A => n621, B => n622, C => n623, Y => n337);
   U626 : no310 port map( A => n624, B => n625, C => n626, Y => n623);
   U627 : no210 port map( A => n616, B => n627, Y => n626);
   U628 : iv110 port map( A => timer_2_done, Y => n627);
   U629 : iv110 port map( A => n628, Y => n616);
   U630 : no310 port map( A => n618, B => cur_state_0_port, C => n629, Y => 
                           n625);
   U631 : na310 port map( A => n584, B => n507, C => n599, Y => n624);
   U632 : no310 port map( A => n630, B => n631, C => n632, Y => n622);
   U633 : no210 port map( A => cur_state_2_port, B => n603, Y => n632);
   U634 : no210 port map( A => n573, B => n572, Y => n631);
   U635 : no210 port map( A => n533, B => n633, Y => n630);
   U636 : iv110 port map( A => n634, Y => n633);
   U637 : no210 port map( A => n588, B => n635, Y => n621);
   U638 : na210 port map( A => n636, B => n637, Y => n588);
   U639 : na310 port map( A => n540, B => n547, C => n638, Y => n637);
   U640 : iv110 port map( A => n573, Y => n540);
   U641 : na210 port map( A => n639, B => n634, Y => n636);
   U642 : no210 port map( A => n333, B => n561, Y => n332);
   U643 : na310 port map( A => n640, B => n641, C => n642, Y => n333);
   U644 : no310 port map( A => n643, B => n589, C => n644, Y => n642);
   U645 : na310 port map( A => n509, B => n507, C => n645, Y => n589);
   U646 : no210 port map( A => n614, B => n646, Y => n645);
   U647 : no210 port map( A => n532, B => n647, Y => n646);
   U648 : no210 port map( A => n608, B => timer_1_done, Y => n614);
   U649 : na210 port map( A => n648, B => n649, Y => n643);
   U650 : na210 port map( A => n539, B => n592, Y => n649);
   U651 : no210 port map( A => n572, B => cur_state_3_port, Y => n539);
   U652 : na210 port map( A => lut_ready, B => n650, Y => n648);
   U653 : no310 port map( A => n511, B => n892, C => n651, Y => n641);
   U654 : na210 port map( A => n652, B => n593, Y => n892);
   U655 : iv110 port map( A => n653, Y => n652);
   U656 : no210 port map( A => n654, B => n532, Y => n653);
   U657 : no210 port map( A => n890, B => n655, Y => n640);
   U658 : no210 port map( A => check_empty, B => n656, Y => n655);
   U659 : no210 port map( A => n329, B => n561, Y => n328);
   U660 : iv110 port map( A => n657, Y => n561);
   U661 : na310 port map( A => n658, B => n659, C => n660, Y => n657);
   U662 : no310 port map( A => n661, B => n635, C => n596, Y => n660);
   U663 : na310 port map( A => n662, B => n663, C => n498, Y => n596);
   U664 : iv110 port map( A => n650, Y => n498);
   U665 : na210 port map( A => n570, B => n664, Y => n663);
   U666 : na210 port map( A => n665, B => cur_state_4_port, Y => n662);
   U667 : na310 port map( A => n666, B => n667, C => n668, Y => n635);
   U668 : no310 port map( A => n669, B => n360, C => n511, Y => n668);
   U669 : no210 port map( A => n617, B => n670, Y => n511);
   U670 : no210 port map( A => n618, B => n532, Y => n360);
   U671 : na210 port map( A => n671, B => n571, Y => n667);
   U672 : no210 port map( A => n672, B => n890, Y => n666);
   U673 : no310 port map( A => n585, B => cur_state_0_port, C => n673, Y => 
                           n890);
   U674 : na210 port map( A => n671, B => cur_state_5_port, Y => n673);
   U675 : na310 port map( A => n603, B => n553, C => n674, Y => n661);
   U676 : na210 port map( A => n675, B => n676, Y => n674);
   U677 : na210 port map( A => n617, B => n677, Y => n676);
   U678 : iv110 port map( A => n576, Y => n617);
   U679 : na310 port map( A => cur_state_1_port, B => n570, C => n678, Y => 
                           n553);
   U680 : no310 port map( A => n494, B => n894, C => n893, Y => n659);
   U681 : iv110 port map( A => n679, Y => n893);
   U682 : no210 port map( A => n515, B => n516, Y => n679);
   U683 : na210 port map( A => n599, B => n680, Y => n515);
   U684 : na210 port map( A => n675, B => n570, Y => n680);
   U685 : iv110 port map( A => n681, Y => n894);
   U686 : no310 port map( A => n550, B => n369, C => n682, Y => n681);
   U687 : no210 port map( A => n584, B => cur_state_3_port, Y => n682);
   U688 : na210 port map( A => n678, B => n665, Y => n584);
   U689 : na210 port map( A => n507, B => n536, Y => n369);
   U690 : na210 port map( A => n675, B => n634, Y => n507);
   U691 : no310 port map( A => n602, B => n557, C => n651, Y => n658);
   U692 : no210 port map( A => n618, B => n683, Y => n651);
   U693 : no210 port map( A => n576, B => n684, Y => n683);
   U694 : no210 port map( A => cur_state_0_port, B => cur_state_3_port, Y => 
                           n684);
   U695 : iv110 port map( A => n578, Y => n618);
   U696 : no210 port map( A => n604, B => n534, Y => n578);
   U697 : na310 port map( A => n685, B => n686, C => n687, Y => n329);
   U698 : no210 port map( A => n688, B => n689, Y => n687);
   U699 : na210 port map( A => n690, B => n599, Y => n689);
   U700 : na210 port map( A => n571, B => n691, Y => n599);
   U701 : na310 port map( A => n671, B => n571, C => check_ready, Y => n690);
   U702 : iv110 port map( A => n677, Y => n571);
   U703 : na310 port map( A => n509, B => n593, C => n608, Y => n688);
   U704 : na210 port map( A => n576, B => n675, Y => n608);
   U705 : no210 port map( A => n629, B => n692, Y => n576);
   U706 : na210 port map( A => n669, B => cur_state_4_port, Y => n593);
   U707 : no310 port map( A => n620, B => n546, C => n587, Y => n686);
   U708 : iv110 port map( A => n693, Y => n587);
   U709 : no310 port map( A => n557, B => n516, C => n628, Y => n693);
   U710 : no210 port map( A => n677, B => n647, Y => n628);
   U711 : na310 port map( A => n692, B => n694, C => cur_state_3_port, Y => 
                           n677);
   U712 : no210 port map( A => n695, B => n569, Y => n516);
   U713 : no210 port map( A => n647, B => n695, Y => n557);
   U714 : iv110 port map( A => n675, Y => n647);
   U715 : no210 port map( A => n604, B => cur_state_1_port, Y => n675);
   U716 : na210 port map( A => n560, B => n696, Y => n546);
   U717 : na310 port map( A => n665, B => n664, C => draw_erase_ready, Y => 
                           n696);
   U718 : iv110 port map( A => n572, Y => n665);
   U719 : iv110 port map( A => n494, Y => n560);
   U720 : no210 port map( A => n670, B => n695, Y => n401);
   U721 : na310 port map( A => n697, B => n508, C => n698, Y => n620);
   U722 : na210 port map( A => check_empty, B => n672, Y => n698);
   U723 : iv110 port map( A => n656, Y => n672);
   U724 : na210 port map( A => n671, B => n634, Y => n656);
   U725 : iv110 port map( A => n550, Y => n508);
   U726 : no310 port map( A => n670, B => cur_state_0_port, C => n629, Y => 
                           n550);
   U727 : na210 port map( A => cur_state_5_port, B => n585, Y => n629);
   U728 : na210 port map( A => n638, B => n678, Y => n697);
   U729 : no210 port map( A => n644, B => n699, Y => n685);
   U730 : mu111 port map( A => n650, B => n700, S => lut_ready, Y => n699);
   U731 : no210 port map( A => n572, B => n604, Y => n700);
   U732 : iv110 port map( A => n586, Y => n604);
   U733 : na210 port map( A => n701, B => n702, Y => n650);
   U734 : na210 port map( A => n634, B => n691, Y => n702);
   U735 : na210 port map( A => n569, B => n654, Y => n691);
   U736 : iv110 port map( A => n639, Y => n569);
   U737 : na210 port map( A => n570, B => n639, Y => n701);
   U738 : no210 port map( A => n573, B => cur_state_1_port, Y => n639);
   U739 : na310 port map( A => n703, B => n536, C => n704, Y => n644);
   U740 : na210 port map( A => n619, B => n547, Y => n704);
   U741 : iv110 port map( A => draw_erase_ready, Y => n547);
   U742 : iv110 port map( A => n548, Y => n619);
   U743 : na210 port map( A => n638, B => n705, Y => n548);
   U744 : na210 port map( A => n533, B => n573, Y => n705);
   U745 : na210 port map( A => cur_state_2_port, B => cur_state_4_port, Y => 
                           n573);
   U746 : iv110 port map( A => n603, Y => n638);
   U747 : na210 port map( A => cur_state_1_port, B => n634, Y => n603);
   U748 : no310 port map( A => n692, B => cur_state_5_port, C => n585, Y => 
                           n634);
   U749 : na210 port map( A => n671, B => n570, Y => n536);
   U750 : iv110 port map( A => n532, Y => n570);
   U751 : na310 port map( A => n585, B => n694, C => cur_state_0_port, Y => 
                           n532);
   U752 : iv110 port map( A => n670, Y => n671);
   U753 : na210 port map( A => n678, B => n534, Y => n670);
   U754 : no210 port map( A => cur_state_2_port, B => cur_state_4_port, Y => 
                           n678);
   U755 : na210 port map( A => clear_shift_ready, B => n602, Y => n703);
   U756 : no210 port map( A => n654, B => n695, Y => n602);
   U757 : na310 port map( A => n585, B => n694, C => n692, Y => n695);
   U758 : na210 port map( A => n664, B => n534, Y => n654);
   U759 : iv110 port map( A => cur_state_1_port, Y => n534);
   U760 : iv110 port map( A => n533, Y => n664);
   U761 : na210 port map( A => cur_state_4_port, B => n592, Y => n533);
   U762 : iv110 port map( A => n509, Y => n325);
   U763 : na210 port map( A => n669, B => n586, Y => n509);
   U764 : no210 port map( A => n592, B => cur_state_4_port, Y => n586);
   U765 : iv110 port map( A => cur_state_2_port, Y => n592);
   U766 : no210 port map( A => n572, B => n585, Y => n669);
   U767 : iv110 port map( A => cur_state_3_port, Y => n585);
   U768 : na310 port map( A => n692, B => n694, C => cur_state_1_port, Y => 
                           n572);
   U769 : iv110 port map( A => cur_state_5_port, Y => n694);
   U770 : iv110 port map( A => cur_state_0_port, Y => n692);
   n714 <= '0';
   n715 <= '0';
   n716 <= '0';
   n717 <= '0';
   n718 <= '0';
   n719 <= '0';
   n720 <= '0';
   n721 <= '0';
   n722 <= '0';
   n723 <= '0';
   n724 <= '0';
   n725 <= '0';
   n726 <= '0';
   n727 <= '0';
   n728 <= '0';
   n729 <= '0';
   n730 <= '0';
   n731 <= '0';
   n732 <= '0';
   n733 <= '0';
   n734 <= '0';
   n735 <= '0';
   n736 <= '0';
   n737 <= '0';
   n738 <= '0';
   n739 <= '0';
   n740 <= '0';
   n741 <= '0';
   n742 <= '0';
   n743 <= '0';
   n744 <= '0';
   n745 <= '0';
   n746 <= '0';
   n747 <= '0';
   n748 <= '0';
   n749 <= '0';
   n750 <= '0';
   n751 <= '0';
   n752 <= '0';
   n753 <= '0';
   n754 <= '0';
   n755 <= '0';
   n756 <= '0';
   n757 <= '0';
   n758 <= '0';
   n759 <= '0';
   n760 <= '0';
   n761 <= '0';
   n762 <= '0';
   n763 <= '0';
   n764 <= '0';
   n765 <= '0';
   n766 <= '0';
   n767 <= '0';
   n768 <= '0';
   n769 <= '0';
   n770 <= '0';
   n771 <= '0';
   n772 <= '0';
   n773 <= '0';
   n774 <= '0';
   n775 <= '0';
   n776 <= '0';
   n777 <= '0';
   n778 <= '0';
   n779 <= '0';
   n780 <= '0';
   n781 <= '0';
   n782 <= '0';
   n783 <= '0';
   n784 <= '0';
   n785 <= '0';
   n786 <= '0';
   n787 <= '0';
   n788 <= '0';
   n789 <= '0';
   n790 <= '0';
   n791 <= '0';
   n792 <= '0';
   n793 <= '0';
   n794 <= '0';
   n795 <= '0';
   n796 <= '0';
   n797 <= '0';
   n798 <= '0';
   n799 <= '0';
   n800 <= '0';
   n801 <= '0';
   n802 <= '0';
   n803 <= '0';
   n804 <= '0';
   n805 <= '0';
   n806 <= '0';
   n807 <= '0';
   n808 <= '0';
   n809 <= '0';
   n810 <= '0';
   n811 <= '0';
   n812 <= '0';
   n813 <= '0';
   n814 <= '0';
   n815 <= '0';
   n816 <= '0';
   n817 <= '0';
   n818 <= '0';
   n819 <= '0';
   n820 <= '0';
   n821 <= '0';
   n822 <= '0';
   n823 <= '0';
   n824 <= '0';
   n825 <= '0';
   n826 <= '0';
   n827 <= '0';
   n828 <= '0';
   n829 <= '0';
   n830 <= '0';
   n831 <= '0';
   n832 <= '0';
   n833 <= '0';
   n834 <= '0';
   n835 <= '0';
   n836 <= '0';
   n837 <= '0';
   n838 <= '0';
   n839 <= '0';
   n840 <= '0';
   n841 <= '0';
   n842 <= '0';
   n843 <= '0';
   n844 <= '0';
   n845 <= '0';
   n846 <= '0';
   n847 <= '0';
   n848 <= '0';
   n849 <= '0';
   n850 <= '0';
   n851 <= '0';
   n852 <= '0';
   n853 <= '0';
   n854 <= '0';
   n855 <= '0';
   n856 <= '0';
   n857 <= '0';
   n858 <= '0';
   n859 <= '0';
   n860 <= '0';
   n861 <= '0';
   n862 <= '0';
   n863 <= '0';
   n864 <= '0';
   n865 <= '0';
   n866 <= '0';
   n867 <= '0';
   n868 <= '0';
   n869 <= '0';
   n870 <= '0';
   n871 <= '0';
   n872 <= '0';
   n873 <= '0';
   n874 <= '0';
   n875 <= '0';
   n876 <= '0';
   n877 <= '0';
   n878 <= '0';
   n879 <= '0';
   n880 <= '0';
   n881 <= '0';
   n882 <= '0';
   n883 <= '0';
   n884 <= '0';
   n885 <= '0';
   n886 <= '0';
   n887 <= '0';
   n888 <= '0';
   n889 <= '0';

end synthesised;

-- This is the basic technology-independent flip-flop.
-- All flip-flops and latches are written in terms of this.

library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;
entity SYNOP_BASIC_FF is

   port(next_state, clocked_on, force_00, force_01, force_10, force_11: in 
         std_logic;
         Q, QN: out std_logic);

end SYNOP_BASIC_FF;

architecture RTL of SYNOP_BASIC_FF is
   signal t_q: std_logic;
begin
   process ( force_00, force_01, force_10, force_11, clocked_on )
   begin
      if ( force_00 = '1' or force_01 = '1' ) then
         t_q <= '0';
      elsif ( force_10 = '1' or force_11 = '1' ) then
         t_q <= '1';
      elsif ( clocked_on'event and clocked_on = '1' ) then
         t_q <= next_state;
      end if;
   end process;
   
   process ( t_q, force_00, force_11 )
   begin
      Q <= t_q;
      if ( force_00 = '1' or force_11 = '1' ) then
         QN <= t_q;
      else
         QN <= not t_q;
      end if;
   end process;
end RTL;
