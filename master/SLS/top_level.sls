extern network npg (terminal clk, rst, button_seed, new_number, output_2_0_2, 
                             output_2_0_1, output_2_0_0, vss, vdd)
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
extern network debounce (terminal clk, rst, inv_inputs_5_0_5, inv_inputs_5_0_4, 
                                  inv_inputs_5_0_3, inv_inputs_5_0_2, 
                                  inv_inputs_5_0_1, inv_inputs_5_0_0, 
                                  output_5_0_5, output_5_0_4, output_5_0_3, 
                                  output_5_0_2, output_5_0_1, output_5_0_0, 
                                  random_seed, vss, vdd)
extern network sr_if (terminal clk, rst, di, do1, do2, we, addr1_7_0_7, 
                               addr1_7_0_6, addr1_7_0_5, addr1_7_0_4, 
                               addr1_7_0_3, addr1_7_0_2, addr1_7_0_1, 
                               addr1_7_0_0, addr2_7_0_7, addr2_7_0_6, 
                               addr2_7_0_5, addr2_7_0_4, addr2_7_0_3, 
                               addr2_7_0_2, addr2_7_0_1, addr2_7_0_0, vss, vdd)
extern network vga (terminal clk, rst, mem_addr_7_0_7, mem_addr_7_0_6, 
                             mem_addr_7_0_5, mem_addr_7_0_4, mem_addr_7_0_3, 
                             mem_addr_7_0_2, mem_addr_7_0_1, mem_addr_7_0_0, 
                             data, h_sync, v_sync, red, green, blue, vss, vdd)
extern network timer (terminal clk, vga_clk, rst, cnt_rst, time, start, ready, 
                               vss, vdd)
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
extern network iv110 (terminal A, Y, vss, vdd)
extern network buf40 (terminal A, Y, vss, vdd)
network top_level (terminal rst, clk, dbg_inputs_5_0_5, dbg_inputs_5_0_4, 
                            dbg_inputs_5_0_3, dbg_inputs_5_0_2, 
                            dbg_inputs_5_0_1, dbg_inputs_5_0_0, vga_hsync, 
                            vga_vsync, vga_clk, vga_r, vga_g, vga_b, vss, vdd)
{
   net {vga_hsync, vga_hsync_port};
   net {vga_vsync, vga_vsync_port};
   net {vga_clk, clk};
   {b2v_inst10} npg (clk, rst, SYNTHESIZED_WIRE_0, SYNTHESIZED_WIRE_1, 
                     SYNTHESIZED_WIRE_49_2_port, SYNTHESIZED_WIRE_49_1_port, 
                     SYNTHESIZED_WIRE_49_0_port, vss, vdd);
   {b2v_inst11} cs_compare (clk, rst, SYNTHESIZED_WIRE_2, SYNTHESIZED_WIRE_45, 
                            SYNTHESIZED_WIRE_4, SYNTHESIZED_WIRE_52_7_port, 
                            SYNTHESIZED_WIRE_52_6_port, 
                            SYNTHESIZED_WIRE_52_5_port, 
                            SYNTHESIZED_WIRE_52_4_port, 
                            SYNTHESIZED_WIRE_52_3_port, 
                            SYNTHESIZED_WIRE_52_2_port, 
                            SYNTHESIZED_WIRE_52_1_port, 
                            SYNTHESIZED_WIRE_52_0_port, SYNTHESIZED_WIRE_51, 
                            SYNTHESIZED_WIRE_50, gdfx_temp0, vss, vdd);
   {b2v_inst12} log_score (clk, rst, SYNTHESIZED_WIRE_4, 
                           SYNTHESIZED_WIRE_6_7_port, 
                           SYNTHESIZED_WIRE_6_6_port, 
                           SYNTHESIZED_WIRE_6_5_port, 
                           SYNTHESIZED_WIRE_6_4_port, 
                           SYNTHESIZED_WIRE_6_3_port, 
                           SYNTHESIZED_WIRE_6_2_port, 
                           SYNTHESIZED_WIRE_6_1_port, 
                           SYNTHESIZED_WIRE_6_0_port, vss, vdd);
   {b2v_inst13} draw_score (clk, rst, SYNTHESIZED_WIRE_5, SYNTHESIZED_WIRE_46, 
                            SYNTHESIZED_WIRE_6_7_port, 
                            SYNTHESIZED_WIRE_6_6_port, 
                            SYNTHESIZED_WIRE_6_5_port, 
                            SYNTHESIZED_WIRE_6_4_port, 
                            SYNTHESIZED_WIRE_6_3_port, 
                            SYNTHESIZED_WIRE_6_2_port, 
                            SYNTHESIZED_WIRE_6_1_port, 
                            SYNTHESIZED_WIRE_6_0_port, SYNTHESIZED_WIRE_51, 
                            SYNTHESIZED_WIRE_52_7_port, 
                            SYNTHESIZED_WIRE_52_6_port, 
                            SYNTHESIZED_WIRE_52_5_port, 
                            SYNTHESIZED_WIRE_52_4_port, 
                            SYNTHESIZED_WIRE_52_3_port, 
                            SYNTHESIZED_WIRE_52_2_port, 
                            SYNTHESIZED_WIRE_52_1_port, 
                            SYNTHESIZED_WIRE_52_0_port, gdfx_temp0, vss, vdd);
   {b2v_inst19} debounce (vga_hsync_port, rst, dbg_inputs_5_0_5, 
                          dbg_inputs_5_0_4, dbg_inputs_5_0_3, dbg_inputs_5_0_2, 
                          dbg_inputs_5_0_1, dbg_inputs_5_0_0, 
                          SYNTHESIZED_WIRE_48_5_port, 
                          SYNTHESIZED_WIRE_48_4_port, 
                          SYNTHESIZED_WIRE_48_3_port, 
                          SYNTHESIZED_WIRE_48_2_port, 
                          SYNTHESIZED_WIRE_48_1_port, 
                          SYNTHESIZED_WIRE_48_0_port, SYNTHESIZED_WIRE_0, vss, 
                          vdd);
   {b2v_inst2} sr_if (clk, rst, n14, SYNTHESIZED_WIRE_50, SYNTHESIZED_WIRE_17, 
                      SYNTHESIZED_WIRE_51, SYNTHESIZED_WIRE_52_7_port, 
                      SYNTHESIZED_WIRE_52_6_port, SYNTHESIZED_WIRE_52_5_port, 
                      n17, n18, n19, n15, n16, SYNTHESIZED_WIRE_16_7_port, 
                      SYNTHESIZED_WIRE_16_6_port, SYNTHESIZED_WIRE_16_5_port, 
                      n9, n8, n11, n7, n10, vss, vdd);
   {b2v_inst3} vga (clk, rst, SYNTHESIZED_WIRE_16_7_port, 
                    SYNTHESIZED_WIRE_16_6_port, SYNTHESIZED_WIRE_16_5_port, 
                    SYNTHESIZED_WIRE_16_4_port, SYNTHESIZED_WIRE_16_3_port, 
                    SYNTHESIZED_WIRE_16_2_port, SYNTHESIZED_WIRE_16_1_port, 
                    SYNTHESIZED_WIRE_16_0_port, SYNTHESIZED_WIRE_17, n20, 
                    vga_vsync_port, vga_r, vga_g, vga_b, vss, vdd);
   {b2v_inst4} timer (clk, vga_vsync_port, rst, SYNTHESIZED_WIRE_19, 
                      SYNTHESIZED_WIRE_20, SYNTHESIZED_WIRE_21, 
                      SYNTHESIZED_WIRE_47, vss, vdd);
   {b2v_inst5} check_mask (clk, rst, SYNTHESIZED_WIRE_54_7_port, 
                           SYNTHESIZED_WIRE_54_6_port, 
                           SYNTHESIZED_WIRE_54_5_port, 
                           SYNTHESIZED_WIRE_54_4_port, 
                           SYNTHESIZED_WIRE_54_3_port, 
                           SYNTHESIZED_WIRE_54_2_port, 
                           SYNTHESIZED_WIRE_54_1_port, 
                           SYNTHESIZED_WIRE_54_0_port, 
                           SYNTHESIZED_WIRE_55_1_port, 
                           SYNTHESIZED_WIRE_55_0_port, SYNTHESIZED_WIRE_43, 
                           SYNTHESIZED_WIRE_42, SYNTHESIZED_WIRE_22, 
                           SYNTHESIZED_WIRE_32, SYNTHESIZED_WIRE_53, 
                           SYNTHESIZED_WIRE_24, SYNTHESIZED_WIRE_51, 
                           SYNTHESIZED_WIRE_52_7_port, 
                           SYNTHESIZED_WIRE_52_6_port, 
                           SYNTHESIZED_WIRE_52_5_port, 
                           SYNTHESIZED_WIRE_52_4_port, 
                           SYNTHESIZED_WIRE_52_3_port, 
                           SYNTHESIZED_WIRE_52_2_port, 
                           SYNTHESIZED_WIRE_52_1_port, 
                           SYNTHESIZED_WIRE_52_0_port, SYNTHESIZED_WIRE_50, 
                           vss, vdd);
   {b2v_inst6} de_piece (clk, rst, SYNTHESIZED_WIRE_54_7_port, 
                         SYNTHESIZED_WIRE_54_6_port, 
                         SYNTHESIZED_WIRE_54_5_port, 
                         SYNTHESIZED_WIRE_54_4_port, 
                         SYNTHESIZED_WIRE_54_3_port, 
                         SYNTHESIZED_WIRE_54_2_port, 
                         SYNTHESIZED_WIRE_54_1_port, 
                         SYNTHESIZED_WIRE_54_0_port, SYNTHESIZED_WIRE_27, 
                         SYNTHESIZED_WIRE_44, SYNTHESIZED_WIRE_28, 
                         SYNTHESIZED_WIRE_55_1_port, 
                         SYNTHESIZED_WIRE_55_0_port, SYNTHESIZED_WIRE_33, 
                         SYNTHESIZED_WIRE_53, SYNTHESIZED_WIRE_51, 
                         SYNTHESIZED_WIRE_52_7_port, 
                         SYNTHESIZED_WIRE_52_6_port, 
                         SYNTHESIZED_WIRE_52_5_port, 
                         SYNTHESIZED_WIRE_52_4_port, 
                         SYNTHESIZED_WIRE_52_3_port, 
                         SYNTHESIZED_WIRE_52_2_port, 
                         SYNTHESIZED_WIRE_52_1_port, 
                         SYNTHESIZED_WIRE_52_0_port, gdfx_temp0, vss, vdd);
   {b2v_inst7} piece_lut (clk, rst, SYNTHESIZED_WIRE_54_7_port, 
                          SYNTHESIZED_WIRE_54_6_port, 
                          SYNTHESIZED_WIRE_54_5_port, 
                          SYNTHESIZED_WIRE_54_4_port, 
                          SYNTHESIZED_WIRE_54_3_port, 
                          SYNTHESIZED_WIRE_54_2_port, 
                          SYNTHESIZED_WIRE_54_1_port, 
                          SYNTHESIZED_WIRE_54_0_port, 
                          SYNTHESIZED_WIRE_55_1_port, 
                          SYNTHESIZED_WIRE_55_0_port, 
                          SYNTHESIZED_WIRE_39_2_port, 
                          SYNTHESIZED_WIRE_39_1_port, 
                          SYNTHESIZED_WIRE_39_0_port, 
                          SYNTHESIZED_WIRE_40_3_port, 
                          SYNTHESIZED_WIRE_40_2_port, 
                          SYNTHESIZED_WIRE_40_1_port, 
                          SYNTHESIZED_WIRE_40_0_port, 
                          SYNTHESIZED_WIRE_38_1_port, 
                          SYNTHESIZED_WIRE_38_0_port, 
                          SYNTHESIZED_WIRE_36_2_port, 
                          SYNTHESIZED_WIRE_36_1_port, 
                          SYNTHESIZED_WIRE_36_0_port, SYNTHESIZED_WIRE_31, 
                          SYNTHESIZED_WIRE_53, SYNTHESIZED_WIRE_24, 
                          SYNTHESIZED_WIRE_32, SYNTHESIZED_WIRE_33, 
                          SYNTHESIZED_WIRE_41_6_port, 
                          SYNTHESIZED_WIRE_41_5_port, 
                          SYNTHESIZED_WIRE_41_4_port, 
                          SYNTHESIZED_WIRE_41_3_port, 
                          SYNTHESIZED_WIRE_41_2_port, 
                          SYNTHESIZED_WIRE_41_1_port, 
                          SYNTHESIZED_WIRE_41_0_port, 
                          SYNTHESIZED_WIRE_37_3_port, 
                          SYNTHESIZED_WIRE_37_2_port, 
                          SYNTHESIZED_WIRE_37_1_port, 
                          SYNTHESIZED_WIRE_37_0_port, vss, vdd);
   {b2v_inst8} rom (SYNTHESIZED_WIRE_41_6_port, n4, n2, n6, n5, n13, n12, 
                    SYNTHESIZED_WIRE_37_3_port, SYNTHESIZED_WIRE_37_2_port, 
                    SYNTHESIZED_WIRE_37_1_port, SYNTHESIZED_WIRE_37_0_port, 
                    vss, vdd);
   {b2v_inst9} controller (clk, rst, SYNTHESIZED_WIRE_36_2_port, 
                           SYNTHESIZED_WIRE_36_1_port, 
                           SYNTHESIZED_WIRE_36_0_port, SYNTHESIZED_WIRE_31, 
                           SYNTHESIZED_WIRE_39_2_port, 
                           SYNTHESIZED_WIRE_39_1_port, 
                           SYNTHESIZED_WIRE_39_0_port, 
                           SYNTHESIZED_WIRE_40_3_port, 
                           SYNTHESIZED_WIRE_40_2_port, 
                           SYNTHESIZED_WIRE_40_1_port, 
                           SYNTHESIZED_WIRE_40_0_port, 
                           SYNTHESIZED_WIRE_38_1_port, 
                           SYNTHESIZED_WIRE_38_0_port, SYNTHESIZED_WIRE_1, 
                           SYNTHESIZED_WIRE_49_2_port, 
                           SYNTHESIZED_WIRE_49_1_port, 
                           SYNTHESIZED_WIRE_49_0_port, SYNTHESIZED_WIRE_42, 
                           SYNTHESIZED_WIRE_22, SYNTHESIZED_WIRE_43, 
                           SYNTHESIZED_WIRE_27, SYNTHESIZED_WIRE_28, 
                           SYNTHESIZED_WIRE_44, SYNTHESIZED_WIRE_2, 
                           SYNTHESIZED_WIRE_45, SYNTHESIZED_WIRE_5, 
                           SYNTHESIZED_WIRE_46, SYNTHESIZED_WIRE_20, 
                           SYNTHESIZED_WIRE_21, SYNTHESIZED_WIRE_47, 
                           SYNTHESIZED_WIRE_19, SYNTHESIZED_WIRE_48_5_port, 
                           SYNTHESIZED_WIRE_48_4_port, 
                           SYNTHESIZED_WIRE_48_3_port, 
                           SYNTHESIZED_WIRE_48_2_port, 
                           SYNTHESIZED_WIRE_48_1_port, 
                           SYNTHESIZED_WIRE_48_0_port, vss, vdd);
   {U1} iv110 (SYNTHESIZED_WIRE_41_4_port, n1, vss, vdd);
   {U2} iv110 (n1, n2, vss, vdd);
   {U3} buf40 (n20, vga_hsync_port, vss, vdd);
   {U4} buf40 (SYNTHESIZED_WIRE_41_5_port, n4, vss, vdd);
   {U5} buf40 (SYNTHESIZED_WIRE_41_2_port, n5, vss, vdd);
   {U6} buf40 (SYNTHESIZED_WIRE_41_3_port, n6, vss, vdd);
   {U7} buf40 (SYNTHESIZED_WIRE_16_1_port, n7, vss, vdd);
   {U8} buf40 (SYNTHESIZED_WIRE_16_3_port, n8, vss, vdd);
   {U9} buf40 (SYNTHESIZED_WIRE_16_4_port, n9, vss, vdd);
   {U10} buf40 (SYNTHESIZED_WIRE_16_0_port, n10, vss, vdd);
   {U11} buf40 (SYNTHESIZED_WIRE_16_2_port, n11, vss, vdd);
   {U12} buf40 (SYNTHESIZED_WIRE_41_0_port, n12, vss, vdd);
   {U13} buf40 (SYNTHESIZED_WIRE_41_1_port, n13, vss, vdd);
   {U14} buf40 (gdfx_temp0, n14, vss, vdd);
   {U15} buf40 (SYNTHESIZED_WIRE_52_1_port, n15, vss, vdd);
   {U16} buf40 (SYNTHESIZED_WIRE_52_0_port, n16, vss, vdd);
   {U17} buf40 (SYNTHESIZED_WIRE_52_4_port, n17, vss, vdd);
   {U18} buf40 (SYNTHESIZED_WIRE_52_3_port, n18, vss, vdd);
   {U19} buf40 (SYNTHESIZED_WIRE_52_2_port, n19, vss, vdd);
}



