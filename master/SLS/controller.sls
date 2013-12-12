extern network controller_move (terminal clk, rst, x, rot, add_sub, 
                                         draw_erase_draw, draw_erase_start, 
                                         draw_erase_ready, start, ready, 
                                         inputs_3_0_3, inputs_3_0_2, 
                                         inputs_3_0_1, inputs_3_0_0, 
                                         check_ready, check_start, check_empty, 
                                         vss, vdd)
extern network dfr11 (terminal D, R, CK, Q, vss, vdd)
extern network dfn10 (terminal D, CK, Q, vss, vdd)
extern network no310 (terminal A, B, C, Y, vss, vdd)
extern network mu111 (terminal A, B, S, Y, vss, vdd)
extern network na310 (terminal A, B, C, Y, vss, vdd)
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
   net {lut_next_piece, lut_next_piece_port};
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
                              X_Logic0_port, move_start, move_ready, 
                              inputs_5_0_3, inputs_5_0_2, inputs_5_0_1, 
                              inputs_5_0_0, X_Logic0_port, move_check_start, 
                              check_empty, vss, vdd);
   net {X_Logic0_port, vss};
   {cur_timer_1_time_reg} dfn10 (n355, clk, cur_timer_1_time, vss, vdd);
   {cur_state_reg_4_inst} dfr11 (next_state_4_port, rst, clk, cur_state_4_port, 
                                 vss, vdd);
   {cur_state_reg_1_inst} dfr11 (next_state_1_port, rst, clk, cur_state_1_port, 
                                 vss, vdd);
   {cur_state_reg_3_inst} dfr11 (next_state_3_port, rst, clk, cur_state_3_port, 
                                 vss, vdd);
   {cur_state_reg_0_inst} dfr11 (next_state_0_port, rst, clk, cur_state_0_port, 
                                 vss, vdd);
   {cur_state_reg_5_inst} dfr11 (next_state_5_port, rst, clk, cur_state_5_port, 
                                 vss, vdd);
   {cur_state_reg_2_inst} dfr11 (next_state_2_port, rst, clk, cur_state_2_port, 
                                 vss, vdd);
   {cur_timer_1_reset_reg} dfn10 (n354, clk, cur_timer_1_reset, vss, vdd);
   {cur_piece_reg_2_inst} dfn10 (n362, clk, lut_piece_type_2_port, vss, vdd);
   {cur_future_piece_reg_2_inst} dfn10 (n359, clk, cur_future_piece_2_port, 
                                        vss, vdd);
   {cur_piece_reg_1_inst} dfn10 (n363, clk, lut_piece_type_1_port, vss, vdd);
   {cur_future_piece_reg_1_inst} dfn10 (n360, clk, cur_future_piece_1_port, 
                                        vss, vdd);
   {cur_piece_reg_0_inst} dfn10 (n364, clk, lut_piece_type_0_port, vss, vdd);
   {cur_future_piece_reg_0_inst} dfn10 (n361, clk, cur_future_piece_0_port, 
                                        vss, vdd);
   {cur_y_reg_3_inst} dfn10 (n370, clk, lut_y_3_port, vss, vdd);
   {cur_y_reg_2_inst} dfn10 (n369, clk, lut_y_2_port, vss, vdd);
   {cur_y_reg_1_inst} dfn10 (n368, clk, lut_y_1_port, vss, vdd);
   {cur_y_reg_0_inst} dfn10 (n367, clk, lut_y_0_port, vss, vdd);
   {cur_rot_reg_1_inst} dfn10 (n366, clk, lut_rot_1_port, vss, vdd);
   {cur_rot_reg_0_inst} dfn10 (n365, clk, lut_rot_0_port, vss, vdd);
   {cur_x_reg_2_inst} dfn10 (n373, clk, lut_x_2_port, vss, vdd);
   {cur_x_reg_0_inst} dfn10 (n372, clk, lut_x_0_port, vss, vdd);
   {cur_x_reg_1_inst} dfn10 (n371, clk, lut_x_1_port, vss, vdd);
   {cur_timer_1_start_reg} dfn10 (n353, clk, cur_timer_1_start, vss, vdd);
   {U394} iv110 (n374, x, vss, vdd);
   {U395} na210 (move_start, move_x, n374, vss, vdd);
   {U396} na210 (n375, n376, timer_1_time, vss, vdd);
   {U397} na210 (cur_timer_1_time, n377, n376, vss, vdd);
   {U398} na210 (n378, n379, timer_1_start, vss, vdd);
   {U399} na210 (cur_timer_1_start, n380, n379, vss, vdd);
   {U400} na210 (n381, n382, timer_1_reset, vss, vdd);
   {U401} na210 (cur_timer_1_reset, n383, n382, vss, vdd);
   {U402} iv110 (n384, rot, vss, vdd);
   {U403} na210 (move_start, move_rot, n384, vss, vdd);
   {U404} na310 (n385, n386, n387, next_state_5_port, vss, vdd);
   {U405} no310 (n388, n389, n390, n387, vss, vdd);
   {U406} no210 (n391, n392, n390, vss, vdd);
   {U407} no210 (n393, n394, n391, vss, vdd);
   {U408} na210 (n395, n396, n388, vss, vdd);
   {U409} no210 (n397, n398, n386, vss, vdd);
   {U410} no210 (timer_1_done, n399, n398, vss, vdd);
   {U411} no210 (check_empty, n400, n397, vss, vdd);
   {U412} no210 (n401, n402, n385, vss, vdd);
   {U413} na310 (n403, n404, n405, next_state_4_port, vss, vdd);
   {U414} no310 (n406, n407, n408, n405, vss, vdd);
   {U415} iv110 (n409, n408, vss, vdd);
   {U416} na210 (n410, n411, n406, vss, vdd);
   {U417} na210 (n412, n413, n411, vss, vdd);
   {U418} na210 (draw_erase_ready, n414, n410, vss, vdd);
   {U419} no210 (n415, n416, n404, vss, vdd);
   {U420} no210 (n417, n418, n403, vss, vdd);
   {U421} no210 (n419, n420, n418, vss, vdd);
   {U422} no210 (n421, n414, n419, vss, vdd);
   {U423} no310 (n422, cur_timer_1_time, n423, n417, vss, vdd);
   {U424} na310 (n424, n425, n426, next_state_3_port, vss, vdd);
   {U425} no310 (n427, n428, n429, n426, vss, vdd);
   {U426} na210 (n430, n431, n429, vss, vdd);
   {U427} na310 (n432, n433, n381, n427, vss, vdd);
   {U428} na210 (n434, n435, n433, vss, vdd);
   {U429} na210 (n436, cur_timer_1_time, n432, vss, vdd);
   {U430} no310 (n437, n438, n415, n425, vss, vdd);
   {U431} na210 (n399, n439, n437, vss, vdd);
   {U432} no310 (n440, n441, n442, n424, vss, vdd);
   {U433} no210 (n443, n444, n442, vss, vdd);
   {U434} no210 (n445, n446, n443, vss, vdd);
   {U435} no210 (draw_erase_ready, n447, n445, vss, vdd);
   {U436} no210 (n448, n449, n440, vss, vdd);
   {U437} no210 (n450, n451, n448, vss, vdd);
   {U438} na310 (n452, n453, n454, next_state_2_port, vss, vdd);
   {U439} no210 (n455, n456, n454, vss, vdd);
   {U440} na310 (n457, n458, n459, n456, vss, vdd);
   {U441} iv110 (n460, n457, vss, vdd);
   {U442} na310 (n461, n462, n463, n455, vss, vdd);
   {U443} na210 (draw_score_draw_port, n464, n462, vss, vdd);
   {U444} iv110 (draw_score_ready, n464, vss, vdd);
   {U445} no310 (n465, n389, n466, n453, vss, vdd);
   {U446} iv110 (n467, n466, vss, vdd);
   {U447} na210 (n468, move_ready, n467, vss, vdd);
   {U448} no210 (n469, n470, n465, vss, vdd);
   {U449} iv110 (n435, n469, vss, vdd);
   {U450} no310 (n471, n472, n473, n452, vss, vdd);
   {U451} no210 (n449, n447, n473, vss, vdd);
   {U452} no210 (n423, n422, n472, vss, vdd);
   {U453} no210 (n474, n396, n471, vss, vdd);
   {U454} na310 (n475, n476, n477, next_state_1_port, vss, vdd);
   {U455} no310 (n478, n479, n407, n477, vss, vdd);
   {U456} na310 (n480, n481, n482, n407, vss, vdd);
   {U457} no310 (n483, n484, n441, n482, vss, vdd);
   {U458} no210 (n485, n435, n483, vss, vdd);
   {U459} no210 (n486, n434, n485, vss, vdd);
   {U460} na210 (n487, check_ready, n481, vss, vdd);
   {U461} na210 (draw_score_ready, draw_score_draw_port, n480, vss, vdd);
   {U462} na210 (n459, n430, n478, vss, vdd);
   {U463} no210 (n488, n489, n430, vss, vdd);
   {U464} no210 (n423, inputs_5_0_4, n489, vss, vdd);
   {U465} iv110 (n490, n459, vss, vdd);
   {U466} na310 (n491, n492, n493, n490, vss, vdd);
   {U467} no310 (n494, n495, n496, n493, vss, vdd);
   {U468} no210 (n400, n474, n494, vss, vdd);
   {U469} na210 (n412, n497, n492, vss, vdd);
   {U470} no310 (n498, n499, n500, n476, vss, vdd);
   {U471} no210 (inputs_5_0_5, n501, n500, vss, vdd);
   {U472} no210 (n502, n503, n499, vss, vdd);
   {U473} no210 (n393, n421, n502, vss, vdd);
   {U474} na210 (n504, n458, n421, vss, vdd);
   {U475} no210 (n487, n505, n458, vss, vdd);
   {U476} no210 (n506, draw_erase_ready, n505, vss, vdd);
   {U477} iv110 (n446, n504, vss, vdd);
   {U478} na310 (n507, n508, n509, n446, vss, vdd);
   {U479} no210 (n510, n511, n509, vss, vdd);
   {U480} na210 (n512, n513, n507, vss, vdd);
   {U481} iv110 (clear_shift_ready, n513, vss, vdd);
   {U482} no210 (draw_erase_ready, n514, n393, vss, vdd);
   {U483} no210 (cur_timer_1_time, n515, n498, vss, vdd);
   {U484} no210 (n516, n517, n475, vss, vdd);
   {U485} no210 (check_empty, n396, n517, vss, vdd);
   {U486} na310 (n518, n519, n520, next_state_0_port, vss, vdd);
   {U487} no310 (n521, n436, n522, n520, vss, vdd);
   {U488} no210 (n523, n524, n522, vss, vdd);
   {U489} no210 (n525, n435, n523, vss, vdd);
   {U490} na210 (n526, n422, n435, vss, vdd);
   {U491} iv110 (inputs_5_0_4, n422, vss, vdd);
   {U492} iv110 (n527, n521, vss, vdd);
   {U493} no310 (n416, new_piece_port, n496, n527, vss, vdd);
   {U494} no310 (n402, n528, n529, n519, vss, vdd);
   {U495} no210 (n530, n449, n529, vss, vdd);
   {U496} no210 (n531, n532, n530, vss, vdd);
   {U497} iv110 (n533, n532, vss, vdd);
   {U498} no210 (n534, n535, n531, vss, vdd);
   {U499} no210 (n536, n537, n528, vss, vdd);
   {U500} no210 (draw_score_draw_port, n394, n536, vss, vdd);
   {U501} na310 (n538, n539, n540, n394, vss, vdd);
   {U502} no210 (n541, n510, n540, vss, vdd);
   {U503} no210 (n542, move_ready, n510, vss, vdd);
   {U504} iv110 (n468, n542, vss, vdd);
   {U505} na210 (n543, n449, n539, vss, vdd);
   {U506} na210 (n487, n544, n538, vss, vdd);
   {U507} iv110 (check_ready, n544, vss, vdd);
   {U508} na310 (n491, n545, n431, n402, vss, vdd);
   {U509} iv110 (n546, n431, vss, vdd);
   {U510} na210 (n547, n548, n546, vss, vdd);
   {U511} na210 (n549, n550, n548, vss, vdd);
   {U512} na210 (check_ready, n541, n545, vss, vdd);
   {U513} na210 (n551, n413, n491, vss, vdd);
   {U514} no210 (n428, n460, n518, vss, vdd);
   {U515} na210 (n409, n552, n460, vss, vdd);
   {U516} na210 (clear_shift_ready, n512, n552, vss, vdd);
   {U517} no310 (n553, n438, n479, n409, vss, vdd);
   {U518} na310 (n554, n555, n556, n479, vss, vdd);
   {U519} no310 (n557, n558, n559, n556, vss, vdd);
   {U520} no210 (n508, n449, n559, vss, vdd);
   {U521} iv110 (draw_erase_ready, n449, vss, vdd);
   {U522} no310 (n560, n561, n562, n558, vss, vdd);
   {U523} no210 (n563, n564, n557, vss, vdd);
   {U524} no210 (n565, n566, n554, vss, vdd);
   {U525} iv110 (n567, n566, vss, vdd);
   {U526} iv110 (n568, n438, vss, vdd);
   {U527} na310 (n569, cur_timer_1_time, inputs_5_0_5, n568, vss, vdd);
   {U528} no210 (n570, n399, n553, vss, vdd);
   {U529} iv110 (timer_1_done, n570, vss, vdd);
   {U530} na210 (n400, n571, n428, vss, vdd);
   {U531} na210 (n511, n526, n571, vss, vdd);
   {U532} iv110 (n572, n526, vss, vdd);
   {U533} na210 (n573, n574, n572, vss, vdd);
   {U534} no310 (inputs_5_0_2, inputs_5_0_5, inputs_5_0_3, n574, vss, vdd);
   {U535} no210 (inputs_5_0_1, inputs_5_0_0, n573, vss, vdd);
   {U536} na210 (n575, n413, n400, vss, vdd);
   {U537} na210 (n576, n577, n373, vss, vdd);
   {U538} na210 (calc_x_2_0_2, n578, n577, vss, vdd);
   {U539} na210 (lut_x_2_port, n579, n576, vss, vdd);
   {U540} na210 (n580, n581, n372, vss, vdd);
   {U541} na210 (calc_x_2_0_0, n578, n581, vss, vdd);
   {U542} iv110 (n582, n580, vss, vdd);
   {U543} mu111 (n416, lut_x_0_port, n579, n582, vss, vdd);
   {U544} na210 (n583, n584, n371, vss, vdd);
   {U545} na210 (calc_x_2_0_1, n578, n584, vss, vdd);
   {U546} no210 (n555, n579, n578, vss, vdd);
   {U547} iv110 (n585, n583, vss, vdd);
   {U548} mu111 (n416, lut_x_1_port, n579, n585, vss, vdd);
   {U549} na210 (n586, n587, n370, vss, vdd);
   {U550} na210 (calc_y_3_0_3, n588, n587, vss, vdd);
   {U551} na210 (lut_y_3_port, n589, n586, vss, vdd);
   {U552} na210 (n590, n591, n369, vss, vdd);
   {U553} na210 (calc_y_3_0_2, n588, n591, vss, vdd);
   {U554} na210 (lut_y_2_port, n589, n590, vss, vdd);
   {U555} na210 (n592, n593, n368, vss, vdd);
   {U556} na210 (calc_y_3_0_1, n588, n593, vss, vdd);
   {U557} na210 (lut_y_1_port, n589, n592, vss, vdd);
   {U558} na210 (n594, n595, n367, vss, vdd);
   {U559} na210 (calc_y_3_0_0, n588, n595, vss, vdd);
   {U560} no210 (n589, n396, n588, vss, vdd);
   {U561} na210 (lut_y_0_port, n589, n594, vss, vdd);
   {U562} na210 (n555, n596, n589, vss, vdd);
   {U563} na210 (n597, n598, n596, vss, vdd);
   {U564} na310 (n599, n600, n601, n597, vss, vdd);
   {U565} no210 (n416, n474, n601, vss, vdd);
   {U566} iv110 (check_empty, n474, vss, vdd);
   {U567} iv110 (n602, n416, vss, vdd);
   {U568} mu111 (n603, lut_rot_1_port, n598, n366, vss, vdd);
   {U569} no210 (n604, n555, n603, vss, vdd);
   {U570} iv110 (calc_rot_1_0_1, n604, vss, vdd);
   {U571} mu111 (n605, lut_rot_0_port, n598, n365, vss, vdd);
   {U572} na210 (n606, n602, n598, vss, vdd);
   {U573} iv110 (n579, n606, vss, vdd);
   {U574} na310 (n600, n396, n599, n579, vss, vdd);
   {U575} iv110 (n607, n599, vss, vdd);
   {U576} na310 (n608, n609, n610, n607, vss, vdd);
   {U577} no310 (n516, new_piece_port, n468, n610, vss, vdd);
   {U578} no210 (n611, n612, n468, vss, vdd);
   {U579} na210 (n613, n439, new_piece_port, vss, vdd);
   {U580} no210 (n614, n612, n516, vss, vdd);
   {U581} no210 (n615, n551, n614, vss, vdd);
   {U582} no210 (n616, n555, n605, vss, vdd);
   {U583} iv110 (calc_rot_1_0_0, n616, vss, vdd);
   {U584} na310 (n617, n618, n619, n364, vss, vdd);
   {U585} na210 (lut_piece_type_0_port, n620, n619, vss, vdd);
   {U586} na210 (next_piece_2_0_0, n621, n618, vss, vdd);
   {U587} na210 (cur_future_piece_0_port, n622, n617, vss, vdd);
   {U588} na310 (n623, n624, n625, n363, vss, vdd);
   {U589} na210 (lut_piece_type_1_port, n620, n625, vss, vdd);
   {U590} na210 (next_piece_2_0_1, n621, n624, vss, vdd);
   {U591} na210 (cur_future_piece_1_port, n622, n623, vss, vdd);
   {U592} na310 (n626, n627, n628, n362, vss, vdd);
   {U593} na210 (lut_piece_type_2_port, n620, n628, vss, vdd);
   {U594} na210 (next_piece_2_0_2, n621, n627, vss, vdd);
   {U595} no210 (n439, n620, n621, vss, vdd);
   {U596} na210 (cur_future_piece_2_port, n622, n626, vss, vdd);
   {U597} no210 (n620, n463, n622, vss, vdd);
   {U598} iv110 (n629, n463, vss, vdd);
   {U599} na310 (n630, n600, n631, n620, vss, vdd);
   {U600} no310 (n486, y_port, move_start, n631, vss, vdd);
   {U601} no310 (n632, n450, n633, n600, vss, vdd);
   {U602} iv110 (n634, n632, vss, vdd);
   {U603} no210 (n496, n635, n630, vss, vdd);
   {U604} iv110 (n608, n635, vss, vdd);
   {U605} no310 (n636, n637, n638, n608, vss, vdd);
   {U606} na310 (n639, n640, n641, n361, vss, vdd);
   {U607} na210 (cur_future_piece_0_port, n642, n641, vss, vdd);
   {U608} na210 (n643, next_piece_2_0_0, n640, vss, vdd);
   {U609} na210 (n644, lut_piece_type_0_port, n639, vss, vdd);
   {U610} na310 (n645, n646, n647, n360, vss, vdd);
   {U611} na210 (cur_future_piece_1_port, n642, n647, vss, vdd);
   {U612} na210 (n643, next_piece_2_0_1, n646, vss, vdd);
   {U613} na210 (n644, lut_piece_type_1_port, n645, vss, vdd);
   {U614} na310 (n648, n649, n650, n359, vss, vdd);
   {U615} na210 (cur_future_piece_2_port, n642, n650, vss, vdd);
   {U616} na210 (n643, next_piece_2_0_2, n649, vss, vdd);
   {U617} no210 (n613, n642, n643, vss, vdd);
   {U618} iv110 (n486, n613, vss, vdd);
   {U619} na210 (n644, lut_piece_type_2_port, n648, vss, vdd);
   {U620} no210 (n642, n602, n644, vss, vdd);
   {U621} na310 (n651, n564, n652, n642, vss, vdd);
   {U622} no210 (n633, n638, n652, vss, vdd);
   {U623} na310 (n653, n654, n655, n638, vss, vdd);
   {U624} no310 (n412, n484, n511, n655, vss, vdd);
   {U625} no210 (rst, n565, n653, vss, vdd);
   {U626} na210 (n656, n657, n355, vss, vdd);
   {U627} na210 (cur_timer_1_time, n658, n657, vss, vdd);
   {U628} na210 (n659, n660, n658, vss, vdd);
   {U629} iv110 (n377, n659, vss, vdd);
   {U630} na210 (n378, n661, n377, vss, vdd);
   {U631} iv110 (n662, n378, vss, vdd);
   {U632} na210 (n663, n660, n656, vss, vdd);
   {U633} iv110 (n375, n663, vss, vdd);
   {U634} no310 (n495, n484, n664, n375, vss, vdd);
   {U635} iv110 (n395, n495, vss, vdd);
   {U636} na210 (n665, n666, n354, vss, vdd);
   {U637} na210 (cur_timer_1_reset, n667, n666, vss, vdd);
   {U638} na210 (n668, n660, n667, vss, vdd);
   {U639} iv110 (n383, n668, vss, vdd);
   {U640} na310 (n669, n651, n670, n383, vss, vdd);
   {U641} no310 (n629, n412, n664, n670, vss, vdd);
   {U642} iv110 (n671, n664, vss, vdd);
   {U643} iv110 (n672, n651, vss, vdd);
   {U644} iv110 (n633, n669, vss, vdd);
   {U645} na210 (n395, n567, n633, vss, vdd);
   {U646} na210 (n497, n673, n395, vss, vdd);
   {U647} na210 (n674, n660, n665, vss, vdd);
   {U648} iv110 (n381, n674, vss, vdd);
   {U649} no210 (n484, n675, n381, vss, vdd);
   {U650} no210 (n676, n535, n675, vss, vdd);
   {U651} no210 (n563, n677, n484, vss, vdd);
   {U652} na210 (n678, n679, n353, vss, vdd);
   {U653} na210 (cur_timer_1_start, n680, n679, vss, vdd);
   {U654} na210 (n681, n660, n680, vss, vdd);
   {U655} iv110 (n380, n681, vss, vdd);
   {U656} na210 (n661, n671, n380, vss, vdd);
   {U657} no210 (n486, n565, n671, vss, vdd);
   {U658} no210 (n682, n612, n565, vss, vdd);
   {U659} no210 (n611, n563, n486, vss, vdd);
   {U660} no310 (n629, n511, n672, n661, vss, vdd);
   {U661} na310 (n683, n634, n684, n672, vss, vdd);
   {U662} no310 (lut_next_piece_port, y_port, move_start, n684, vss, vdd);
   {U663} no310 (n389, n434, n685, n634, vss, vdd);
   {U664} na210 (n399, n547, n685, vss, vdd);
   {U665} na310 (cur_state_5_port, cur_state_0_port, n686, n547, vss, vdd);
   {U666} na210 (n673, n413, n399, vss, vdd);
   {U667} iv110 (n470, n434, vss, vdd);
   {U668} na310 (cur_state_5_port, n537, n686, n470, vss, vdd);
   {U669} no210 (n450, n636, n683, vss, vdd);
   {U670} na310 (n687, n515, n688, n636, vss, vdd);
   {U671} no310 (n689, draw_score_draw_port, n487, n688, vss, vdd);
   {U672} iv110 (n690, n487, vss, vdd);
   {U673} no210 (n691, n563, n689, vss, vdd);
   {U674} no210 (n549, n692, n691, vss, vdd);
   {U675} no210 (n436, n569, n515, vss, vdd);
   {U676} iv110 (n501, n569, vss, vdd);
   {U677} na210 (n412, n525, n501, vss, vdd);
   {U678} iv110 (n676, n412, vss, vdd);
   {U679} iv110 (n423, n436, vss, vdd);
   {U680} na310 (n497, n693, n694, n423, vss, vdd);
   {U681} iv110 (n695, n687, vss, vdd);
   {U682} na210 (n696, n461, n695, vss, vdd);
   {U683} no310 (n441, clear_shift_start_port, n697, n461, vss, vdd);
   {U684} iv110 (n508, n697, vss, vdd);
   {U685} na210 (n692, n413, n696, vss, vdd);
   {U686} na210 (n564, n682, n692, vss, vdd);
   {U687} no210 (n698, n612, n511, vss, vdd);
   {U688} na210 (n602, n564, n629, vss, vdd);
   {U689} na210 (n575, n497, n602, vss, vdd);
   {U690} iv110 (n682, n575, vss, vdd);
   {U691} na210 (n662, n660, n678, vss, vdd);
   {U692} iv110 (rst, n660, vss, vdd);
   {U693} na210 (n567, n654, n662, vss, vdd);
   {U694} na310 (n413, n392, n694, n654, vss, vdd);
   {U695} na210 (n699, n413, n567, vss, vdd);
   {U696} na310 (n700, n439, n701, lut_next_piece_port, vss, vdd);
   {U697} iv110 (n637, n701, vss, vdd);
   {U698} na310 (n506, n702, n447, n637, vss, vdd);
   {U699} na210 (n686, n693, n439, vss, vdd);
   {U700} no210 (n611, n535, draw_score_draw_port, vss, vdd);
   {U701} na310 (n703, n704, n705, draw_erase_start, vss, vdd);
   {U702} no210 (n451, n706, n705, vss, vdd);
   {U703} na210 (n506, n508, n451, vss, vdd);
   {U704} na210 (n549, n413, n508, vss, vdd);
   {U705} iv110 (n698, n549, vss, vdd);
   {U706} iv110 (n543, n506, vss, vdd);
   {U707} no210 (n611, n561, n543, vss, vdd);
   {U708} na210 (move_draw_erase_start, move_start, n704, vss, vdd);
   {U709} no210 (n496, n441, n703, vss, vdd);
   {U710} no210 (n535, n677, n441, vss, vdd);
   {U711} iv110 (n700, n496, vss, vdd);
   {U712} na210 (n615, n413, n700, vss, vdd);
   {U713} iv110 (n561, n413, vss, vdd);
   {U714} na210 (n707, n708, draw_erase_draw, vss, vdd);
   {U715} na210 (move_draw_erase_draw, move_start, n708, vss, vdd);
   {U716} iv110 (n706, n707, vss, vdd);
   {U717} na310 (n514, n709, n710, n706, vss, vdd);
   {U718} no310 (n711, n488, n389, n710, vss, vdd);
   {U719} no210 (n712, n713, n389, vss, vdd);
   {U720} mu111 (n612, n535, n537, n712, vss, vdd);
   {U721} iv110 (n702, n488, vss, vdd);
   {U722} na210 (n686, n714, n702, vss, vdd);
   {U723} no210 (n560, n563, n686, vss, vdd);
   {U724} no210 (n561, n676, n711, vss, vdd);
   {U725} na210 (n694, n714, n676, vss, vdd);
   {U726} na210 (n551, n550, n709, vss, vdd);
   {U727} iv110 (n414, n514, vss, vdd);
   {U728} na210 (n533, n447, n414, vss, vdd);
   {U729} na310 (n525, n693, n694, n447, vss, vdd);
   {U730} iv110 (n560, n694, vss, vdd);
   {U731} na210 (cur_state_3_port, n420, n560, vss, vdd);
   {U732} iv110 (cur_state_4_port, n420, vss, vdd);
   {U733} no210 (n450, n715, n533, vss, vdd);
   {U734} no210 (n682, n563, n715, vss, vdd);
   {U735} na310 (cur_state_4_port, n444, n693, n682, vss, vdd);
   {U736} no210 (n612, n534, n450, vss, vdd);
   {U737} iv110 (n716, clear_shift_start_port, vss, vdd);
   {U738} no210 (n415, n512, n716, vss, vdd);
   {U739} no210 (n698, n535, n512, vss, vdd);
   {U740} na310 (cur_state_4_port, cur_state_3_port, n693, n698, vss, vdd);
   {U741} no210 (n612, n677, n415, vss, vdd);
   {U742} na310 (n717, n690, n609, check_start, vss, vdd);
   {U743} na210 (n551, n497, n690, vss, vdd);
   {U744} iv110 (n564, n551, vss, vdd);
   {U745} na310 (n714, n444, cur_state_4_port, n564, vss, vdd);
   {U746} iv110 (cur_state_3_port, n444, vss, vdd);
   {U747} na210 (move_check_start, move_start, n717, vss, vdd);
   {U748} na210 (n718, n719, add_sub, vss, vdd);
   {U749} iv110 (y_port, n719, vss, vdd);
   {U750} na210 (n609, n396, y_port, vss, vdd);
   {U751} na210 (n673, n550, n396, vss, vdd);
   {U752} iv110 (n563, n550, vss, vdd);
   {U753} no210 (n713, n537, n673, vss, vdd);
   {U754} no210 (n541, n401, n609, vss, vdd);
   {U755} no210 (n561, n677, n401, vss, vdd);
   {U756} na310 (cur_state_3_port, n714, cur_state_4_port, n677, vss, vdd);
   {U757} na210 (cur_state_2_port, cur_state_1_port, n561, vss, vdd);
   {U758} no210 (n563, n534, n541, vss, vdd);
   {U759} iv110 (n699, n534, vss, vdd);
   {U760} no210 (n713, cur_state_0_port, n699, vss, vdd);
   {U761} na210 (cur_state_5_port, n720, n713, vss, vdd);
   {U762} na210 (n503, n721, n563, vss, vdd);
   {U763} na210 (move_add_sub, move_start, n718, vss, vdd);
   {U764} na210 (n722, n555, move_start, vss, vdd);
   {U765} na210 (n615, n497, n555, vss, vdd);
   {U766} iv110 (n535, n497, vss, vdd);
   {U767} na210 (cur_state_2_port, n503, n535, vss, vdd);
   {U768} iv110 (cur_state_1_port, n503, vss, vdd);
   {U769} iv110 (n524, n615, vss, vdd);
   {U770} na210 (n525, n723, n722, vss, vdd);
   {U771} na210 (n611, n524, n723, vss, vdd);
   {U772} na210 (n693, n720, n524, vss, vdd);
   {U773} iv110 (n562, n693, vss, vdd);
   {U774} na210 (n392, n537, n562, vss, vdd);
   {U775} iv110 (cur_state_5_port, n392, vss, vdd);
   {U776} na210 (n720, n714, n611, vss, vdd);
   {U777} no210 (n537, cur_state_5_port, n714, vss, vdd);
   {U778} iv110 (cur_state_0_port, n537, vss, vdd);
   {U779} no210 (cur_state_3_port, cur_state_4_port, n720, vss, vdd);
   {U780} iv110 (n612, n525, vss, vdd);
   {U781} na210 (cur_state_1_port, n721, n612, vss, vdd);
   {U782} iv110 (cur_state_2_port, n721, vss, vdd);
}



