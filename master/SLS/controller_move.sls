extern network dfr11 (terminal D, R, CK, Q, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network na310 (terminal A, B, C, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
network controller_move (terminal clk, rst, x, rot, add_sub, draw_erase_draw, 
                                  draw_erase_start, draw_erase_ready, start, 
                                  ready, inputs_3_0_3, inputs_3_0_2, 
                                  inputs_3_0_1, inputs_3_0_0, check_ready, 
                                  check_start, check_empty, vss, vdd)
{
   net {ready, X_Logic1_port};
   net {check_start, X_Logic1_port};
   net {X_Logic1_port, vdd};
   {cur_state_reg_0_inst} dfr11 (next_state_0_port, rst, clk, cur_state_0_port, 
                                 vss, vdd);
   {cur_state_reg_1_inst} dfr11 (next_state_1_port, rst, clk, cur_state_1_port, 
                                 vss, vdd);
   {cur_state_reg_2_inst} dfr11 (next_state_2_port, rst, clk, cur_state_2_port, 
                                 vss, vdd);
   {cur_state_reg_3_inst} dfr11 (next_state_3_port, rst, clk, cur_state_3_port, 
                                 vss, vdd);
   {U72} no210 (n62, n63, x, vss, vdd);
   {U73} no210 (n62, n64, rot, vss, vdd);
   {U74} na210 (n65, n66, next_state_3_port, vss, vdd);
   {U75} na210 (n67, n68, n66, vss, vdd);
   {U76} na210 (n69, n70, n68, vss, vdd);
   {U77} na210 (n71, n72, n70, vss, vdd);
   {U78} na310 (n73, n74, n75, next_state_2_port, vss, vdd);
   {U79} na310 (cur_state_0_port, n76, n72, n74, vss, vdd);
   {U80} iv110 (n77, n76, vss, vdd);
   {U81} na210 (cur_state_2_port, n78, n73, vss, vdd);
   {U82} na210 (n79, n80, next_state_1_port, vss, vdd);
   {U83} na210 (cur_state_1_port, n78, n80, vss, vdd);
   {U84} iv110 (n81, n78, vss, vdd);
   {U85} no210 (n82, n83, n81, vss, vdd);
   {U86} no210 (n69, n67, n83, vss, vdd);
   {U87} iv110 (n84, n67, vss, vdd);
   {U88} na210 (n85, n86, n79, vss, vdd);
   {U89} na210 (n87, n88, n85, vss, vdd);
   {U90} na210 (n89, n90, n88, vss, vdd);
   {U91} iv110 (draw_erase_ready, n90, vss, vdd);
   {U92} na210 (cur_state_0_port, n91, n87, vss, vdd);
   {U93} na210 (cur_state_1_port, n92, n91, vss, vdd);
   {U94} na210 (cur_state_2_port, n93, n92, vss, vdd);
   {U95} iv110 (check_empty, n93, vss, vdd);
   {U96} na310 (n94, n95, n75, next_state_0_port, vss, vdd);
   {U97} iv110 (n96, n75, vss, vdd);
   {U98} na210 (n97, n98, n96, vss, vdd);
   {U99} na310 (n99, draw_erase_ready, n89, n98, vss, vdd);
   {U100} na210 (check_ready, n100, n97, vss, vdd);
   {U101} iv110 (n101, n100, vss, vdd);
   {U102} na310 (n99, n71, start, n95, vss, vdd);
   {U103} na210 (cur_state_0_port, n102, n94, vss, vdd);
   {U104} na310 (n103, n69, n104, n102, vss, vdd);
   {U105} iv110 (n82, n104, vss, vdd);
   {U106} na310 (n65, n101, n105, n82, vss, vdd);
   {U107} na310 (n72, n84, n71, n105, vss, vdd);
   {U108} na310 (n63, n64, draw_erase_ready, n84, vss, vdd);
   {U109} no210 (inputs_3_0_3, inputs_3_0_2, n64, vss, vdd);
   {U110} no210 (inputs_3_0_1, inputs_3_0_0, n63, vss, vdd);
   {U111} na210 (n89, n72, n101, vss, vdd);
   {U112} no210 (n106, cur_state_0_port, n89, vss, vdd);
   {U113} na310 (start, cur_state_3_port, n107, n65, vss, vdd);
   {U114} no210 (cur_state_2_port, cur_state_1_port, n107, vss, vdd);
   {U115} na210 (n77, n72, n103, vss, vdd);
   {U116} no210 (n106, check_empty, n77, vss, vdd);
   {U117} iv110 (cur_state_1_port, n106, vss, vdd);
   {U118} na210 (n108, n109, draw_erase_start, vss, vdd);
   {U119} na210 (n110, n99, n109, vss, vdd);
   {U120} iv110 (n108, draw_erase_draw, vss, vdd);
   {U121} na210 (n111, n112, n108, vss, vdd);
   {U122} na210 (n113, n69, n111, vss, vdd);
   {U123} na210 (n99, n114, n69, vss, vdd);
   {U124} no210 (cur_state_2_port, cur_state_3_port, n99, vss, vdd);
   {U125} no210 (n62, n115, add_sub, vss, vdd);
   {U126} no210 (inputs_3_0_1, inputs_3_0_2, n115, vss, vdd);
   {U127} iv110 (n116, n62, vss, vdd);
   {U128} na210 (n113, n117, n116, vss, vdd);
   {U129} na210 (n118, n112, n117, vss, vdd);
   {U130} iv110 (n110, n112, vss, vdd);
   {U131} no210 (n114, n71, n110, vss, vdd);
   {U132} no210 (cur_state_0_port, cur_state_1_port, n71, vss, vdd);
   {U133} iv110 (n119, n114, vss, vdd);
   {U134} na210 (n120, n121, n118, vss, vdd);
   {U135} na310 (n119, n122, cur_state_3_port, n121, vss, vdd);
   {U136} iv110 (cur_state_2_port, n122, vss, vdd);
   {U137} na210 (n72, n119, n113, vss, vdd);
   {U138} na210 (cur_state_1_port, cur_state_0_port, n119, vss, vdd);
   {U139} iv110 (n120, n72, vss, vdd);
   {U140} na210 (cur_state_2_port, n86, n120, vss, vdd);
   {U141} iv110 (cur_state_3_port, n86, vss, vdd);
}



