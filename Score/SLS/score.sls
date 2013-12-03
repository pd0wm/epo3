extern network dfr11 (terminal D, R, CK, Q, vss, vdd)
extern network na310 (terminal A, B, C, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network ex210 (terminal A, B, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
network score (terminal clk, rst, increase_value_2_0_2, increase_value_2_0_1, 
                        increase_value_2_0_0, increase, output_7_0_7, 
                        output_7_0_6, output_7_0_5, output_7_0_4, output_7_0_3, 
                        output_7_0_2, output_7_0_1, output_7_0_0, vss, vdd)
{
   net {output_7_0_7, output_7_port};
   net {output_7_0_6, output_6_port};
   net {output_7_0_5, output_5_port};
   net {output_7_0_4, output_4_port};
   net {output_7_0_3, output_3_port};
   net {output_7_0_2, output_2_port};
   net {output_7_0_1, output_1_port};
   net {output_7_0_0, output_0_port};
   {score_reg_0_inst} dfr11 (next_score_0_port, rst, clk, output_0_port, vss, 
                             vdd);
   {score_reg_1_inst} dfr11 (next_score_1_port, rst, clk, output_1_port, vss, 
                             vdd);
   {score_reg_2_inst} dfr11 (next_score_2_port, rst, clk, output_2_port, vss, 
                             vdd);
   {score_reg_3_inst} dfr11 (next_score_3_port, rst, clk, output_3_port, vss, 
                             vdd);
   {score_reg_4_inst} dfr11 (next_score_4_port, rst, clk, output_4_port, vss, 
                             vdd);
   {score_reg_5_inst} dfr11 (next_score_5_port, rst, clk, output_5_port, vss, 
                             vdd);
   {score_reg_6_inst} dfr11 (next_score_6_port, rst, clk, output_6_port, vss, 
                             vdd);
   {score_reg_7_inst} dfr11 (next_score_7_port, rst, clk, output_7_port, vss, 
                             vdd);
   net {n7, vss};
   {U10} iv110 (n8, n11, vss, vdd);
   {U11} na210 (increase_value_2_0_2, increase, n8, vss, vdd);
   {U12} iv110 (n9, n12, vss, vdd);
   {U13} na210 (increase_value_2_0_1, increase, n9, vss, vdd);
   {U14} iv110 (n10, n13, vss, vdd);
   {U15} na210 (increase_value_2_0_0, increase, n10, vss, vdd);
   {add_30_aco_U29} ex210 (n13, output_0_port, next_score_0_port, vss, vdd);
   {add_30_aco_U28} na210 (n13, output_0_port, add_30_aco_n22, vss, vdd);
   {add_30_aco_U27} ex210 (n12, output_1_port, add_30_aco_n23, vss, vdd);
   {add_30_aco_U26} ex210 (add_30_aco_n4, add_30_aco_n23, next_score_1_port, 
                           vss, vdd);
   {add_30_aco_U25} na210 (output_1_port, add_30_aco_n4, add_30_aco_n19, vss, 
                           vdd);
   {add_30_aco_U24} na210 (add_30_aco_n5, add_30_aco_n22, add_30_aco_n21, vss, 
                           vdd);
   {add_30_aco_U23} na210 (n12, add_30_aco_n21, add_30_aco_n20, vss, vdd);
   {add_30_aco_U22} na210 (add_30_aco_n19, add_30_aco_n20, add_30_aco_n17, vss, 
                           vdd);
   {add_30_aco_U21} ex210 (n11, output_2_port, add_30_aco_n18, vss, vdd);
   {add_30_aco_U20} ex210 (add_30_aco_n17, add_30_aco_n18, next_score_2_port, 
                           vss, vdd);
   {add_30_aco_U19} na210 (output_2_port, add_30_aco_n17, add_30_aco_n14, vss, 
                           vdd);
   {add_30_aco_U18} no210 (add_30_aco_n17, output_2_port, add_30_aco_n16, vss, 
                           vdd);
   {add_30_aco_U17} na210 (n11, add_30_aco_n3, add_30_aco_n15, vss, vdd);
   {add_30_aco_U16} na210 (add_30_aco_n14, add_30_aco_n15, add_30_aco_n11, vss, 
                           vdd);
   {add_30_aco_U15} ex210 (output_3_port, add_30_aco_n11, next_score_3_port, 
                           vss, vdd);
   {add_30_aco_U14} na210 (add_30_aco_n11, output_3_port, add_30_aco_n13, vss, 
                           vdd);
   {add_30_aco_U13} ex210 (output_4_port, add_30_aco_n13, add_30_aco_n12, vss, 
                           vdd);
   {add_30_aco_U12} na310 (output_3_port, add_30_aco_n11, output_4_port, 
                           add_30_aco_n10, vss, vdd);
   {add_30_aco_U11} ex210 (add_30_aco_n6, add_30_aco_n10, next_score_5_port, 
                           vss, vdd);
   {add_30_aco_U10} no210 (add_30_aco_n6, add_30_aco_n10, add_30_aco_n9, vss, 
                           vdd);
   {add_30_aco_U9} ex210 (output_6_port, add_30_aco_n9, next_score_6_port, vss, 
                          vdd);
   {add_30_aco_U8} na210 (add_30_aco_n9, output_6_port, add_30_aco_n8, vss, 
                          vdd);
   {add_30_aco_U7} ex210 (output_7_port, add_30_aco_n8, add_30_aco_n7, vss, 
                          vdd);
   {add_30_aco_U6} iv110 (output_5_port, add_30_aco_n6, vss, vdd);
   {add_30_aco_U5} iv110 (output_1_port, add_30_aco_n5, vss, vdd);
   {add_30_aco_U4} iv110 (add_30_aco_n22, add_30_aco_n4, vss, vdd);
   {add_30_aco_U3} iv110 (add_30_aco_n16, add_30_aco_n3, vss, vdd);
   {add_30_aco_U2} iv110 (add_30_aco_n7, next_score_7_port, vss, vdd);
   {add_30_aco_U1} iv110 (add_30_aco_n12, next_score_4_port, vss, vdd);
}



