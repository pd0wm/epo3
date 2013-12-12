extern network dfr11 (terminal D, R, CK, Q, vss, vdd)
extern network dfn10 (terminal D, CK, Q, vss, vdd)
extern network tinv10 (terminal A, E, Y, vss, vdd)
extern network mu111 (terminal A, B, S, Y, vss, vdd)
extern network na310 (terminal A, B, C, Y, vss, vdd)
extern network no310 (terminal A, B, C, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
network check_mask (terminal clk, rst, mask_7_0_7, mask_7_0_6, mask_7_0_5, 
                             mask_7_0_4, mask_7_0_3, mask_7_0_2, mask_7_0_1, 
                             mask_7_0_0, mask_select_1_0_1, mask_select_1_0_0, 
                             ready, empty, start, lut_start, lut_ready, 
                             lut_error, write, addr_7_0_7, addr_7_0_6, 
                             addr_7_0_5, addr_7_0_4, addr_7_0_3, addr_7_0_2, 
                             addr_7_0_1, addr_7_0_0, data_in, vss, vdd)
{
   net {empty, empty_port};
   {pixel_reg_0_inst} dfn10 (n58, clk, pixel_0_port, vss, vdd);
   {state_reg_2_inst} dfr11 (next_state_2_port, rst, clk, state_2_port, vss, 
                             vdd);
   {state_reg_0_inst} dfr11 (next_state_0_port, rst, clk, state_0_port, vss, 
                             vdd);
   {state_reg_1_inst} dfr11 (next_state_1_port, rst, clk, state_1_port, vss, 
                             vdd);
   {pixel_reg_1_inst} dfn10 (n57, clk, pixel_1_port, vss, vdd);
   {empty_s_reg} dfn10 (n56, clk, empty_port, vss, vdd);
   {addr_tri_0_inst} tinv10 (n55, n48, addr_7_0_0, vss, vdd);
   {addr_tri_1_inst} tinv10 (n54, n48, addr_7_0_1, vss, vdd);
   {addr_tri_2_inst} tinv10 (n53, n48, addr_7_0_2, vss, vdd);
   {addr_tri_3_inst} tinv10 (n52, n48, addr_7_0_3, vss, vdd);
   {addr_tri_4_inst} tinv10 (n51, n48, addr_7_0_4, vss, vdd);
   {addr_tri_5_inst} tinv10 (n50, n48, addr_7_0_5, vss, vdd);
   {addr_tri_6_inst} tinv10 (n49, n48, addr_7_0_6, vss, vdd);
   {addr_tri_7_inst} tinv10 (n47, n48, addr_7_0_7, vss, vdd);
   {mask_select_tri_0_inst} tinv10 (n46, n44, mask_select_1_0_0, vss, vdd);
   {mask_select_tri_1_inst} tinv10 (n45, n44, mask_select_1_0_1, vss, vdd);
   {write_tri} tinv10 (n1, n44, write, vss, vdd);
   net {n1, vdd};
   {U66} na210 (n59, n60, ready, vss, vdd);
   {U67} na210 (data_in, n61, n60, vss, vdd);
   {U68} na310 (n62, n63, n64, next_state_2_port, vss, vdd);
   {U69} no310 (n65, n66, n67, n64, vss, vdd);
   {U70} no210 (n68, n69, n67, vss, vdd);
   {U71} iv110 (n70, n66, vss, vdd);
   {U72} no210 (n71, n72, n65, vss, vdd);
   {U73} na210 (start, n73, n63, vss, vdd);
   {U74} iv110 (n74, n62, vss, vdd);
   {U75} no210 (n75, state_2_port, n74, vss, vdd);
   {U76} mu111 (n76, n77, n78, next_state_1_port, vss, vdd);
   {U77} iv110 (n79, n77, vss, vdd);
   {U78} na210 (n68, n80, n79, vss, vdd);
   {U79} na210 (lut_ready, lut_error, n68, vss, vdd);
   {U80} no210 (state_2_port, state_1_port, n76, vss, vdd);
   {U81} na310 (n81, n71, n82, next_state_0_port, vss, vdd);
   {U82} na210 (start, n83, n82, vss, vdd);
   {U83} na210 (n44, n59, n83, vss, vdd);
   {U84} na310 (lut_ready, n78, n80, n81, vss, vdd);
   {U85} iv110 (n69, n80, vss, vdd);
   {U86} na210 (state_1_port, n84, n69, vss, vdd);
   {U87} mu111 (n85, n86, n46, n58, vss, vdd);
   {U88} no310 (n85, data_in, n71, n86, vss, vdd);
   {U89} iv110 (n61, n71, vss, vdd);
   {U90} na210 (n87, n88, n57, vss, vdd);
   {U91} na310 (n61, n72, n89, n88, vss, vdd);
   {U92} mu111 (n90, pixel_1_port, n46, n89, vss, vdd);
   {U93} no210 (pixel_1_port, n85, n90, vss, vdd);
   {U94} iv110 (data_in, n72, vss, vdd);
   {U95} na210 (n85, pixel_1_port, n87, vss, vdd);
   {U96} na210 (n91, n92, n85, vss, vdd);
   {U97} na210 (n93, n84, n92, vss, vdd);
   {U98} mu111 (empty_port, n94, n91, n56, vss, vdd);
   {U99} no210 (rst, n73, n91, vss, vdd);
   {U100} no210 (data_in, n70, n94, vss, vdd);
   {U101} na310 (pixel_1_port, pixel_0_port, n61, n70, vss, vdd);
   {U102} no210 (n84, n93, n61, vss, vdd);
   {U103} iv110 (mask_7_0_0, n55, vss, vdd);
   {U104} iv110 (mask_7_0_1, n54, vss, vdd);
   {U105} iv110 (mask_7_0_2, n53, vss, vdd);
   {U106} iv110 (mask_7_0_3, n52, vss, vdd);
   {U107} iv110 (mask_7_0_4, n51, vss, vdd);
   {U108} iv110 (mask_7_0_5, n50, vss, vdd);
   {U109} iv110 (mask_7_0_6, n49, vss, vdd);
   {U110} iv110 (n95, n48, vss, vdd);
   {U111} na310 (n96, n93, n59, n95, vss, vdd);
   {U112} iv110 (n73, n59, vss, vdd);
   {U113} no310 (n84, state_1_port, n78, n73, vss, vdd);
   {U114} iv110 (state_0_port, n78, vss, vdd);
   {U115} iv110 (n97, n93, vss, vdd);
   {U116} iv110 (mask_7_0_7, n47, vss, vdd);
   {U117} iv110 (pixel_0_port, n46, vss, vdd);
   {U118} iv110 (pixel_1_port, n45, vss, vdd);
   {U119} na210 (n97, n84, n44, vss, vdd);
   {U120} no210 (n97, n96, lut_start, vss, vdd);
   {U121} na210 (n84, n75, n96, vss, vdd);
   {U122} na210 (state_1_port, state_0_port, n75, vss, vdd);
   {U123} iv110 (state_2_port, n84, vss, vdd);
   {U124} no210 (state_0_port, state_1_port, n97, vss, vdd);
}



