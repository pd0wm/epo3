extern network dfa11 (terminal D, CK, R, Q, vss, vdd)
extern network mu111 (terminal A, B, S, Y, vss, vdd)
extern network na310 (terminal A, B, C, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network no310 (terminal A, B, C, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
network vga_np_check (terminal clk, rst, pos_x_in_7_0_7, pos_x_in_7_0_6, 
                               pos_x_in_7_0_5, pos_x_in_7_0_4, pos_x_in_7_0_3, 
                               pos_x_in_7_0_2, pos_x_in_7_0_1, pos_x_in_7_0_0, 
                               pos_y_in_9_0_9, pos_y_in_9_0_8, pos_y_in_9_0_7, 
                               pos_y_in_9_0_6, pos_y_in_9_0_5, pos_y_in_9_0_4, 
                               pos_y_in_9_0_3, pos_y_in_9_0_2, pos_y_in_9_0_1, 
                               pos_y_in_9_0_0, in_np_out, end_np_line_out, vss, 
                               vdd)
{
   {end_np_line_state_reg} dfa11 (N15, clk, rst, end_np_line_out, vss, vdd);
   {in_np_state_reg} dfa11 (N18, clk, rst, in_np_out, vss, vdd);
   {U18} no310 (n14, n15_port, n16, N18, vss, vdd);
   {U19} mu111 (n17, n18_port, pos_x_in_7_0_6, n14, vss, vdd);
   {U20} na310 (n19, n20, pos_x_in_7_0_5, n18_port, vss, vdd);
   {U21} iv110 (pos_x_in_7_0_7, n20, vss, vdd);
   {U22} na210 (n21, n22, n19, vss, vdd);
   {U23} na210 (pos_x_in_7_0_3, pos_x_in_7_0_2, n22, vss, vdd);
   {U24} iv110 (pos_x_in_7_0_4, n21, vss, vdd);
   {U25} iv110 (n23, n17, vss, vdd);
   {U26} no210 (n24, pos_x_in_7_0_2, n23, vss, vdd);
   {U27} no210 (n25, n26, N15, vss, vdd);
   {U28} na310 (pos_x_in_7_0_0, n27, pos_x_in_7_0_1, n26, vss, vdd);
   {U29} iv110 (n16, n27, vss, vdd);
   {U30} na210 (n28, n29, n16, vss, vdd);
   {U31} na210 (pos_y_in_9_0_7, n30, n29, vss, vdd);
   {U32} iv110 (n31, n30, vss, vdd);
   {U33} no310 (pos_y_in_9_0_5, pos_y_in_9_0_6, pos_y_in_9_0_4, n31, vss, vdd);
   {U34} no210 (pos_y_in_9_0_9, pos_y_in_9_0_8, n28, vss, vdd);
   {U35} na310 (pos_x_in_7_0_6, pos_x_in_7_0_2, n32, n25, vss, vdd);
   {U36} no210 (n15_port, n24, n32, vss, vdd);
   {U37} na310 (pos_x_in_7_0_7, n33, n34, n24, vss, vdd);
   {U38} no210 (pos_x_in_7_0_5, pos_x_in_7_0_4, n34, vss, vdd);
   {U39} iv110 (pos_x_in_7_0_3, n33, vss, vdd);
   {U40} no310 (pos_y_in_9_0_6, pos_y_in_9_0_7, n35, n15_port, vss, vdd);
   {U41} iv110 (n36, n35, vss, vdd);
   {U42} na210 (pos_y_in_9_0_5, pos_y_in_9_0_4, n36, vss, vdd);
}



