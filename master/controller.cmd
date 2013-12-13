set vdd = h*~
set vss = l*~
set clk = (h*80 l*80)*375\
          h*~
set rst = h*250 l*~
set next_piece_2_0_2 = x*250 l*~
set next_piece_2_0_1 = x*250 l*~
set next_piece_2_0_0 = x*250 l*~
set check_empty = x*250 h*~
set check_ready = l*3360\
                  h*160\
                  l*2560\
                  (h*160 l*4480)*11\
                  h*160 l*~
set draw_erase_ready = l*1440\
                       h*160\
                       l*800\
                       h*160\
                       l*1600\
                       h*160\
                       l*960\
                       h*160\
                       l*1600\
                       h*160\
                       l*2720\
                       h*160\
                       l*1600\
                       h*160\
                       l*2720\
                       h*160\
                       l*1600\
                       h*160\
                       l*2720\
                       h*160\
                       l*1600\
                       h*160\
                       l*2720\
                       h*160\
                       l*1600\
                       h*160\
                       l*2720\
                       h*160\
                       l*1600\
                       h*160\
                       l*2720\
                       h*160\
                       l*1600\
                       h*160\
                       l*2720\
                       h*160\
                       l*1600\
                       h*160\
                       l*2720\
                       h*160\
                       l*1600\
                       h*160\
                       l*2720\
                       h*160\
                       l*1600\
                       h*160\
                       l*2720\
                       h*160\
                       l*1600\
                       h*160\
                       l*2720\
                       h*160\
                       l*1600\
                       h*160 l*~
set clear_shift_ready = l*~
set draw_score_ready = l*~
set timer_1_done = l*4320\
                   h*160\
                   l*3680\
                   h*160\
                   l*640\
                   h*160\
                   l*3680\
                   h*160\
                   l*640\
                   h*160\
                   l*3680\
                   h*160\
                   l*640\
                   h*160\
                   l*3680\
                   h*160\
                   l*640\
                   h*160\
                   l*3680\
                   h*160\
                   l*640\
                   h*160\
                   l*3680\
                   h*160\
                   l*640\
                   h*160\
                   l*3680\
                   h*160\
                   l*640\
                   h*160\
                   l*3680\
                   h*160\
                   l*640\
                   h*160\
                   l*3680\
                   h*160\
                   l*640\
                   h*160\
                   l*3680\
                   h*160\
                   l*640\
                   h*160\
                   l*3680\
                   h*160\
                   l*640\
                   h*160\
                   l*3680\
                   h*160\
                   l*640 h*~
set inputs_5_0_5 = l*~
set inputs_5_0_4 = l*~
set inputs_5_0_3 = l*~
set inputs_5_0_2 = l*~
set inputs_5_0_1 = l*~
set inputs_5_0_0 = h*410\
                   l*320\
                   h*320 l*~

option sigunit   = 1n
option outacc    = 100p
option level     = 3
option initialize random = on
option simperiod = 60000

print \
      clk,\
      rst,\
      lut_piece_type_2_0_2,\
      lut_piece_type_2_0_1,\
      lut_piece_type_2_0_0,\
      lut_next_piece,\
      lut_x_2_0_2,\
      lut_x_2_0_1,\
      lut_x_2_0_0,\
      lut_y_3_0_3,\
      lut_y_3_0_2,\
      lut_y_3_0_1,\
      lut_y_3_0_0,\
      lut_rot_1_0_1,\
      lut_rot_1_0_0,\
      new_piece,\
      next_piece_2_0_2,\
      next_piece_2_0_1,\
      next_piece_2_0_0,\
      check_empty,\
      check_start,\
      check_ready,\
      draw_erase_draw,\
      draw_erase_start,\
      draw_erase_ready,\
      clear_shift_start,\
      clear_shift_ready,\
      draw_score_draw,\
      draw_score_ready,\
      timer_1_time,\
      timer_1_start,\
      timer_1_done,\
      timer_1_reset,\
      inputs_5_0_5,\
      inputs_5_0_4,\
      inputs_5_0_3,\
      inputs_5_0_2,\
      inputs_5_0_1,\
      inputs_5_0_0

plot \
      clk,\
      rst,\
      lut_piece_type_2_0_2,\
      lut_piece_type_2_0_1,\
      lut_piece_type_2_0_0,\
      lut_next_piece,\
      lut_x_2_0_2,\
      lut_x_2_0_1,\
      lut_x_2_0_0,\
      lut_y_3_0_3,\
      lut_y_3_0_2,\
      lut_y_3_0_1,\
      lut_y_3_0_0,\
      lut_rot_1_0_1,\
      lut_rot_1_0_0,\
      new_piece,\
      next_piece_2_0_2,\
      next_piece_2_0_1,\
      next_piece_2_0_0,\
      check_empty,\
      check_start,\
      check_ready,\
      draw_erase_draw,\
      draw_erase_start,\
      draw_erase_ready,\
      clear_shift_start,\
      clear_shift_ready,\
      draw_score_draw,\
      draw_score_ready,\
      timer_1_time,\
      timer_1_start,\
      timer_1_done,\
      timer_1_reset,\
      inputs_5_0_5,\
      inputs_5_0_4,\
      inputs_5_0_3,\
      inputs_5_0_2,\
      inputs_5_0_1,\
      inputs_5_0_0
/*
*%
tstep 0.1n
trise 0.5n
tfall 0.5n
*%
.options cptime = 1000
*%
*/


