extern network dfr11 (terminal D, R, CK, Q, vss, vdd)
extern network no310 (terminal A, B, C, Y, vss, vdd)
extern network na310 (terminal A, B, C, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
network controller_move (terminal clk, rst, x, rot, add_sub, draw_erase_draw, 
                                  draw_erase_start, draw_erase_ready, start, 
                                  ready, inputs_3_0_3, inputs_3_0_2, 
                                  inputs_3_0_1, inputs_3_0_0, check_ready, 
                                  check_start, check_empty, vss, vdd)
{
   net {ready, ready_port};
   {cur_state_reg_0_inst} dfr11 (next_state_0_port, rst, clk, cur_state_0_port, 
                                 vss, vdd);
   {cur_state_reg_1_inst} dfr11 (next_state_1_port, rst, clk, cur_state_1_port, 
                                 vss, vdd);
   {cur_state_reg_2_inst} dfr11 (next_state_2_port, rst, clk, cur_state_2_port, 
                                 vss, vdd);
   {cur_state_reg_3_inst} dfr11 (next_state_3_port, rst, clk, cur_state_3_port, 
                                 vss, vdd);
   {U72} no210 (n60, n61, x, vss, vdd);
   {U73} no210 (n60, n62, rot, vss, vdd);
   {U74} na310 (n63, n64, n65, next_state_3_port, vss, vdd);
   {U75} iv110 (n66, n65, vss, vdd);
   {U76} no210 (n67, n68, n66, vss, vdd);
   {U77} na210 (draw_erase_ready, n69, n63, vss, vdd);
   {U78} na310 (n70, n71, n72, next_state_2_port, vss, vdd);
   {U79} iv110 (n73, n71, vss, vdd);
   {U80} no310 (n74, n75, n76, n73, vss, vdd);
   {U81} na210 (cur_state_2_port, n77, n70, vss, vdd);
   {U82} na210 (n78, n79, next_state_1_port, vss, vdd);
   {U83} na210 (n80, n81, n79, vss, vdd);
   {U84} na210 (n82, n83, n80, vss, vdd);
   {U85} na210 (n84, n85, n83, vss, vdd);
   {U86} na210 (cur_state_0_port, n86, n82, vss, vdd);
   {U87} na210 (cur_state_1_port, n87, n86, vss, vdd);
   {U88} iv110 (n88, n87, vss, vdd);
   {U89} no210 (n89, check_empty, n88, vss, vdd);
   {U90} na210 (cur_state_1_port, n77, n78, vss, vdd);
   {U91} na310 (n90, n91, n92, n77, vss, vdd);
   {U92} na210 (n93, n68, n92, vss, vdd);
   {U93} na310 (n62, draw_erase_ready, n61, n68, vss, vdd);
   {U94} no210 (inputs_3_0_1, inputs_3_0_0, n61, vss, vdd);
   {U95} no210 (inputs_3_0_3, inputs_3_0_2, n62, vss, vdd);
   {U96} na210 (n69, n85, n90, vss, vdd);
   {U97} iv110 (draw_erase_ready, n85, vss, vdd);
   {U98} no210 (n94, n76, n69, vss, vdd);
   {U99} na310 (n95, n96, n72, next_state_0_port, vss, vdd);
   {U100} iv110 (n97, n72, vss, vdd);
   {U101} na210 (n98, n99, n97, vss, vdd);
   {U102} na310 (n100, draw_erase_ready, n84, n99, vss, vdd);
   {U103} na210 (check_ready, n101, n98, vss, vdd);
   {U104} iv110 (n91, n101, vss, vdd);
   {U105} na210 (n84, n102, n91, vss, vdd);
   {U106} no210 (n103, cur_state_0_port, n84, vss, vdd);
   {U107} na310 (n104, start, n100, n96, vss, vdd);
   {U108} iv110 (n105, n100, vss, vdd);
   {U109} na210 (cur_state_0_port, n106, n95, vss, vdd);
   {U110} na310 (n64, n67, n107, n106, vss, vdd);
   {U111} na210 (n75, n102, n107, vss, vdd);
   {U112} no210 (n103, check_empty, n75, vss, vdd);
   {U113} iv110 (cur_state_1_port, n103, vss, vdd);
   {U114} na210 (start, ready_port, n64, vss, vdd);
   {U115} no310 (cur_state_1_port, cur_state_2_port, n81, ready_port, vss, vdd);
   {U116} na210 (n108, n109, draw_erase_start, vss, vdd);
   {U117} iv110 (n110, n109, vss, vdd);
   {U118} no210 (n111, n105, n110, vss, vdd);
   {U119} iv110 (n108, draw_erase_draw, vss, vdd);
   {U120} na210 (n112, n111, n108, vss, vdd);
   {U121} na210 (n113, n67, n112, vss, vdd);
   {U122} iv110 (n93, n67, vss, vdd);
   {U123} no210 (n105, n114, n93, vss, vdd);
   {U124} na210 (n89, n81, n105, vss, vdd);
   {U125} iv110 (cur_state_3_port, n81, vss, vdd);
   {U126} no210 (n111, n113, check_start, vss, vdd);
   {U127} no210 (n60, n115, add_sub, vss, vdd);
   {U128} no210 (inputs_3_0_1, inputs_3_0_2, n115, vss, vdd);
   {U129} iv110 (n116, n60, vss, vdd);
   {U130} na210 (n113, n117, n116, vss, vdd);
   {U131} na210 (n118, n111, n117, vss, vdd);
   {U132} na210 (n114, n94, n111, vss, vdd);
   {U133} iv110 (n104, n94, vss, vdd);
   {U134} no210 (cur_state_0_port, cur_state_1_port, n104, vss, vdd);
   {U135} na210 (n119, n76, n118, vss, vdd);
   {U136} iv110 (n102, n76, vss, vdd);
   {U137} na310 (n74, n89, cur_state_3_port, n119, vss, vdd);
   {U138} iv110 (cur_state_0_port, n74, vss, vdd);
   {U139} na210 (n102, n114, n113, vss, vdd);
   {U140} na210 (cur_state_1_port, cur_state_0_port, n114, vss, vdd);
   {U141} no210 (n89, cur_state_3_port, n102, vss, vdd);
   {U142} iv110 (cur_state_2_port, n89, vss, vdd);
}



