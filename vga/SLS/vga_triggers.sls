extern network dfa11 (terminal D, CK, R, Q, vss, vdd)
extern network no310 (terminal A, B, C, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network na310 (terminal A, B, C, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
network vga_triggers (terminal clk, rst, pos_x_in_7_0_7, pos_x_in_7_0_6, 
                               pos_x_in_7_0_5, pos_x_in_7_0_4, pos_x_in_7_0_3, 
                               pos_x_in_7_0_2, pos_x_in_7_0_1, pos_x_in_7_0_0, 
                               pos_y_in_8_0_8, pos_y_in_8_0_7, pos_y_in_8_0_6, 
                               pos_y_in_8_0_5, pos_y_in_8_0_4, pos_y_in_8_0_3, 
                               pos_y_in_8_0_2, pos_y_in_8_0_1, pos_y_in_8_0_0, 
                               new_line_out, new_frame_out, end_line_out, 
                               end_frame_out, vss, vdd)
{
   {new_line_state_reg} dfa11 (new_line_new, clk, rst, new_line_out, vss, vdd);
   {new_frame_state_reg} dfa11 (new_frame_new, clk, rst, new_frame_out, vss, 
                                vdd);
   {end_line_state_reg} dfa11 (n14, clk, rst, end_line_out, vss, vdd);
   net {end_frame_out, vss};
   {U20} no210 (n15, n16, new_line_new, vss, vdd);
   {U21} iv110 (n17, n15, vss, vdd);
   {U22} no210 (n16, n17, new_frame_new, vss, vdd);
   {U23} na310 (n18, n19, n20, n17, vss, vdd);
   {U24} no310 (n21, pos_y_in_8_0_1, pos_y_in_8_0_0, n20, vss, vdd);
   {U25} iv110 (n22, n21, vss, vdd);
   {U26} no210 (pos_y_in_8_0_3, pos_y_in_8_0_2, n22, vss, vdd);
   {U27} no310 (pos_y_in_8_0_6, pos_y_in_8_0_8, pos_y_in_8_0_7, n19, vss, vdd);
   {U28} no210 (pos_y_in_8_0_5, pos_y_in_8_0_4, n18, vss, vdd);
   {U29} na210 (n23, n24, n16, vss, vdd);
   {U30} no310 (n25, pos_x_in_7_0_5, pos_x_in_7_0_4, n24, vss, vdd);
   {U31} iv110 (n26, n25, vss, vdd);
   {U32} no210 (pos_x_in_7_0_6, pos_x_in_7_0_7, n26, vss, vdd);
   {U33} no310 (n27, pos_x_in_7_0_1, pos_x_in_7_0_0, n23, vss, vdd);
   {U34} iv110 (n28, n27, vss, vdd);
   {U35} no210 (pos_x_in_7_0_2, pos_x_in_7_0_3, n28, vss, vdd);
   {U36} no310 (n29, n30, n31, n14, vss, vdd);
   {U37} na210 (pos_x_in_7_0_7, pos_x_in_7_0_6, n31, vss, vdd);
   {U38} na210 (pos_x_in_7_0_2, pos_x_in_7_0_1, n30, vss, vdd);
   {U39} na310 (pos_x_in_7_0_0, n32, n33, n29, vss, vdd);
   {U40} no210 (pos_x_in_7_0_5, pos_x_in_7_0_4, n33, vss, vdd);
   {U41} iv110 (pos_x_in_7_0_3, n32, vss, vdd);
}



