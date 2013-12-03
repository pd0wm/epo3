extern network dfa11 (terminal D, CK, R, Q, vss, vdd)
extern network no310 (terminal A, B, C, Y, vss, vdd)
extern network na310 (terminal A, B, C, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
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
   {end_field_line_state_reg} dfa11 (N15, clk, rst, end_field_line_out, vss, 
                                     vdd);
   {in_field_state_reg} dfa11 (N18, clk, rst, in_field_out, vss, vdd);
   {U18} no310 (n14, n15_port, n16, N18, vss, vdd);
   {U19} iv110 (n17, n14, vss, vdd);
   {U20} no310 (pos_x_in_7_0_6, pos_x_in_7_0_7, n18_port, n17, vss, vdd);
   {U21} no210 (n19, n20, N15, vss, vdd);
   {U22} na310 (pos_x_in_7_0_2, pos_x_in_7_0_1, n21, n20, vss, vdd);
   {U23} iv110 (n22, n21, vss, vdd);
   {U24} na210 (pos_x_in_7_0_6, pos_x_in_7_0_7, n22, vss, vdd);
   {U25} na310 (pos_x_in_7_0_0, n15_port, n23, n19, vss, vdd);
   {U26} no310 (n16, pos_x_in_7_0_3, n18_port, n23, vss, vdd);
   {U27} no310 (pos_y_in_9_0_7, pos_y_in_9_0_8, n24, n18_port, vss, vdd);
   {U28} na210 (n25, n26, n16, vss, vdd);
   {U29} na310 (pos_y_in_9_0_7, n24, pos_y_in_9_0_8, n26, vss, vdd);
   {U30} na210 (n27, n28, n24, vss, vdd);
   {U31} na210 (pos_y_in_9_0_5, pos_y_in_9_0_4, n28, vss, vdd);
   {U32} iv110 (pos_y_in_9_0_6, n27, vss, vdd);
   {U33} iv110 (pos_y_in_9_0_9, n25, vss, vdd);
   {U34} no210 (pos_x_in_7_0_4, pos_x_in_7_0_5, n15_port, vss, vdd);
}



