extern network debounce (terminal clk, rst, inv_inputs_5_0_5, inv_inputs_5_0_4, 
                                  inv_inputs_5_0_3, inv_inputs_5_0_2, 
                                  inv_inputs_5_0_1, inv_inputs_5_0_0, 
                                  output_5_0_5, output_5_0_4, output_5_0_3, 
                                  output_5_0_2, output_5_0_1, output_5_0_0, 
                                  random_seed, vss, vdd)
extern network npg (terminal clk, rst, button_seed, new_number, output_2_0_2, 
                             output_2_0_1, output_2_0_0, vss, vdd)
extern network timer (terminal clk, vga_clk, rst, cnt_rst, time, start, ready, 
                               vss, vdd)
extern network controller (terminal clk, rst, lut_piece_type_2_0_2, 
                                    lut_piece_type_2_0_1, lut_piece_type_2_0_0, 
                                    lut_next_piece, lut_x_2_0_2, lut_x_2_0_1, 
                                    lut_x_2_0_0, lut_y_3_0_3, lut_y_3_0_2, 
                                    lut_y_3_0_1, lut_y_3_0_0, lut_rot_1_0_1, 
                                    lut_rot_1_0_0, new_piece, next_piece_2_0_2, 
                                    next_piece_2_0_1, next_piece_2_0_0, 
                                    check_empty, check_start, check_ready, 
                                    draw_erase_draw, draw_erase_start, 
                                    draw_erase_ready, clear_shift_start, 
                                    clear_shift_ready, draw_score_draw, 
                                    draw_score_ready, timer_1_time, 
                                    timer_1_start, timer_1_done, timer_1_reset, 
                                    inputs_5_0_5, inputs_5_0_4, inputs_5_0_3, 
                                    inputs_5_0_2, inputs_5_0_1, inputs_5_0_0, 
                                    vss, vdd)
extern network sr_if (terminal clk, rst, di, do1, do2, we, addr1_7_0_7, 
                               addr1_7_0_6, addr1_7_0_5, addr1_7_0_4, 
                               addr1_7_0_3, addr1_7_0_2, addr1_7_0_1, 
                               addr1_7_0_0, addr2_7_0_7, addr2_7_0_6, 
                               addr2_7_0_5, addr2_7_0_4, addr2_7_0_3, 
                               addr2_7_0_2, addr2_7_0_1, addr2_7_0_0, vss, vdd)
extern network ram_fix (terminal draw_erase_start, draw_score_draw, 
                                 clear_shift_start, check_start, we, vss, vdd)
extern network vga (terminal clk, rst, mem_addr_7_0_7, mem_addr_7_0_6, 
                             mem_addr_7_0_5, mem_addr_7_0_4, mem_addr_7_0_3, 
                             mem_addr_7_0_2, mem_addr_7_0_1, mem_addr_7_0_0, 
                             data, h_sync, v_sync, red, green, blue, vss, vdd)
extern network check_mask (terminal clk, rst, mask_7_0_7, mask_7_0_6, 
                                    mask_7_0_5, mask_7_0_4, mask_7_0_3, 
                                    mask_7_0_2, mask_7_0_1, mask_7_0_0, 
                                    mask_select_1_0_1, mask_select_1_0_0, 
                                    ready, empty, start, lut_start, lut_ready, 
                                    lut_error, write, addr_7_0_7, addr_7_0_6, 
                                    addr_7_0_5, addr_7_0_4, addr_7_0_3, 
                                    addr_7_0_2, addr_7_0_1, addr_7_0_0, 
                                    data_in, vss, vdd)
extern network de_piece (terminal clk, rst, mask_7_0_7, mask_7_0_6, mask_7_0_5, 
                                  mask_7_0_4, mask_7_0_3, mask_7_0_2, 
                                  mask_7_0_1, mask_7_0_0, draw_erase, ready, 
                                  start, mask_select_1_0_1, mask_select_1_0_0, 
                                  lut_start, lut_ready, write, addr_7_0_7, 
                                  addr_7_0_6, addr_7_0_5, addr_7_0_4, 
                                  addr_7_0_3, addr_7_0_2, addr_7_0_1, 
                                  addr_7_0_0, data, vss, vdd)
extern network piece_lut (terminal clk, rst, mask_7_0_7, mask_7_0_6, 
                                   mask_7_0_5, mask_7_0_4, mask_7_0_3, 
                                   mask_7_0_2, mask_7_0_1, mask_7_0_0, 
                                   mask_select_1_0_1, mask_select_1_0_0, 
                                   x_2_0_2, x_2_0_1, x_2_0_0, y_3_0_3, y_3_0_2, 
                                   y_3_0_1, y_3_0_0, rot_1_0_1, rot_1_0_0, 
                                   piece_type_2_0_2, piece_type_2_0_1, 
                                   piece_type_2_0_0, next_piece, ready, 
                                   overflow, check_start, draw_start, 
                                   rom_addr_6_0_6, rom_addr_6_0_5, 
                                   rom_addr_6_0_4, rom_addr_6_0_3, 
                                   rom_addr_6_0_2, rom_addr_6_0_1, 
                                   rom_addr_6_0_0, rom_data_3_0_3, 
                                   rom_data_3_0_2, rom_data_3_0_1, 
                                   rom_data_3_0_0, vss, vdd)
extern network rom (terminal addr_6_0_6, addr_6_0_5, addr_6_0_4, addr_6_0_3, 
                             addr_6_0_2, addr_6_0_1, addr_6_0_0, data_3_0_3, 
                             data_3_0_2, data_3_0_1, data_3_0_0, vss, vdd)
extern network cs_compare (terminal clk, rst, start_in, ready_out, score_out, 
                                    ram_addr_out_7_0_7, ram_addr_out_7_0_6, 
                                    ram_addr_out_7_0_5, ram_addr_out_7_0_4, 
                                    ram_addr_out_7_0_3, ram_addr_out_7_0_2, 
                                    ram_addr_out_7_0_1, ram_addr_out_7_0_0, 
                                    ram_we, ram_data_in, ram_data_out, vss, vdd)
extern network log_score (terminal clk, rst, increase, output_7_0_7, 
                                   output_7_0_6, output_7_0_5, output_7_0_4, 
                                   output_7_0_3, output_7_0_2, output_7_0_1, 
                                   output_7_0_0, vss, vdd)
extern network draw_score (terminal ds_clk, ds_rst, ds_draw, ds_ready, 
                                    ds_input_7_0_7, ds_input_7_0_6, 
                                    ds_input_7_0_5, ds_input_7_0_4, 
                                    ds_input_7_0_3, ds_input_7_0_2, 
                                    ds_input_7_0_1, ds_input_7_0_0, ds_write, 
                                    ds_addr_7_0_7, ds_addr_7_0_6, 
                                    ds_addr_7_0_5, ds_addr_7_0_4, 
                                    ds_addr_7_0_3, ds_addr_7_0_2, 
                                    ds_addr_7_0_1, ds_addr_7_0_0, ds_data_out, 
                                    vss, vdd)
extern network buf40 (terminal A, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
network top_level2 (terminal rst, clk, inputs_5_0_5, inputs_5_0_4, 
                             inputs_5_0_3, inputs_5_0_2, inputs_5_0_1, 
                             inputs_5_0_0, vga_h_sync, vga_v_sync, vga_red, 
                             vga_green, vga_blue, dbg_check_start, 
                             dbg_check_ready, dbg_draw_erase_start, 
                             dbg_draw_erase_ready, dbg_clear_shift_start, 
                             dbg_clear_shift_ready, dbg_draw_score_start, 
                             dbg_draw_score_ready, dbg_lut_start, 
                             dbg_lut_ready, dbg_timer_start, dbg_timer_ready, 
                             dbg_ram_we, dbg_ram_data_in, dbg_ram_data_out, 
                             dbg_ram_data_vga, dbg_ram_addr_part_1_0_1, 
                             dbg_ram_addr_part_1_0_0, vss, vdd)
{
   net {vga_v_sync, vga_v_sync_port};
   net {dbg_check_start, dbg_check_start_port};
   net {dbg_check_ready, dbg_check_ready_port};
   net {dbg_draw_erase_start, dbg_draw_erase_start_port};
   net {dbg_draw_erase_ready, dbg_draw_erase_ready_port};
   net {dbg_clear_shift_start, dbg_clear_shift_start_port};
   net {dbg_clear_shift_ready, dbg_clear_shift_ready_port};
   net {dbg_draw_score_start, dbg_draw_score_start_port};
   net {dbg_draw_score_ready, dbg_draw_score_ready_port};
   net {dbg_lut_ready, dbg_lut_ready_port};
   net {dbg_timer_start, dbg_timer_start_port};
   net {dbg_timer_ready, dbg_timer_ready_port};
   net {dbg_ram_we, dbg_ram_we_port};
   net {dbg_ram_data_in, dbg_ram_data_in_port};
   net {dbg_ram_data_out, dbg_ram_data_out_port};
   net {dbg_ram_data_vga, dbg_ram_data_vga_port};
   net {dbg_ram_addr_part_1_0_1, dbg_ram_addr_part_1_port};
   net {dbg_ram_addr_part_1_0_0, dbg_ram_addr_part_0_port};
   {switch_debounce} debounce (clk, rst, inputs_5_0_5, inputs_5_0_4, 
                               inputs_5_0_3, inputs_5_0_2, inputs_5_0_1, 
                               inputs_5_0_0, inputs_debounced_5_port, 
                               inputs_debounced_4_port, 
                               inputs_debounced_3_port, 
                               inputs_debounced_2_port, 
                               inputs_debounced_1_port, 
                               inputs_debounced_0_port, button_seed, vss, vdd);
   {next_piece_generator} npg (clk, rst, button_seed, new_piece, 
                               next_piece_2_port, next_piece_1_port, 
                               next_piece_0_port, vss, vdd);
   {fall_timer} timer (clk, vga_v_sync_port, rst, timer_1_reset, timer_1_time, 
                       dbg_timer_start_port, dbg_timer_ready_port, vss, vdd);
   {game_controller} controller (clk, rst, lut_piece_type_2_port, 
                                 lut_piece_type_1_port, lut_piece_type_0_port, 
                                 lut_next_piece, lut_x_2_port, lut_x_1_port, 
                                 lut_x_0_port, lut_y_3_port, lut_y_2_port, 
                                 lut_y_1_port, lut_y_0_port, lut_rot_1_port, 
                                 lut_rot_0_port, new_piece, next_piece_2_port, 
                                 next_piece_1_port, next_piece_0_port, 
                                 check_empty, dbg_check_start_port, 
                                 dbg_check_ready_port, draw_erase_draw, 
                                 dbg_draw_erase_start_port, 
                                 dbg_draw_erase_ready_port, 
                                 dbg_clear_shift_start_port, 
                                 dbg_clear_shift_ready_port, 
                                 dbg_draw_score_start_port, 
                                 dbg_draw_score_ready_port, timer_1_time, 
                                 dbg_timer_start_port, dbg_timer_ready_port, 
                                 timer_1_reset, inputs_debounced_5_port, 
                                 inputs_debounced_4_port, 
                                 inputs_debounced_3_port, 
                                 inputs_debounced_2_port, 
                                 inputs_debounced_1_port, 
                                 inputs_debounced_0_port, vss, vdd);
   {video_ram} sr_if (clk, rst, n15, dbg_ram_data_out_port, 
                      dbg_ram_data_vga_port, dbg_ram_we_port, ram_addr_7_port, 
                      ram_addr_6_port, ram_addr_5_port, n18, n19, n20, n16, 
                      n17, vga_addr_7_port, vga_addr_6_port, vga_addr_5_port, 
                      n10, n9, n12, n8, n11, vss, vdd);
   {video_ram_fix} ram_fix (dbg_draw_erase_start_port, 
                            dbg_draw_score_start_port, 
                            dbg_clear_shift_start_port, dbg_check_start_port, 
                            dbg_ram_we_port, vss, vdd);
   {vga_controller} vga (clk, rst, vga_addr_7_port, vga_addr_6_port, 
                         vga_addr_5_port, vga_addr_4_port, vga_addr_3_port, 
                         vga_addr_2_port, vga_addr_1_port, vga_addr_0_port, 
                         dbg_ram_data_vga_port, vga_h_sync, vga_v_sync_port, 
                         vga_red, vga_green, vga_blue, vss, vdd);
   {check_piece_mask} check_mask (clk, rst, mask_7_port, mask_6_port, 
                                  mask_5_port, mask_4_port, mask_3_port, 
                                  mask_2_port, mask_1_port, mask_0_port, 
                                  mask_select_1_port, mask_select_0_port, 
                                  dbg_check_ready_port, check_empty, 
                                  dbg_check_start_port, lut_start_check, 
                                  dbg_lut_ready_port, lut_error, 
                                  dbg_ram_we_port, ram_addr_7_port, 
                                  ram_addr_6_port, ram_addr_5_port, 
                                  ram_addr_4_port, ram_addr_3_port, 
                                  ram_addr_2_port, dbg_ram_addr_part_1_port, 
                                  dbg_ram_addr_part_0_port, 
                                  dbg_ram_data_out_port, vss, vdd);
   {draw_erase_piece} de_piece (clk, rst, mask_7_port, mask_6_port, 
                                mask_5_port, mask_4_port, mask_3_port, 
                                mask_2_port, mask_1_port, mask_0_port, 
                                draw_erase_draw, dbg_draw_erase_ready_port, 
                                dbg_draw_erase_start_port, mask_select_1_port, 
                                mask_select_0_port, lut_start_de, 
                                dbg_lut_ready_port, dbg_ram_we_port, 
                                ram_addr_7_port, ram_addr_6_port, 
                                ram_addr_5_port, ram_addr_4_port, 
                                ram_addr_3_port, ram_addr_2_port, 
                                dbg_ram_addr_part_1_port, 
                                dbg_ram_addr_part_0_port, dbg_ram_data_in_port, 
                                vss, vdd);
   {lookup_table} piece_lut (clk, rst, mask_7_port, mask_6_port, mask_5_port, 
                             mask_4_port, mask_3_port, mask_2_port, 
                             mask_1_port, mask_0_port, mask_select_1_port, 
                             mask_select_0_port, lut_x_2_port, lut_x_1_port, 
                             lut_x_0_port, lut_y_3_port, lut_y_2_port, 
                             lut_y_1_port, lut_y_0_port, lut_rot_1_port, 
                             lut_rot_0_port, lut_piece_type_2_port, 
                             lut_piece_type_1_port, lut_piece_type_0_port, 
                             lut_next_piece, dbg_lut_ready_port, lut_error, 
                             lut_start_check, lut_start_de, rom_addr_6_port, 
                             rom_addr_5_port, rom_addr_4_port, rom_addr_3_port, 
                             rom_addr_2_port, rom_addr_1_port, rom_addr_0_port, 
                             rom_data_3_port, rom_data_2_port, rom_data_1_port, 
                             rom_data_0_port, vss, vdd);
   {read_only_memory} rom (rom_addr_6_port, n5, n4, n7, n6, n14, n13, 
                           rom_data_3_port, rom_data_2_port, rom_data_1_port, 
                           rom_data_0_port, vss, vdd);
   {clear_shift} cs_compare (clk, rst, dbg_clear_shift_start_port, 
                             dbg_clear_shift_ready_port, score, 
                             ram_addr_7_port, ram_addr_6_port, ram_addr_5_port, 
                             ram_addr_4_port, ram_addr_3_port, ram_addr_2_port, 
                             dbg_ram_addr_part_1_port, 
                             dbg_ram_addr_part_0_port, dbg_ram_we_port, 
                             dbg_ram_data_out_port, dbg_ram_data_in_port, vss, 
                             vdd);
   {keep_score} log_score (clk, rst, score, score_data_7_port, 
                           score_data_6_port, score_data_5_port, 
                           score_data_4_port, score_data_3_port, 
                           score_data_2_port, score_data_1_port, 
                           score_data_0_port, vss, vdd);
   {output_score} draw_score (clk, rst, dbg_draw_score_start_port, 
                              dbg_draw_score_ready_port, score_data_7_port, 
                              score_data_6_port, score_data_5_port, 
                              score_data_4_port, score_data_3_port, 
                              score_data_2_port, score_data_1_port, 
                              score_data_0_port, dbg_ram_we_port, 
                              ram_addr_7_port, ram_addr_6_port, 
                              ram_addr_5_port, ram_addr_4_port, 
                              ram_addr_3_port, ram_addr_2_port, 
                              dbg_ram_addr_part_1_port, 
                              dbg_ram_addr_part_0_port, dbg_ram_data_in_port, 
                              vss, vdd);
   {U3} iv110 (rom_addr_4_port, n3, vss, vdd);
   {U4} iv110 (n3, n4, vss, vdd);
   {U5} buf40 (rom_addr_5_port, n5, vss, vdd);
   {U6} buf40 (rom_addr_2_port, n6, vss, vdd);
   {U7} buf40 (rom_addr_3_port, n7, vss, vdd);
   {U8} buf40 (vga_addr_1_port, n8, vss, vdd);
   {U9} buf40 (vga_addr_3_port, n9, vss, vdd);
   {U10} buf40 (vga_addr_4_port, n10, vss, vdd);
   {U11} buf40 (vga_addr_0_port, n11, vss, vdd);
   {U12} buf40 (vga_addr_2_port, n12, vss, vdd);
   {U13} buf40 (rom_addr_0_port, n13, vss, vdd);
   {U14} buf40 (rom_addr_1_port, n14, vss, vdd);
   {U15} buf40 (dbg_ram_data_in_port, n15, vss, vdd);
   {U16} buf40 (dbg_ram_addr_part_1_port, n16, vss, vdd);
   {U17} buf40 (dbg_ram_addr_part_0_port, n17, vss, vdd);
   {U18} buf40 (ram_addr_4_port, n18, vss, vdd);
   {U19} buf40 (ram_addr_3_port, n19, vss, vdd);
   {U20} buf40 (ram_addr_2_port, n20, vss, vdd);
   {U21} iv110 (n21, dbg_lut_start, vss, vdd);
   {U22} no210 (lut_start_check, lut_start_de, n21, vss, vdd);
}



