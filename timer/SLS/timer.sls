extern network dfr11 (terminal D, R, CK, Q, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network na310 (terminal A, B, C, Y, vss, vdd)
extern network no310 (terminal A, B, C, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network ex210 (terminal A, B, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
extern network mu111 (terminal A, B, S, Y, vss, vdd)
network timer (terminal timer_clk, timer_vga_clk, timer_rst, timer_time_7_0_7, 
                        timer_time_7_0_6, timer_time_7_0_5, timer_time_7_0_4, 
                        timer_time_7_0_3, timer_time_7_0_2, timer_time_7_0_1, 
                        timer_time_7_0_0, timer_start, timer_done, vss, vdd)
{
   net {timer_done, timer_done_port};
   {state_reg_0_inst} dfr11 (new_state_0_port, timer_rst, clk_sig, 
                             state_0_port, vss, vdd);
   {count_reg_0_inst} dfr11 (new_count_0_port, timer_rst, clk_sig, 
                             count_0_port, vss, vdd);
   {count_reg_7_inst} dfr11 (new_count_7_port, timer_rst, clk_sig, 
                             count_7_port, vss, vdd);
   {state_reg_1_inst} dfr11 (new_state_1_port, timer_rst, clk_sig, 
                             timer_done_port, vss, vdd);
   {count_reg_1_inst} dfr11 (new_count_1_port, timer_rst, clk_sig, 
                             count_1_port, vss, vdd);
   {count_reg_2_inst} dfr11 (new_count_2_port, timer_rst, clk_sig, 
                             count_2_port, vss, vdd);
   {count_reg_3_inst} dfr11 (new_count_3_port, timer_rst, clk_sig, 
                             count_3_port, vss, vdd);
   {count_reg_4_inst} dfr11 (new_count_4_port, timer_rst, clk_sig, 
                             count_4_port, vss, vdd);
   {count_reg_5_inst} dfr11 (new_count_5_port, timer_rst, clk_sig, 
                             count_5_port, vss, vdd);
   {count_reg_6_inst} dfr11 (new_count_6_port, timer_rst, clk_sig, 
                             count_6_port, vss, vdd);
   {U42} na210 (n30, n31, new_state_1_port, vss, vdd);
   {U43} na210 (timer_done_port, n32, n31, vss, vdd);
   {U44} na210 (timer_start, state_0_port, n32, vss, vdd);
   {U45} na210 (n33, n34, new_state_0_port, vss, vdd);
   {U46} ex210 (timer_done_port, n35, n33, vss, vdd);
   {U47} na210 (n36, timer_start, n35, vss, vdd);
   {U48} iv110 (n37, new_count_7_port, vss, vdd);
   {U49} mu111 (n38, n39, count_7_port, n37, vss, vdd);
   {U50} no210 (n40, n41, n39, vss, vdd);
   {U51} no210 (n34, count_6_port, n41, vss, vdd);
   {U52} na210 (count_6_port, n42, n38, vss, vdd);
   {U53} mu111 (n42, n40, count_6_port, new_count_6_port, vss, vdd);
   {U54} iv110 (n43, n40, vss, vdd);
   {U55} no210 (n44, n45, n43, vss, vdd);
   {U56} no210 (n34, count_5_port, n45, vss, vdd);
   {U57} no310 (n46, n47, n34, n42, vss, vdd);
   {U58} mu111 (n48, n44, count_5_port, new_count_5_port, vss, vdd);
   {U59} na210 (n30, n49, n44, vss, vdd);
   {U60} na210 (n50, n46, n49, vss, vdd);
   {U61} no210 (n46, n34, n48, vss, vdd);
   {U62} iv110 (n51, n46, vss, vdd);
   {U63} no310 (n52, n53, n54, n51, vss, vdd);
   {U64} mu111 (n55, n56, n52, new_count_4_port, vss, vdd);
   {U65} no310 (n34, n53, n54, n56, vss, vdd);
   {U66} na210 (n57, n58, n55, vss, vdd);
   {U67} na210 (n50, n53, n58, vss, vdd);
   {U68} iv110 (n59, n57, vss, vdd);
   {U69} mu111 (n60, n59, count_3_port, new_count_3_port, vss, vdd);
   {U70} na210 (n30, n61, n59, vss, vdd);
   {U71} na210 (n50, n54, n61, vss, vdd);
   {U72} no210 (n54, n34, n60, vss, vdd);
   {U73} na310 (count_1_port, count_0_port, count_2_port, n54, vss, vdd);
   {U74} mu111 (n62, n63, n64, new_count_2_port, vss, vdd);
   {U75} no310 (n34, n65, n66, n63, vss, vdd);
   {U76} na210 (n67, n68, n62, vss, vdd);
   {U77} na210 (n50, n66, n68, vss, vdd);
   {U78} iv110 (count_1_port, n66, vss, vdd);
   {U79} iv110 (n69, n67, vss, vdd);
   {U80} mu111 (n70, n69, count_1_port, new_count_1_port, vss, vdd);
   {U81} na210 (n30, n71, n69, vss, vdd);
   {U82} na210 (n50, n65, n71, vss, vdd);
   {U83} iv110 (n72, n30, vss, vdd);
   {U84} no210 (n65, n34, n70, vss, vdd);
   {U85} iv110 (count_0_port, n65, vss, vdd);
   {U86} mu111 (n50, n72, count_0_port, new_count_0_port, vss, vdd);
   {U87} no310 (n36, timer_done_port, n73, n72, vss, vdd);
   {U88} iv110 (state_0_port, n36, vss, vdd);
   {U89} iv110 (n34, n50, vss, vdd);
   {U90} na310 (n73, n74, state_0_port, n34, vss, vdd);
   {U91} iv110 (timer_done_port, n74, vss, vdd);
   {U92} na210 (n75, n76, n73, vss, vdd);
   {U93} no310 (n77, n78, n79, n76, vss, vdd);
   {U94} ex210 (timer_time_7_0_1, count_1_port, n79, vss, vdd);
   {U95} ex210 (timer_time_7_0_0, count_0_port, n78, vss, vdd);
   {U96} na210 (n80, n81, n77, vss, vdd);
   {U97} ex210 (n64, timer_time_7_0_2, n81, vss, vdd);
   {U98} iv110 (count_2_port, n64, vss, vdd);
   {U99} ex210 (n53, timer_time_7_0_3, n80, vss, vdd);
   {U100} iv110 (count_3_port, n53, vss, vdd);
   {U101} no310 (n82, n83, n84, n75, vss, vdd);
   {U102} ex210 (timer_time_7_0_7, count_7_port, n84, vss, vdd);
   {U103} ex210 (timer_time_7_0_6, count_6_port, n83, vss, vdd);
   {U104} na210 (n85, n86, n82, vss, vdd);
   {U105} ex210 (n52, timer_time_7_0_4, n86, vss, vdd);
   {U106} iv110 (count_4_port, n52, vss, vdd);
   {U107} ex210 (n47, timer_time_7_0_5, n85, vss, vdd);
   {U108} iv110 (count_5_port, n47, vss, vdd);
   {U109} mu111 (timer_vga_clk, timer_clk, timer_rst, clk_sig, vss, vdd);
}



