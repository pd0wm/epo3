set vdd = h*~
set vss = l*~
set clk = (h*10 l*10)*3000\
          h*~
set rst = h*30 l*~
set mask_select_1_0_1 = l*510\
                        h*1000 l*~
set mask_select_1_0_0 = h*510\
                        l*500\
                        h*500 l*~
set x_2_0_2 = h*~
set x_2_0_1 = h*~
set x_2_0_0 = h*~
set y_3_0_3 = h*~
set y_3_0_2 = h*~
set y_3_0_1 = h*~
set y_3_0_0 = l*~
set rot_1_0_1 = l*~
set rot_1_0_0 = h*~
set piece_type_2_0_2 = l*~
set piece_type_2_0_1 = h*~
set piece_type_2_0_0 = h*~
set next_piece = l*~
set check_start = l*110\
                  h*240\
                  l*160\
                  (h*240 l*260)*2\
                  h*240 l*~
set draw_start = l*~
set rom_data_3_0_3 = x*150\
                     l*1400 h*~
set rom_data_3_0_2 = x*150\
                     l*400\
                     h*1000 l*~
set rom_data_3_0_1 = x*150 l*~
set rom_data_3_0_0 = x*150\
                     l*900\
                     h*500 l*~

option sigunit   = 1n
option outacc    = 100p
option level     = 3
option initialize random = on
option simperiod = 60000

print \
      clk,\
      rst,\
      mask_7_0_7,\
      mask_7_0_6,\
      mask_7_0_5,\
      mask_7_0_4,\
      mask_7_0_3,\
      mask_7_0_2,\
      mask_7_0_1,\
      mask_7_0_0,\
      mask_select_1_0_1,\
      mask_select_1_0_0,\
      x_2_0_2,\
      x_2_0_1,\
      x_2_0_0,\
      y_3_0_3,\
      y_3_0_2,\
      y_3_0_1,\
      y_3_0_0,\
      rot_1_0_1,\
      rot_1_0_0,\
      piece_type_2_0_2,\
      piece_type_2_0_1,\
      piece_type_2_0_0,\
      next_piece,\
      ready,\
      overflow,\
      check_start,\
      draw_start,\
      rom_addr_6_0_6,\
      rom_addr_6_0_5,\
      rom_addr_6_0_4,\
      rom_addr_6_0_3,\
      rom_addr_6_0_2,\
      rom_addr_6_0_1,\
      rom_addr_6_0_0,\
      rom_data_3_0_3,\
      rom_data_3_0_2,\
      rom_data_3_0_1,\
      rom_data_3_0_0

plot \
      clk,\
      rst,\
      mask_7_0_7,\
      mask_7_0_6,\
      mask_7_0_5,\
      mask_7_0_4,\
      mask_7_0_3,\
      mask_7_0_2,\
      mask_7_0_1,\
      mask_7_0_0,\
      mask_select_1_0_1,\
      mask_select_1_0_0,\
      x_2_0_2,\
      x_2_0_1,\
      x_2_0_0,\
      y_3_0_3,\
      y_3_0_2,\
      y_3_0_1,\
      y_3_0_0,\
      rot_1_0_1,\
      rot_1_0_0,\
      piece_type_2_0_2,\
      piece_type_2_0_1,\
      piece_type_2_0_0,\
      next_piece,\
      ready,\
      overflow,\
      check_start,\
      draw_start,\
      rom_addr_6_0_6,\
      rom_addr_6_0_5,\
      rom_addr_6_0_4,\
      rom_addr_6_0_3,\
      rom_addr_6_0_2,\
      rom_addr_6_0_1,\
      rom_addr_6_0_0,\
      rom_data_3_0_3,\
      rom_data_3_0_2,\
      rom_data_3_0_1,\
      rom_data_3_0_0
/*
*%
tstep 0.1n
trise 0.5n
tfall 0.5n
*%
.options cptime = 1000
*%
*/


