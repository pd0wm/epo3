extern network dfn10 (terminal D, CK, Q, vss, vdd)
extern network tinv10 (terminal A, E, Y, vss, vdd)
extern network na310 (terminal A, B, C, Y, vss, vdd)
extern network mu111 (terminal A, B, S, Y, vss, vdd)
extern network no310 (terminal A, B, C, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
network de_piece (terminal clk, rst, mask_7_0_7, mask_7_0_6, mask_7_0_5, 
                           mask_7_0_4, mask_7_0_3, mask_7_0_2, mask_7_0_1, 
                           mask_7_0_0, draw_erase, ready, start, 
                           mask_select_1_0_1, mask_select_1_0_0, lut_start, 
                           lut_ready, write, addr_7_0_7, addr_7_0_6, 
                           addr_7_0_5, addr_7_0_4, addr_7_0_3, addr_7_0_2, 
                           addr_7_0_1, addr_7_0_0, data, vss, vdd)
{
   net {lut_start, lut_start_port};
   {state_reg_0_inst} dfn10 (new_state_0_port, clk, state_0_port, vss, vdd);
   {state_reg_2_inst} dfn10 (new_state_2_port, clk, state_2_port, vss, vdd);
   {cur_block_reg_0_inst} dfn10 (n48, clk, cur_block_0_port, vss, vdd);
   {cur_block_reg_1_inst} dfn10 (n49, clk, cur_block_1_port, vss, vdd);
   {state_reg_1_inst} dfn10 (new_state_1_port, clk, state_1_port, vss, vdd);
   {data_tri} tinv10 (n46, n42, data, vss, vdd);
   {mask_select_tri_0_inst} tinv10 (n45, n44, mask_select_1_0_0, vss, vdd);
   {mask_select_tri_1_inst} tinv10 (n43, n44, mask_select_1_0_1, vss, vdd);
   {write_tri} tinv10 (n1, n42, write, vss, vdd);
   {addr_tri_0_inst} tinv10 (n41, n42, addr_7_0_0, vss, vdd);
   {addr_tri_1_inst} tinv10 (n40, n42, addr_7_0_1, vss, vdd);
   {addr_tri_2_inst} tinv10 (n39, n42, addr_7_0_2, vss, vdd);
   {addr_tri_3_inst} tinv10 (n38, n42, addr_7_0_3, vss, vdd);
   {addr_tri_4_inst} tinv10 (n37, n42, addr_7_0_4, vss, vdd);
   {addr_tri_5_inst} tinv10 (n36, n42, addr_7_0_5, vss, vdd);
   {addr_tri_6_inst} tinv10 (n35, n42, addr_7_0_6, vss, vdd);
   {addr_tri_7_inst} tinv10 (n34, n42, addr_7_0_7, vss, vdd);
   net {n1, vss};
   {U56} no210 (n51, n52, ready, vss, vdd);
   {U57} iv110 (n53, n51, vss, vdd);
   {U58} na310 (n54, n55, n56, new_state_2_port, vss, vdd);
   {U59} na210 (n57, n58, n56, vss, vdd);
   {U60} na210 (start, n53, n55, vss, vdd);
   {U61} na210 (n59, n60, n54, vss, vdd);
   {U62} iv110 (n61, n60, vss, vdd);
   {U63} na210 (n62, n63, new_state_1_port, vss, vdd);
   {U64} iv110 (n64, n63, vss, vdd);
   {U65} no210 (n58, n65, n64, vss, vdd);
   {U66} no210 (n66, n57, n65, vss, vdd);
   {U67} na310 (n67, n62, n68, new_state_0_port, vss, vdd);
   {U68} no310 (n69, n70, n57, n68, vss, vdd);
   {U69} iv110 (n71, n69, vss, vdd);
   {U70} na310 (start, n52, n53, n71, vss, vdd);
   {U71} na210 (n59, n61, n62, vss, vdd);
   {U72} na210 (cur_block_1_port, cur_block_0_port, n61, vss, vdd);
   {U73} na210 (n66, n58, n67, vss, vdd);
   {U74} iv110 (lut_ready, n58, vss, vdd);
   {U75} mu111 (n72, n73, cur_block_1_port, n49, vss, vdd);
   {U76} na210 (n74, n75, n73, vss, vdd);
   {U77} na210 (n59, n45, n75, vss, vdd);
   {U78} no210 (n45, n76, n72, vss, vdd);
   {U79} iv110 (n59, n76, vss, vdd);
   {U80} mu111 (n59, n77, cur_block_0_port, n48, vss, vdd);
   {U81} no310 (state_0_port, state_2_port, n78, n59, vss, vdd);
   {U82} iv110 (draw_erase, n46, vss, vdd);
   {U83} iv110 (cur_block_0_port, n45, vss, vdd);
   {U84} na210 (n79, n80, n44, vss, vdd);
   {U85} na210 (state_1_port, state_2_port, n80, vss, vdd);
   {U86} iv110 (cur_block_1_port, n43, vss, vdd);
   {U87} no210 (n53, n77, n42, vss, vdd);
   {U88} iv110 (n74, n77, vss, vdd);
   {U89} no210 (n57, lut_start_port, n74, vss, vdd);
   {U90} no310 (n78, state_2_port, n81, n57, vss, vdd);
   {U91} iv110 (state_0_port, n81, vss, vdd);
   {U92} no210 (state_0_port, state_1_port, n53, vss, vdd);
   {U93} iv110 (mask_7_0_0, n41, vss, vdd);
   {U94} iv110 (mask_7_0_1, n40, vss, vdd);
   {U95} iv110 (mask_7_0_2, n39, vss, vdd);
   {U96} iv110 (mask_7_0_3, n38, vss, vdd);
   {U97} iv110 (mask_7_0_4, n37, vss, vdd);
   {U98} iv110 (mask_7_0_5, n36, vss, vdd);
   {U99} iv110 (mask_7_0_6, n35, vss, vdd);
   {U100} iv110 (mask_7_0_7, n34, vss, vdd);
   {U101} iv110 (n82, lut_start_port, vss, vdd);
   {U102} no210 (n66, n70, n82, vss, vdd);
   {U103} no210 (n79, n52, n70, vss, vdd);
   {U104} iv110 (state_2_port, n52, vss, vdd);
   {U105} no210 (n79, state_2_port, n66, vss, vdd);
   {U106} na210 (state_0_port, n78, n79, vss, vdd);
   {U107} iv110 (state_1_port, n78, vss, vdd);
}



