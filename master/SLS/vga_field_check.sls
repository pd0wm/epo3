extern network dfr11 (terminal D, R, CK, Q, vss, vdd)
extern network no310 (terminal A, B, C, Y, vss, vdd)
extern network na310 (terminal A, B, C, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
network vga_field_check (terminal clk, rst, pos_x_in_7_0_7, pos_x_in_7_0_6, 
                                  pos_x_in_7_0_5, pos_x_in_7_0_4, 
                                  pos_x_in_7_0_3, pos_x_in_7_0_2, 
                                  pos_x_in_7_0_1, pos_x_in_7_0_0, 
                                  pos_y_in_9_0_9, pos_y_in_9_0_8, 
                                  pos_y_in_9_0_7, pos_y_in_9_0_6, 
                                  pos_y_in_9_0_5, pos_y_in_9_0_4, 
                                  pos_y_in_9_0_3, pos_y_in_9_0_2, 
                                  pos_y_in_9_0_1, pos_y_in_9_0_0, in_field_out, 
                                  end_field_line_out, vss, vdd)
{
   {end_field_line_state_reg} dfr11 (N15, rst, clk, end_field_line_out, vss, 
                                     vdd);
   {in_field_state_reg} dfr11 (n33, n34, clk, in_field_out, vss, vdd);
   {U20} iv110 (rst, n33, vss, vdd);
   {U21} na310 (n16, n17, n18, n34, vss, vdd);
   {U22} no310 (pos_x_in_7_0_6, pos_y_in_9_0_9, pos_x_in_7_0_7, n18, vss, vdd);
   {U23} iv110 (n19, n17, vss, vdd);
   {U24} no210 (pos_x_in_7_0_4, pos_x_in_7_0_5, n19, vss, vdd);
   {U25} no210 (n20, n21, n16, vss, vdd);
   {U26} iv110 (n22, n21, vss, vdd);
   {U27} no310 (n23, n24, n25, N15, vss, vdd);
   {U28} na210 (pos_x_in_7_0_7, pos_x_in_7_0_6, n25, vss, vdd);
   {U29} na310 (pos_x_in_7_0_1, pos_x_in_7_0_0, pos_x_in_7_0_2, n24, vss, vdd);
   {U30} na310 (n26, n22, n27, n23, vss, vdd);
   {U31} no310 (pos_x_in_7_0_4, pos_y_in_9_0_9, pos_x_in_7_0_5, n27, vss, vdd);
   {U32} na310 (pos_y_in_9_0_7, n28, pos_y_in_9_0_8, n22, vss, vdd);
   {U33} na210 (n29, n30, n28, vss, vdd);
   {U34} no210 (pos_x_in_7_0_3, n20, n26, vss, vdd);
   {U35} iv110 (n31, n20, vss, vdd);
   {U36} na310 (n29, n30, n32, n31, vss, vdd);
   {U37} no210 (pos_y_in_9_0_8, pos_y_in_9_0_7, n32, vss, vdd);
   {U38} iv110 (pos_y_in_9_0_6, n30, vss, vdd);
   {U39} na210 (pos_y_in_9_0_5, pos_y_in_9_0_4, n29, vss, vdd);
}



