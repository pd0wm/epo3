extern network dfr11 (terminal D, R, CK, Q, vss, vdd)
extern network dfn10 (terminal D, CK, Q, vss, vdd)
extern network tinv10 (terminal A, E, Y, vss, vdd)
extern network no310 (terminal A, B, C, Y, vss, vdd)
extern network mu111 (terminal A, B, S, Y, vss, vdd)
extern network na310 (terminal A, B, C, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
network check_mask (terminal clk, rst, mask_7_0_7, mask_7_0_6, mask_7_0_5, 
                             mask_7_0_4, mask_7_0_3, mask_7_0_2, mask_7_0_1, 
                             mask_7_0_0, mask_select_1_0_1, mask_select_1_0_0, 
                             ready, empty, start, lut_start, lut_ready, 
                             lut_error, write, addr_7_0_7, addr_7_0_6, 
                             addr_7_0_5, addr_7_0_4, addr_7_0_3, addr_7_0_2, 
                             addr_7_0_1, addr_7_0_0, data_in, vss, vdd)
{
   net {mask_select_1_0_1, mask_select_1_port};
   net {mask_select_1_0_0, mask_select_0_port};
   net {empty, empty_port};
   net {lut_start, lut_start_port};
   net {write, vss};
   {pixel_reg_0_inst} dfn10 (n56, clk, mask_select_0_port, vss, vdd);
   {state_reg_2_inst} dfr11 (next_state_2_port, rst, clk, state_2_port, vss, 
                             vdd);
   {state_reg_0_inst} dfr11 (next_state_0_port, rst, clk, state_0_port, vss, 
                             vdd);
   {state_reg_1_inst} dfr11 (next_state_1_port, rst, clk, state_1_port, vss, 
                             vdd);
   {pixel_reg_1_inst} dfn10 (n55, clk, mask_select_1_port, vss, vdd);
   {empty_s_reg} dfn10 (n54, clk, empty_port, vss, vdd);
   {addr_tri_0_inst} tinv10 (n53, n46, addr_7_0_0, vss, vdd);
   {addr_tri_1_inst} tinv10 (n52, n46, addr_7_0_1, vss, vdd);
   {addr_tri_2_inst} tinv10 (n51, n46, addr_7_0_2, vss, vdd);
   {addr_tri_3_inst} tinv10 (n50, n46, addr_7_0_3, vss, vdd);
   {addr_tri_4_inst} tinv10 (n49, n46, addr_7_0_4, vss, vdd);
   {addr_tri_5_inst} tinv10 (n48, n46, addr_7_0_5, vss, vdd);
   {addr_tri_6_inst} tinv10 (n47, n46, addr_7_0_6, vss, vdd);
   {addr_tri_7_inst} tinv10 (n45, n46, addr_7_0_7, vss, vdd);
   {U64} na210 (n57, n58, ready, vss, vdd);
   {U65} na210 (data_in, n59, n58, vss, vdd);
   {U66} na310 (n60, n61, n62, next_state_2_port, vss, vdd);
   {U67} no210 (n63, n64, n62, vss, vdd);
   {U68} no210 (n57, n65, n64, vss, vdd);
   {U69} iv110 (start, n65, vss, vdd);
   {U70} no210 (n66, n67, n63, vss, vdd);
   {U71} na210 (n68, n69, n60, vss, vdd);
   {U72} na210 (n70, n71, next_state_1_port, vss, vdd);
   {U73} na210 (n72, n68, n71, vss, vdd);
   {U74} iv110 (n69, n72, vss, vdd);
   {U75} na210 (n73, n74, n69, vss, vdd);
   {U76} na210 (lut_ready, lut_error, n74, vss, vdd);
   {U77} na310 (n75, n66, n76, next_state_0_port, vss, vdd);
   {U78} na310 (n77, n78, start, n76, vss, vdd);
   {U79} na310 (lut_ready, n73, n68, n75, vss, vdd);
   {U80} mu111 (n79, n80, mask_select_0_port, n56, vss, vdd);
   {U81} no310 (n80, data_in, n66, n79, vss, vdd);
   {U82} na210 (n81, n82, n55, vss, vdd);
   {U83} na310 (n59, n67, n83, n82, vss, vdd);
   {U84} mu111 (mask_select_1_port, n84, mask_select_0_port, n83, vss, vdd);
   {U85} no210 (mask_select_1_port, n80, n84, vss, vdd);
   {U86} iv110 (data_in, n67, vss, vdd);
   {U87} na210 (mask_select_1_port, n80, n81, vss, vdd);
   {U88} iv110 (n85, n80, vss, vdd);
   {U89} no310 (lut_start_port, rst, n86, n85, vss, vdd);
   {U90} na210 (n57, n77, n86, vss, vdd);
   {U91} iv110 (n87, n77, vss, vdd);
   {U92} mu111 (empty_port, n88, n89, n54, vss, vdd);
   {U93} no210 (n90, rst, n89, vss, vdd);
   {U94} iv110 (n57, n90, vss, vdd);
   {U95} na310 (state_2_port, n78, state_0_port, n57, vss, vdd);
   {U96} no210 (data_in, n61, n88, vss, vdd);
   {U97} na310 (mask_select_0_port, n59, mask_select_1_port, n61, vss, vdd);
   {U98} iv110 (n66, n59, vss, vdd);
   {U99} na310 (n73, n78, state_2_port, n66, vss, vdd);
   {U100} iv110 (mask_7_0_0, n53, vss, vdd);
   {U101} iv110 (mask_7_0_1, n52, vss, vdd);
   {U102} iv110 (mask_7_0_2, n51, vss, vdd);
   {U103} iv110 (mask_7_0_3, n50, vss, vdd);
   {U104} iv110 (mask_7_0_4, n49, vss, vdd);
   {U105} iv110 (mask_7_0_5, n48, vss, vdd);
   {U106} iv110 (mask_7_0_6, n47, vss, vdd);
   {U107} no210 (n91, n78, n46, vss, vdd);
   {U108} no210 (state_0_port, state_2_port, n91, vss, vdd);
   {U109} iv110 (mask_7_0_7, n45, vss, vdd);
   {U110} na210 (n70, n92, lut_start_port, vss, vdd);
   {U111} na210 (n68, n73, n92, vss, vdd);
   {U112} no210 (n78, state_2_port, n68, vss, vdd);
   {U113} na210 (n87, n78, n70, vss, vdd);
   {U114} iv110 (state_1_port, n78, vss, vdd);
   {U115} no210 (n73, state_2_port, n87, vss, vdd);
   {U116} iv110 (state_0_port, n73, vss, vdd);
}



