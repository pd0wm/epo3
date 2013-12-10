extern network dfr11 (terminal D, R, CK, Q, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network no310 (terminal A, B, C, Y, vss, vdd)
extern network na310 (terminal A, B, C, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network ex210 (terminal A, B, Y, vss, vdd)
network vga_sync (terminal clk, rst, pos_x_in_7_0_7, pos_x_in_7_0_6, 
                           pos_x_in_7_0_5, pos_x_in_7_0_4, pos_x_in_7_0_3, 
                           pos_x_in_7_0_2, pos_x_in_7_0_1, pos_x_in_7_0_0, 
                           pos_y_in_9_0_9, pos_y_in_9_0_8, pos_y_in_9_0_7, 
                           pos_y_in_9_0_6, pos_y_in_9_0_5, pos_y_in_9_0_4, 
                           pos_y_in_9_0_3, pos_y_in_9_0_2, pos_y_in_9_0_1, 
                           pos_y_in_9_0_0, h_sync_out, v_sync_out, vss, vdd)
{
   {v_sync_state_reg} dfr11 (n19, n20, clk, v_sync_out, vss, vdd);
   {h_sync_state_reg} dfr11 (n4, rst, clk, h_sync_out, vss, vdd);
   {U13} iv110 (rst, n19, vss, vdd);
   {U14} no310 (n11, n12, n13, n20, vss, vdd);
   {U15} na210 (pos_y_in_9_0_8, pos_y_in_9_0_7, n13, vss, vdd);
   {U16} na210 (pos_y_in_9_0_6, pos_y_in_9_0_5, n12, vss, vdd);
   {U17} na310 (pos_y_in_9_0_4, pos_y_in_9_0_2, n14, n11, vss, vdd);
   {U18} no310 (pos_y_in_9_0_1, pos_y_in_9_0_9, pos_y_in_9_0_3, n14, vss, vdd);
   {U19} na310 (pos_x_in_7_0_7, pos_x_in_7_0_5, n15, n4, vss, vdd);
   {U20} no210 (pos_x_in_7_0_6, n16, n15, vss, vdd);
   {U21} no210 (n17, n18, n16, vss, vdd);
   {U22} ex210 (pos_x_in_7_0_3, pos_x_in_7_0_2, n18, vss, vdd);
   {U23} ex210 (pos_x_in_7_0_4, pos_x_in_7_0_2, n17, vss, vdd);
}



