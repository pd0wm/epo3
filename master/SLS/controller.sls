extern network controller_move (terminal clk, rst, x, rot, add_sub, 
                                         draw_erase_draw, draw_erase_start, 
                                         draw_erase_ready, start, ready, 
                                         inputs_3_0_3, inputs_3_0_2, 
                                         inputs_3_0_1, inputs_3_0_0, 
                                         check_ready, check_start, check_empty, 
                                         vss, vdd)
extern network dfr11 (terminal D, R, CK, Q, vss, vdd)
extern network dfn10 (terminal D, CK, Q, vss, vdd)
extern network na310 (terminal A, B, C, Y, vss, vdd)
extern network no310 (terminal A, B, C, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
network controller (terminal clk, rst, lut_piece_type_2_0_2, 
                             lut_piece_type_2_0_1, lut_piece_type_2_0_0, 
                             lut_next_piece, lut_x_2_0_2, lut_x_2_0_1, 
                             lut_x_2_0_0, lut_y_3_0_3, lut_y_3_0_2, 
                             lut_y_3_0_1, lut_y_3_0_0, lut_rot_1_0_1, 
                             lut_rot_1_0_0, calc_x_2_0_2, calc_x_2_0_1, 
                             calc_x_2_0_0, calc_y_3_0_3, calc_y_3_0_2, 
                             calc_y_3_0_1, calc_y_3_0_0, calc_rot_1_0_1, 
                             calc_rot_1_0_0, add_sub, x, y, rot, new_piece, 
                             next_piece_2_0_2, next_piece_2_0_1, 
                             next_piece_2_0_0, check_empty, check_start, 
                             check_ready, draw_erase_draw, draw_erase_start, 
                             draw_erase_ready, clear_shift_start, 
                             clear_shift_ready, draw_score_draw, 
                             draw_score_ready, timer_1_time, timer_1_start, 
                             timer_1_done, timer_1_reset, inputs_5_0_5, 
                             inputs_5_0_4, inputs_5_0_3, inputs_5_0_2, 
                             inputs_5_0_1, inputs_5_0_0, vss, vdd)
{
   net {lut_piece_type_2_0_2, lut_piece_type_2_port};
   net {lut_piece_type_2_0_1, lut_piece_type_1_port};
   net {lut_piece_type_2_0_0, lut_piece_type_0_port};
   net {lut_x_2_0_2, lut_x_2_port};
   net {lut_x_2_0_1, lut_x_1_port};
   net {lut_x_2_0_0, lut_x_0_port};
   net {lut_y_3_0_3, lut_y_3_port};
   net {lut_y_3_0_2, lut_y_2_port};
   net {lut_y_3_0_1, lut_y_1_port};
   net {lut_y_3_0_0, lut_y_0_port};
   net {lut_rot_1_0_1, lut_rot_1_port};
   net {lut_rot_1_0_0, lut_rot_0_port};
   net {y, y_port};
   net {new_piece, new_piece_port};
   net {clear_shift_start, clear_shift_start_port};
   net {draw_score_draw, draw_score_draw_port};
   {move_pm} controller_move (clk, rst, move_x, move_rot, move_add_sub, 
                              move_draw_erase_draw, move_draw_erase_start, 
                              draw_erase_ready, move_start, move_ready, 
                              inputs_5_0_3, inputs_5_0_2, inputs_5_0_1, 
                              inputs_5_0_0, check_ready, move_check_start, 
                              check_empty, vss, vdd);
   {cur_timer_1_time_reg} dfn10 (n354, clk, cur_timer_1_time, vss, vdd);
   {cur_state_reg_1_inst} dfr11 (next_state_1_port, rst, clk, cur_state_1_port, 
                                 vss, vdd);
   {cur_state_reg_2_inst} dfr11 (next_state_2_port, rst, clk, cur_state_2_port, 
                                 vss, vdd);
   {cur_state_reg_3_inst} dfr11 (next_state_3_port, rst, clk, cur_state_3_port, 
                                 vss, vdd);
   {cur_state_reg_4_inst} dfr11 (next_state_4_port, rst, clk, cur_state_4_port, 
                                 vss, vdd);
   {cur_state_reg_5_inst} dfr11 (next_state_5_port, rst, clk, cur_state_5_port, 
                                 vss, vdd);
   {cur_state_reg_0_inst} dfr11 (next_state_0_port, rst, clk, cur_state_0_port, 
                                 vss, vdd);
   {cur_rot_reg_1_inst} dfn10 (n364, clk, lut_rot_1_port, vss, vdd);
   {cur_rot_reg_0_inst} dfn10 (n365, clk, lut_rot_0_port, vss, vdd);
   {cur_y_reg_3_inst} dfn10 (n369, clk, lut_y_3_port, vss, vdd);
   {cur_y_reg_2_inst} dfn10 (n368, clk, lut_y_2_port, vss, vdd);
   {cur_y_reg_1_inst} dfn10 (n367, clk, lut_y_1_port, vss, vdd);
   {cur_y_reg_0_inst} dfn10 (n366, clk, lut_y_0_port, vss, vdd);
   {cur_x_reg_2_inst} dfn10 (n370, clk, lut_x_2_port, vss, vdd);
   {cur_x_reg_0_inst} dfn10 (n371, clk, lut_x_0_port, vss, vdd);
   {cur_x_reg_1_inst} dfn10 (n372, clk, lut_x_1_port, vss, vdd);
   {cur_piece_reg_2_inst} dfn10 (n361, clk, lut_piece_type_2_port, vss, vdd);
   {cur_future_piece_reg_2_inst} dfn10 (n358, clk, cur_future_piece_2_port, 
                                        vss, vdd);
   {cur_piece_reg_1_inst} dfn10 (n362, clk, lut_piece_type_1_port, vss, vdd);
   {cur_future_piece_reg_1_inst} dfn10 (n359, clk, cur_future_piece_1_port, 
                                        vss, vdd);
   {cur_piece_reg_0_inst} dfn10 (n363, clk, lut_piece_type_0_port, vss, vdd);
   {cur_future_piece_reg_0_inst} dfn10 (n360, clk, cur_future_piece_0_port, 
                                        vss, vdd);
   {cur_timer_1_reset_reg} dfn10 (n353, clk, cur_timer_1_reset, vss, vdd);
   {cur_timer_1_start_reg} dfn10 (n352, clk, cur_timer_1_start, vss, vdd);
   {U393} iv110 (n373, x, vss, vdd);
   {U394} na210 (move_start, move_x, n373, vss, vdd);
   {U395} na210 (n374, n375, timer_1_time, vss, vdd);
   {U396} na210 (cur_timer_1_time, n376, n375, vss, vdd);
   {U397} iv110 (n377, n374, vss, vdd);
   {U398} na210 (n378, n379, timer_1_start, vss, vdd);
   {U399} na210 (cur_timer_1_start, n380, n379, vss, vdd);
   {U400} na210 (n381, n382, timer_1_reset, vss, vdd);
   {U401} na210 (cur_timer_1_reset, n383, n382, vss, vdd);
   {U402} iv110 (n384, rot, vss, vdd);
   {U403} na210 (move_start, move_rot, n384, vss, vdd);
   {U404} na310 (n385, n386, n387, next_state_5_port, vss, vdd);
   {U405} no310 (n388, n389, n390, n387, vss, vdd);
   {U406} no210 (n391, n392, n389, vss, vdd);
   {U407} no310 (n393, n394, n395, n391, vss, vdd);
   {U408} no210 (check_empty, n396, n395, vss, vdd);
   {U409} no210 (timer_1_done, n397, n393, vss, vdd);
   {U410} na210 (cur_state_5_port, n398, n386, vss, vdd);
   {U411} na210 (n399, n400, n398, vss, vdd);
   {U412} na210 (n401, n402, n400, vss, vdd);
   {U413} no210 (n403, n404, n385, vss, vdd);
   {U414} na310 (n405, n406, n407, next_state_4_port, vss, vdd);
   {U415} no310 (n408, n409, n410, n407, vss, vdd);
   {U416} iv110 (n411, n410, vss, vdd);
   {U417} na210 (n412, n413, n408, vss, vdd);
   {U418} na310 (n414, n415, inputs_5_0_4, n412, vss, vdd);
   {U419} no210 (n416, n417, n406, vss, vdd);
   {U420} no210 (n418, n402, n417, vss, vdd);
   {U421} no210 (n419, n420, n416, vss, vdd);
   {U422} no210 (n421, n422, n419, vss, vdd);
   {U423} no210 (n423, n424, n405, vss, vdd);
   {U424} na310 (n425, n426, n427, next_state_3_port, vss, vdd);
   {U425} no310 (n428, n429, n430, n427, vss, vdd);
   {U426} na310 (n431, n432, n433, n428, vss, vdd);
   {U427} na210 (n414, cur_timer_1_time, n431, vss, vdd);
   {U428} iv110 (n434, n426, vss, vdd);
   {U429} na310 (n411, n435, n436, n434, vss, vdd);
   {U430} no310 (n437, n438, n439, n425, vss, vdd);
   {U431} no210 (n440, n441, n439, vss, vdd);
   {U432} iv110 (n442, n440, vss, vdd);
   {U433} no210 (n443, n444, n438, vss, vdd);
   {U434} no310 (n401, n445, n446, n443, vss, vdd);
   {U435} no210 (clear_shift_ready, n447, n445, vss, vdd);
   {U436} iv110 (n448, n437, vss, vdd);
   {U437} na210 (n401, draw_erase_ready, n448, vss, vdd);
   {U438} na310 (n449, n450, n451, next_state_2_port, vss, vdd);
   {U439} no210 (n452, n453, n451, vss, vdd);
   {U440} na310 (n454, n455, n456, n453, vss, vdd);
   {U441} na210 (move_ready, n457, n456, vss, vdd);
   {U442} na210 (n458, draw_erase_ready, n455, vss, vdd);
   {U443} na210 (n403, check_empty, n454, vss, vdd);
   {U444} na310 (n432, n459, n460, n452, vss, vdd);
   {U445} na210 (inputs_5_0_4, n414, n460, vss, vdd);
   {U446} na210 (n461, n462, n432, vss, vdd);
   {U447} no310 (n463, n464, n465, n450, vss, vdd);
   {U448} no210 (draw_score_ready, n466, n464, vss, vdd);
   {U449} no310 (n467, n468, n424, n449, vss, vdd);
   {U450} na310 (n469, n470, n471, next_state_1_port, vss, vdd);
   {U451} no310 (n472, n430, n467, n471, vss, vdd);
   {U452} na310 (n473, n474, n475, n467, vss, vdd);
   {U453} no310 (n476, n477, n404, n475, vss, vdd);
   {U454} iv110 (n478, n476, vss, vdd);
   {U455} na210 (check_empty, n479, n474, vss, vdd);
   {U456} na210 (n480, n481, n430, vss, vdd);
   {U457} na210 (n414, n482, n481, vss, vdd);
   {U458} iv110 (inputs_5_0_4, n482, vss, vdd);
   {U459} iv110 (n483, n472, vss, vdd);
   {U460} no310 (n484, n485, n423, n483, vss, vdd);
   {U461} na310 (n486, n487, n488, n423, vss, vdd);
   {U462} no310 (n489, n490, n491, n488, vss, vdd);
   {U463} iv110 (n492, n491, vss, vdd);
   {U464} no210 (n493, n462, n489, vss, vdd);
   {U465} iv110 (n494, n462, vss, vdd);
   {U466} no210 (n461, n495, n493, vss, vdd);
   {U467} iv110 (n496, n461, vss, vdd);
   {U468} na210 (check_ready, n497, n487, vss, vdd);
   {U469} na210 (draw_score_ready, draw_score_draw_port, n486, vss, vdd);
   {U470} no210 (n498, check_empty, n485, vss, vdd);
   {U471} no310 (n499, n500, n501, n470, vss, vdd);
   {U472} iv110 (n502, n501, vss, vdd);
   {U473} no210 (n503, n504, n499, vss, vdd);
   {U474} no210 (n505, n421, n503, vss, vdd);
   {U475} na310 (n506, n507, n508, n421, vss, vdd);
   {U476} no210 (n497, n509, n508, vss, vdd);
   {U477} na210 (n510, n511, n507, vss, vdd);
   {U478} no210 (draw_erase_ready, n418, n505, vss, vdd);
   {U479} iv110 (n422, n418, vss, vdd);
   {U480} no210 (n512, n513, n469, vss, vdd);
   {U481} iv110 (n514, n513, vss, vdd);
   {U482} na210 (n415, n515, n514, vss, vdd);
   {U483} iv110 (cur_timer_1_time, n415, vss, vdd);
   {U484} no210 (inputs_5_0_5, n516, n512, vss, vdd);
   {U485} na310 (n517, n518, n519, next_state_0_port, vss, vdd);
   {U486} no310 (n520, n479, n521, n519, vss, vdd);
   {U487} iv110 (n522, n521, vss, vdd);
   {U488} no210 (n523, n409, n522, vss, vdd);
   {U489} no310 (n524, inputs_5_0_5, n525, n523, vss, vdd);
   {U490} na310 (n526, n527, n528, n520, vss, vdd);
   {U491} no210 (n477, n414, n528, vss, vdd);
   {U492} iv110 (n529, n414, vss, vdd);
   {U493} iv110 (new_piece_port, n527, vss, vdd);
   {U494} no310 (n530, n531, n532, n518, vss, vdd);
   {U495} no210 (n533, n534, n532, vss, vdd);
   {U496} no210 (n535, n446, n533, vss, vdd);
   {U497} na310 (n536, n525, n537, n446, vss, vdd);
   {U498} na210 (n497, n538, n537, vss, vdd);
   {U499} iv110 (check_ready, n538, vss, vdd);
   {U500} na210 (n458, n402, n536, vss, vdd);
   {U501} iv110 (n539, n458, vss, vdd);
   {U502} iv110 (n506, n535, vss, vdd);
   {U503} no310 (n540, draw_score_draw_port, n468, n506, vss, vdd);
   {U504} na310 (n541, n542, n543, n468, vss, vdd);
   {U505} na210 (n544, n402, n543, vss, vdd);
   {U506} iv110 (draw_erase_ready, n402, vss, vdd);
   {U507} no210 (n545, move_ready, n540, vss, vdd);
   {U508} no310 (n546, n494, n441, n531, vss, vdd);
   {U509} no310 (inputs_5_0_4, inputs_5_0_5, n524, n494, vss, vdd);
   {U510} na210 (n547, n548, n530, vss, vdd);
   {U511} na210 (draw_erase_ready, n549, n548, vss, vdd);
   {U512} na210 (n550, n551, n549, vss, vdd);
   {U513} na210 (n552, check_ready, n547, vss, vdd);
   {U514} no310 (n424, n553, n388, n517, vss, vdd);
   {U515} no210 (n447, n511, n553, vss, vdd);
   {U516} iv110 (clear_shift_ready, n511, vss, vdd);
   {U517} na310 (n554, n436, n555, n424, vss, vdd);
   {U518} iv110 (n484, n555, vss, vdd);
   {U519} na310 (n556, n557, n558, n484, vss, vdd);
   {U520} no310 (n559, n560, n561, n558, vss, vdd);
   {U521} no210 (n524, n541, n559, vss, vdd);
   {U522} na210 (n562, n563, n524, vss, vdd);
   {U523} no210 (inputs_5_0_3, inputs_5_0_2, n563, vss, vdd);
   {U524} no210 (inputs_5_0_1, inputs_5_0_0, n562, vss, vdd);
   {U525} na210 (draw_erase_ready, n564, n557, vss, vdd);
   {U526} na310 (n565, cur_timer_1_time, inputs_5_0_5, n436, vss, vdd);
   {U527} iv110 (n516, n565, vss, vdd);
   {U528} na310 (n566, n567, timer_1_done, n554, vss, vdd);
   {U529} na310 (n568, n569, n570, n372, vss, vdd);
   {U530} na210 (calc_x_2_0_1, n571, n569, vss, vdd);
   {U531} na210 (lut_x_1_port, n572, n568, vss, vdd);
   {U532} na310 (n573, n574, n570, n371, vss, vdd);
   {U533} na210 (n409, n575, n570, vss, vdd);
   {U534} iv110 (n576, n409, vss, vdd);
   {U535} na210 (calc_x_2_0_0, n571, n574, vss, vdd);
   {U536} na210 (lut_x_0_port, n572, n573, vss, vdd);
   {U537} na210 (n577, n578, n370, vss, vdd);
   {U538} na210 (calc_x_2_0_2, n571, n578, vss, vdd);
   {U539} na210 (lut_x_2_port, n572, n577, vss, vdd);
   {U540} na210 (n579, n580, n369, vss, vdd);
   {U541} na210 (calc_y_3_0_3, n581, n580, vss, vdd);
   {U542} na210 (lut_y_3_port, n582, n579, vss, vdd);
   {U543} na210 (n583, n584, n368, vss, vdd);
   {U544} na210 (calc_y_3_0_2, n581, n584, vss, vdd);
   {U545} na210 (lut_y_2_port, n582, n583, vss, vdd);
   {U546} na210 (n585, n586, n367, vss, vdd);
   {U547} na210 (calc_y_3_0_1, n581, n586, vss, vdd);
   {U548} na210 (lut_y_1_port, n582, n585, vss, vdd);
   {U549} na210 (n587, n588, n366, vss, vdd);
   {U550} na210 (calc_y_3_0_0, n581, n588, vss, vdd);
   {U551} no210 (n498, n582, n581, vss, vdd);
   {U552} na210 (lut_y_0_port, n582, n587, vss, vdd);
   {U553} iv110 (n589, n582, vss, vdd);
   {U554} na210 (n590, n591, n589, vss, vdd);
   {U555} na310 (n592, check_empty, n593, n591, vss, vdd);
   {U556} no310 (n463, move_start, n594, n593, vss, vdd);
   {U557} na310 (n576, n545, n575, n590, vss, vdd);
   {U558} na210 (n595, n596, n365, vss, vdd);
   {U559} na210 (lut_rot_0_port, n597, n596, vss, vdd);
   {U560} na210 (calc_rot_1_0_0, n571, n595, vss, vdd);
   {U561} na210 (n598, n599, n364, vss, vdd);
   {U562} na210 (lut_rot_1_port, n597, n599, vss, vdd);
   {U563} na210 (n600, n576, n597, vss, vdd);
   {U564} iv110 (n572, n600, vss, vdd);
   {U565} na210 (n575, n601, n572, vss, vdd);
   {U566} na210 (n457, n602, n601, vss, vdd);
   {U567} iv110 (n545, n457, vss, vdd);
   {U568} iv110 (n603, n575, vss, vdd);
   {U569} na210 (calc_rot_1_0_1, n571, n598, vss, vdd);
   {U570} no310 (n602, n545, n603, n571, vss, vdd);
   {U571} na310 (n592, n502, n604, n603, vss, vdd);
   {U572} no210 (y_port, n500, n604, vss, vdd);
   {U573} iv110 (n526, n500, vss, vdd);
   {U574} no310 (n401, new_piece_port, n605, n592, vss, vdd);
   {U575} na210 (n435, n606, new_piece_port, vss, vdd);
   {U576} iv110 (move_ready, n602, vss, vdd);
   {U577} na310 (n607, n608, n609, n363, vss, vdd);
   {U578} na210 (lut_piece_type_0_port, n610, n609, vss, vdd);
   {U579} na210 (cur_future_piece_0_port, n611, n608, vss, vdd);
   {U580} na210 (next_piece_2_0_0, n612, n607, vss, vdd);
   {U581} na310 (n613, n614, n615, n362, vss, vdd);
   {U582} na210 (lut_piece_type_1_port, n610, n615, vss, vdd);
   {U583} na210 (cur_future_piece_1_port, n611, n614, vss, vdd);
   {U584} na210 (next_piece_2_0_1, n612, n613, vss, vdd);
   {U585} na310 (n616, n617, n618, n361, vss, vdd);
   {U586} na210 (lut_piece_type_2_port, n610, n618, vss, vdd);
   {U587} na210 (cur_future_piece_2_port, n611, n617, vss, vdd);
   {U588} no210 (n610, n619, n611, vss, vdd);
   {U589} iv110 (n463, n619, vss, vdd);
   {U590} na210 (next_piece_2_0_2, n612, n616, vss, vdd);
   {U591} no210 (n435, n610, n612, vss, vdd);
   {U592} na310 (n620, n621, n622, n610, vss, vdd);
   {U593} no310 (n477, y_port, move_start, n622, vss, vdd);
   {U594} iv110 (n605, n621, vss, vdd);
   {U595} na310 (n539, n480, n623, n605, vss, vdd);
   {U596} no210 (n495, n401, n620, vss, vdd);
   {U597} na210 (n624, n625, n401, vss, vdd);
   {U598} na310 (n626, n627, n628, n360, vss, vdd);
   {U599} na210 (cur_future_piece_0_port, n629, n628, vss, vdd);
   {U600} na210 (n630, lut_piece_type_0_port, n627, vss, vdd);
   {U601} na210 (n631, next_piece_2_0_0, n626, vss, vdd);
   {U602} na310 (n632, n633, n634, n359, vss, vdd);
   {U603} na210 (cur_future_piece_1_port, n629, n634, vss, vdd);
   {U604} na210 (n630, lut_piece_type_1_port, n633, vss, vdd);
   {U605} na210 (n631, next_piece_2_0_1, n632, vss, vdd);
   {U606} na310 (n635, n636, n637, n358, vss, vdd);
   {U607} na210 (cur_future_piece_2_port, n629, n637, vss, vdd);
   {U608} na210 (n630, lut_piece_type_2_port, n636, vss, vdd);
   {U609} no210 (n629, n576, n630, vss, vdd);
   {U610} na210 (n631, next_piece_2_0_2, n635, vss, vdd);
   {U611} no210 (n606, n629, n631, vss, vdd);
   {U612} na310 (n638, n502, n623, n629, vss, vdd);
   {U613} no310 (n639, n640, n641, n623, vss, vdd);
   {U614} na310 (n556, n642, n381, n641, vss, vdd);
   {U615} iv110 (n429, n381, vss, vdd);
   {U616} iv110 (n643, n556, vss, vdd);
   {U617} na210 (n644, n645, n643, vss, vdd);
   {U618} na210 (n646, n647, n645, vss, vdd);
   {U619} na210 (n648, n649, n639, vss, vdd);
   {U620} iv110 (n650, n638, vss, vdd);
   {U621} na210 (n651, n652, n354, vss, vdd);
   {U622} na210 (cur_timer_1_time, n653, n652, vss, vdd);
   {U623} na210 (n654, n648, n653, vss, vdd);
   {U624} iv110 (n376, n654, vss, vdd);
   {U625} na310 (n642, n644, n655, n376, vss, vdd);
   {U626} na210 (n656, n566, n644, vss, vdd);
   {U627} no310 (n560, n509, n657, n642, vss, vdd);
   {U628} iv110 (n413, n657, vss, vdd);
   {U629} na210 (n377, n648, n651, vss, vdd);
   {U630} na310 (n492, n649, n658, n377, vss, vdd);
   {U631} iv110 (n404, n649, vss, vdd);
   {U632} na210 (n659, n660, n353, vss, vdd);
   {U633} na210 (cur_timer_1_reset, n661, n660, vss, vdd);
   {U634} na210 (n662, n648, n661, vss, vdd);
   {U635} iv110 (n383, n662, vss, vdd);
   {U636} na310 (n655, n658, n663, n383, vss, vdd);
   {U637} no310 (n404, n664, n560, n663, vss, vdd);
   {U638} no210 (n665, n397, n404, vss, vdd);
   {U639} na210 (n429, n648, n659, vss, vdd);
   {U640} na210 (n478, n492, n429, vss, vdd);
   {U641} na210 (n394, n666, n492, vss, vdd);
   {U642} na210 (n664, n667, n478, vss, vdd);
   {U643} na210 (n668, n669, n352, vss, vdd);
   {U644} na210 (cur_timer_1_start, n670, n669, vss, vdd);
   {U645} na210 (n671, n648, n670, vss, vdd);
   {U646} iv110 (n380, n671, vss, vdd);
   {U647} na310 (n658, n525, n655, n380, vss, vdd);
   {U648} no310 (n650, n463, n640, n655, vss, vdd);
   {U649} na310 (n672, n673, n674, n640, vss, vdd);
   {U650} no310 (n675, n561, n676, n674, vss, vdd);
   {U651} no210 (n441, n396, n676, vss, vdd);
   {U652} iv110 (n677, n561, vss, vdd);
   {U653} na310 (n496, n466, n541, n675, vss, vdd);
   {U654} na210 (n667, n678, n541, vss, vdd);
   {U655} na310 (n679, n666, n680, n496, vss, vdd);
   {U656} no210 (cur_state_0_port, n681, n680, vss, vdd);
   {U657} no210 (n465, n515, n673, vss, vdd);
   {U658} na210 (n529, n516, n515, vss, vdd);
   {U659} na210 (n664, n647, n516, vss, vdd);
   {U660} na210 (n656, n667, n529, vss, vdd);
   {U661} iv110 (n682, n465, vss, vdd);
   {U662} no310 (n497, clear_shift_start_port, n390, n682, vss, vdd);
   {U663} iv110 (n683, n497, vss, vdd);
   {U664} no210 (n684, n388, n672, vss, vdd);
   {U665} na210 (n473, n685, n388, vss, vdd);
   {U666} na210 (n666, n442, n685, vss, vdd);
   {U667} na210 (n686, n687, n442, vss, vdd);
   {U668} na310 (cur_state_5_port, cur_state_0_port, n679, n687, vss, vdd);
   {U669} iv110 (n688, n679, vss, vdd);
   {U670} na210 (n689, n566, n473, vss, vdd);
   {U671} iv110 (n433, n684, vss, vdd);
   {U672} no310 (n479, n490, n690, n433, vss, vdd);
   {U673} no210 (n392, n397, n690, vss, vdd);
   {U674} iv110 (n567, n397, vss, vdd);
   {U675} no210 (n396, n392, n479, vss, vdd);
   {U676} na210 (n576, n502, n463, vss, vdd);
   {U677} na210 (n689, n647, n502, vss, vdd);
   {U678} na210 (n646, n667, n576, vss, vdd);
   {U679} na310 (n624, n691, n692, n650, vss, vdd);
   {U680} no210 (y_port, move_start, n692, vss, vdd);
   {U681} iv110 (n693, y_port, vss, vdd);
   {U682} no210 (n564, n694, n624, vss, vdd);
   {U683} no210 (n695, n696, n694, vss, vdd);
   {U684} iv110 (n509, n525, vss, vdd);
   {U685} no210 (n686, n695, n509, vss, vdd);
   {U686} no210 (n495, n697, n658, vss, vdd);
   {U687} no210 (n396, n695, n697, vss, vdd);
   {U688} iv110 (n647, n695, vss, vdd);
   {U689} iv110 (n646, n396, vss, vdd);
   {U690} iv110 (n606, n495, vss, vdd);
   {U691} na210 (n698, n666, n606, vss, vdd);
   {U692} na210 (n699, n648, n668, vss, vdd);
   {U693} iv110 (rst, n648, vss, vdd);
   {U694} iv110 (n378, n699, vss, vdd);
   {U695} no210 (n560, n700, n378, vss, vdd);
   {U696} no310 (n392, cur_state_5_port, n688, n700, vss, vdd);
   {U697} no210 (n696, n392, n560, vss, vdd);
   {U698} iv110 (n691, lut_next_piece, vss, vdd);
   {U699} no310 (n701, n477, n702, n691, vss, vdd);
   {U700} na310 (n625, n480, n539, n702, vss, vdd);
   {U701} iv110 (n435, n701, vss, vdd);
   {U702} na210 (n656, n666, n435, vss, vdd);
   {U703} iv110 (n466, draw_score_draw_port, vss, vdd);
   {U704} na210 (n667, n698, n466, vss, vdd);
   {U705} na310 (n703, n704, n705, draw_erase_start, vss, vdd);
   {U706} no310 (n490, n544, n477, n705, vss, vdd);
   {U707} no210 (n546, n392, n477, vss, vdd);
   {U708} iv110 (n678, n546, vss, vdd);
   {U709} iv110 (n625, n544, vss, vdd);
   {U710} na210 (n698, n566, n625, vss, vdd);
   {U711} iv110 (n459, n490, vss, vdd);
   {U712} na210 (n667, n394, n459, vss, vdd);
   {U713} no210 (n564, n706, n703, vss, vdd);
   {U714} iv110 (n707, n706, vss, vdd);
   {U715} na210 (move_start, move_draw_erase_start, n707, vss, vdd);
   {U716} iv110 (n542, n564, vss, vdd);
   {U717} na210 (n708, n566, n542, vss, vdd);
   {U718} na210 (n704, n709, draw_erase_draw, vss, vdd);
   {U719} na210 (move_draw_erase_draw, move_start, n709, vss, vdd);
   {U720} no310 (n422, n390, n710, n704, vss, vdd);
   {U721} na310 (n677, n480, n413, n710, vss, vdd);
   {U722} na210 (n664, n566, n413, vss, vdd);
   {U723} na210 (n664, n666, n480, vss, vdd);
   {U724} no210 (n688, n711, n664, vss, vdd);
   {U725} na210 (n689, n666, n677, vss, vdd);
   {U726} na210 (n712, n551, n390, vss, vdd);
   {U727} na210 (n667, n713, n551, vss, vdd);
   {U728} na210 (n647, n567, n712, vss, vdd);
   {U729} na210 (n550, n539, n422, vss, vdd);
   {U730} na210 (n656, n647, n539, vss, vdd);
   {U731} no210 (n688, n714, n656, vss, vdd);
   {U732} na210 (cur_state_3_port, n420, n688, vss, vdd);
   {U733} iv110 (n715, n550, vss, vdd);
   {U734} na210 (n716, n717, n715, vss, vdd);
   {U735} na210 (n646, n666, n717, vss, vdd);
   {U736} no310 (n420, cur_state_3_port, n714, n646, vss, vdd);
   {U737} na210 (n647, n713, n716, vss, vdd);
   {U738} na210 (n447, n411, clear_shift_start_port, vss, vdd);
   {U739} na210 (n647, n394, n411, vss, vdd);
   {U740} iv110 (n510, n447, vss, vdd);
   {U741} no210 (n686, n665, n510, vss, vdd);
   {U742} iv110 (n667, n665, vss, vdd);
   {U743} iv110 (n708, n686, vss, vdd);
   {U744} no310 (n420, n444, n714, n708, vss, vdd);
   {U745} na310 (n718, n683, n719, check_start, vss, vdd);
   {U746} iv110 (n594, n719, vss, vdd);
   {U747} na210 (n689, n667, n683, vss, vdd);
   {U748} no210 (n720, cur_state_1_port, n667, vss, vdd);
   {U749} no310 (n711, cur_state_3_port, n420, n689, vss, vdd);
   {U750} na210 (move_check_start, move_start, n718, vss, vdd);
   {U751} na210 (n721, n693, add_sub, vss, vdd);
   {U752} no210 (n594, n403, n693, vss, vdd);
   {U753} iv110 (n498, n403, vss, vdd);
   {U754} na210 (n666, n567, n498, vss, vdd);
   {U755} no310 (n534, n722, n681, n567, vss, vdd);
   {U756} iv110 (n441, n666, vss, vdd);
   {U757} na210 (n399, n723, n594, vss, vdd);
   {U758} na210 (n394, n566, n723, vss, vdd);
   {U759} iv110 (n392, n566, vss, vdd);
   {U760} na210 (cur_state_2_port, cur_state_1_port, n392, vss, vdd);
   {U761} no310 (n444, n711, n420, n394, vss, vdd);
   {U762} iv110 (n552, n399, vss, vdd);
   {U763} no210 (n696, n441, n552, vss, vdd);
   {U764} na210 (n504, n720, n441, vss, vdd);
   {U765} iv110 (cur_state_2_port, n720, vss, vdd);
   {U766} iv110 (n713, n696, vss, vdd);
   {U767} no310 (n722, cur_state_0_port, n681, n713, vss, vdd);
   {U768} na210 (move_add_sub, move_start, n721, vss, vdd);
   {U769} na210 (n545, n526, move_start, vss, vdd);
   {U770} na210 (n647, n678, n526, vss, vdd);
   {U771} no210 (n714, n722, n678, vss, vdd);
   {U772} na210 (n534, n681, n714, vss, vdd);
   {U773} iv110 (cur_state_0_port, n534, vss, vdd);
   {U774} na210 (n698, n647, n545, vss, vdd);
   {U775} no210 (n504, cur_state_2_port, n647, vss, vdd);
   {U776} iv110 (cur_state_1_port, n504, vss, vdd);
   {U777} no210 (n711, n722, n698, vss, vdd);
   {U778} na210 (n444, n420, n722, vss, vdd);
   {U779} iv110 (cur_state_4_port, n420, vss, vdd);
   {U780} iv110 (cur_state_3_port, n444, vss, vdd);
   {U781} na210 (cur_state_0_port, n681, n711, vss, vdd);
   {U782} iv110 (cur_state_5_port, n681, vss, vdd);
}



