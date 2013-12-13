extern network controller_calc (terminal old_x_2_0_2, old_x_2_0_1, old_x_2_0_0, 
                                         old_y_3_0_3, old_y_3_0_2, old_y_3_0_1, 
                                         old_y_3_0_0, old_rot_1_0_1, 
                                         old_rot_1_0_0, new_x_2_0_2, 
                                         new_x_2_0_1, new_x_2_0_0, new_y_3_0_3, 
                                         new_y_3_0_2, new_y_3_0_1, new_y_3_0_0, 
                                         new_rot_1_0_1, new_rot_1_0_0, add_sub, 
                                         rot, x, y, vss, vdd)
extern network controller_move (terminal clk, rst, x, y, rot, add_sub, 
                                         draw_erase_draw, draw_erase_start, 
                                         draw_erase_ready, start, ready, 
                                         inputs_3_0_3, inputs_3_0_2, 
                                         inputs_3_0_1, inputs_3_0_0, drop, 
                                         check_ready, check_start, check_empty, 
                                         vss, vdd)
extern network dfr11 (terminal D, R, CK, Q, vss, vdd)
extern network dfn10 (terminal D, CK, Q, vss, vdd)
extern network ex210 (terminal A, B, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network no310 (terminal A, B, C, Y, vss, vdd)
extern network na310 (terminal A, B, C, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
network controller (terminal clk, rst, lut_piece_type_2_0_2, 
                             lut_piece_type_2_0_1, lut_piece_type_2_0_0, 
                             lut_next_piece, lut_x_2_0_2, lut_x_2_0_1, 
                             lut_x_2_0_0, lut_y_3_0_3, lut_y_3_0_2, 
                             lut_y_3_0_1, lut_y_3_0_0, lut_rot_1_0_1, 
                             lut_rot_1_0_0, new_piece, next_piece_2_0_2, 
                             next_piece_2_0_1, next_piece_2_0_0, check_empty, 
                             check_start, check_ready, draw_erase_draw, 
                             draw_erase_start, draw_erase_ready, 
                             clear_shift_start, clear_shift_ready, 
                             draw_score_draw, draw_score_ready, timer_1_time, 
                             timer_1_start, timer_1_done, timer_1_reset, 
                             inputs_5_0_5, inputs_5_0_4, inputs_5_0_3, 
                             inputs_5_0_2, inputs_5_0_1, inputs_5_0_0, vss, vdd)
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
   net {new_piece, new_piece_port};
   net {clear_shift_start, clear_shift_start_port};
   net {draw_score_draw, draw_score_draw_port};
   {calc_pm} controller_calc (cur_x_2_port, cur_x_1_port, cur_x_0_port, 
                              cur_y_3_port, cur_y_2_port, cur_y_1_port, 
                              cur_y_0_port, cur_rot_1_port, cur_rot_0_port, 
                              lut_x_2_port, lut_x_1_port, lut_x_0_port, 
                              lut_y_3_port, lut_y_2_port, lut_y_1_port, 
                              lut_y_0_port, lut_rot_1_port, lut_rot_0_port, 
                              add_sub, rot, x, n270, vss, vdd);
   {move_pm} controller_move (clk, rst, move_x, move_y, move_rot, move_add_sub, 
                              move_draw_erase_draw, move_draw_erase_start, 
                              draw_erase_ready, n274, move_ready, inputs_5_0_3, 
                              inputs_5_0_2, inputs_5_0_1, inputs_5_0_0, n276, 
                              check_ready, move_check_start, check_empty, vss, 
                              vdd);
   {cur_timer_1_time_reg} dfn10 (n269, clk, cur_timer_1_time, vss, vdd);
   {cur_state_reg_3_inst} dfr11 (next_state_3_port, rst, clk, cur_state_3_port, 
                                 vss, vdd);
   {cur_y_reg_3_inst} dfn10 (n291, clk, cur_y_3_port, vss, vdd);
   {cur_state_reg_2_inst} dfr11 (next_state_2_port, rst, clk, cur_state_2_port, 
                                 vss, vdd);
   {cur_state_reg_0_inst} dfr11 (next_state_0_port, rst, clk, cur_state_0_port, 
                                 vss, vdd);
   {cur_state_reg_1_inst} dfr11 (next_state_1_port, rst, clk, cur_state_1_port, 
                                 vss, vdd);
   {cur_state_reg_4_inst} dfr11 (next_state_4_port, rst, clk, cur_state_4_port, 
                                 vss, vdd);
   {cur_y_reg_2_inst} dfn10 (n285, clk, cur_y_2_port, vss, vdd);
   {cur_y_reg_1_inst} dfn10 (n286, clk, cur_y_1_port, vss, vdd);
   {cur_y_reg_0_inst} dfn10 (n287, clk, cur_y_0_port, vss, vdd);
   {cur_timer_1_reset_reg} dfn10 (n268, clk, cur_timer_1_reset, vss, vdd);
   {cur_rot_reg_0_inst} dfn10 (n284, clk, cur_rot_0_port, vss, vdd);
   {cur_rot_reg_1_inst} dfn10 (n283, clk, cur_rot_1_port, vss, vdd);
   {cur_x_reg_2_inst} dfn10 (n288, clk, cur_x_2_port, vss, vdd);
   {cur_x_reg_1_inst} dfn10 (n289, clk, cur_x_1_port, vss, vdd);
   {cur_x_reg_0_inst} dfn10 (n290, clk, cur_x_0_port, vss, vdd);
   {cur_piece_reg_2_inst} dfn10 (n280, clk, lut_piece_type_2_port, vss, vdd);
   {cur_future_piece_reg_2_inst} dfn10 (n277, clk, cur_future_piece_2_port, 
                                        vss, vdd);
   {cur_piece_reg_1_inst} dfn10 (n281, clk, lut_piece_type_1_port, vss, vdd);
   {cur_future_piece_reg_1_inst} dfn10 (n278, clk, cur_future_piece_1_port, 
                                        vss, vdd);
   {cur_piece_reg_0_inst} dfn10 (n282, clk, lut_piece_type_0_port, vss, vdd);
   {cur_future_piece_reg_0_inst} dfn10 (n279, clk, cur_future_piece_0_port, 
                                        vss, vdd);
   {cur_timer_1_start_reg} dfn10 (n267, clk, cur_timer_1_start, vss, vdd);
   {U306} iv110 (n292, x, vss, vdd);
   {U307} na210 (n293, move_x, n292, vss, vdd);
   {U308} na210 (n294, n295, timer_1_time, vss, vdd);
   {U309} na210 (cur_timer_1_time, n296, n295, vss, vdd);
   {U310} iv110 (n297, n296, vss, vdd);
   {U311} na210 (n298, n299, timer_1_start, vss, vdd);
   {U312} na210 (cur_timer_1_start, n300, n299, vss, vdd);
   {U313} iv110 (n301, n298, vss, vdd);
   {U314} na210 (n302, n303, timer_1_reset, vss, vdd);
   {U315} na210 (cur_timer_1_reset, n304, n303, vss, vdd);
   {U316} iv110 (n305, n304, vss, vdd);
   {U317} iv110 (n306, n302, vss, vdd);
   {U318} iv110 (n307, rot, vss, vdd);
   {U319} na210 (n293, move_rot, n307, vss, vdd);
   {U320} na310 (n308, n309, n310, next_state_4_port, vss, vdd);
   {U321} no310 (n311, n312, n313, n310, vss, vdd);
   {U322} no210 (n314, n315, n313, vss, vdd);
   {U323} no210 (n316, n317, n312, vss, vdd);
   {U324} no210 (n318, n319, n316, vss, vdd);
   {U325} no210 (move_ready, n320, n318, vss, vdd);
   {U326} no210 (n321, n322, n309, vss, vdd);
   {U327} no210 (n323, n324, n308, vss, vdd);
   {U328} no310 (n325, cur_timer_1_time, n326, n324, vss, vdd);
   {U329} no210 (n327, n328, n323, vss, vdd);
   {U330} na310 (n329, n330, n331, next_state_3_port, vss, vdd);
   {U331} no310 (n332, n333, n334, n331, vss, vdd);
   {U332} no310 (n325, n335, n326, n334, vss, vdd);
   {U333} no210 (n336, n337, n332, vss, vdd);
   {U334} no210 (n338, n339, n336, vss, vdd);
   {U335} iv110 (n340, n329, vss, vdd);
   {U336} na310 (n341, n342, n343, next_state_2_port, vss, vdd);
   {U337} no310 (n344, n345, n340, n343, vss, vdd);
   {U338} na310 (n346, n347, n348, n340, vss, vdd);
   {U339} no210 (n349, n350, n348, vss, vdd);
   {U340} no310 (n351, n328, n352, n350, vss, vdd);
   {U341} iv110 (n327, n352, vss, vdd);
   {U342} no310 (n353, n354, n355, n327, vss, vdd);
   {U343} iv110 (n356, n355, vss, vdd);
   {U344} no210 (n357, n358, n356, vss, vdd);
   {U345} ex210 (lut_y_1_port, cur_y_1_port, n358, vss, vdd);
   {U346} ex210 (lut_y_3_port, cur_y_3_port, n357, vss, vdd);
   {U347} ex210 (cur_y_0_port, lut_y_0_port, n354, vss, vdd);
   {U348} ex210 (cur_y_2_port, lut_y_2_port, n353, vss, vdd);
   {U349} na310 (n359, n325, new_piece_port, n347, vss, vdd);
   {U350} na210 (draw_score_ready, draw_score_draw_port, n346, vss, vdd);
   {U351} no210 (n360, n361, n345, vss, vdd);
   {U352} iv110 (clear_shift_start_port, n360, vss, vdd);
   {U353} no210 (n362, n363, n341, vss, vdd);
   {U354} no210 (n364, n365, n362, vss, vdd);
   {U355} no310 (n339, lut_next_piece_port, n366, n364, vss, vdd);
   {U356} no210 (check_ready, n367, n366, vss, vdd);
   {U357} na310 (n368, n369, n370, n339, vss, vdd);
   {U358} na210 (n371, n372, n370, vss, vdd);
   {U359} na310 (n373, n374, n375, next_state_1_port, vss, vdd);
   {U360} no310 (n376, n377, n378, n375, vss, vdd);
   {U361} no210 (n320, n351, n377, vss, vdd);
   {U362} na210 (n379, n380, n376, vss, vdd);
   {U363} na210 (n381, n382, n380, vss, vdd);
   {U364} na210 (n383, draw_erase_ready, n379, vss, vdd);
   {U365} no210 (n384, n385, n374, vss, vdd);
   {U366} no210 (cur_timer_1_time, n386, n385, vss, vdd);
   {U367} no310 (n387, n367, n388, n384, vss, vdd);
   {U368} no210 (n389, n363, n373, vss, vdd);
   {U369} no210 (inputs_5_0_4, n326, n363, vss, vdd);
   {U370} no210 (n390, n391, n389, vss, vdd);
   {U371} no310 (n392, n274, n393, n390, vss, vdd);
   {U372} no210 (draw_erase_ready, n394, n393, vss, vdd);
   {U373} na310 (n395, n396, n397, next_state_0_port, vss, vdd);
   {U374} no310 (n398, n344, n378, n397, vss, vdd);
   {U375} na310 (n399, n400, n401, n378, vss, vdd);
   {U376} iv110 (n311, n401, vss, vdd);
   {U377} na310 (n402, n403, n404, n311, vss, vdd);
   {U378} na210 (n405, n406, n403, vss, vdd);
   {U379} iv110 (n407, n406, vss, vdd);
   {U380} na210 (draw_erase_ready, n371, n402, vss, vdd);
   {U381} na310 (n359, n325, n333, n399, vss, vdd);
   {U382} iv110 (n408, n333, vss, vdd);
   {U383} iv110 (inputs_5_0_4, n325, vss, vdd);
   {U384} na210 (n409, n410, n344, vss, vdd);
   {U385} na210 (n338, n388, n410, vss, vdd);
   {U386} iv110 (check_empty, n388, vss, vdd);
   {U387} na210 (n330, n411, n398, vss, vdd);
   {U388} na210 (timer_1_done, n321, n411, vss, vdd);
   {U389} na210 (n412, draw_erase_ready, n330, vss, vdd);
   {U390} no310 (n413, n414, n322, n396, vss, vdd);
   {U391} no310 (n415, n335, n382, n322, vss, vdd);
   {U392} iv110 (inputs_5_0_5, n382, vss, vdd);
   {U393} iv110 (cur_timer_1_time, n335, vss, vdd);
   {U394} no210 (n416, n417, n395, vss, vdd);
   {U395} no210 (n418, n419, n417, vss, vdd);
   {U396} no310 (n420, n421, n392, n418, vss, vdd);
   {U397} na210 (n422, n368, n392, vss, vdd);
   {U398} na210 (n423, n314, n368, vss, vdd);
   {U399} iv110 (n319, n422, vss, vdd);
   {U400} na310 (n424, n425, n426, n319, vss, vdd);
   {U401} no210 (n405, n371, n426, vss, vdd);
   {U402} na210 (n338, n387, n425, vss, vdd);
   {U403} iv110 (check_ready, n387, vss, vdd);
   {U404} na210 (clear_shift_start_port, n361, n424, vss, vdd);
   {U405} iv110 (clear_shift_ready, n361, vss, vdd);
   {U406} no210 (n427, n428, n416, vss, vdd);
   {U407} no210 (inputs_5_0_4, n314, n428, vss, vdd);
   {U408} iv110 (n359, n314, vss, vdd);
   {U409} no210 (n407, inputs_5_0_5, n359, vss, vdd);
   {U410} na210 (n429, n430, n407, vss, vdd);
   {U411} no210 (inputs_5_0_3, inputs_5_0_2, n430, vss, vdd);
   {U412} no210 (inputs_5_0_1, inputs_5_0_0, n429, vss, vdd);
   {U413} no210 (n431, new_piece_port, n427, vss, vdd);
   {U414} no210 (n432, n433, n431, vss, vdd);
   {U415} na210 (n434, n435, n291, vss, vdd);
   {U416} na210 (n436, lut_y_3_port, n435, vss, vdd);
   {U417} na210 (cur_y_3_port, n437, n434, vss, vdd);
   {U418} na310 (n438, n439, n440, n290, vss, vdd);
   {U419} na210 (lut_x_0_port, n441, n439, vss, vdd);
   {U420} na210 (cur_x_0_port, n442, n438, vss, vdd);
   {U421} na310 (n443, n444, n440, n289, vss, vdd);
   {U422} na210 (n412, n445, n440, vss, vdd);
   {U423} iv110 (n394, n412, vss, vdd);
   {U424} na210 (lut_x_1_port, n441, n444, vss, vdd);
   {U425} na210 (cur_x_1_port, n442, n443, vss, vdd);
   {U426} na210 (n446, n447, n288, vss, vdd);
   {U427} na210 (lut_x_2_port, n441, n447, vss, vdd);
   {U428} no210 (n448, n449, n441, vss, vdd);
   {U429} na210 (cur_x_2_port, n442, n446, vss, vdd);
   {U430} na210 (n445, n450, n442, vss, vdd);
   {U431} iv110 (n449, n445, vss, vdd);
   {U432} no210 (n451, n452, n449, vss, vdd);
   {U433} no310 (n453, n372, n454, n452, vss, vdd);
   {U434} na210 (n328, n409, n454, vss, vdd);
   {U435} na210 (n455, n456, n287, vss, vdd);
   {U436} na210 (n436, lut_y_0_port, n456, vss, vdd);
   {U437} na210 (cur_y_0_port, n437, n455, vss, vdd);
   {U438} na210 (n457, n458, n286, vss, vdd);
   {U439} na210 (n436, lut_y_1_port, n458, vss, vdd);
   {U440} na210 (cur_y_1_port, n437, n457, vss, vdd);
   {U441} na210 (n459, n460, n285, vss, vdd);
   {U442} na210 (n436, lut_y_2_port, n460, vss, vdd);
   {U443} no310 (n351, n328, n453, n436, vss, vdd);
   {U444} na210 (cur_y_2_port, n437, n459, vss, vdd);
   {U445} na310 (n461, n462, n463, n437, vss, vdd);
   {U446} no210 (n293, n421, n463, vss, vdd);
   {U447} no210 (move_ready, n328, n421, vss, vdd);
   {U448} na210 (n464, n465, n284, vss, vdd);
   {U449} na310 (n451, n414, lut_rot_0_port, n465, vss, vdd);
   {U450} na210 (cur_rot_0_port, n466, n464, vss, vdd);
   {U451} na210 (n467, n468, n283, vss, vdd);
   {U452} na310 (n451, n414, lut_rot_1_port, n468, vss, vdd);
   {U453} iv110 (n448, n414, vss, vdd);
   {U454} na210 (move_ready, n293, n448, vss, vdd);
   {U455} na210 (cur_rot_1_port, n466, n467, vss, vdd);
   {U456} na210 (n451, n450, n466, vss, vdd);
   {U457} na210 (n293, n351, n450, vss, vdd);
   {U458} iv110 (move_ready, n351, vss, vdd);
   {U459} no310 (n453, n276, n469, n451, vss, vdd);
   {U460} na310 (n470, n471, n472, n282, vss, vdd);
   {U461} na210 (lut_piece_type_0_port, n473, n472, vss, vdd);
   {U462} na210 (cur_future_piece_0_port, n474, n471, vss, vdd);
   {U463} na210 (next_piece_2_0_0, n475, n470, vss, vdd);
   {U464} na310 (n476, n477, n478, n281, vss, vdd);
   {U465} na210 (lut_piece_type_1_port, n473, n478, vss, vdd);
   {U466} na210 (cur_future_piece_1_port, n474, n477, vss, vdd);
   {U467} na210 (next_piece_2_0_1, n475, n476, vss, vdd);
   {U468} na310 (n479, n480, n481, n280, vss, vdd);
   {U469} na210 (lut_piece_type_2_port, n473, n481, vss, vdd);
   {U470} na210 (cur_future_piece_2_port, n474, n480, vss, vdd);
   {U471} no210 (n473, n461, n474, vss, vdd);
   {U472} iv110 (n469, n461, vss, vdd);
   {U473} na210 (n394, n409, n469, vss, vdd);
   {U474} na210 (next_piece_2_0_2, n475, n479, vss, vdd);
   {U475} no210 (n473, n482, n475, vss, vdd);
   {U476} na310 (n483, n320, n462, n473, vss, vdd);
   {U477} iv110 (n453, n462, vss, vdd);
   {U478} na310 (n484, n369, n485, n453, vss, vdd);
   {U479} no310 (new_piece_port, rst, n405, n485, vss, vdd);
   {U480} iv110 (n486, n484, vss, vdd);
   {U481} na210 (lut_next_piece_port, n372, n483, vss, vdd);
   {U482} na310 (n487, n488, n489, n279, vss, vdd);
   {U483} na210 (cur_future_piece_0_port, n490, n489, vss, vdd);
   {U484} na210 (n491, next_piece_2_0_0, n488, vss, vdd);
   {U485} na210 (n492, lut_piece_type_0_port, n487, vss, vdd);
   {U486} na310 (n493, n494, n495, n278, vss, vdd);
   {U487} na210 (cur_future_piece_1_port, n490, n495, vss, vdd);
   {U488} na210 (n491, next_piece_2_0_1, n494, vss, vdd);
   {U489} na210 (n492, lut_piece_type_1_port, n493, vss, vdd);
   {U490} na310 (n496, n497, n498, n277, vss, vdd);
   {U491} na210 (cur_future_piece_2_port, n490, n498, vss, vdd);
   {U492} na210 (n491, next_piece_2_0_2, n497, vss, vdd);
   {U493} no210 (n490, n499, n491, vss, vdd);
   {U494} na210 (n492, lut_piece_type_2_port, n496, vss, vdd);
   {U495} no210 (n490, n394, n492, vss, vdd);
   {U496} iv110 (n500, n490, vss, vdd);
   {U497} no310 (n486, n501, n502, n500, vss, vdd);
   {U498} na210 (n503, n504, n502, vss, vdd);
   {U499} na210 (lut_next_piece_port, n505, n504, vss, vdd);
   {U500} na210 (n482, draw_erase_ready, n505, vss, vdd);
   {U501} na310 (n506, n404, n507, n486, vss, vdd);
   {U502} no310 (n423, n321, n349, n507, vss, vdd);
   {U503} no210 (n508, n509, n404, vss, vdd);
   {U504} no210 (n371, n510, n506, vss, vdd);
   {U505} iv110 (n511, n371, vss, vdd);
   {U506} no210 (n328, n512, n270, vss, vdd);
   {U507} iv110 (move_y, n512, vss, vdd);
   {U508} na210 (n513, n514, n269, vss, vdd);
   {U509} na210 (cur_timer_1_time, n515, n514, vss, vdd);
   {U510} na210 (n297, n503, n515, vss, vdd);
   {U511} no310 (n423, n321, n516, n297, vss, vdd);
   {U512} iv110 (n315, n423, vss, vdd);
   {U513} na210 (n517, n518, n315, vss, vdd);
   {U514} na210 (n519, n503, n513, vss, vdd);
   {U515} iv110 (n294, n519, vss, vdd);
   {U516} no310 (n520, n349, n521, n294, vss, vdd);
   {U517} na210 (n522, n499, n521, vss, vdd);
   {U518} iv110 (n400, n349, vss, vdd);
   {U519} no210 (n523, n391, n520, vss, vdd);
   {U520} na210 (n524, n525, n268, vss, vdd);
   {U521} na210 (cur_timer_1_reset, n526, n525, vss, vdd);
   {U522} na210 (n305, n503, n526, vss, vdd);
   {U523} no310 (new_piece_port, n508, n516, n305, vss, vdd);
   {U524} na210 (n527, n528, n516, vss, vdd);
   {U525} na310 (n365, n317, cur_state_1_port, n528, vss, vdd);
   {U526} na210 (n306, n503, n524, vss, vdd);
   {U527} na210 (n400, n529, n306, vss, vdd);
   {U528} na210 (n509, n391, n529, vss, vdd);
   {U529} iv110 (n523, n509, vss, vdd);
   {U530} na210 (n517, n365, n523, vss, vdd);
   {U531} na210 (n518, n530, n400, vss, vdd);
   {U532} na210 (n531, n532, n267, vss, vdd);
   {U533} na210 (cur_timer_1_start, n533, n532, vss, vdd);
   {U534} na210 (n534, n503, n533, vss, vdd);
   {U535} iv110 (n300, n534, vss, vdd);
   {U536} na310 (n535, n499, n527, n300, vss, vdd);
   {U537} no310 (n501, lut_next_piece_port, n510, n527, vss, vdd);
   {U538} na310 (n386, n408, n536, n510, vss, vdd);
   {U539} no210 (clear_shift_start_port, n338, n536, vss, vdd);
   {U540} iv110 (n367, n338, vss, vdd);
   {U541} na310 (n537, cur_state_4_port, n538, n408, vss, vdd);
   {U542} no210 (cur_state_3_port, cur_state_0_port, n538, vss, vdd);
   {U543} no210 (n381, n413, n386, vss, vdd);
   {U544} iv110 (n326, n413, vss, vdd);
   {U545} na310 (n391, n365, n530, n326, vss, vdd);
   {U546} iv110 (n415, n381, vss, vdd);
   {U547} na210 (n539, n518, n415, vss, vdd);
   {U548} na310 (n409, n369, n540, n501, vss, vdd);
   {U549} no210 (n274, n405, n540, vss, vdd);
   {U550} no210 (n541, n542, n405, vss, vdd);
   {U551} na210 (n537, n530, n409, vss, vdd);
   {U552} iv110 (new_piece_port, n499, vss, vdd);
   {U553} no210 (n433, n541, new_piece_port, vss, vdd);
   {U554} na210 (n517, cur_state_1_port, n535, vss, vdd);
   {U555} na210 (n301, n503, n531, vss, vdd);
   {U556} iv110 (rst, n503, vss, vdd);
   {U557} na310 (n511, n522, n342, n301, vss, vdd);
   {U558} na210 (n321, n543, n342, vss, vdd);
   {U559} iv110 (timer_1_done, n543, vss, vdd);
   {U560} no310 (n317, n542, n419, n321, vss, vdd);
   {U561} iv110 (n508, n522, vss, vdd);
   {U562} no310 (n542, cur_state_0_port, n317, n508, vss, vdd);
   {U563} na210 (n394, n482, lut_next_piece_port, vss, vdd);
   {U564} iv110 (n369, draw_score_draw_port, vss, vdd);
   {U565} na310 (n544, n337, n537, n369, vss, vdd);
   {U566} na310 (n545, n511, n546, draw_erase_start, vss, vdd);
   {U567} iv110 (n420, n546, vss, vdd);
   {U568} na210 (n394, n547, n420, vss, vdd);
   {U569} na210 (n383, n372, n547, vss, vdd);
   {U570} iv110 (draw_erase_ready, n372, vss, vdd);
   {U571} iv110 (n482, n383, vss, vdd);
   {U572} na210 (n537, n539, n482, vss, vdd);
   {U573} no210 (n541, cur_state_3_port, n539, vss, vdd);
   {U574} na210 (move_draw_erase_start, n274, n545, vss, vdd);
   {U575} na310 (n511, n394, n548, draw_erase_draw, vss, vdd);
   {U576} na210 (move_draw_erase_draw, n274, n548, vss, vdd);
   {U577} na310 (n544, n337, n518, n394, vss, vdd);
   {U578} no210 (n365, n391, n518, vss, vdd);
   {U579} iv110 (n432, n544, vss, vdd);
   {U580} na310 (cur_state_1_port, n365, n530, n511, vss, vdd);
   {U581} no210 (n337, n432, n530, vss, vdd);
   {U582} no310 (n317, cur_state_0_port, n433, clear_shift_start_port, vss, 
                 vdd);
   {U583} na210 (n367, n549, check_start, vss, vdd);
   {U584} na210 (move_check_start, n274, n549, vss, vdd);
   {U585} iv110 (n320, n274, vss, vdd);
   {U586} no210 (n276, n293, n320, vss, vdd);
   {U587} na210 (n537, n517, n367, vss, vdd);
   {U588} no210 (n337, n541, n517, vss, vdd);
   {U589} na210 (cur_state_0_port, n317, n541, vss, vdd);
   {U590} no210 (n365, cur_state_1_port, n537, vss, vdd);
   {U591} na210 (n328, n550, add_sub, vss, vdd);
   {U592} na210 (move_add_sub, n293, n550, vss, vdd);
   {U593} no210 (n432, n542, n293, vss, vdd);
   {U594} na310 (n365, n337, cur_state_1_port, n542, vss, vdd);
   {U595} na210 (n317, n419, n432, vss, vdd);
   {U596} iv110 (n276, n328, vss, vdd);
   {U597} no310 (n419, n317, n433, n276, vss, vdd);
   {U598} na310 (n365, n337, n391, n433, vss, vdd);
   {U599} iv110 (cur_state_1_port, n391, vss, vdd);
   {U600} iv110 (cur_state_3_port, n337, vss, vdd);
   {U601} iv110 (cur_state_2_port, n365, vss, vdd);
   {U602} iv110 (cur_state_4_port, n317, vss, vdd);
   {U603} iv110 (cur_state_0_port, n419, vss, vdd);
}



