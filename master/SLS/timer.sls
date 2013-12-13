extern network timer_counter (terminal clk, rst, rst2, value_4_0_4, 
                                       value_4_0_3, value_4_0_2, value_4_0_1, 
                                       value_4_0_0, en, vss, vdd)
extern network timer_det (terminal cnt_val_4_0_4, cnt_val_4_0_3, cnt_val_4_0_2, 
                                   cnt_val_4_0_1, cnt_val_4_0_0, time, done, 
                                   vss, vdd)
extern network dfr11 (terminal D, R, CK, Q, vss, vdd)
extern network mu111 (terminal A, B, S, Y, vss, vdd)
extern network na310 (terminal A, B, C, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
extern network no310 (terminal A, B, C, Y, vss, vdd)
network timer (terminal clk, vga_clk, rst, cnt_rst, time, start, ready, vss, 
                        vdd)
{
   {counter} timer_counter (clk, n8, N18, cnt_val_4_port, cnt_val_3_port, 
                            cnt_val_2_port, cnt_val_1_port, cnt_val_0_port, 
                            n23, vss, vdd);
   {donecheck} timer_det (cnt_val_4_port, cnt_val_3_port, cnt_val_2_port, 
                          cnt_val_1_port, cnt_val_0_port, time, timer_done, 
                          vss, vdd);
   {state_reg_0_inst} dfr11 (state_next_0_port, n8, clk, state_0_port, vss, 
                             vdd);
   {state_reg_2_inst} dfr11 (state_next_2_port, n8, clk, state_2_port, vss, 
                             vdd);
   {state_reg_1_inst} dfr11 (state_next_1_port, n8, clk, state_1_port, vss, 
                             vdd);
   {U30} na310 (n24, n25, n26, state_next_2_port, vss, vdd);
   {U31} iv110 (n27, n26, vss, vdd);
   {U32} no210 (n28, n29, n27, vss, vdd);
   {U33} mu111 (state_2_port, n30, n31, n28, vss, vdd);
   {U34} na210 (n32, n33, state_next_1_port, vss, vdd);
   {U35} na310 (n34, n29, n35, n33, vss, vdd);
   {U36} mu111 (state_0_port, n36, state_2_port, n35, vss, vdd);
   {U37} no210 (timer_done, state_0_port, n36, vss, vdd);
   {U38} iv110 (vga_clk, n29, vss, vdd);
   {U39} na210 (n37, n31, n32, vss, vdd);
   {U40} na310 (n38, n24, n39, state_next_0_port, vss, vdd);
   {U41} na210 (start, N18, n39, vss, vdd);
   {U42} na310 (n40, n31, timer_done, n24, vss, vdd);
   {U43} iv110 (n30, n40, vss, vdd);
   {U44} na310 (n37, n31, vga_clk, n38, vss, vdd);
   {U45} no210 (n31, n30, ready, vss, vdd);
   {U46} na210 (state_2_port, n34, n30, vss, vdd);
   {U47} iv110 (state_0_port, n31, vss, vdd);
   {U48} iv110 (n41, n8, vss, vdd);
   {U49} no210 (cnt_rst, rst, n41, vss, vdd);
   {U50} iv110 (n25, n23, vss, vdd);
   {U51} na210 (state_0_port, n37, n25, vss, vdd);
   {U52} no210 (n34, state_2_port, n37, vss, vdd);
   {U53} iv110 (state_1_port, n34, vss, vdd);
   {U54} no310 (state_1_port, state_2_port, state_0_port, N18, vss, vdd);
}



