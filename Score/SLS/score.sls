extern network dfr11 (terminal D, R, CK, Q, vss, vdd)
extern network na310 (terminal A, B, C, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
extern network ex210 (terminal A, B, Y, vss, vdd)
network score (terminal clk, rst, increase, output_7_0_7, output_7_0_6, 
                        output_7_0_5, output_7_0_4, output_7_0_3, output_7_0_2, 
                        output_7_0_1, output_7_0_0, vss, vdd)
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
   {U28} ex210 (output_7_port, n18, next_score_7_port, vss, vdd);
   {U29} no210 (n19, n20, n18, vss, vdd);
   {U30} ex210 (n20, n19, next_score_6_port, vss, vdd);
   {U31} na210 (output_5_port, n21, n19, vss, vdd);
   {U32} iv110 (output_6_port, n20, vss, vdd);
   {U33} ex210 (output_5_port, n21, next_score_5_port, vss, vdd);
   {U34} iv110 (n22, n21, vss, vdd);
   {U35} na310 (output_4_port, output_3_port, n23, n22, vss, vdd);
   {U36} iv110 (n24, next_score_4_port, vss, vdd);
   {U37} ex210 (output_4_port, n25, n24, vss, vdd);
   {U38} na210 (n23, output_3_port, n25, vss, vdd);
   {U39} ex210 (output_3_port, n23, next_score_3_port, vss, vdd);
   {U40} no210 (n26, n27, n23, vss, vdd);
   {U41} na310 (output_1_port, output_0_port, output_2_port, n27, vss, vdd);
   {U42} iv110 (increase, n26, vss, vdd);
   {U43} ex210 (output_2_port, n28, next_score_2_port, vss, vdd);
   {U44} no210 (n29, n30, n28, vss, vdd);
   {U45} ex210 (n29, n30, next_score_1_port, vss, vdd);
   {U46} na210 (increase, output_0_port, n30, vss, vdd);
   {U47} iv110 (output_1_port, n29, vss, vdd);
   {U48} ex210 (output_0_port, increase, next_score_0_port, vss, vdd);
}



