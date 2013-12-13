extern network dfr11 (terminal D, R, CK, Q, vss, vdd)
extern network tinv10 (terminal A, E, Y, vss, vdd)
extern network no310 (terminal A, B, C, Y, vss, vdd)
extern network mu111 (terminal A, B, S, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network na310 (terminal A, B, C, Y, vss, vdd)
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
   {data_tri} tinv10 (n42, n43, data, vss, vdd);
   {mask_select_tri_0_inst} tinv10 (n41, n40, mask_select_1_0_0, vss, vdd);
   {mask_select_tri_1_inst} tinv10 (n39, n40, mask_select_1_0_1, vss, vdd);
   {addr_tri_0_inst} tinv10 (n38, n43, addr_7_0_0, vss, vdd);
   {addr_tri_1_inst} tinv10 (n37, n43, addr_7_0_1, vss, vdd);
   {addr_tri_2_inst} tinv10 (n36, n43, addr_7_0_2, vss, vdd);
   {addr_tri_3_inst} tinv10 (n35, n43, addr_7_0_3, vss, vdd);
   {addr_tri_4_inst} tinv10 (n34, n43, addr_7_0_4, vss, vdd);
   {addr_tri_5_inst} tinv10 (n33, n43, addr_7_0_5, vss, vdd);
   {addr_tri_6_inst} tinv10 (n32, n43, addr_7_0_6, vss, vdd);
   {addr_tri_7_inst} tinv10 (n31, n43, addr_7_0_7, vss, vdd);
   {write_tri} tinv10 (n29, n30, write, vss, vdd);
   {U53} no310 (n45, state_1_port, state_0_port, ready, vss, vdd);
   {U54} na210 (n46, n47, new_state_2_port, vss, vdd);
   {U55} iv110 (n48, n47, vss, vdd);
   {U56} no210 (n49, n29, n48, vss, vdd);
   {U57} mu111 (n50, n51, state_1_port, n46, vss, vdd);
   {U58} na210 (n52, n53, n51, vss, vdd);
   {U59} iv110 (lut_ready, n53, vss, vdd);
   {U60} na210 (start, n54, n50, vss, vdd);
   {U61} na210 (n55, n56, new_state_1_port, vss, vdd);
   {U62} na210 (n49, n57, n56, vss, vdd);
   {U63} na210 (lut_ready, n52, n55, vss, vdd);
   {U64} na310 (n58, n59, n60, new_state_0_port, vss, vdd);
   {U65} na210 (start, n61, n60, vss, vdd);
   {U66} iv110 (n30, n61, vss, vdd);
   {U67} na210 (lut_start_port, n62, n59, vss, vdd);
   {U68} na210 (lut_ready, n45, n62, vss, vdd);
   {U69} na210 (state_1_port, n63, n58, vss, vdd);
   {U70} na210 (n64, n65, n63, vss, vdd);
   {U71} na210 (n49, n45, n65, vss, vdd);
   {U72} na210 (cur_block_1_port, cur_block_0_port, n49, vss, vdd);
   {U73} mu111 (n66, n67, cur_block_1_port, new_cur_block_1_port, vss, vdd);
   {U74} na210 (n68, n69, n67, vss, vdd);
   {U75} na210 (n57, n41, n69, vss, vdd);
   {U76} iv110 (n29, n57, vss, vdd);
   {U77} no210 (n41, n29, n66, vss, vdd);
   {U78} iv110 (n70, new_cur_block_0_port, vss, vdd);
   {U79} mu111 (n29, n68, cur_block_0_port, n70, vss, vdd);
   {U80} no210 (lut_start_port, n52, n68, vss, vdd);
   {U81} no210 (n52, n71, n43, vss, vdd);
   {U82} iv110 (n64, n52, vss, vdd);
   {U83} na210 (state_0_port, n45, n64, vss, vdd);
   {U84} iv110 (draw_erase, n42, vss, vdd);
   {U85} iv110 (cur_block_0_port, n41, vss, vdd);
   {U86} na210 (n72, n73, n40, vss, vdd);
   {U87} na210 (state_1_port, state_2_port, n73, vss, vdd);
   {U88} iv110 (cur_block_1_port, n39, vss, vdd);
   {U89} iv110 (mask_7_0_0, n38, vss, vdd);
   {U90} iv110 (mask_7_0_1, n37, vss, vdd);
   {U91} iv110 (mask_7_0_2, n36, vss, vdd);
   {U92} iv110 (mask_7_0_3, n35, vss, vdd);
   {U93} iv110 (mask_7_0_4, n34, vss, vdd);
   {U94} iv110 (mask_7_0_5, n33, vss, vdd);
   {U95} iv110 (mask_7_0_6, n32, vss, vdd);
   {U96} iv110 (mask_7_0_7, n31, vss, vdd);
   {U97} na310 (n71, n45, n54, n30, vss, vdd);
   {U98} na310 (n54, n45, state_1_port, n29, vss, vdd);
   {U99} iv110 (state_2_port, n45, vss, vdd);
   {U100} iv110 (state_0_port, n54, vss, vdd);
   {U101} iv110 (n72, lut_start_port, vss, vdd);
   {U102} na210 (state_0_port, n71, n72, vss, vdd);
   {U103} iv110 (state_1_port, n71, vss, vdd);
}



