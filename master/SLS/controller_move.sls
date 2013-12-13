extern network dfr11 (terminal D, R, CK, Q, vss, vdd)
extern network mu111 (terminal A, B, S, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network na310 (terminal A, B, C, Y, vss, vdd)
extern network no310 (terminal A, B, C, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
network controller_move (terminal clk, rst, x, y, rot, add_sub, 
                                  draw_erase_draw, draw_erase_start, 
                                  draw_erase_ready, start, ready, inputs_3_0_3, 
                                  inputs_3_0_2, inputs_3_0_1, inputs_3_0_0, 
                                  drop, check_ready, check_start, check_empty, 
                                  vss, vdd)
{
   net {draw_erase_draw, draw_erase_draw_port};
   net {ready, ready_port};
   net {check_start, check_start_port};
   {cur_state_reg_0_inst} dfr11 (next_state_0_port, rst, clk, cur_state_0_port, 
                                 vss, vdd);
   {cur_state_reg_3_inst} dfr11 (next_state_3_port, rst, clk, cur_state_3_port, 
                                 vss, vdd);
   {cur_state_reg_1_inst} dfr11 (next_state_1_port, rst, clk, cur_state_1_port, 
                                 vss, vdd);
   {cur_state_reg_2_inst} dfr11 (next_state_2_port, rst, clk, cur_state_2_port, 
                                 vss, vdd);
   {U69} no210 (n56, n57, y, vss, vdd);
   {U70} iv110 (drop, n57, vss, vdd);
   {U71} no210 (n56, n58, x, vss, vdd);
   {U72} no210 (inputs_3_0_0, inputs_3_0_1, n58, vss, vdd);
   {U73} no210 (n56, n59, rot, vss, vdd);
   {U74} no210 (inputs_3_0_2, inputs_3_0_3, n59, vss, vdd);
   {U75} na210 (n60, n61, next_state_3_port, vss, vdd);
   {U76} iv110 (n62, n61, vss, vdd);
   {U77} no210 (n63, n64, n62, vss, vdd);
   {U78} na210 (cur_state_3_port, n65, n60, vss, vdd);
   {U79} na310 (n66, n67, n68, next_state_2_port, vss, vdd);
   {U80} na210 (check_empty, n69, n68, vss, vdd);
   {U81} na210 (cur_state_2_port, n70, n66, vss, vdd);
   {U82} na310 (n71, n72, n73, next_state_1_port, vss, vdd);
   {U83} no310 (n74, n75, n76, n73, vss, vdd);
   {U84} no210 (n77, n78, n76, vss, vdd);
   {U85} no210 (n79, n70, n77, vss, vdd);
   {U86} na310 (n80, n81, n82, n70, vss, vdd);
   {U87} no210 (n83, check_start_port, n82, vss, vdd);
   {U88} no210 (draw_erase_ready, n84, n79, vss, vdd);
   {U89} iv110 (n85, n75, vss, vdd);
   {U90} iv110 (n86, n74, vss, vdd);
   {U91} na210 (check_start_port, check_ready, n86, vss, vdd);
   {U92} na210 (n83, draw_erase_ready, n72, vss, vdd);
   {U93} na310 (n71, n67, n87, next_state_0_port, vss, vdd);
   {U94} mu111 (n88, n89, cur_state_0_port, n87, vss, vdd);
   {U95} no210 (n90, n65, n89, vss, vdd);
   {U96} na210 (n80, n91, n65, vss, vdd);
   {U97} na210 (check_start_port, n92, n91, vss, vdd);
   {U98} iv110 (check_ready, n92, vss, vdd);
   {U99} na210 (start, ready_port, n80, vss, vdd);
   {U100} na210 (n93, n94, ready_port, vss, vdd);
   {U101} na310 (cur_state_3_port, n95, n96, n94, vss, vdd);
   {U102} no210 (cur_state_2_port, cur_state_1_port, n96, vss, vdd);
   {U103} iv110 (n81, n90, vss, vdd);
   {U104} na210 (n97, n63, n81, vss, vdd);
   {U105} na310 (draw_erase_ready, n98, n99, n63, vss, vdd);
   {U106} no310 (inputs_3_0_1, inputs_3_0_3, inputs_3_0_2, n99, vss, vdd);
   {U107} iv110 (inputs_3_0_0, n98, vss, vdd);
   {U108} iv110 (n64, n97, vss, vdd);
   {U109} na210 (n100, start, n88, vss, vdd);
   {U110} na210 (draw_erase_ready, n101, n67, vss, vdd);
   {U111} na210 (n102, n84, n101, vss, vdd);
   {U112} na210 (n69, n103, n71, vss, vdd);
   {U113} iv110 (check_empty, n103, vss, vdd);
   {U114} na310 (n85, n104, n84, draw_erase_start, vss, vdd);
   {U115} na210 (n105, n95, n84, vss, vdd);
   {U116} iv110 (draw_erase_draw_port, n104, vss, vdd);
   {U117} na210 (n100, cur_state_0_port, n85, vss, vdd);
   {U118} no310 (cur_state_2_port, cur_state_3_port, cur_state_1_port, n100, 
                 vss, vdd);
   {U119} na210 (n102, n64, draw_erase_draw_port, vss, vdd);
   {U120} na210 (n105, cur_state_0_port, n64, vss, vdd);
   {U121} no310 (cur_state_2_port, cur_state_3_port, n78, n105, vss, vdd);
   {U122} no210 (n56, n106, add_sub, vss, vdd);
   {U123} no210 (inputs_3_0_1, inputs_3_0_2, n106, vss, vdd);
   {U124} no310 (check_start_port, n83, n107, n56, vss, vdd);
   {U125} na210 (n93, n108, n107, vss, vdd);
   {U126} iv110 (n69, n108, vss, vdd);
   {U127} no310 (n109, cur_state_0_port, n78, n69, vss, vdd);
   {U128} na310 (cur_state_0_port, n110, cur_state_1_port, n93, vss, vdd);
   {U129} iv110 (n102, n83, vss, vdd);
   {U130} na310 (n95, n78, n110, n102, vss, vdd);
   {U131} iv110 (cur_state_1_port, n78, vss, vdd);
   {U132} no310 (n109, cur_state_1_port, n95, check_start_port, vss, vdd);
   {U133} iv110 (cur_state_0_port, n95, vss, vdd);
   {U134} iv110 (n110, n109, vss, vdd);
   {U135} no210 (n111, cur_state_3_port, n110, vss, vdd);
   {U136} iv110 (cur_state_2_port, n111, vss, vdd);
}



