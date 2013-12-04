extern network dfr11 (terminal D, R, CK, Q, vss, vdd)
extern network mu111 (terminal A, B, S, Y, vss, vdd)
extern network na310 (terminal A, B, C, Y, vss, vdd)
extern network no310 (terminal A, B, C, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
network vga_sync (terminal clk, rst, pos_x_in_7_0_7, pos_x_in_7_0_6, 
                           pos_x_in_7_0_5, pos_x_in_7_0_4, pos_x_in_7_0_3, 
                           pos_x_in_7_0_2, pos_x_in_7_0_1, pos_x_in_7_0_0, 
                           pos_y_in_9_0_9, pos_y_in_9_0_8, pos_y_in_9_0_7, 
                           pos_y_in_9_0_6, pos_y_in_9_0_5, pos_y_in_9_0_4, 
                           pos_y_in_9_0_3, pos_y_in_9_0_2, pos_y_in_9_0_1, 
                           pos_y_in_9_0_0, h_sync_out, v_sync_out, vss, vdd)
{
   net {h_sync_out, h_sync_out_port};
   net {v_sync_out, v_sync_out_port};
   {v_sync_state_reg} dfr11 (v_sync_new, rst, clk, v_sync_out_port, vss, vdd);
   {h_sync_state_reg} dfr11 (N25, n2, clk, h_sync_out_port, vss, vdd);
   {U25} mu111 (v_sync_out_port, pos_y_in_9_0_1, n21, v_sync_new, vss, vdd);
   {U26} no310 (n22, n23, n24, n21, vss, vdd);
   {U27} na210 (pos_y_in_9_0_8, pos_y_in_9_0_7, n24, vss, vdd);
   {U28} na210 (pos_y_in_9_0_6, pos_y_in_9_0_5, n23, vss, vdd);
   {U29} na310 (pos_y_in_9_0_4, pos_y_in_9_0_2, n25_port, n22, vss, vdd);
   {U30} no310 (pos_y_in_9_0_0, pos_y_in_9_0_9, pos_y_in_9_0_3, n25_port, vss, 
                vdd);
   {U31} iv110 (n26, n2, vss, vdd);
   {U32} no210 (rst, n27, n26, vss, vdd);
   {U33} no310 (pos_x_in_7_0_3, pos_x_in_7_0_4, n28, n27, vss, vdd);
   {U34} na210 (n29, n30, N25, vss, vdd);
   {U35} na310 (pos_x_in_7_0_3, n31, pos_x_in_7_0_4, n30, vss, vdd);
   {U36} iv110 (n28, n31, vss, vdd);
   {U37} na210 (n32, n33, n28, vss, vdd);
   {U38} no310 (pos_x_in_7_0_0, pos_x_in_7_0_6, pos_x_in_7_0_1, n33, vss, vdd);
   {U39} no210 (n34, n35, n32, vss, vdd);
   {U40} na210 (pos_x_in_7_0_5, pos_x_in_7_0_2, n35, vss, vdd);
   {U41} iv110 (pos_x_in_7_0_7, n34, vss, vdd);
   {U42} iv110 (h_sync_out_port, n29, vss, vdd);
}



