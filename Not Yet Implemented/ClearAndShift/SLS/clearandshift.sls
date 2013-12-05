extern network dfn10 (terminal D, CK, Q, vss, vdd)
extern network dfr11 (terminal D, R, CK, Q, vss, vdd)
extern network tinv10 (terminal A, E, Y, vss, vdd)
extern network mu111 (terminal A, B, S, Y, vss, vdd)
extern network ex210 (terminal A, B, Y, vss, vdd)
extern network na310 (terminal A, B, C, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network no310 (terminal A, B, C, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
network clearandshift (terminal clk, reset, start, ram_in, ram_out, 
                                ram_addr_7_0_7, ram_addr_7_0_6, ram_addr_7_0_5, 
                                ram_addr_7_0_4, ram_addr_7_0_3, ram_addr_7_0_2, 
                                ram_addr_7_0_1, ram_addr_7_0_0, ram_write, 
                                score, ready, vss, vdd)
{
   {ram_out_tri_enable_reg} dfn10 (n200, clk, N55, vss, vdd);
   {ram_addr_tri_enable_reg_7_inst} dfn10 (n201, clk, N58, vss, vdd);
   {ram_addr_tri_enable_reg_6_inst} dfn10 (n202, clk, N61, vss, vdd);
   {ram_addr_tri_enable_reg_5_inst} dfn10 (n203, clk, N64, vss, vdd);
   {ram_addr_tri_enable_reg_4_inst} dfn10 (n204, clk, N67, vss, vdd);
   {ram_addr_tri_enable_reg_3_inst} dfn10 (n205, clk, N70, vss, vdd);
   {ram_addr_tri_enable_reg_2_inst} dfn10 (n206, clk, N73, vss, vdd);
   {ram_addr_tri_enable_reg_1_inst} dfn10 (n207, clk, N76, vss, vdd);
   {ram_addr_tri_enable_reg_0_inst} dfn10 (n208, clk, N79, vss, vdd);
   {ram_write_tri_enable_reg} dfn10 (n209, clk, N82, vss, vdd);
   {shift_row_reg_0_inst} dfr11 (n_shift_row_0_port, reset, clk, 
                                 shift_row_0_port, vss, vdd);
   {shift_row_reg_1_inst} dfr11 (n_shift_row_1_port, reset, clk, 
                                 shift_row_1_port, vss, vdd);
   {shift_row_reg_2_inst} dfr11 (n_shift_row_2_port, reset, clk, 
                                 shift_row_2_port, vss, vdd);
   {state_reg_0_inst} dfr11 (next_state_0_port, reset, clk, state_0_port, vss, 
                             vdd);
   {row_reg_0_inst} dfr11 (n_row_0_port, reset, clk, row_0_port, vss, vdd);
   {state_reg_3_inst} dfr11 (n197, reset, clk, state_3_port, vss, vdd);
   {shift_col_reg_1_inst} dfr11 (n_shift_col_1_port, reset, clk, 
                                 shift_col_1_port, vss, vdd);
   {state_reg_2_inst} dfr11 (next_state_2_port, reset, clk, state_2_port, vss, 
                             vdd);
   {state_reg_1_inst} dfr11 (next_state_1_port, reset, clk, state_1_port, vss, 
                             vdd);
   {col_reg_0_inst} dfr11 (n_col_0_port, reset, clk, col_0_port, vss, vdd);
   {col_reg_1_inst} dfr11 (n_col_1_port, reset, clk, col_1_port, vss, vdd);
   {col_reg_2_inst} dfr11 (n_col_2_port, reset, clk, col_2_port, vss, vdd);
   {ready_reg} dfn10 (n196, clk, ready, vss, vdd);
   {shift_col_reg_0_inst} dfr11 (n_shift_col_0_port, reset, clk, 
                                 shift_col_0_port, vss, vdd);
   {shift_col_reg_2_inst} dfr11 (n_shift_col_2_port, reset, clk, 
                                 shift_col_2_port, vss, vdd);
   {row_reg_3_inst} dfr11 (n_row_3_port, reset, clk, row_3_port, vss, vdd);
   {row_reg_1_inst} dfr11 (n_row_1_port, reset, clk, row_1_port, vss, vdd);
   {row_reg_2_inst} dfr11 (n_row_2_port, reset, clk, row_2_port, vss, vdd);
   {shift_row_reg_3_inst} dfr11 (n_shift_row_3_port, reset, clk, 
                                 shift_row_3_port, vss, vdd);
   {score_reg} dfr11 (n199, reset, clk, score, vss, vdd);
   {ram_write_tri2} tinv10 (n1, n194, ram_write, vss, vdd);
   {ram_addr_tri2_0_inst} tinv10 (n1, n193, ram_addr_7_0_0, vss, vdd);
   {ram_addr_tri2_1_inst} tinv10 (n1, n192, ram_addr_7_0_1, vss, vdd);
   {ram_addr_tri2_2_inst} tinv10 (n1, n191, ram_addr_7_0_2, vss, vdd);
   {ram_addr_tri2_3_inst} tinv10 (n1, n190, ram_addr_7_0_3, vss, vdd);
   {ram_addr_tri2_4_inst} tinv10 (n1, n189, ram_addr_7_0_4, vss, vdd);
   {ram_addr_tri2_5_inst} tinv10 (n1, n188, ram_addr_7_0_5, vss, vdd);
   {ram_addr_tri2_6_inst} tinv10 (n1, n187, ram_addr_7_0_6, vss, vdd);
   {ram_addr_tri2_7_inst} tinv10 (n1, n186, ram_addr_7_0_7, vss, vdd);
   {ram_out_tri2} tinv10 (n1, n185, ram_out, vss, vdd);
   {ram_addr_tri_0_inst} tinv10 (n184, n177, ram_addr_7_0_0, vss, vdd);
   {ram_addr_tri_1_inst} tinv10 (n183, n177, ram_addr_7_0_1, vss, vdd);
   {ram_addr_tri_2_inst} tinv10 (n182, n177, ram_addr_7_0_2, vss, vdd);
   {ram_addr_tri_3_inst} tinv10 (n181, n177, ram_addr_7_0_3, vss, vdd);
   {ram_addr_tri_4_inst} tinv10 (n180, n177, ram_addr_7_0_4, vss, vdd);
   {ram_addr_tri_5_inst} tinv10 (n179, n177, ram_addr_7_0_5, vss, vdd);
   {ram_addr_tri_6_inst} tinv10 (n178, n177, ram_addr_7_0_6, vss, vdd);
   {ram_addr_tri_7_inst} tinv10 (n1, n177, ram_addr_7_0_7, vss, vdd);
   {ram_write_tri} tinv10 (n176, n177, ram_write, vss, vdd);
   {ram_out_tri} tinv10 (n174, n175, ram_out, vss, vdd);
   net {n1, vdd};
   {U227} iv110 (n195, n196, vss, vdd);
   {U228} no210 (reset, n198, n195, vss, vdd);
   {U229} na310 (n210, n211, n212, next_state_2_port, vss, vdd);
   {U230} no310 (n213, n214, n215, n212, vss, vdd);
   {U231} no210 (n216, n217, n214, vss, vdd);
   {U232} no210 (state_0_port, n218, n213, vss, vdd);
   {U233} no210 (n219, n220, n211, vss, vdd);
   {U234} no210 (n221, n222, n210, vss, vdd);
   {U235} no210 (n223, n224, n222, vss, vdd);
   {U236} no310 (n225, n226, n227, n221, vss, vdd);
   {U237} na310 (n228, n229, n230, next_state_1_port, vss, vdd);
   {U238} no310 (n231, n232, n220, n230, vss, vdd);
   {U239} no210 (n176, n233, n231, vss, vdd);
   {U240} iv110 (n234, n228, vss, vdd);
   {U241} na310 (n235, n236, n237, next_state_0_port, vss, vdd);
   {U242} no310 (n238, n234, n239, n237, vss, vdd);
   {U243} na310 (n240, n241, n242, n234, vss, vdd);
   {U244} na210 (n243, n244, n242, vss, vdd);
   {U245} na310 (state_1_port, n225, n245, n241, vss, vdd);
   {U246} iv110 (n227, n245, vss, vdd);
   {U247} iv110 (ram_in, n225, vss, vdd);
   {U248} na310 (n246, n247, n248, n240, vss, vdd);
   {U249} mu111 (n246, n249, n250, n238, vss, vdd);
   {U250} na210 (start, n198, n236, vss, vdd);
   {U251} no210 (n251, n252, n235, vss, vdd);
   {U252} na310 (n253, n254, n255, n_shift_row_3_port, vss, vdd);
   {U253} na210 (row_3_port, n199, n255, vss, vdd);
   {U254} na210 (n220, n256, n254, vss, vdd);
   {U255} iv110 (n257, n256, vss, vdd);
   {U256} na210 (shift_row_3_port, n258, n253, vss, vdd);
   {U257} na310 (n259, n260, n261, n_shift_row_2_port, vss, vdd);
   {U258} na210 (row_2_port, n199, n261, vss, vdd);
   {U259} na210 (n220, n262, n260, vss, vdd);
   {U260} na210 (shift_row_2_port, n258, n259, vss, vdd);
   {U261} na310 (n263, n264, n265, n_shift_row_1_port, vss, vdd);
   {U262} na210 (row_1_port, n199, n265, vss, vdd);
   {U263} na210 (n266, n220, n264, vss, vdd);
   {U264} na210 (shift_row_1_port, n258, n263, vss, vdd);
   {U265} na210 (n267, n268, n_shift_row_0_port, vss, vdd);
   {U266} na210 (row_0_port, n199, n268, vss, vdd);
   {U267} iv110 (n269, n267, vss, vdd);
   {U268} mu111 (n258, n220, n270, n269, vss, vdd);
   {U269} na310 (n218, n271, n272, n258, vss, vdd);
   {U270} na210 (n273, n274, n_shift_col_2_port, vss, vdd);
   {U271} na310 (n275, n233, n276, n274, vss, vdd);
   {U272} na210 (n277, n278, n276, vss, vdd);
   {U273} na210 (shift_col_1_port, shift_col_0_port, n278, vss, vdd);
   {U274} na210 (shift_col_2_port, n279, n273, vss, vdd);
   {U275} mu111 (n280, n281, shift_col_1_port, n_shift_col_1_port, vss, vdd);
   {U276} na210 (n282, n283, n281, vss, vdd);
   {U277} na210 (n275, n284, n283, vss, vdd);
   {U278} iv110 (n279, n282, vss, vdd);
   {U279} no210 (n229, n284, n280, vss, vdd);
   {U280} iv110 (n275, n229, vss, vdd);
   {U281} mu111 (n275, n279, shift_col_0_port, n_shift_col_0_port, vss, vdd);
   {U282} na210 (n176, n218, n279, vss, vdd);
   {U283} na210 (n285, n271, n275, vss, vdd);
   {U284} na210 (n286, n287, n_row_3_port, vss, vdd);
   {U285} na210 (row_3_port, n288, n287, vss, vdd);
   {U286} na210 (n289, n290, n288, vss, vdd);
   {U287} na210 (n291, row_2_port, n286, vss, vdd);
   {U288} mu111 (n291, n292, row_2_port, n_row_2_port, vss, vdd);
   {U289} na210 (n293, n294, n292, vss, vdd);
   {U290} na210 (n295, n296, n294, vss, vdd);
   {U291} iv110 (n297, n293, vss, vdd);
   {U292} no310 (n296, n298, n299, n291, vss, vdd);
   {U293} mu111 (n300, n297, row_1_port, n_row_1_port, vss, vdd);
   {U294} na210 (n289, n301, n297, vss, vdd);
   {U295} na210 (n295, n298, n301, vss, vdd);
   {U296} iv110 (n302, n289, vss, vdd);
   {U297} no210 (n298, n299, n300, vss, vdd);
   {U298} iv110 (n252, n299, vss, vdd);
   {U299} mu111 (n252, n302, row_0_port, n_row_0_port, vss, vdd);
   {U300} na310 (n303, n224, n304, n302, vss, vdd);
   {U301} iv110 (n251, n224, vss, vdd);
   {U302} na210 (n305, n295, n303, vss, vdd);
   {U303} iv110 (n290, n295, vss, vdd);
   {U304} no210 (n290, n305, n252, vss, vdd);
   {U305} no310 (n296, n298, n306, n305, vss, vdd);
   {U306} na210 (row_2_port, row_3_port, n306, vss, vdd);
   {U307} na210 (n307, state_0_port, n290, vss, vdd);
   {U308} na210 (n308, n309, n_col_2_port, vss, vdd);
   {U309} na310 (col_1_port, col_0_port, n310, n309, vss, vdd);
   {U310} na210 (col_2_port, n311, n308, vss, vdd);
   {U311} na210 (n304, n312, n311, vss, vdd);
   {U312} mu111 (n313, n314, n315, n_col_1_port, vss, vdd);
   {U313} no210 (n316, n312, n314, vss, vdd);
   {U314} na210 (n304, n317, n313, vss, vdd);
   {U315} na210 (n310, n316, n317, vss, vdd);
   {U316} iv110 (n318, n304, vss, vdd);
   {U317} mu111 (n310, n318, col_0_port, n_col_0_port, vss, vdd);
   {U318} na310 (n319, n320, n321, n318, vss, vdd);
   {U319} na210 (n307, n244, n319, vss, vdd);
   {U320} iv110 (n312, n310, vss, vdd);
   {U321} na210 (n251, n223, n312, vss, vdd);
   {U322} na310 (col_1_port, col_0_port, col_2_port, n223, vss, vdd);
   {U323} na210 (n322, n194, n209, vss, vdd);
   {U324} na210 (n322, n193, n208, vss, vdd);
   {U325} na210 (n322, n192, n207, vss, vdd);
   {U326} na210 (n322, n191, n206, vss, vdd);
   {U327} na210 (n322, n190, n205, vss, vdd);
   {U328} na210 (n322, n189, n204, vss, vdd);
   {U329} na210 (n322, n188, n203, vss, vdd);
   {U330} na210 (n322, n187, n202, vss, vdd);
   {U331} na210 (n322, n186, n201, vss, vdd);
   {U332} na210 (n322, n185, n200, vss, vdd);
   {U333} iv110 (reset, n322, vss, vdd);
   {U334} no310 (state_1_port, state_2_port, n227, n198, vss, vdd);
   {U335} na310 (n323, n324, n325, n197, vss, vdd);
   {U336} no210 (n246, n215, n325, vss, vdd);
   {U337} no210 (n250, n326, n215, vss, vdd);
   {U338} iv110 (n233, n250, vss, vdd);
   {U339} na310 (shift_col_1_port, shift_col_0_port, shift_col_2_port, n233, 
                 vss, vdd);
   {U340} na210 (n243, state_0_port, n324, vss, vdd);
   {U341} iv110 (n239, n323, vss, vdd);
   {U342} na210 (n285, n327, n239, vss, vdd);
   {U343} na210 (n216, n199, n327, vss, vdd);
   {U344} iv110 (n217, n199, vss, vdd);
   {U345} na210 (n232, state_2_port, n217, vss, vdd);
   {U346} no310 (row_2_port, row_3_port, n328, n216, vss, vdd);
   {U347} na210 (n296, n298, n328, vss, vdd);
   {U348} iv110 (N82, n194, vss, vdd);
   {U349} iv110 (N79, n193, vss, vdd);
   {U350} iv110 (N76, n192, vss, vdd);
   {U351} iv110 (N73, n191, vss, vdd);
   {U352} iv110 (N70, n190, vss, vdd);
   {U353} iv110 (N67, n189, vss, vdd);
   {U354} iv110 (N64, n188, vss, vdd);
   {U355} iv110 (N61, n187, vss, vdd);
   {U356} iv110 (N58, n186, vss, vdd);
   {U357} iv110 (N55, n185, vss, vdd);
   {U358} no210 (n329, n330, n184, vss, vdd);
   {U359} no210 (n321, n284, n330, vss, vdd);
   {U360} iv110 (shift_col_0_port, n284, vss, vdd);
   {U361} no210 (n331, n316, n329, vss, vdd);
   {U362} iv110 (col_0_port, n316, vss, vdd);
   {U363} no210 (n332, n333, n183, vss, vdd);
   {U364} no210 (n321, n334, n333, vss, vdd);
   {U365} iv110 (shift_col_1_port, n334, vss, vdd);
   {U366} no210 (n331, n315, n332, vss, vdd);
   {U367} iv110 (col_1_port, n315, vss, vdd);
   {U368} no210 (n335, n336, n182, vss, vdd);
   {U369} no210 (n321, n277, n336, vss, vdd);
   {U370} iv110 (shift_col_2_port, n277, vss, vdd);
   {U371} no210 (n331, n337, n335, vss, vdd);
   {U372} iv110 (col_2_port, n337, vss, vdd);
   {U373} no210 (n338, n339, n181, vss, vdd);
   {U374} mu111 (n175, n340, n270, n339, vss, vdd);
   {U375} no210 (n331, n298, n338, vss, vdd);
   {U376} iv110 (row_0_port, n298, vss, vdd);
   {U377} no310 (n341, n342, n343, n180, vss, vdd);
   {U378} no210 (n331, n296, n343, vss, vdd);
   {U379} iv110 (row_1_port, n296, vss, vdd);
   {U380} iv110 (n344, n342, vss, vdd);
   {U381} na210 (n340, n266, n344, vss, vdd);
   {U382} ex210 (n270, shift_row_1_port, n266, vss, vdd);
   {U383} no210 (n345, n346, n341, vss, vdd);
   {U384} iv110 (n347, n179, vss, vdd);
   {U385} na310 (n348, n349, n350, n347, vss, vdd);
   {U386} na210 (n351, row_2_port, n350, vss, vdd);
   {U387} iv110 (n331, n351, vss, vdd);
   {U388} na210 (n340, n262, n349, vss, vdd);
   {U389} na210 (n352, n353, n262, vss, vdd);
   {U390} na210 (shift_row_2_port, n354, n353, vss, vdd);
   {U391} na210 (n346, n270, n354, vss, vdd);
   {U392} iv110 (shift_row_0_port, n270, vss, vdd);
   {U393} iv110 (shift_row_1_port, n346, vss, vdd);
   {U394} iv110 (n248, n352, vss, vdd);
   {U395} na210 (n175, shift_row_2_port, n348, vss, vdd);
   {U396} no310 (n355, n356, n357, n178, vss, vdd);
   {U397} no210 (n345, n247, n357, vss, vdd);
   {U398} iv110 (n175, n345, vss, vdd);
   {U399} no210 (n358, n257, n356, vss, vdd);
   {U400} ex210 (n247, n248, n257, vss, vdd);
   {U401} no310 (shift_row_1_port, shift_row_2_port, shift_row_0_port, n248, 
                 vss, vdd);
   {U402} iv110 (shift_row_3_port, n247, vss, vdd);
   {U403} no210 (n331, n359, n355, vss, vdd);
   {U404} iv110 (row_3_port, n359, vss, vdd);
   {U405} na210 (n331, n321, n177, vss, vdd);
   {U406} no210 (n340, n175, n321, vss, vdd);
   {U407} iv110 (n358, n340, vss, vdd);
   {U408} no310 (n220, n219, n243, n358, vss, vdd);
   {U409} iv110 (n218, n243, vss, vdd);
   {U410} na310 (state_1_port, n360, state_2_port, n218, vss, vdd);
   {U411} iv110 (n271, n219, vss, vdd);
   {U412} na310 (state_3_port, state_0_port, n361, n271, vss, vdd);
   {U413} no210 (state_2_port, state_1_port, n361, vss, vdd);
   {U414} no310 (n226, n360, n362, n220, vss, vdd);
   {U415} na210 (n363, n244, n362, vss, vdd);
   {U416} no310 (n307, n251, n232, n331, vss, vdd);
   {U417} iv110 (n320, n232, vss, vdd);
   {U418} na310 (n226, n360, state_0_port, n320, vss, vdd);
   {U419} no310 (n227, state_1_port, n363, n251, vss, vdd);
   {U420} na210 (n244, n360, n227, vss, vdd);
   {U421} no310 (state_2_port, state_3_port, n226, n307, vss, vdd);
   {U422} iv110 (state_1_port, n226, vss, vdd);
   {U423} na210 (n176, n285, n175, vss, vdd);
   {U424} na210 (n364, state_2_port, n285, vss, vdd);
   {U425} no210 (n246, n249, n176, vss, vdd);
   {U426} iv110 (n326, n249, vss, vdd);
   {U427} na310 (state_1_port, state_3_port, n365, n326, vss, vdd);
   {U428} no210 (state_2_port, n244, n365, vss, vdd);
   {U429} iv110 (state_0_port, n244, vss, vdd);
   {U430} na210 (n246, ram_in, n174, vss, vdd);
   {U431} iv110 (n272, n246, vss, vdd);
   {U432} na210 (n364, n363, n272, vss, vdd);
   {U433} iv110 (state_2_port, n363, vss, vdd);
   {U434} no310 (state_0_port, state_1_port, n360, n364, vss, vdd);
   {U435} iv110 (state_3_port, n360, vss, vdd);
}



