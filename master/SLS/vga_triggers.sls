extern network dfa11 (terminal D, CK, R, Q, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network no310 (terminal A, B, C, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
extern network na310 (terminal A, B, C, Y, vss, vdd)
network vga_triggers (terminal clk, rst, pos_x_in_7_0_7, pos_x_in_7_0_6, 
                               pos_x_in_7_0_5, pos_x_in_7_0_4, pos_x_in_7_0_3, 
                               pos_x_in_7_0_2, pos_x_in_7_0_1, pos_x_in_7_0_0, 
                               pos_y_in_9_0_9, pos_y_in_9_0_8, pos_y_in_9_0_7, 
                               pos_y_in_9_0_6, pos_y_in_9_0_5, pos_y_in_9_0_4, 
                               pos_y_in_9_0_3, pos_y_in_9_0_2, pos_y_in_9_0_1, 
                               pos_y_in_9_0_0, new_line_out, new_frame_out, 
                               end_frame_out, vss, vdd)
{
   {end_frame_state_reg} dfa11 (end_frame_new, clk, rst, end_frame_out, vss, 
                                vdd);
   {new_line_state_reg} dfa11 (new_line_new, clk, rst, new_line_out, vss, vdd);
   {new_frame_state_reg} dfa11 (new_frame_new, clk, rst, new_frame_out, vss, 
                                vdd);
   {U23} no210 (n18, n19, new_line_new, vss, vdd);
   {U24} iv110 (n20, n18, vss, vdd);
   {U25} no210 (n19, n20, new_frame_new, vss, vdd);
   {U26} na310 (n21, n22, n23, n20, vss, vdd);
   {U27} no310 (pos_y_in_9_0_2, pos_y_in_9_0_9, pos_y_in_9_0_4, n23, vss, vdd);
   {U28} na210 (n24, n25, n19, vss, vdd);
   {U29} no310 (n26, pos_x_in_7_0_5, pos_x_in_7_0_4, n25, vss, vdd);
   {U30} na210 (n27, n28, n26, vss, vdd);
   {U31} no310 (n29, pos_x_in_7_0_1, pos_x_in_7_0_0, n24, vss, vdd);
   {U32} iv110 (n30, n29, vss, vdd);
   {U33} no210 (pos_x_in_7_0_2, pos_x_in_7_0_3, n30, vss, vdd);
   {U34} no310 (n31, n32, n33, end_frame_new, vss, vdd);
   {U35} na310 (pos_x_in_7_0_1, pos_x_in_7_0_0, pos_x_in_7_0_2, n33, vss, vdd);
   {U36} na310 (n21, n34, n35, n32, vss, vdd);
   {U37} no210 (pos_x_in_7_0_5, pos_x_in_7_0_4, n35, vss, vdd);
   {U38} iv110 (pos_x_in_7_0_3, n34, vss, vdd);
   {U39} iv110 (n36, n21, vss, vdd);
   {U40} na210 (n37, n38, n36, vss, vdd);
   {U41} no310 (pos_y_in_9_0_6, pos_y_in_9_0_8, pos_y_in_9_0_7, n38, vss, vdd);
   {U42} no310 (pos_y_in_9_0_0, pos_y_in_9_0_5, pos_y_in_9_0_3, n37, vss, vdd);
   {U43} na210 (n39, n40, n31, vss, vdd);
   {U44} no310 (n22, n27, n28, n40, vss, vdd);
   {U45} iv110 (pos_x_in_7_0_7, n28, vss, vdd);
   {U46} iv110 (pos_x_in_7_0_6, n27, vss, vdd);
   {U47} iv110 (pos_y_in_9_0_1, n22, vss, vdd);
   {U48} iv110 (n41, n39, vss, vdd);
   {U49} na310 (pos_y_in_9_0_9, pos_y_in_9_0_2, pos_y_in_9_0_4, n41, vss, vdd);
}



