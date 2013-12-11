extern network cs_7bc (terminal clk, rst, en, value_6_0_6, value_6_0_5, 
                                value_6_0_4, value_6_0_3, value_6_0_2, 
                                value_6_0_1, value_6_0_0, vss, vdd)
extern network cs_tri7 (terminal i_6_0_6, i_6_0_5, i_6_0_4, i_6_0_3, i_6_0_2, 
                                 i_6_0_1, i_6_0_0, o_6_0_6, o_6_0_5, o_6_0_4, 
                                 o_6_0_3, o_6_0_2, o_6_0_1, o_6_0_0, e, vss, 
                                 vdd)
extern network cs_shift (terminal clk, rst, start_in, ready_out, 
                                  ram_addr_in_6_0_6, ram_addr_in_6_0_5, 
                                  ram_addr_in_6_0_4, ram_addr_in_6_0_3, 
                                  ram_addr_in_6_0_2, ram_addr_in_6_0_1, 
                                  ram_addr_in_6_0_0, ram_addr_out_6_0_6, 
                                  ram_addr_out_6_0_5, ram_addr_out_6_0_4, 
                                  ram_addr_out_6_0_3, ram_addr_out_6_0_2, 
                                  ram_addr_out_6_0_1, ram_addr_out_6_0_0, 
                                  ram_we, ram_data_in, ram_data_out, vss, vdd)
extern network dfr11 (terminal D, R, CK, Q, vss, vdd)
extern network mu111 (terminal A, B, S, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network na310 (terminal A, B, C, Y, vss, vdd)
extern network no310 (terminal A, B, C, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
network cs_compare (terminal clk, rst, start_in, ready_out, score_out, 
                             ram_addr_out_6_0_6, ram_addr_out_6_0_5, 
                             ram_addr_out_6_0_4, ram_addr_out_6_0_3, 
                             ram_addr_out_6_0_2, ram_addr_out_6_0_1, 
                             ram_addr_out_6_0_0, ram_we, ram_data_in, 
                             ram_data_out, vss, vdd)
{
   net {score_out, score_out_port};
   {counter_7_bit} cs_7bc (clk, rst, n5, cnt_ram_addr_6_port, 
                           cnt_ram_addr_5_port, cnt_ram_addr_4_port, 
                           cnt_ram_addr_3_port, cnt_ram_addr_2_port, 
                           cnt_ram_addr_1_port, cnt_ram_addr_0_port, vss, vdd);
   {tristate_7_bit} cs_tri7 (cnt_ram_addr_6_port, cnt_ram_addr_5_port, 
                             cnt_ram_addr_4_port, cnt_ram_addr_3_port, 
                             cnt_ram_addr_2_port, cnt_ram_addr_1_port, 
                             cnt_ram_addr_0_port, ram_addr_out_6_0_6, 
                             ram_addr_out_6_0_5, ram_addr_out_6_0_4, 
                             ram_addr_out_6_0_3, ram_addr_out_6_0_2, 
                             ram_addr_out_6_0_1, ram_addr_out_6_0_0, tri_en, 
                             vss, vdd);
   {shift} cs_shift (clk, rst, n35, shift_ready, cnt_ram_addr_6_port, 
                     cnt_ram_addr_5_port, cnt_ram_addr_4_port, 
                     cnt_ram_addr_3_port, cnt_ram_addr_2_port, 
                     cnt_ram_addr_1_port, cnt_ram_addr_0_port, 
                     ram_addr_out_6_0_6, ram_addr_out_6_0_5, 
                     ram_addr_out_6_0_4, ram_addr_out_6_0_3, 
                     ram_addr_out_6_0_2, ram_addr_out_6_0_1, 
                     ram_addr_out_6_0_0, ram_we, ram_data_in, ram_data_out, 
                     vss, vdd);
   {state_reg_0_inst} dfr11 (state_next_0_port, rst, clk, state_0_port, vss, 
                             vdd);
   {state_reg_2_inst} dfr11 (state_next_2_port, rst, clk, state_2_port, vss, 
                             vdd);
   {state_reg_1_inst} dfr11 (state_next_1_port, rst, clk, state_1_port, vss, 
                             vdd);
   {row_full_reg} dfr11 (row_full_next, rst, clk, row_full, vss, vdd);
   {U44} na310 (n36, n37, n38, state_next_2_port, vss, vdd);
   {U45} no210 (score_out_port, n35, n38, vss, vdd);
   {U46} na210 (state_1_port, n39, n37, vss, vdd);
   {U47} na210 (n36, n40, state_next_1_port, vss, vdd);
   {U48} iv110 (tri_en, n40, vss, vdd);
   {U49} na210 (n41, n42, tri_en, vss, vdd);
   {U50} iv110 (n43, n36, vss, vdd);
   {U51} na210 (n44, n45, n43, vss, vdd);
   {U52} na310 (n46, n47, n48, n45, vss, vdd);
   {U53} no310 (n49, cnt_ram_addr_0_port, n50, n48, vss, vdd);
   {U54} na210 (n51, n52, n49, vss, vdd);
   {U55} iv110 (cnt_ram_addr_1_port, n52, vss, vdd);
   {U56} no210 (cnt_ram_addr_3_port, cnt_ram_addr_2_port, n51, vss, vdd);
   {U57} no310 (cnt_ram_addr_6_port, state_1_port, state_0_port, n47, vss, vdd);
   {U58} no210 (cnt_ram_addr_5_port, cnt_ram_addr_4_port, n46, vss, vdd);
   {U59} na210 (shift_ready, n35, n44, vss, vdd);
   {U60} na310 (n53, n54, n55, state_next_0_port, vss, vdd);
   {U61} mu111 (n56, n57, n58, n55, vss, vdd);
   {U62} iv110 (n59, n57, vss, vdd);
   {U63} no210 (state_0_port, n60, n59, vss, vdd);
   {U64} no210 (start_in, state_2_port, n60, vss, vdd);
   {U65} na210 (row_full, n39, n56, vss, vdd);
   {U66} na310 (cnt_ram_addr_0_port, n5, n61, n54, vss, vdd);
   {U67} iv110 (n62, n61, vss, vdd);
   {U68} na210 (cnt_ram_addr_1_port, cnt_ram_addr_2_port, n62, vss, vdd);
   {U69} na210 (n35, n63, n53, vss, vdd);
   {U70} iv110 (shift_ready, n63, vss, vdd);
   {U71} no310 (n58, state_0_port, n50, score_out_port, vss, vdd);
   {U72} na210 (n42, n64, row_full_next, vss, vdd);
   {U73} na210 (row_full, n65, n64, vss, vdd);
   {U74} na210 (n5, n66, n65, vss, vdd);
   {U75} iv110 (ram_data_in, n66, vss, vdd);
   {U76} na210 (n39, n58, n42, vss, vdd);
   {U77} no210 (n67, state_2_port, n39, vss, vdd);
   {U78} iv110 (n41, n5, vss, vdd);
   {U79} na310 (n67, n50, state_1_port, n41, vss, vdd);
   {U80} no310 (n67, state_1_port, n50, n35, vss, vdd);
   {U81} no310 (n50, n67, n58, ready_out, vss, vdd);
   {U82} iv110 (state_1_port, n58, vss, vdd);
   {U83} iv110 (state_0_port, n67, vss, vdd);
   {U84} iv110 (state_2_port, n50, vss, vdd);
}



