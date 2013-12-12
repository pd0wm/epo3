extern network cs_7bc (terminal clk, rst, en, value_6_0_6, value_6_0_5, 
                                value_6_0_4, value_6_0_3, value_6_0_2, 
                                value_6_0_1, value_6_0_0, vss, vdd)
extern network cs_tri8 (terminal i_7_0_7, i_7_0_6, i_7_0_5, i_7_0_4, i_7_0_3, 
                                 i_7_0_2, i_7_0_1, i_7_0_0, o_7_0_7, o_7_0_6, 
                                 o_7_0_5, o_7_0_4, o_7_0_3, o_7_0_2, o_7_0_1, 
                                 o_7_0_0, e, vss, vdd)
extern network cs_shift (terminal clk, rst, start_in, ready_out, 
                                  ram_addr_in_6_0_6, ram_addr_in_6_0_5, 
                                  ram_addr_in_6_0_4, ram_addr_in_6_0_3, 
                                  ram_addr_in_6_0_2, ram_addr_in_6_0_1, 
                                  ram_addr_in_6_0_0, ram_addr_out_7_0_7, 
                                  ram_addr_out_7_0_6, ram_addr_out_7_0_5, 
                                  ram_addr_out_7_0_4, ram_addr_out_7_0_3, 
                                  ram_addr_out_7_0_2, ram_addr_out_7_0_1, 
                                  ram_addr_out_7_0_0, ram_we, ram_data_in, 
                                  ram_data_out, vss, vdd)
extern network cs_defset2 (terminal en, out1, out2, vss, vdd)
extern network cs_compare_comb (terminal state_3_0_3, state_3_0_2, state_3_0_1, 
                                         state_3_0_0, state_next_3_0_3, 
                                         state_next_3_0_2, state_next_3_0_1, 
                                         state_next_3_0_0, row_full, start_in, 
                                         ram_data_in, shift_ready, 
                                         cnt_ram_addr_6_0_6, 
                                         cnt_ram_addr_6_0_5, 
                                         cnt_ram_addr_6_0_4, 
                                         cnt_ram_addr_6_0_3, 
                                         cnt_ram_addr_6_0_2, 
                                         cnt_ram_addr_6_0_1, 
                                         cnt_ram_addr_6_0_0, tri_en, cnt_en, 
                                         ready_out, shift_start, score_out, 
                                         defset_en, row_full_next, vss, vdd)
extern network dfr11 (terminal D, R, CK, Q, vss, vdd)
network cs_compare (terminal clk, rst, start_in, ready_out, score_out, 
                             ram_addr_out_7_0_7, ram_addr_out_7_0_6, 
                             ram_addr_out_7_0_5, ram_addr_out_7_0_4, 
                             ram_addr_out_7_0_3, ram_addr_out_7_0_2, 
                             ram_addr_out_7_0_1, ram_addr_out_7_0_0, ram_we, 
                             ram_data_in, ram_data_out, vss, vdd)
{
   {counter_7_bit} cs_7bc (clk, rst, cnt_en, cnt_ram_addr_6_port, 
                           cnt_ram_addr_5_port, cnt_ram_addr_4_port, 
                           cnt_ram_addr_3_port, cnt_ram_addr_2_port, 
                           cnt_ram_addr_1_port, cnt_ram_addr_0_port, vss, vdd);
   {tristate_8_bit} cs_tri8 (X_Logic0_port, cnt_ram_addr_6_port, 
                             cnt_ram_addr_5_port, cnt_ram_addr_4_port, 
                             cnt_ram_addr_3_port, cnt_ram_addr_2_port, 
                             cnt_ram_addr_1_port, cnt_ram_addr_0_port, 
                             ram_addr_out_7_0_7, ram_addr_out_7_0_6, 
                             ram_addr_out_7_0_5, ram_addr_out_7_0_4, 
                             ram_addr_out_7_0_3, ram_addr_out_7_0_2, 
                             ram_addr_out_7_0_1, ram_addr_out_7_0_0, tri_en, 
                             vss, vdd);
   {shift} cs_shift (clk, rst, shift_start, shift_ready, cnt_ram_addr_6_port, 
                     cnt_ram_addr_5_port, cnt_ram_addr_4_port, 
                     cnt_ram_addr_3_port, cnt_ram_addr_2_port, 
                     cnt_ram_addr_1_port, cnt_ram_addr_0_port, 
                     ram_addr_out_7_0_7, ram_addr_out_7_0_6, 
                     ram_addr_out_7_0_5, ram_addr_out_7_0_4, 
                     ram_addr_out_7_0_3, ram_addr_out_7_0_2, 
                     ram_addr_out_7_0_1, ram_addr_out_7_0_0, ram_we, 
                     ram_data_in, ram_data_out, vss, vdd);
   {defset} cs_defset2 (defset_en, ram_we, ram_data_out, vss, vdd);
   {comb} cs_compare_comb (state_3_port, state_2_port, state_1_port, 
                           state_0_port, state_next_3_port, state_next_2_port, 
                           state_next_1_port, state_next_0_port, row_full, 
                           start_in, ram_data_in, shift_ready, 
                           cnt_ram_addr_6_port, cnt_ram_addr_5_port, 
                           cnt_ram_addr_4_port, cnt_ram_addr_3_port, 
                           cnt_ram_addr_2_port, cnt_ram_addr_1_port, 
                           cnt_ram_addr_0_port, tri_en, cnt_en, ready_out, 
                           shift_start, score_out, defset_en, row_full_next, 
                           vss, vdd);
   net {X_Logic0_port, vss};
   {row_full_reg} dfr11 (row_full_next, rst, clk, row_full, vss, vdd);
   {state_reg_3_inst} dfr11 (state_next_3_port, rst, clk, state_3_port, vss, 
                             vdd);
   {state_reg_2_inst} dfr11 (state_next_2_port, rst, clk, state_2_port, vss, 
                             vdd);
   {state_reg_1_inst} dfr11 (state_next_1_port, rst, clk, state_1_port, vss, 
                             vdd);
   {state_reg_0_inst} dfr11 (state_next_0_port, rst, clk, state_0_port, vss, 
                             vdd);
}



