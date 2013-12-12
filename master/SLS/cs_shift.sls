extern network cs_7bcws (terminal clk, rst, en, set, value_6_0_6, value_6_0_5, 
                                  value_6_0_4, value_6_0_3, value_6_0_2, 
                                  value_6_0_1, value_6_0_0, data_6_0_6, 
                                  data_6_0_5, data_6_0_4, data_6_0_3, 
                                  data_6_0_2, data_6_0_1, data_6_0_0, vss, vdd)
extern network cs_adder7 (terminal i_6_0_6, i_6_0_5, i_6_0_4, i_6_0_3, i_6_0_2, 
                                   i_6_0_1, i_6_0_0, o_6_0_6, o_6_0_5, o_6_0_4, 
                                   o_6_0_3, o_6_0_2, o_6_0_1, o_6_0_0, vss, vdd)
extern network cs_tri8 (terminal i_7_0_7, i_7_0_6, i_7_0_5, i_7_0_4, i_7_0_3, 
                                 i_7_0_2, i_7_0_1, i_7_0_0, o_7_0_7, o_7_0_6, 
                                 o_7_0_5, o_7_0_4, o_7_0_3, o_7_0_2, o_7_0_1, 
                                 o_7_0_0, e, vss, vdd)
extern network cs_shift_comb (terminal state_2_0_2, state_2_0_1, state_2_0_0, 
                                       state_next_2_0_2, state_next_2_0_1, 
                                       state_next_2_0_0, start_in, ram_data_in, 
                                       cnt_ram_addr_6_0_6, cnt_ram_addr_6_0_5, 
                                       cnt_ram_addr_6_0_4, cnt_ram_addr_6_0_3, 
                                       cnt_ram_addr_6_0_2, cnt_ram_addr_6_0_1, 
                                       cnt_ram_addr_6_0_0, cnt_set, cnt_en, 
                                       tri_en, tri_en_substr, ram_we, 
                                       ready_out, ram_data_out, vss, vdd)
extern network dfr11 (terminal D, R, CK, Q, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
network cs_shift (terminal clk, rst, start_in, ready_out, ram_addr_in_6_0_6, 
                           ram_addr_in_6_0_5, ram_addr_in_6_0_4, 
                           ram_addr_in_6_0_3, ram_addr_in_6_0_2, 
                           ram_addr_in_6_0_1, ram_addr_in_6_0_0, 
                           ram_addr_out_7_0_7, ram_addr_out_7_0_6, 
                           ram_addr_out_7_0_5, ram_addr_out_7_0_4, 
                           ram_addr_out_7_0_3, ram_addr_out_7_0_2, 
                           ram_addr_out_7_0_1, ram_addr_out_7_0_0, ram_we, 
                           ram_data_in, ram_data_out, vss, vdd)
{
   {tristate_8_bit_normal} cs_tri8 (X_Logic0_port, 
                                    cnt_ram_addr_uncompressed_6_port, 
                                    cnt_ram_addr_uncompressed_5_port, 
                                    cnt_ram_addr_uncompressed_4_port, 
                                    cnt_ram_addr_uncompressed_3_port, 
                                    cnt_ram_addr_uncompressed_2_port, 
                                    cnt_ram_addr_uncompressed_1_port, 
                                    cnt_ram_addr_uncompressed_0_port, 
                                    ram_addr_out_7_0_7, ram_addr_out_7_0_6, 
                                    ram_addr_out_7_0_5, ram_addr_out_7_0_4, 
                                    ram_addr_out_7_0_3, ram_addr_out_7_0_2, 
                                    ram_addr_out_7_0_1, ram_addr_out_7_0_0, 
                                    tri_en, vss, vdd);
   {counter_7_bit} cs_7bcws (clk, rst, cnt_en, cnt_set, 
                             cnt_ram_addr_uncompressed_6_port, 
                             cnt_ram_addr_uncompressed_5_port, 
                             cnt_ram_addr_uncompressed_4_port, 
                             cnt_ram_addr_uncompressed_3_port, 
                             cnt_ram_addr_uncompressed_2_port, 
                             cnt_ram_addr_uncompressed_1_port, 
                             cnt_ram_addr_uncompressed_0_port, 
                             ram_addr_in_6_0_6, ram_addr_in_6_0_5, 
                             ram_addr_in_6_0_4, ram_addr_in_6_0_3, 
                             ram_addr_in_6_0_2, ram_addr_in_6_0_1, 
                             ram_addr_in_6_0_0, vss, vdd);
   {adder_7_bit} cs_adder7 (cnt_ram_addr_uncompressed_6_port, 
                            cnt_ram_addr_uncompressed_5_port, 
                            cnt_ram_addr_uncompressed_4_port, 
                            cnt_ram_addr_uncompressed_3_port, 
                            cnt_ram_addr_uncompressed_2_port, 
                            cnt_ram_addr_uncompressed_1_port, 
                            cnt_ram_addr_uncompressed_0_port, 
                            cnt_ram_addr_substr_6_port, 
                            cnt_ram_addr_substr_5_port, 
                            cnt_ram_addr_substr_4_port, 
                            cnt_ram_addr_substr_3_port, 
                            cnt_ram_addr_substr_2_port, 
                            cnt_ram_addr_substr_1_port, 
                            cnt_ram_addr_substr_0_port, vss, vdd);
   {tristate_8_bit_substr} cs_tri8 (X_Logic0_port, cnt_ram_addr_substr_6_port, 
                                    cnt_ram_addr_substr_5_port, 
                                    cnt_ram_addr_substr_4_port, 
                                    cnt_ram_addr_substr_3_port, 
                                    cnt_ram_addr_substr_2_port, 
                                    cnt_ram_addr_substr_1_port, 
                                    cnt_ram_addr_substr_0_port, 
                                    ram_addr_out_7_0_7, ram_addr_out_7_0_6, 
                                    ram_addr_out_7_0_5, ram_addr_out_7_0_4, 
                                    ram_addr_out_7_0_3, ram_addr_out_7_0_2, 
                                    ram_addr_out_7_0_1, ram_addr_out_7_0_0, n2, 
                                    vss, vdd);
   {comb} cs_shift_comb (state_2_port, state_1_port, state_0_port, 
                         state_next_2_port, state_next_1_port, 
                         state_next_0_port, start_in, ram_data_in, 
                         cnt_ram_addr_uncompressed_6_port, 
                         cnt_ram_addr_uncompressed_5_port, 
                         cnt_ram_addr_uncompressed_4_port, 
                         cnt_ram_addr_uncompressed_3_port, 
                         cnt_ram_addr_uncompressed_2_port, 
                         cnt_ram_addr_uncompressed_1_port, 
                         cnt_ram_addr_uncompressed_0_port, cnt_set, cnt_en, 
                         tri_en, tri_en_substr, ram_we, ready_out, 
                         ram_data_out, vss, vdd);
   net {X_Logic0_port, vss};
   {state_reg_2_inst} dfr11 (state_next_2_port, rst, clk, state_2_port, vss, 
                             vdd);
   {state_reg_1_inst} dfr11 (state_next_1_port, rst, clk, state_1_port, vss, 
                             vdd);
   {state_reg_0_inst} dfr11 (state_next_0_port, rst, clk, state_0_port, vss, 
                             vdd);
   {U3} iv110 (tri_en_substr, n1, vss, vdd);
   {U4} iv110 (n1, n2, vss, vdd);
}



