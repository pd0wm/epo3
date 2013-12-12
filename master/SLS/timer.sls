extern network dfr11 (terminal D, R, CK, Q, vss, vdd)
extern network dfn10 (terminal D, CK, Q, vss, vdd)
extern network mu111 (terminal A, B, S, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network no310 (terminal A, B, C, Y, vss, vdd)
extern network na310 (terminal A, B, C, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
network timer (terminal clk, vga_clk, rst, ctr_rst, time, start, ready, vss, 
                        vdd)
{
   net {ready, ready_port};
   {state_reg_0_inst} dfr11 (next_state_0_port, n135, clk, state_0_port, vss, 
                             vdd);
   {state_reg_2_inst} dfr11 (next_state_2_port, n135, clk, state_2_port, vss, 
                             vdd);
   {state_reg_1_inst} dfr11 (next_state_1_port, n135, clk, state_1_port, vss, 
                             vdd);
   {cur_count_reg_7_inst} dfn10 (n64, clk, cur_count_7_port, vss, vdd);
   {cur_count_reg_0_inst} dfn10 (n57, clk, cur_count_0_port, vss, vdd);
   {cur_count_reg_1_inst} dfn10 (n58, clk, cur_count_1_port, vss, vdd);
   {cur_count_reg_2_inst} dfn10 (n59, clk, cur_count_2_port, vss, vdd);
   {cur_count_reg_3_inst} dfn10 (n60, clk, cur_count_3_port, vss, vdd);
   {cur_count_reg_4_inst} dfn10 (n61, clk, cur_count_4_port, vss, vdd);
   {cur_count_reg_5_inst} dfn10 (n62, clk, cur_count_5_port, vss, vdd);
   {cur_count_reg_6_inst} dfn10 (n63, clk, cur_count_6_port, vss, vdd);
   {cur_ready_reg} dfn10 (n56, clk, ready_port, vss, vdd);
   {U70} na210 (n65, n66, next_state_2_port, vss, vdd);
   {U71} na210 (start, n67, n66, vss, vdd);
   {U72} na210 (n68, n69, n65, vss, vdd);
   {U73} iv110 (n70, n69, vss, vdd);
   {U74} na210 (n71, n72, next_state_1_port, vss, vdd);
   {U75} na210 (vga_clk, n73, n72, vss, vdd);
   {U76} na310 (n74, n75, n76, next_state_0_port, vss, vdd);
   {U77} na210 (n68, n70, n76, vss, vdd);
   {U78} na210 (n77, n78, n70, vss, vdd);
   {U79} no310 (n79, cur_count_5_port, n80, n78, vss, vdd);
   {U80} no210 (cur_count_2_port, n81, n80, vss, vdd);
   {U81} iv110 (n82, n79, vss, vdd);
   {U82} no210 (cur_count_6_port, cur_count_7_port, n82, vss, vdd);
   {U83} no310 (n83, n84, n85, n77, vss, vdd);
   {U84} mu111 (n86, cur_count_2_port, cur_count_0_port, n85, vss, vdd);
   {U85} iv110 (time, n86, vss, vdd);
   {U86} mu111 (time, n81, cur_count_3_port, n83, vss, vdd);
   {U87} na310 (start, n87, n88, n75, vss, vdd);
   {U88} no210 (state_2_port, state_1_port, n88, vss, vdd);
   {U89} na210 (n89, n90, n74, vss, vdd);
   {U90} iv110 (n91, n89, vss, vdd);
   {U91} no210 (n73, n92, n91, vss, vdd);
   {U92} iv110 (n93, n64, vss, vdd);
   {U93} mu111 (n94, n95, cur_count_7_port, n93, vss, vdd);
   {U94} no210 (n96, n97, n95, vss, vdd);
   {U95} no210 (n98, cur_count_6_port, n97, vss, vdd);
   {U96} na210 (n99, cur_count_6_port, n94, vss, vdd);
   {U97} mu111 (n99, n96, cur_count_6_port, n63, vss, vdd);
   {U98} iv110 (n100, n96, vss, vdd);
   {U99} no210 (n101, n102, n100, vss, vdd);
   {U100} no210 (n98, cur_count_5_port, n102, vss, vdd);
   {U101} no310 (n98, n103, n104, n99, vss, vdd);
   {U102} mu111 (n101, n105, n104, n62, vss, vdd);
   {U103} iv110 (cur_count_5_port, n104, vss, vdd);
   {U104} no210 (n103, n98, n105, vss, vdd);
   {U105} na210 (n106, n107, n101, vss, vdd);
   {U106} na210 (n108, n103, n107, vss, vdd);
   {U107} iv110 (n109, n103, vss, vdd);
   {U108} no310 (n110, n81, n111, n109, vss, vdd);
   {U109} iv110 (cur_count_4_port, n81, vss, vdd);
   {U110} mu111 (n112, n113, cur_count_4_port, n61, vss, vdd);
   {U111} na210 (n114, n115, n113, vss, vdd);
   {U112} na210 (n108, n110, n115, vss, vdd);
   {U113} iv110 (n116, n114, vss, vdd);
   {U114} no310 (n98, n110, n111, n112, vss, vdd);
   {U115} iv110 (cur_count_3_port, n110, vss, vdd);
   {U116} mu111 (n117, n116, cur_count_3_port, n60, vss, vdd);
   {U117} na210 (n106, n118, n116, vss, vdd);
   {U118} na210 (n108, n111, n118, vss, vdd);
   {U119} no210 (n111, n98, n117, vss, vdd);
   {U120} na310 (cur_count_2_port, cur_count_0_port, cur_count_1_port, n111, 
                 vss, vdd);
   {U121} mu111 (n119, n120, cur_count_2_port, n59, vss, vdd);
   {U122} na210 (n121, n122, n120, vss, vdd);
   {U123} na210 (n108, n84, n122, vss, vdd);
   {U124} iv110 (n123, n121, vss, vdd);
   {U125} no310 (n98, n124, n84, n119, vss, vdd);
   {U126} iv110 (cur_count_1_port, n84, vss, vdd);
   {U127} mu111 (n125, n123, cur_count_1_port, n58, vss, vdd);
   {U128} na210 (n106, n126, n123, vss, vdd);
   {U129} na210 (n108, n124, n126, vss, vdd);
   {U130} iv110 (n127, n106, vss, vdd);
   {U131} no210 (n124, n98, n125, vss, vdd);
   {U132} iv110 (n108, n98, vss, vdd);
   {U133} iv110 (cur_count_0_port, n124, vss, vdd);
   {U134} mu111 (n108, n127, cur_count_0_port, n57, vss, vdd);
   {U135} no210 (n71, n127, n108, vss, vdd);
   {U136} na210 (n128, n129, n127, vss, vdd);
   {U137} na210 (n130, n131, n129, vss, vdd);
   {U138} na210 (n132, n90, n130, vss, vdd);
   {U139} iv110 (vga_clk, n90, vss, vdd);
   {U140} mu111 (n67, ready_port, n131, n56, vss, vdd);
   {U141} na210 (n132, n71, n131, vss, vdd);
   {U142} iv110 (n92, n71, vss, vdd);
   {U143} no310 (state_0_port, state_2_port, n133, n92, vss, vdd);
   {U144} no310 (n68, n135, n73, n132, vss, vdd);
   {U145} no310 (state_1_port, state_2_port, n87, n73, vss, vdd);
   {U146} iv110 (n134, n135, vss, vdd);
   {U147} no210 (ctr_rst, rst, n134, vss, vdd);
   {U148} no310 (n87, state_2_port, n133, n68, vss, vdd);
   {U149} iv110 (n128, n67, vss, vdd);
   {U150} na310 (n87, n133, state_2_port, n128, vss, vdd);
   {U151} iv110 (state_1_port, n133, vss, vdd);
   {U152} iv110 (state_0_port, n87, vss, vdd);
}



