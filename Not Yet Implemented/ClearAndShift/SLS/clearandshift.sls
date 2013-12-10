extern network dfn10 (terminal D, CK, Q, vss, vdd)
extern network dfr11 (terminal D, R, CK, Q, vss, vdd)
extern network tinv10 (terminal A, E, Y, vss, vdd)
extern network ex210 (terminal A, B, Y, vss, vdd)
extern network mu111 (terminal A, B, S, Y, vss, vdd)
extern network no310 (terminal A, B, C, Y, vss, vdd)
extern network na310 (terminal A, B, C, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
network clearandshift (terminal clk, reset, start, ram_in, ram_out, 
                                ram_addr_7_0_7, ram_addr_7_0_6, ram_addr_7_0_5, 
                                ram_addr_7_0_4, ram_addr_7_0_3, ram_addr_7_0_2, 
                                ram_addr_7_0_1, ram_addr_7_0_0, ram_write, 
                                score, ready, vss, vdd)
{
   {ram_out_tri_enable_reg} dfn10 (n195, clk, N55, vss, vdd);
   {ram_addr_tri_enable_reg_7_inst} dfn10 (n196, clk, N58, vss, vdd);
   {ram_addr_tri_enable_reg_6_inst} dfn10 (n197, clk, N61, vss, vdd);
   {ram_addr_tri_enable_reg_5_inst} dfn10 (n198, clk, N64, vss, vdd);
   {ram_addr_tri_enable_reg_4_inst} dfn10 (n199, clk, N67, vss, vdd);
   {ram_addr_tri_enable_reg_3_inst} dfn10 (n200, clk, N70, vss, vdd);
   {ram_addr_tri_enable_reg_2_inst} dfn10 (n201, clk, N73, vss, vdd);
   {ram_addr_tri_enable_reg_1_inst} dfn10 (n202, clk, N76, vss, vdd);
   {ram_addr_tri_enable_reg_0_inst} dfn10 (n203, clk, N79, vss, vdd);
   {ram_write_tri_enable_reg} dfn10 (n204, clk, N82, vss, vdd);
   {shift_row_reg_0_inst} dfr11 (n_shift_row_0_port, n207, clk, 
                                 shift_row_0_port, vss, vdd);
   {shift_row_reg_3_inst} dfr11 (n_shift_row_3_port, n207, clk, 
                                 shift_row_3_port, vss, vdd);
   {state_reg_1_inst} dfr11 (n192, n205, clk, state_1_port, vss, vdd);
   {state_reg_2_inst} dfr11 (next_state_2_port, n205, clk, state_2_port, vss, 
                             vdd);
   {row_reg_0_inst} dfr11 (n_row_0_port, n205, clk, row_0_port, vss, vdd);
   {row_reg_1_inst} dfr11 (n_row_1_port, n205, clk, row_1_port, vss, vdd);
   {row_reg_2_inst} dfr11 (n_row_2_port, n205, clk, row_2_port, vss, vdd);
   {state_reg_3_inst} dfr11 (next_state_3_port, n205, clk, state_3_port, vss, 
                             vdd);
   {shift_col_reg_0_inst} dfr11 (n_shift_col_0_port, n205, clk, 
                                 shift_col_0_port, vss, vdd);
   {state_reg_0_inst} dfr11 (next_state_0_port, n205, clk, state_0_port, vss, 
                             vdd);
   {ready_reg} dfn10 (n191, clk, ready, vss, vdd);
   {col_reg_0_inst} dfr11 (n_col_0_port, n205, clk, col_0_port, vss, vdd);
   {col_reg_1_inst} dfr11 (n_col_1_port, n205, clk, col_1_port, vss, vdd);
   {col_reg_2_inst} dfr11 (n_col_2_port, n205, clk, col_2_port, vss, vdd);
   {row_reg_3_inst} dfr11 (n_row_3_port, n205, clk, row_3_port, vss, vdd);
   {shift_col_reg_1_inst} dfr11 (n_shift_col_1_port, n205, clk, 
                                 shift_col_1_port, vss, vdd);
   {shift_col_reg_2_inst} dfr11 (n_shift_col_2_port, n205, clk, 
                                 shift_col_2_port, vss, vdd);
   {score_reg} dfr11 (n194, n205, clk, score, vss, vdd);
   {shift_row_reg_2_inst} dfr11 (n_shift_row_2_port, n207, clk, 
                                 shift_row_2_port, vss, vdd);
   {shift_row_reg_1_inst} dfr11 (n_shift_row_1_port, n205, clk, 
                                 shift_row_1_port, vss, vdd);
   {ram_write_tri2} tinv10 (n1, n189, ram_write, vss, vdd);
   {ram_addr_tri2_0_inst} tinv10 (n1, n188, ram_addr_7_0_0, vss, vdd);
   {ram_addr_tri2_1_inst} tinv10 (n1, n187, ram_addr_7_0_1, vss, vdd);
   {ram_addr_tri2_2_inst} tinv10 (n1, n186, ram_addr_7_0_2, vss, vdd);
   {ram_addr_tri2_3_inst} tinv10 (n1, n185, ram_addr_7_0_3, vss, vdd);
   {ram_addr_tri2_4_inst} tinv10 (n1, n184, ram_addr_7_0_4, vss, vdd);
   {ram_addr_tri2_5_inst} tinv10 (n1, n183, ram_addr_7_0_5, vss, vdd);
   {ram_addr_tri2_6_inst} tinv10 (n1, n182, ram_addr_7_0_6, vss, vdd);
   {ram_addr_tri2_7_inst} tinv10 (n1, n181, ram_addr_7_0_7, vss, vdd);
   {ram_out_tri2} tinv10 (n1, n180, ram_out, vss, vdd);
   {ram_addr_tri_0_inst} tinv10 (n179, n172, ram_addr_7_0_0, vss, vdd);
   {ram_addr_tri_1_inst} tinv10 (n178, n172, ram_addr_7_0_1, vss, vdd);
   {ram_addr_tri_2_inst} tinv10 (n177, n172, ram_addr_7_0_2, vss, vdd);
   {ram_addr_tri_3_inst} tinv10 (n176, n172, ram_addr_7_0_3, vss, vdd);
   {ram_addr_tri_4_inst} tinv10 (n175, n172, ram_addr_7_0_4, vss, vdd);
   {ram_addr_tri_5_inst} tinv10 (n174, n172, ram_addr_7_0_5, vss, vdd);
   {ram_addr_tri_6_inst} tinv10 (n173, n172, ram_addr_7_0_6, vss, vdd);
   {ram_addr_tri_7_inst} tinv10 (n1, n172, ram_addr_7_0_7, vss, vdd);
   {ram_write_tri} tinv10 (n171, n172, ram_write, vss, vdd);
   {ram_out_tri} tinv10 (n169, n170, ram_out, vss, vdd);
   net {n1, vdd};
   {U224} na210 (n206, n190, n191, vss, vdd);
   {U225} iv110 (n193, n190, vss, vdd);
   {U226} iv110 (n206, n207, vss, vdd);
   {U227} na310 (n208, n209, n210, next_state_3_port, vss, vdd);
   {U228} no210 (n211, n212, n210, vss, vdd);
   {U229} no210 (n213, n214, n212, vss, vdd);
   {U230} no210 (n215, n216, n211, vss, vdd);
   {U231} na310 (n217, n218, n219, next_state_2_port, vss, vdd);
   {U232} no210 (n220, n221, n219, vss, vdd);
   {U233} iv110 (n222, n221, vss, vdd);
   {U234} na210 (n213, n194, n222, vss, vdd);
   {U235} na310 (n223, n224, n225, n213, vss, vdd);
   {U236} no210 (row_1_port, row_0_port, n225, vss, vdd);
   {U237} no210 (n226, n227, n220, vss, vdd);
   {U238} na210 (ram_in, n228, n218, vss, vdd);
   {U239} na310 (n229, n230, n231, next_state_0_port, vss, vdd);
   {U240} no310 (n232, n233, n234, n231, vss, vdd);
   {U241} iv110 (n235, n229, vss, vdd);
   {U242} na210 (n236, n237, n235, vss, vdd);
   {U243} na210 (n193, start, n237, vss, vdd);
   {U244} na310 (n238, n239, n215, n236, vss, vdd);
   {U245} no310 (n240, n241, n242, n215, vss, vdd);
   {U246} na310 (n243, n244, n245, n_shift_row_3_port, vss, vdd);
   {U247} na210 (row_3_port, n194, n245, vss, vdd);
   {U248} na210 (n246, n247, n244, vss, vdd);
   {U249} na210 (shift_row_3_port, n248, n243, vss, vdd);
   {U250} na310 (n249, n250, n251, n_shift_row_2_port, vss, vdd);
   {U251} na210 (row_2_port, n194, n251, vss, vdd);
   {U252} na210 (shift_row_2_port, n248, n250, vss, vdd);
   {U253} na210 (n246, n252, n249, vss, vdd);
   {U254} na310 (n253, n254, n255, n_shift_row_1_port, vss, vdd);
   {U255} na210 (row_1_port, n194, n255, vss, vdd);
   {U256} na210 (shift_row_1_port, n256, n254, vss, vdd);
   {U257} na210 (n257, n258, n256, vss, vdd);
   {U258} na210 (shift_row_0_port, n246, n258, vss, vdd);
   {U259} na210 (n246, n259, n253, vss, vdd);
   {U260} iv110 (n260, n246, vss, vdd);
   {U261} na210 (n261, n262, n_shift_row_0_port, vss, vdd);
   {U262} na210 (row_0_port, n194, n262, vss, vdd);
   {U263} mu111 (n260, n257, shift_row_0_port, n261, vss, vdd);
   {U264} iv110 (n248, n257, vss, vdd);
   {U265} na310 (n263, n208, n264, n248, vss, vdd);
   {U266} na210 (n265, state_0_port, n260, vss, vdd);
   {U267} mu111 (n266, n267, n242, n_shift_col_2_port, vss, vdd);
   {U268} no310 (n240, n268, n241, n267, vss, vdd);
   {U269} na210 (n269, n270, n266, vss, vdd);
   {U270} na210 (n271, n240, n270, vss, vdd);
   {U271} mu111 (n272, n273, n240, n_shift_col_1_port, vss, vdd);
   {U272} no210 (n268, n241, n273, vss, vdd);
   {U273} iv110 (n269, n272, vss, vdd);
   {U274} no210 (n274, n275, n269, vss, vdd);
   {U275} no210 (n268, shift_col_0_port, n275, vss, vdd);
   {U276} iv110 (n271, n268, vss, vdd);
   {U277} mu111 (n274, n271, n241, n_shift_col_0_port, vss, vdd);
   {U278} na210 (n264, n209, n271, vss, vdd);
   {U279} iv110 (n276, n209, vss, vdd);
   {U280} na210 (n265, n277, n264, vss, vdd);
   {U281} na210 (n171, n263, n274, vss, vdd);
   {U282} na210 (n278, n279, n_row_3_port, vss, vdd);
   {U283} na310 (row_2_port, row_1_port, n280, n279, vss, vdd);
   {U284} na210 (row_3_port, n281, n278, vss, vdd);
   {U285} na210 (n282, n283, n281, vss, vdd);
   {U286} mu111 (n284, n285, n223, n_row_2_port, vss, vdd);
   {U287} no210 (n286, n287, n285, vss, vdd);
   {U288} na210 (n288, n289, n284, vss, vdd);
   {U289} na210 (n290, n286, n289, vss, vdd);
   {U290} iv110 (n291, n288, vss, vdd);
   {U291} mu111 (n291, n280, n286, n_row_1_port, vss, vdd);
   {U292} iv110 (n287, n280, vss, vdd);
   {U293} na210 (n233, row_0_port, n287, vss, vdd);
   {U294} na210 (n282, n292, n291, vss, vdd);
   {U295} na210 (n290, n293, n292, vss, vdd);
   {U296} iv110 (n294, n282, vss, vdd);
   {U297} mu111 (n294, n233, n293, n_row_0_port, vss, vdd);
   {U298} no210 (n283, n295, n233, vss, vdd);
   {U299} na310 (n296, n227, n297, n294, vss, vdd);
   {U300} na210 (n295, n290, n296, vss, vdd);
   {U301} iv110 (n283, n290, vss, vdd);
   {U302} na210 (n298, state_1_port, n283, vss, vdd);
   {U303} no310 (n286, n293, n299, n295, vss, vdd);
   {U304} na210 (row_2_port, row_3_port, n299, vss, vdd);
   {U305} na210 (n300, n301, n_col_2_port, vss, vdd);
   {U306} na310 (col_1_port, col_0_port, n302, n301, vss, vdd);
   {U307} na210 (col_2_port, n303, n300, vss, vdd);
   {U308} na210 (n297, n304, n303, vss, vdd);
   {U309} mu111 (n305, n306, n307, n_col_1_port, vss, vdd);
   {U310} no210 (n308, n304, n306, vss, vdd);
   {U311} na210 (n297, n309, n305, vss, vdd);
   {U312} na210 (n302, n308, n309, vss, vdd);
   {U313} iv110 (n310, n297, vss, vdd);
   {U314} mu111 (n310, n302, n308, n_col_0_port, vss, vdd);
   {U315} iv110 (n304, n302, vss, vdd);
   {U316} na210 (n234, n226, n304, vss, vdd);
   {U317} na310 (col_1_port, col_0_port, col_2_port, n226, vss, vdd);
   {U318} na310 (n311, n312, n313, n310, vss, vdd);
   {U319} iv110 (n206, n205, vss, vdd);
   {U320} na210 (n206, n189, n204, vss, vdd);
   {U321} na210 (n206, n188, n203, vss, vdd);
   {U322} na210 (n206, n187, n202, vss, vdd);
   {U323} na210 (n206, n186, n201, vss, vdd);
   {U324} na210 (n206, n185, n200, vss, vdd);
   {U325} na210 (n206, n184, n199, vss, vdd);
   {U326} na210 (n206, n183, n198, vss, vdd);
   {U327} na210 (n206, n182, n197, vss, vdd);
   {U328} na210 (n206, n181, n196, vss, vdd);
   {U329} na210 (n206, n180, n195, vss, vdd);
   {U330} no210 (n314, reset, n206, vss, vdd);
   {U331} iv110 (start, n314, vss, vdd);
   {U332} no310 (state_0_port, state_1_port, n315, n193, vss, vdd);
   {U333} na310 (n311, n230, n316, n192, vss, vdd);
   {U334} no310 (n317, n276, n318, n316, vss, vdd);
   {U335} no210 (n208, n239, n318, vss, vdd);
   {U336} no210 (n277, n216, n276, vss, vdd);
   {U337} no210 (n319, n320, n230, vss, vdd);
   {U338} no210 (n312, ram_in, n320, vss, vdd);
   {U339} no210 (n216, state_0_port, n319, vss, vdd);
   {U340} iv110 (n321, n216, vss, vdd);
   {U341} iv110 (n322, n311, vss, vdd);
   {U342} na210 (n214, n323, n322, vss, vdd);
   {U343} na210 (n298, n324, n323, vss, vdd);
   {U344} iv110 (N82, n189, vss, vdd);
   {U345} iv110 (N79, n188, vss, vdd);
   {U346} iv110 (N76, n187, vss, vdd);
   {U347} iv110 (N73, n186, vss, vdd);
   {U348} iv110 (N70, n185, vss, vdd);
   {U349} iv110 (N67, n184, vss, vdd);
   {U350} iv110 (N64, n183, vss, vdd);
   {U351} iv110 (N61, n182, vss, vdd);
   {U352} iv110 (N58, n181, vss, vdd);
   {U353} iv110 (N55, n180, vss, vdd);
   {U354} no210 (n325, n326, n179, vss, vdd);
   {U355} no210 (n313, n241, n326, vss, vdd);
   {U356} iv110 (shift_col_0_port, n241, vss, vdd);
   {U357} no210 (n327, n308, n325, vss, vdd);
   {U358} iv110 (col_0_port, n308, vss, vdd);
   {U359} no210 (n328, n329, n178, vss, vdd);
   {U360} no210 (n313, n240, n329, vss, vdd);
   {U361} iv110 (shift_col_1_port, n240, vss, vdd);
   {U362} no210 (n327, n307, n328, vss, vdd);
   {U363} iv110 (col_1_port, n307, vss, vdd);
   {U364} no210 (n330, n331, n177, vss, vdd);
   {U365} no210 (n313, n242, n331, vss, vdd);
   {U366} iv110 (shift_col_2_port, n242, vss, vdd);
   {U367} no210 (n327, n332, n330, vss, vdd);
   {U368} iv110 (col_2_port, n332, vss, vdd);
   {U369} no210 (n333, n334, n176, vss, vdd);
   {U370} mu111 (n317, n170, shift_row_0_port, n334, vss, vdd);
   {U371} no210 (n327, n293, n333, vss, vdd);
   {U372} iv110 (row_0_port, n293, vss, vdd);
   {U373} no310 (n335, n336, n337, n175, vss, vdd);
   {U374} iv110 (n338, n337, vss, vdd);
   {U375} na210 (n170, shift_row_1_port, n338, vss, vdd);
   {U376} no210 (n217, n339, n336, vss, vdd);
   {U377} ex210 (shift_row_1_port, shift_row_0_port, n339, vss, vdd);
   {U378} no210 (n327, n286, n335, vss, vdd);
   {U379} iv110 (row_1_port, n286, vss, vdd);
   {U380} no310 (n340, n341, n342, n174, vss, vdd);
   {U381} no210 (n343, n344, n342, vss, vdd);
   {U382} no210 (n327, n223, n341, vss, vdd);
   {U383} iv110 (row_2_port, n223, vss, vdd);
   {U384} iv110 (n345, n340, vss, vdd);
   {U385} na210 (n317, n252, n345, vss, vdd);
   {U386} ex210 (shift_row_2_port, n259, n252, vss, vdd);
   {U387} no310 (n346, n347, n348, n173, vss, vdd);
   {U388} no210 (n327, n224, n348, vss, vdd);
   {U389} iv110 (row_3_port, n224, vss, vdd);
   {U390} no310 (n194, n349, n234, n327, vss, vdd);
   {U391} iv110 (n350, n347, vss, vdd);
   {U392} na210 (n317, n247, n350, vss, vdd);
   {U393} na210 (n239, n351, n247, vss, vdd);
   {U394} na210 (shift_row_3_port, n352, n351, vss, vdd);
   {U395} na210 (n259, n344, n352, vss, vdd);
   {U396} na310 (n344, n353, n259, n239, vss, vdd);
   {U397} no210 (shift_row_1_port, shift_row_0_port, n259, vss, vdd);
   {U398} iv110 (shift_row_2_port, n344, vss, vdd);
   {U399} no210 (n343, n353, n346, vss, vdd);
   {U400} iv110 (shift_row_3_port, n353, vss, vdd);
   {U401} na310 (n313, n312, n354, n172, vss, vdd);
   {U402} no310 (n234, n298, n194, n354, vss, vdd);
   {U403} iv110 (n214, n194, vss, vdd);
   {U404} na310 (state_0_port, n324, n355, n214, vss, vdd);
   {U405} no210 (n315, n277, n298, vss, vdd);
   {U406} iv110 (n227, n234, vss, vdd);
   {U407} na310 (n277, n324, n355, n227, vss, vdd);
   {U408} iv110 (n228, n312, vss, vdd);
   {U409} no310 (n324, state_0_port, n315, n228, vss, vdd);
   {U410} no210 (n317, n170, n313, vss, vdd);
   {U411} iv110 (n217, n317, vss, vdd);
   {U412} no210 (n232, n265, n217, vss, vdd);
   {U413} no310 (state_1_port, state_2_port, n356, n265, vss, vdd);
   {U414} iv110 (n263, n232, vss, vdd);
   {U415} na310 (state_1_port, n277, n355, n263, vss, vdd);
   {U416} na310 (state_1_port, n315, n357, n171, vss, vdd);
   {U417} mu111 (n356, n358, n277, n357, vss, vdd);
   {U418} iv110 (state_0_port, n277, vss, vdd);
   {U419} iv110 (n349, n315, vss, vdd);
   {U420} no210 (state_2_port, state_3_port, n349, vss, vdd);
   {U421} iv110 (n343, n170, vss, vdd);
   {U422} no210 (n238, n321, n343, vss, vdd);
   {U423} no310 (n324, state_2_port, n356, n321, vss, vdd);
   {U424} iv110 (state_3_port, n356, vss, vdd);
   {U425} iv110 (state_1_port, n324, vss, vdd);
   {U426} iv110 (n208, n238, vss, vdd);
   {U427} na310 (state_0_port, state_1_port, n355, n208, vss, vdd);
   {U428} no210 (n358, state_3_port, n355, vss, vdd);
   {U429} iv110 (state_2_port, n358, vss, vdd);
   {U430} na210 (ram_in, state_2_port, n169, vss, vdd);
}



