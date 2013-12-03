extern network dfr11 (terminal D, R, CK, Q, vss, vdd)
extern network tinv10 (terminal A, E, Y, vss, vdd)
extern network no310 (terminal A, B, C, Y, vss, vdd)
extern network na310 (terminal A, B, C, Y, vss, vdd)
extern network mu111 (terminal A, B, S, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
network check_mask (terminal clk, rst, mask_7_0_7, mask_7_0_6, mask_7_0_5, 
                             mask_7_0_4, mask_7_0_3, mask_7_0_2, mask_7_0_1, 
                             mask_7_0_0, mask_select_1_0_1, mask_select_1_0_0, 
                             ready, empty, start, write, addr_7_0_7, 
                             addr_7_0_6, addr_7_0_5, addr_7_0_4, addr_7_0_3, 
                             addr_7_0_2, addr_7_0_1, addr_7_0_0, data, vss, vdd)
{
   net {write, vss};
   {state_reg_0_inst} dfr11 (next_state_0_port, rst, clk, state_0_port, vss, 
                             vdd);
   {state_reg_2_inst} dfr11 (next_state_2_port, rst, clk, state_2_port, vss, 
                             vdd);
   {state_reg_1_inst} dfr11 (next_state_1_port, rst, clk, state_1_port, vss, 
                             vdd);
   {addr_tri_0_inst} tinv10 (n45, n38, addr_7_0_0, vss, vdd);
   {addr_tri_1_inst} tinv10 (n44, n38, addr_7_0_1, vss, vdd);
   {addr_tri_2_inst} tinv10 (n43, n38, addr_7_0_2, vss, vdd);
   {addr_tri_3_inst} tinv10 (n42, n38, addr_7_0_3, vss, vdd);
   {addr_tri_4_inst} tinv10 (n41, n38, addr_7_0_4, vss, vdd);
   {addr_tri_5_inst} tinv10 (n40, n38, addr_7_0_5, vss, vdd);
   {addr_tri_6_inst} tinv10 (n39, n38, addr_7_0_6, vss, vdd);
   {addr_tri_7_inst} tinv10 (n37, n38, addr_7_0_7, vss, vdd);
   {empty_tri} tinv10 (n35, n36, empty, vss, vdd);
   {data_tri} tinv10 (n3, n4, data, vss, vdd);
   {U5} na310 (n7, n8, pixel_0_port, n6, vss, vdd);
   {U6} na210 (pixel_1_port, n9, n5, vss, vdd);
   {U10} na210 (n7, n12, n14, vss, vdd);
   {U11} na210 (pixel_0_port, n15, n13, vss, vdd);
   net {n4, vss};
   net {n3, vdd};
   {U55} no310 (n46, state_1_port, n47, ready, vss, vdd);
   {U56} no210 (data, state_0_port, n47, vss, vdd);
   {U57} na210 (n48, n49, next_state_2_port, vss, vdd);
   {U58} na310 (pixel_0_port, pixel_1_port, n7, n49, vss, vdd);
   {U59} na310 (state_0_port, n46, state_1_port, n48, vss, vdd);
   {U60} mu111 (n50, n51, n52, next_state_1_port, vss, vdd);
   {U61} no210 (state_2_port, n53, n51, vss, vdd);
   {U62} na210 (n54, n55, next_state_0_port, vss, vdd);
   {U63} na210 (n50, n56, n55, vss, vdd);
   {U64} na210 (n57, n52, n56, vss, vdd);
   {U65} iv110 (start, n57, vss, vdd);
   {U66} na210 (n58, n59, n9, vss, vdd);
   {U67} iv110 (n15, n59, vss, vdd);
   {U68} na210 (state_2_port, n12, n58, vss, vdd);
   {U69} iv110 (n54, n7, vss, vdd);
   {U70} na310 (n60, n53, state_2_port, n54, vss, vdd);
   {U71} iv110 (mask_7_0_0, n45, vss, vdd);
   {U72} iv110 (mask_7_0_1, n44, vss, vdd);
   {U73} iv110 (mask_7_0_2, n43, vss, vdd);
   {U74} iv110 (mask_7_0_3, n42, vss, vdd);
   {U75} iv110 (mask_7_0_4, n41, vss, vdd);
   {U76} iv110 (mask_7_0_5, n40, vss, vdd);
   {U77} iv110 (mask_7_0_6, n39, vss, vdd);
   {U78} no210 (n50, n52, n38, vss, vdd);
   {U79} iv110 (mask_7_0_7, n37, vss, vdd);
   {U80} no210 (n61, n46, n36, vss, vdd);
   {U81} iv110 (state_2_port, n46, vss, vdd);
   {U82} no210 (state_0_port, n35, n61, vss, vdd);
   {U83} iv110 (n60, n35, vss, vdd);
   {U84} no210 (state_1_port, data, n60, vss, vdd);
   {U85} na310 (n53, n52, n62, n15, vss, vdd);
   {U86} na210 (data, state_2_port, n62, vss, vdd);
   {U87} iv110 (state_1_port, n52, vss, vdd);
   {U88} iv110 (state_0_port, n53, vss, vdd);
   {U89} no210 (n8, n63, mask_select_1_0_1, vss, vdd);
   {U90} iv110 (pixel_1_port, n8, vss, vdd);
   {U91} na210 (n6, n5, pixel_1_port, vss, vdd);
   {U92} no210 (n12, n63, mask_select_1_0_0, vss, vdd);
   {U93} mu111 (n50, state_2_port, state_1_port, n63, vss, vdd);
   {U94} no210 (state_0_port, state_2_port, n50, vss, vdd);
   {U95} iv110 (pixel_0_port, n12, vss, vdd);
   {U96} na210 (n14, n13, pixel_0_port, vss, vdd);
}



