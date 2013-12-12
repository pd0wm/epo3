extern network dfa11 (terminal D, CK, R, Q, vss, vdd)
extern network no310 (terminal A, B, C, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network ex210 (terminal A, B, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network na310 (terminal A, B, C, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
network vga_score_check (terminal clk, rst, pos_x_in_7_0_7, pos_x_in_7_0_6, 
                                  pos_x_in_7_0_5, pos_x_in_7_0_4, 
                                  pos_x_in_7_0_3, pos_x_in_7_0_2, 
                                  pos_x_in_7_0_1, pos_x_in_7_0_0, 
                                  pos_y_in_9_0_9, pos_y_in_9_0_8, 
                                  pos_y_in_9_0_7, pos_y_in_9_0_6, 
                                  pos_y_in_9_0_5, pos_y_in_9_0_4, 
                                  pos_y_in_9_0_3, pos_y_in_9_0_2, 
                                  pos_y_in_9_0_1, pos_y_in_9_0_0, in_score_out, 
                                  end_score_line_out, vss, vdd)
{
   {end_score_line_state_reg} dfa11 (N15, clk, rst, end_score_line_out, vss, 
                                     vdd);
   {in_score_state_reg} dfa11 (N18, clk, rst, in_score_out, vss, vdd);
   {U18} iv110 (n14, N18, vss, vdd);
   {U19} na310 (n15_port, pos_x_in_7_0_4, pos_x_in_7_0_5, n14, vss, vdd);
   {U20} no310 (n16, pos_x_in_7_0_7, n17, n15_port, vss, vdd);
   {U21} no210 (n18_port, n19, n16, vss, vdd);
   {U22} no310 (pos_x_in_7_0_1, pos_x_in_7_0_2, n20, n19, vss, vdd);
   {U23} no310 (n21, n17, n22, N15, vss, vdd);
   {U24} iv110 (n23, n22, vss, vdd);
   {U25} no210 (pos_x_in_7_0_4, pos_x_in_7_0_5, n23, vss, vdd);
   {U26} na210 (n24, pos_x_in_7_0_6, n17, vss, vdd);
   {U27} no210 (pos_y_in_9_0_9, n25, n24, vss, vdd);
   {U28} ex210 (n26, pos_y_in_9_0_8, n25, vss, vdd);
   {U29} na210 (pos_y_in_9_0_7, n27, n26, vss, vdd);
   {U30} na210 (n28, n29, n27, vss, vdd);
   {U31} iv110 (pos_y_in_9_0_6, n29, vss, vdd);
   {U32} na210 (pos_y_in_9_0_5, pos_y_in_9_0_4, n28, vss, vdd);
   {U33} na310 (pos_x_in_7_0_0, n18_port, pos_x_in_7_0_7, n21, vss, vdd);
   {U34} iv110 (n30, n18_port, vss, vdd);
   {U35} na310 (pos_x_in_7_0_1, n20, pos_x_in_7_0_2, n30, vss, vdd);
   {U36} iv110 (pos_x_in_7_0_3, n20, vss, vdd);
}



