extern network dfa11 (terminal D, CK, R, Q, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network ex210 (terminal A, B, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network na310 (terminal A, B, C, Y, vss, vdd)
extern network no310 (terminal A, B, C, Y, vss, vdd)
network vga_sync (terminal clk, rst, pos_x_in_7_0_7, pos_x_in_7_0_6, 
                           pos_x_in_7_0_5, pos_x_in_7_0_4, pos_x_in_7_0_3, 
                           pos_x_in_7_0_2, pos_x_in_7_0_1, pos_x_in_7_0_0, 
                           pos_y_in_9_0_9, pos_y_in_9_0_8, pos_y_in_9_0_7, 
                           pos_y_in_9_0_6, pos_y_in_9_0_5, pos_y_in_9_0_4, 
                           pos_y_in_9_0_3, pos_y_in_9_0_2, pos_y_in_9_0_1, 
                           pos_y_in_9_0_0, h_sync_out, v_sync_out, vss, vdd)
{
   {v_sync_state_reg} dfa11 (n1, clk, rst, v_sync_out, vss, vdd);
   {h_sync_state_reg} dfa11 (n2, clk, rst, h_sync_out, vss, vdd);
   {U11} na310 (pos_x_in_7_0_7, pos_x_in_7_0_5, n9, n2, vss, vdd);
   {U12} no210 (pos_x_in_7_0_6, n10, n9, vss, vdd);
   {U13} no210 (n11, n12, n10, vss, vdd);
   {U14} ex210 (pos_x_in_7_0_3, pos_x_in_7_0_2, n12, vss, vdd);
   {U15} ex210 (pos_x_in_7_0_4, pos_x_in_7_0_2, n11, vss, vdd);
   {U16} iv110 (n13, n1, vss, vdd);
   {U17} no310 (n14, n15, n16, n13, vss, vdd);
   {U18} na210 (pos_y_in_9_0_8, pos_y_in_9_0_7, n16, vss, vdd);
   {U19} na210 (pos_y_in_9_0_6, pos_y_in_9_0_5, n15, vss, vdd);
   {U20} na310 (pos_y_in_9_0_4, pos_y_in_9_0_2, n17, n14, vss, vdd);
   {U21} no310 (pos_y_in_9_0_1, pos_y_in_9_0_9, pos_y_in_9_0_3, n17, vss, vdd);
}



