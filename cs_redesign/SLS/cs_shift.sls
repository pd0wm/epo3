extern network cs_7bcws (terminal clk, rst, en, set, value_6_0_6, value_6_0_5, 
                                  value_6_0_4, value_6_0_3, value_6_0_2, 
                                  value_6_0_1, value_6_0_0, data_6_0_6, 
                                  data_6_0_5, data_6_0_4, data_6_0_3, 
                                  data_6_0_2, data_6_0_1, data_6_0_0, vss, vdd)
extern network cs_adder7 (terminal i_6_0_6, i_6_0_5, i_6_0_4, i_6_0_3, i_6_0_2, 
                                   i_6_0_1, i_6_0_0, o_6_0_6, o_6_0_5, o_6_0_4, 
                                   o_6_0_3, o_6_0_2, o_6_0_1, o_6_0_0, vss, vdd)
extern network cs_tri7 (terminal i_6_0_6, i_6_0_5, i_6_0_4, i_6_0_3, i_6_0_2, 
                                 i_6_0_1, i_6_0_0, o_6_0_6, o_6_0_5, o_6_0_4, 
                                 o_6_0_3, o_6_0_2, o_6_0_1, o_6_0_0, e, vss, 
                                 vdd)
extern network dfr11 (terminal D, R, CK, Q, vss, vdd)
extern network na310 (terminal A, B, C, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network no310 (terminal A, B, C, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
network cs_shift (terminal clk, rst, start_in, ready_out, ram_addr_in_6_0_6, 
                           ram_addr_in_6_0_5, ram_addr_in_6_0_4, 
                           ram_addr_in_6_0_3, ram_addr_in_6_0_2, 
                           ram_addr_in_6_0_1, ram_addr_in_6_0_0, 
                           ram_addr_out_6_0_6, ram_addr_out_6_0_5, 
                           ram_addr_out_6_0_4, ram_addr_out_6_0_3, 
                           ram_addr_out_6_0_2, ram_addr_out_6_0_1, 
                           ram_addr_out_6_0_0, ram_we, ram_data_in, 
                           ram_data_out, vss, vdd)
{
   net {ram_we, ram_we_port};
   {tristate_7_bit_normal} cs_tri7 (cnt_ram_addr_6_port, cnt_ram_addr_5_port, 
                                    cnt_ram_addr_4_port, cnt_ram_addr_3_port, 
                                    cnt_ram_addr_2_port, cnt_ram_addr_1_port, 
                                    cnt_ram_addr_0_port, ram_addr_out_6_0_6, 
                                    ram_addr_out_6_0_5, ram_addr_out_6_0_4, 
                                    ram_addr_out_6_0_3, ram_addr_out_6_0_2, 
                                    ram_addr_out_6_0_1, ram_addr_out_6_0_0, 
                                    ram_we_port, vss, vdd);
   {counter_7_bit} cs_7bcws (clk, rst, n7, n29, cnt_ram_addr_6_port, 
                             cnt_ram_addr_5_port, cnt_ram_addr_4_port, 
                             cnt_ram_addr_3_port, cnt_ram_addr_2_port, 
                             cnt_ram_addr_1_port, cnt_ram_addr_0_port, 
                             ram_addr_in_6_0_6, ram_addr_in_6_0_5, 
                             ram_addr_in_6_0_4, ram_addr_in_6_0_3, 
                             ram_addr_in_6_0_2, ram_addr_in_6_0_1, 
                             ram_addr_in_6_0_0, vss, vdd);
   {adder_7_bit} cs_adder7 (cnt_ram_addr_6_port, cnt_ram_addr_5_port, 
                            cnt_ram_addr_4_port, cnt_ram_addr_3_port, 
                            cnt_ram_addr_2_port, cnt_ram_addr_1_port, 
                            cnt_ram_addr_0_port, cnt_ram_addr_substr_6_port, 
                            cnt_ram_addr_substr_5_port, 
                            cnt_ram_addr_substr_4_port, 
                            cnt_ram_addr_substr_3_port, 
                            cnt_ram_addr_substr_2_port, 
                            cnt_ram_addr_substr_1_port, 
                            cnt_ram_addr_substr_0_port, vss, vdd);
   {tristate_7_bit_substr} cs_tri7 (cnt_ram_addr_substr_6_port, 
                                    cnt_ram_addr_substr_5_port, 
                                    cnt_ram_addr_substr_4_port, 
                                    cnt_ram_addr_substr_3_port, 
                                    cnt_ram_addr_substr_2_port, 
                                    cnt_ram_addr_substr_1_port, 
                                    cnt_ram_addr_substr_0_port, 
                                    ram_addr_out_6_0_6, ram_addr_out_6_0_5, 
                                    ram_addr_out_6_0_4, ram_addr_out_6_0_3, 
                                    ram_addr_out_6_0_2, ram_addr_out_6_0_1, 
                                    ram_addr_out_6_0_0, n9, vss, vdd);
   {state_reg_0_inst} dfr11 (state_next_0_port, rst, clk, state_0_port, vss, 
                             vdd);
   {state_reg_1_inst} dfr11 (n1, rst, clk, state_1_port, vss, vdd);
   {state_reg_2_inst} dfr11 (state_next_2_port, rst, clk, state_2_port, vss, 
                             vdd);
   {U35} na310 (n30, n31, n32, state_next_2_port, vss, vdd);
   {U36} na310 (state_2_port, n33, n34, n32, vss, vdd);
   {U37} iv110 (n9, n30, vss, vdd);
   {U38} na210 (n35, n36, state_next_0_port, vss, vdd);
   {U39} na310 (n33, n37, start_in, n36, vss, vdd);
   {U40} no310 (n33, state_1_port, n37, ready_out, vss, vdd);
   {U41} no310 (n38, n39, n31, ram_data_out, vss, vdd);
   {U42} no310 (n40, cnt_ram_addr_4_port, cnt_ram_addr_3_port, n39, vss, vdd);
   {U43} na210 (n41, n42, n40, vss, vdd);
   {U44} iv110 (cnt_ram_addr_5_port, n41, vss, vdd);
   {U45} iv110 (ram_data_in, n38, vss, vdd);
   {U46} no310 (n33, state_2_port, n43, n9, vss, vdd);
   {U47} iv110 (state_1_port, n43, vss, vdd);
   {U48} iv110 (n44, n1, vss, vdd);
   {U49} no310 (n29, n7, n45, n44, vss, vdd);
   {U50} no210 (n35, n34, n45, vss, vdd);
   {U51} no310 (n46, n42, n47, n34, vss, vdd);
   {U52} iv110 (n48, n47, vss, vdd);
   {U53} no210 (n49, n50, n48, vss, vdd);
   {U54} na210 (cnt_ram_addr_3_port, cnt_ram_addr_2_port, n50, vss, vdd);
   {U55} na210 (cnt_ram_addr_1_port, cnt_ram_addr_0_port, n49, vss, vdd);
   {U56} iv110 (cnt_ram_addr_6_port, n42, vss, vdd);
   {U57} na210 (cnt_ram_addr_4_port, cnt_ram_addr_5_port, n46, vss, vdd);
   {U58} na210 (n31, n51, n7, vss, vdd);
   {U59} iv110 (n52, n51, vss, vdd);
   {U60} no210 (n35, state_2_port, n52, vss, vdd);
   {U61} na210 (state_1_port, n33, n35, vss, vdd);
   {U62} iv110 (ram_we_port, n31, vss, vdd);
   {U63} no310 (state_0_port, state_1_port, n37, ram_we_port, vss, vdd);
   {U64} iv110 (state_2_port, n37, vss, vdd);
   {U65} no310 (state_1_port, state_2_port, n33, n29, vss, vdd);
   {U66} iv110 (state_0_port, n33, vss, vdd);
}



