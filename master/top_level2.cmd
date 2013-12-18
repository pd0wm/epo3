set vdd = h*~
set vss = l*~
set rst = h*1740 l*~
set clk = (h*80 l*80)*62500\
          h*~
set inputs_5_0_5 = h*~
set inputs_5_0_4 = h*501740\
                   (l*500000 h*500000)*2\
                   l*~
set inputs_5_0_3 = h*~
set inputs_5_0_2 = h*~
set inputs_5_0_1 = h*~
set inputs_5_0_0 = l*501740 h*~

option sigunit   = 1n
option outacc    = 100p
option level     = 2
option initialize random = on
option simperiod = 10000000

print \
      rst,\
      clk,\
      inputs_5_0_5,\
      inputs_5_0_4,\
      inputs_5_0_3,\
      inputs_5_0_2,\
      inputs_5_0_1,\
      inputs_5_0_0,\
      vga_h_sync,\
      vga_v_sync,\
      vga_red,\
      vga_green,\
      vga_blue,\
      dbg_check_start,\
      dbg_check_ready,\
      dbg_draw_erase_start,\
      dbg_draw_erase_ready,\
      dbg_clear_shift_start,\
      dbg_clear_shift_ready,\
      dbg_draw_score_start,\
      dbg_draw_score_ready,\
      dbg_lut_start,\
      dbg_lut_ready,\
      dbg_timer_start,\
      dbg_timer_ready,\
      dbg_ram_we,\
      dbg_ram_data_in,\
      dbg_ram_data_out,\
      dbg_ram_data_vga,\
      dbg_ram_addr_part_1_0_1,\
      dbg_ram_addr_part_1_0_0

plot \
      rst,\
      clk,\
      inputs_5_0_5,\
      inputs_5_0_4,\
      inputs_5_0_3,\
      inputs_5_0_2,\
      inputs_5_0_1,\
      inputs_5_0_0,\
      vga_h_sync,\
      vga_v_sync,\
      vga_red,\
      vga_green,\
      vga_blue,\
      dbg_check_start,\
      dbg_check_ready,\
      dbg_draw_erase_start,\
      dbg_draw_erase_ready,\
      dbg_clear_shift_start,\
      dbg_clear_shift_ready,\
      dbg_draw_score_start,\
      dbg_draw_score_ready,\
      dbg_lut_start,\
      dbg_lut_ready,\
      dbg_timer_start,\
      dbg_timer_ready,\
      dbg_ram_we,\
      dbg_ram_data_in,\
      dbg_ram_data_out,\
      dbg_ram_data_vga,\
      dbg_ram_addr_part_1_0_1,\
      dbg_ram_addr_part_1_0_0
/*
*%
tstep 0.1n
trise 0.5n
tfall 0.5n
*%
.options cptime = 1000
*%
*/


