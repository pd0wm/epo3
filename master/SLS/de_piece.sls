extern network dfr11 (terminal D, R, CK, Q, vss, vdd)
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
   {state_reg_0_inst} dfr11 (new_state_0_port, rst, clk, state_0_port, vss, 
                             vdd);
   {state_reg_2_inst} dfr11 (new_state_2_port, rst, clk, state_2_port, vss, 
                             vdd);
   {cur_block_reg_0_inst} dfr11 (new_cur_block_0_port, rst, clk, 
                                 cur_block_0_port, vss, vdd);
   {cur_block_reg_1_inst} dfr11 (new_cur_block_1_port, rst, clk, 
                                 cur_block_1_port, vss, vdd);
   {state_reg_1_inst} dfr11 (new_state_1_port, rst, clk, state_1_port, vss, 
                             vdd);
   {data_tri} tinv10 (n46, n34, data, vss, vdd);
   {mask_select_tri_0_inst} tinv10 (n45, n44, mask_select_1_0_0, vss, vdd);
   {mask_select_tri_1_inst} tinv10 (n43, n44, mask_select_1_0_1, vss, vdd);
   {addr_tri_0_inst} tinv10 (n42, n34, addr_7_0_0, vss, vdd);
   {addr_tri_1_inst} tinv10 (n41, n34, addr_7_0_1, vss, vdd);
   {addr_tri_2_inst} tinv10 (n40, n34, addr_7_0_2, vss, vdd);
   {addr_tri_3_inst} tinv10 (n39, n34, addr_7_0_3, vss, vdd);
   {addr_tri_4_inst} tinv10 (n38, n34, addr_7_0_4, vss, vdd);
   {addr_tri_5_inst} tinv10 (n37, n34, addr_7_0_5, vss, vdd);
   {addr_tri_6_inst} tinv10 (n36, n34, addr_7_0_6, vss, vdd);
   {addr_tri_7_inst} tinv10 (n35, n34, addr_7_0_7, vss, vdd);
   {write_tri} tinv10 (n1, n34, write, vss, vdd);
   net {n1, vss};
   {U56} no210 (n49, n50, ready, vss, vdd);
   {U57} iv110 (n51, n49, vss, vdd);
   {U58} na310 (n52, n53, n54, new_state_2_port, vss, vdd);
   {U59} na210 (n55, n56, n54, vss, vdd);
   {U60} na210 (start, n51, n53, vss, vdd);
   {U61} na210 (n57, n58, n52, vss, vdd);
   {U62} iv110 (n59, n58, vss, vdd);
   {U63} na210 (n60, n61, new_state_1_port, vss, vdd);
   {U64} iv110 (n62, n61, vss, vdd);
   {U65} no210 (n56, n63, n62, vss, vdd);
   {U66} no210 (n64, n55, n63, vss, vdd);
   {U67} na310 (n65, n60, n66, new_state_0_port, vss, vdd);
   {U68} no310 (n67, n68, n55, n66, vss, vdd);
   {U69} iv110 (n69, n67, vss, vdd);
   {U70} na310 (start, n50, n51, n69, vss, vdd);
   {U71} na210 (n57, n59, n60, vss, vdd);
   {U72} na210 (cur_block_1_port, cur_block_0_port, n59, vss, vdd);
   {U73} na210 (n64, n56, n65, vss, vdd);
   {U74} iv110 (lut_ready, n56, vss, vdd);
   {U75} mu111 (n70, n71, cur_block_1_port, new_cur_block_1_port, vss, vdd);
   {U76} na210 (n72, n73, n71, vss, vdd);
   {U77} na210 (n57, n45, n73, vss, vdd);
   {U78} no210 (n45, n74, n70, vss, vdd);
   {U79} iv110 (n57, n74, vss, vdd);
   {U80} mu111 (n57, n75, cur_block_0_port, new_cur_block_0_port, vss, vdd);
   {U81} no310 (state_0_port, state_2_port, n76, n57, vss, vdd);
   {U82} iv110 (draw_erase, n46, vss, vdd);
   {U83} iv110 (cur_block_0_port, n45, vss, vdd);
   {U84} na210 (n77, n78, n44, vss, vdd);
   {U85} na210 (state_1_port, state_2_port, n78, vss, vdd);
   {U86} iv110 (cur_block_1_port, n43, vss, vdd);
   {U87} iv110 (mask_7_0_0, n42, vss, vdd);
   {U88} iv110 (mask_7_0_1, n41, vss, vdd);
   {U89} iv110 (mask_7_0_2, n40, vss, vdd);
   {U90} iv110 (mask_7_0_3, n39, vss, vdd);
   {U91} iv110 (mask_7_0_4, n38, vss, vdd);
   {U92} iv110 (mask_7_0_5, n37, vss, vdd);
   {U93} iv110 (mask_7_0_6, n36, vss, vdd);
   {U94} iv110 (mask_7_0_7, n35, vss, vdd);
   {U95} no210 (n51, n75, n34, vss, vdd);
   {U96} iv110 (n72, n75, vss, vdd);
   {U97} no210 (n55, lut_start_port, n72, vss, vdd);
   {U98} no310 (n76, state_2_port, n79, n55, vss, vdd);
   {U99} iv110 (state_0_port, n79, vss, vdd);
   {U100} no210 (state_0_port, state_1_port, n51, vss, vdd);
   {U101} iv110 (n80, lut_start_port, vss, vdd);
   {U102} no210 (n64, n68, n80, vss, vdd);
   {U103} no210 (n77, n50, n68, vss, vdd);
   {U104} iv110 (state_2_port, n50, vss, vdd);
   {U105} no210 (n77, state_2_port, n64, vss, vdd);
   {U106} na210 (state_0_port, n76, n77, vss, vdd);
   {U107} iv110 (state_1_port, n76, vss, vdd);
}



