extern network top_top_level (terminal rst, inputs_5_0_5, inputs_5_0_4, inputs_5_0_3, inputs_5_0_2, inputs_5_0_1, inputs_5_0_0, vga_h_sync, vga_v_sync, vga_red, vga_green, vga_blue, dbg_check_start, dbg_check_ready, dbg_draw_erase_start, dbg_draw_erase_ready, dbg_clear_shift_start, dbg_clear_shift_ready, dbg_draw_score_start, dbg_draw_score_ready, dbg_lut_start, dbg_lut_ready, dbg_timer_start, dbg_timer_ready, dbg_ram_we, dbg_ram_data_in, dbg_ram_data_out, dbg_ram_data_vga, dbg_ram_addr_part_1_0_1, dbg_ram_addr_part_1_0_0, XI, XO, vss, vdd)
extern network bond_bar (terminal t1, t2, t3, t4, t5, t6, t7, t8, t9, t10, t11, t12, t13, t14, t15, t16, t17, t18, t19, t20, t21, t22, t23, t24, t25, t26, t27, t28, t29, t30, t31, t32)

network top_top_level_bb (terminal t1, t2, t3, t4, t5, t6, t7, t8, t9, t10, t11, t12, t13, t14, t15, t16, t17, t18, t19, t20, t21, t22, t23, t24, t25, t26, t27, t28, t29, t30, t31, t32)
{
   top_top_level (t1, t2, t3, t4, t5, t6, t7, t8, t9, t10, t11, t12, t13, t14, t15, t16, t17, t18, t19, t20, t21, t22, t23, t24, t25, t26, t27, t28, t29, t30, t31, t32, vss, vdd);
   bond_bar (t1, t2, t3, t4, t5, t6, t7, t8, t9, t10, t11, t12, t13, t14, t15, t16, t17, t18, t19, t20, t21, t22, t23, t24, t25, t26, t27, t28, t29, t30, t31, t32);
}
