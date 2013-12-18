extern network osc10 (terminal E, XI, XO, F, vss, vdd)
extern network top_level2 (terminal rst, clk, inputs_5_0_5, inputs_5_0_4, 
                                    inputs_5_0_3, inputs_5_0_2, inputs_5_0_1, 
                                    inputs_5_0_0, vga_h_sync, vga_v_sync, 
                                    vga_red, vga_green, vga_blue, 
                                    dbg_check_start, dbg_check_ready, 
                                    dbg_draw_erase_start, dbg_draw_erase_ready, 
                                    dbg_clear_shift_start, 
                                    dbg_clear_shift_ready, 
                                    dbg_draw_score_start, dbg_draw_score_ready, 
                                    dbg_lut_start, dbg_lut_ready, 
                                    dbg_timer_start, dbg_timer_ready, 
                                    dbg_ram_we, dbg_ram_data_in, 
                                    dbg_ram_data_out, dbg_ram_data_vga, 
                                    dbg_ram_addr_part_1_0_1, 
                                    dbg_ram_addr_part_1_0_0, vss, vdd)
extern network buf40 (terminal A, Y, vss, vdd)
network top_top_level (terminal rst, inputs_5_0_5, inputs_5_0_4, inputs_5_0_3, 
                                inputs_5_0_2, inputs_5_0_1, inputs_5_0_0, 
                                vga_h_sync, vga_v_sync, vga_red, vga_green, 
                                vga_blue, dbg_check_start, dbg_check_ready, 
                                dbg_draw_erase_start, dbg_draw_erase_ready, 
                                dbg_clear_shift_start, dbg_clear_shift_ready, 
                                dbg_draw_score_start, dbg_draw_score_ready, 
                                dbg_lut_start, dbg_lut_ready, dbg_timer_start, 
                                dbg_timer_ready, dbg_ram_we, dbg_ram_data_in, 
                                dbg_ram_data_out, dbg_ram_data_vga, 
                                dbg_ram_addr_part_1_0_1, 
                                dbg_ram_addr_part_1_0_0, xi, xo, vss, vdd)
{
   {clock} osc10 (X_Logic1_port, xi, xo, clk, vss, vdd);
   {chip} top_level2 (rst, n1, inputs_5_0_5, inputs_5_0_4, inputs_5_0_3, 
                      inputs_5_0_2, inputs_5_0_1, inputs_5_0_0, vga_h_sync, 
                      vga_v_sync, vga_red, vga_green, vga_blue, 
                      dbg_check_start, dbg_check_ready, dbg_draw_erase_start, 
                      dbg_draw_erase_ready, dbg_clear_shift_start, 
                      dbg_clear_shift_ready, dbg_draw_score_start, 
                      dbg_draw_score_ready, dbg_lut_start, dbg_lut_ready, 
                      dbg_timer_start, dbg_timer_ready, dbg_ram_we, 
                      dbg_ram_data_in, dbg_ram_data_out, dbg_ram_data_vga, 
                      dbg_ram_addr_part_1_0_1, dbg_ram_addr_part_1_0_0, vss, 
                      vdd);
   net {X_Logic1_port, vdd};
   {U2} buf40 (clk, n1, vss, vdd);
}



