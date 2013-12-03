extern network dfr11 (terminal D, R, CK, Q, vss, vdd)
extern network tinv10 (terminal A, E, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network mu111 (terminal A, B, S, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
network de_piece (terminal clk, rst, mask_7_0_7, mask_7_0_6, mask_7_0_5, 
                           mask_7_0_4, mask_7_0_3, mask_7_0_2, mask_7_0_1, 
                           mask_7_0_0, draw_erase, ready, start, 
                           mask_select_1_0_1, mask_select_1_0_0, lut_start, 
                           lut_ready, write, addr_7_0_7, addr_7_0_6, 
                           addr_7_0_5, addr_7_0_4, addr_7_0_3, addr_7_0_2, 
                           addr_7_0_1, addr_7_0_0, data, vss, vdd)
{
   net {lut_start, lut_start_port};
   net {write, write_port};
   {state_reg_0_inst} dfr11 (new_state_0_port, rst, clk, state_0_port, vss, 
                             vdd);
   {state_reg_1_inst} dfr11 (new_state_1_port, rst, clk, state_1_port, vss, 
                             vdd);
   {current_block_reg_0_inst} dfr11 (new_current_block_0_port, rst, clk, 
                                     current_block_0_port, vss, vdd);
   {current_block_reg_1_inst} dfr11 (new_current_block_1_port, rst, clk, 
                                     current_block_1_port, vss, vdd);
   {data_tri} tinv10 (n26, write_port, data, vss, vdd);
   {mask_select_tri_0_inst} tinv10 (n25, lut_start_port, mask_select_1_0_0, 
                                    vss, vdd);
   {mask_select_tri_1_inst} tinv10 (n24, lut_start_port, mask_select_1_0_1, 
                                    vss, vdd);
   {addr_tri_0_inst} tinv10 (n23, write_port, addr_7_0_0, vss, vdd);
   {addr_tri_1_inst} tinv10 (n22, write_port, addr_7_0_1, vss, vdd);
   {addr_tri_2_inst} tinv10 (n21, write_port, addr_7_0_2, vss, vdd);
   {addr_tri_3_inst} tinv10 (n20, write_port, addr_7_0_3, vss, vdd);
   {addr_tri_4_inst} tinv10 (n19, write_port, addr_7_0_4, vss, vdd);
   {addr_tri_5_inst} tinv10 (n18, write_port, addr_7_0_5, vss, vdd);
   {addr_tri_6_inst} tinv10 (n17, write_port, addr_7_0_6, vss, vdd);
   {addr_tri_7_inst} tinv10 (n16, write_port, addr_7_0_7, vss, vdd);
   {U36} no210 (state_0_port, n30, ready, vss, vdd);
   {U37} na210 (n31, n32, new_state_1_port, vss, vdd);
   {U38} mu111 (n33, lut_ready, state_0_port, n31, vss, vdd);
   {U39} iv110 (start, n33, vss, vdd);
   {U40} na210 (n34, n35, new_state_0_port, vss, vdd);
   {U41} iv110 (n36, n35, vss, vdd);
   {U42} mu111 (n37, current_block_1_port, state_0_port, n34, vss, vdd);
   {U43} na210 (start, n30, n37, vss, vdd);
   {U44} mu111 (n38, n36, current_block_1_port, new_current_block_1_port, vss, 
                vdd);
   {U45} na210 (n39, n40, n36, vss, vdd);
   {U46} na210 (state_0_port, n25, n40, vss, vdd);
   {U47} no210 (n25, n32, n38, vss, vdd);
   {U48} mu111 (write_port, lut_start_port, current_block_0_port, 
                new_current_block_0_port, vss, vdd);
   {U49} iv110 (n32, write_port, vss, vdd);
   {U50} na210 (state_0_port, n30, n32, vss, vdd);
   {U51} iv110 (state_1_port, n30, vss, vdd);
   {U52} iv110 (draw_erase, n26, vss, vdd);
   {U53} iv110 (current_block_0_port, n25, vss, vdd);
   {U54} iv110 (current_block_1_port, n24, vss, vdd);
   {U55} iv110 (mask_7_0_0, n23, vss, vdd);
   {U56} iv110 (mask_7_0_1, n22, vss, vdd);
   {U57} iv110 (mask_7_0_2, n21, vss, vdd);
   {U58} iv110 (mask_7_0_3, n20, vss, vdd);
   {U59} iv110 (mask_7_0_4, n19, vss, vdd);
   {U60} iv110 (mask_7_0_5, n18, vss, vdd);
   {U61} iv110 (mask_7_0_6, n17, vss, vdd);
   {U62} iv110 (mask_7_0_7, n16, vss, vdd);
   {U63} iv110 (n39, lut_start_port, vss, vdd);
   {U64} na210 (state_1_port, state_0_port, n39, vss, vdd);
}



