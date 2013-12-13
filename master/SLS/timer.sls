extern network timer_counter (terminal clk, rst, rst2, value_4_0_4, 
                                       value_4_0_3, value_4_0_2, value_4_0_1, 
                                       value_4_0_0, en, vss, vdd)
extern network timer_det (terminal cnt_val_4_0_4, cnt_val_4_0_3, cnt_val_4_0_2, 
                                   cnt_val_4_0_1, cnt_val_4_0_0, time, done, 
                                   vss, vdd)
extern network dfr11 (terminal D, R, CK, Q, vss, vdd)
extern network mu111 (terminal A, B, S, Y, vss, vdd)
extern network na310 (terminal A, B, C, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
extern network no310 (terminal A, B, C, Y, vss, vdd)
network timer (terminal clk, vga_clk, rst, cnt_rst, time, start, ready, vss, 
                        vdd)
{
   net {ready, ready_port};
   {counter} timer_counter (clk, n8, N17, cnt_val_4_port, cnt_val_3_port, 
                            cnt_val_2_port, cnt_val_1_port, cnt_val_0_port, 
                            n29, vss, vdd);
   {donecheck} timer_det (cnt_val_4_port, cnt_val_3_port, cnt_val_2_port, 
                          cnt_val_1_port, cnt_val_0_port, time, timer_done, 
                          vss, vdd);
   {state_reg_0_inst} dfr11 (state_next_0_port, n8, clk, state_0_port, vss, 
                             vdd);
   {state_reg_2_inst} dfr11 (n1, n8, clk, state_2_port, vss, vdd);
   {state_reg_1_inst} dfr11 (state_next_1_port, n8, clk, state_1_port, vss, 
                             vdd);
   {U35} na210 (n30, n31, state_next_1_port, vss, vdd);
   {U36} na210 (n32, n33, n31, vss, vdd);
   {U37} na210 (n34, n35, n32, vss, vdd);
   {U38} na310 (n36, n37, state_0_port, n35, vss, vdd);
   {U39} iv110 (state_1_port, n36, vss, vdd);
   {U40} na210 (n38, n39, n34, vss, vdd);
   {U41} iv110 (timer_done, n39, vss, vdd);
   {U42} na210 (n40, n41, n30, vss, vdd);
   {U43} na310 (n42, n43, n44, state_next_0_port, vss, vdd);
   {U44} mu111 (n45, n46, n41, n44, vss, vdd);
   {U45} na210 (vga_clk, n40, n46, vss, vdd);
   {U46} iv110 (n47, n40, vss, vdd);
   {U47} na210 (start, N17, n42, vss, vdd);
   {U48} iv110 (n48, n8, vss, vdd);
   {U49} no210 (cnt_rst, rst, n48, vss, vdd);
   {U50} na310 (n45, n43, n49, n1, vss, vdd);
   {U51} no210 (n29, n50, n49, vss, vdd);
   {U52} no310 (n33, state_2_port, n41, n50, vss, vdd);
   {U53} iv110 (vga_clk, n33, vss, vdd);
   {U54} no210 (n47, n41, n29, vss, vdd);
   {U55} na210 (state_1_port, n37, n47, vss, vdd);
   {U56} na210 (timer_done, n38, n43, vss, vdd);
   {U57} iv110 (n51, n45, vss, vdd);
   {U58} na210 (n52, n53, n51, vss, vdd);
   {U59} na210 (vga_clk, n38, n53, vss, vdd);
   {U60} no310 (state_0_port, state_1_port, n37, n38, vss, vdd);
   {U61} na210 (ready_port, start, n52, vss, vdd);
   {U62} no310 (n41, state_1_port, n37, ready_port, vss, vdd);
   {U63} iv110 (state_2_port, n37, vss, vdd);
   {U64} iv110 (state_0_port, n41, vss, vdd);
   {U65} no310 (state_1_port, state_2_port, state_0_port, N17, vss, vdd);
}



