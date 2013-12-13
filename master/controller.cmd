set vdd = h*~
set vss = l*~
set clk = (h*10 l*10)*500\
          h*~
set rst = x*30\
          h*40 l*~
set next_piece_2_0_2 = l*~
set next_piece_2_0_1 = l*~
set next_piece_2_0_0 = h*~
set check_empty = l*310\
                  h*30\
                  l*250\
                  (h*30 l*310)*27\
                  h*30 l*~
set check_ready = l*310\
                  h*30\
                  l*250\
                  (h*30 l*310)*27\
                  h*30 l*~
set draw_erase_ready = l*190\
                       h*10\
                       l*50\
                       h*30\
                       l*90\
                       h*30\
                       l*130\
                       h*30\
                       l*110\
                       h*30\
                       l*170\
                       h*30\
                       l*110\
                       h*30\
                       l*170\
                       h*30\
                       l*110\
                       h*30\
                       l*170\
                       h*30\
                       l*110\
                       h*30\
                       l*170\
                       h*30\
                       l*110\
                       h*30\
                       l*170\
                       h*30\
                       l*110\
                       h*30\
                       l*170\
                       h*30\
                       l*110\
                       h*30\
                       l*170\
                       h*30\
                       l*110\
                       h*30\
                       l*170\
                       h*30\
                       l*110\
                       h*30\
                       l*170\
                       h*30\
                       l*110\
                       h*30\
                       l*170\
                       h*30\
                       l*110\
                       h*30\
                       l*170\
                       h*30\
                       l*110\
                       h*30\
                       l*170\
                       h*30\
                       l*110\
                       h*30\
                       l*170\
                       h*30\
                       l*110\
                       h*30\
                       l*170\
                       h*30\
                       l*110\
                       h*30\
                       l*170\
                       h*30\
                       l*110\
                       h*30\
                       l*170\
                       h*30\
                       l*110\
                       h*30\
                       l*170\
                       h*30\
                       l*110\
                       h*30\
                       l*170\
                       h*30\
                       l*110\
                       h*30\
                       l*170\
                       h*30\
                       l*110\
                       h*30\
                       l*170\
                       h*30\
                       l*110\
                       h*30\
                       l*170\
                       h*30\
                       l*110\
                       h*30\
                       l*170\
                       h*30\
                       l*110\
                       h*30\
                       l*170\
                       h*30\
                       l*110\
                       h*30\
                       l*170\
                       h*30\
                       l*110\
                       h*30\
                       l*170\
                       h*30\
                       l*110\
                       h*30\
                       l*170\
                       h*30\
                       l*110\
                       h*30\
                       l*170\
                       h*30\
                       l*110\
                       h*30 l*~
set clear_shift_ready = l*~
set draw_score_ready = l*~
set timer_1_done = l*410\
                   h*50\
                   (l*330 h*10)*28\
                   l*~
set inputs_5_0_5 = l*~
set inputs_5_0_4 = l*~
set inputs_5_0_3 = l*~
set inputs_5_0_2 = l*~
set inputs_5_0_1 = l*~
set inputs_5_0_0 = x*110 l*~

option sigunit   = 1n
option outacc    = 100p
option level     = 3
option initialize random = on
option simperiod = 10000

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


