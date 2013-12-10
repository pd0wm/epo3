extern network cs_7bc (terminal clk, rst, en, value_6_0_6, value_6_0_5, 
                                value_6_0_4, value_6_0_3, value_6_0_2, 
                                value_6_0_1, value_6_0_0, vss, vdd)
extern network cs_tri7 (terminal i_6_0_6, i_6_0_5, i_6_0_4, i_6_0_3, i_6_0_2, 
                                 i_6_0_1, i_6_0_0, o_6_0_6, o_6_0_5, o_6_0_4, 
                                 o_6_0_3, o_6_0_2, o_6_0_1, o_6_0_0, e, vss, 
                                 vdd)
extern network dfr11 (terminal D, R, CK, Q, vss, vdd)
extern network mu111 (terminal A, B, S, Y, vss, vdd)
extern network na310 (terminal A, B, C, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network no310 (terminal A, B, C, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
network cs_compare (terminal clk, rst, start_in, ready_out, ram_addr_out_6_0_6, 
                             ram_addr_out_6_0_5, ram_addr_out_6_0_4, 
                             ram_addr_out_6_0_3, ram_addr_out_6_0_2, 
                             ram_addr_out_6_0_1, ram_addr_out_6_0_0, data_in, 
                             vss, vdd)
{
   net {ready_out, ready_out_port};
   {counter_7_bit} cs_7bc (clk, rst, n32, cnt_ram_addr_6_port, 
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
   {state_reg_0_inst} dfr11 (state_next_0_port, rst, clk, state_0_port, vss, 
                             vdd);
   {state_reg_1_inst} dfr11 (state_next_1_port, rst, clk, state_1_port, vss, 
                             vdd);
   {state_reg_2_inst} dfr11 (state_next_2_port, rst, clk, state_2_port, vss, 
                             vdd);
   {row_full_reg} dfr11 (row_full_next, rst, clk, row_full, vss, vdd);
   {U40} na210 (n33, n34, state_next_2_port, vss, vdd);
   {U41} mu111 (n35, n36, n37, n33, vss, vdd);
   {U42} na210 (state_2_port, state_0_port, n36, vss, vdd);
   {U43} iv110 (n38, n35, vss, vdd);
   {U44} na210 (n34, n39, state_next_1_port, vss, vdd);
   {U45} iv110 (tri_en, n39, vss, vdd);
   {U46} na210 (n40, n41, tri_en, vss, vdd);
   {U47} iv110 (n32, n40, vss, vdd);
   {U48} na210 (n42, n43, n34, vss, vdd);
   {U49} iv110 (n44, n43, vss, vdd);
   {U50} na310 (n45, n46, n47, state_next_0_port, vss, vdd);
   {U51} mu111 (n48, n49, n37, n47, vss, vdd);
   {U52} na310 (n50, n51, start_in, n49, vss, vdd);
   {U53} na210 (row_full, n38, n48, vss, vdd);
   {U54} na310 (cnt_ram_addr_0_port, n32, n52, n46, vss, vdd);
   {U55} iv110 (n53, n52, vss, vdd);
   {U56} na210 (cnt_ram_addr_1_port, cnt_ram_addr_2_port, n53, vss, vdd);
   {U57} na210 (n42, n44, n45, vss, vdd);
   {U58} na310 (n54, n55, n56, n44, vss, vdd);
   {U59} no310 (cnt_ram_addr_0_port, cnt_ram_addr_2_port, cnt_ram_addr_1_port, 
                n56, vss, vdd);
   {U60} no210 (cnt_ram_addr_6_port, cnt_ram_addr_5_port, n55, vss, vdd);
   {U61} no210 (cnt_ram_addr_4_port, cnt_ram_addr_3_port, n54, vss, vdd);
   {U62} no310 (state_0_port, state_1_port, n51, n42, vss, vdd);
   {U63} na210 (n41, n57, row_full_next, vss, vdd);
   {U64} na210 (row_full, n58, n57, vss, vdd);
   {U65} na310 (n59, state_1_port, n60, n58, vss, vdd);
   {U66} no210 (ready_out_port, n38, n60, vss, vdd);
   {U67} na210 (data_in, n32, n59, vss, vdd);
   {U68} na210 (n38, n37, n41, vss, vdd);
   {U69} no210 (n50, state_2_port, n38, vss, vdd);
   {U70} iv110 (state_0_port, n50, vss, vdd);
   {U71} no310 (n37, state_0_port, n51, ready_out_port, vss, vdd);
   {U72} iv110 (state_2_port, n51, vss, vdd);
   {U73} no310 (state_0_port, state_2_port, n37, n32, vss, vdd);
   {U74} iv110 (state_1_port, n37, vss, vdd);
}



