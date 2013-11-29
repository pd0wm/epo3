extern network dfa11 (terminal D, CK, R, Q, vss, vdd)
extern network ex210 (terminal A, B, Y, vss, vdd)
extern network no310 (terminal A, B, C, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
extern network na310 (terminal A, B, C, Y, vss, vdd)
network vga_field_check (terminal clk, rst, pos_x_in_7_0_7, pos_x_in_7_0_6, 
                                  pos_x_in_7_0_5, pos_x_in_7_0_4, 
                                  pos_x_in_7_0_3, pos_x_in_7_0_2, 
                                  pos_x_in_7_0_1, pos_x_in_7_0_0, 
                                  pos_y_in_8_0_8, pos_y_in_8_0_7, 
                                  pos_y_in_8_0_6, pos_y_in_8_0_5, 
                                  pos_y_in_8_0_4, pos_y_in_8_0_3, 
                                  pos_y_in_8_0_2, pos_y_in_8_0_1, 
                                  pos_y_in_8_0_0, in_field_out, 
                                  end_field_line_out, vss, vdd)
{
   {end_field_line_state_reg} dfa11 (N15, clk, rst, end_field_line_out, vss, 
                                     vdd);
   {in_field_state_reg} dfa11 (N18, clk, rst, in_field_out, vss, vdd);
   {U18} iv110 (n14, N18, vss, vdd);
   {U19} na310 (n15_port, n16, n17, n14, vss, vdd);
   {U20} ex210 (n18_port, pos_x_in_7_0_5, n17, vss, vdd);
   {U21} iv110 (n19, n18_port, vss, vdd);
   {U22} na210 (pos_x_in_7_0_4, pos_x_in_7_0_3, n19, vss, vdd);
   {U23} no310 (pos_x_in_7_0_6, pos_x_in_7_0_7, n20, n15_port, vss, vdd);
   {U24} no310 (n21, n22, n23, N15, vss, vdd);
   {U25} na210 (pos_x_in_7_0_7, pos_x_in_7_0_6, n23, vss, vdd);
   {U26} na310 (pos_x_in_7_0_1, pos_x_in_7_0_0, pos_x_in_7_0_2, n22, vss, vdd);
   {U27} na310 (n16, n24, n25, n21, vss, vdd);
   {U28} no310 (pos_x_in_7_0_3, pos_x_in_7_0_5, pos_x_in_7_0_4, n25, vss, vdd);
   {U29} iv110 (n20, n24, vss, vdd);
   {U30} no310 (pos_y_in_8_0_7, pos_y_in_8_0_8, n26, n20, vss, vdd);
   {U31} na210 (pos_y_in_8_0_8, n27, n16, vss, vdd);
   {U32} iv110 (n28, n27, vss, vdd);
   {U33} no210 (n26, pos_y_in_8_0_7, n28, vss, vdd);
   {U34} iv110 (n29, n26, vss, vdd);
   {U35} na310 (pos_y_in_8_0_5, pos_y_in_8_0_4, pos_y_in_8_0_6, n29, vss, vdd);
}



