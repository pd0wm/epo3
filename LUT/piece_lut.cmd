set vdd = h*~
set vss = l*~
set lut_clk = (h*10 l*10)*50\
              h*~
set lut_rst = h*30 l*~
set lut_mask_select_1_0_1 = l*490 h*~
set lut_mask_select_1_0_0 = l*290\
                            h*200\
                            l*200 h*~
set lut_x_2_0_2 = h*~
set lut_x_2_0_1 = h*~
set lut_x_2_0_0 = h*~
set lut_y_3_0_3 = h*~
set lut_y_3_0_2 = h*~
set lut_y_3_0_1 = h*~
set lut_y_3_0_0 = l*~
set lut_rot_1_0_1 = l*~
set lut_rot_1_0_0 = h*~
set lut_piece_type_2_0_2 = h*~
set lut_piece_type_2_0_1 = l*~
set lut_piece_type_2_0_0 = h*~
set lut_next_piece = l*~
set lut_start = l*110\
                (h*20 l*180)*3\
                h*20 l*~
set lut_rom_data_3_0_3 = l*550\
                         h*200 l*~
set lut_rom_data_3_0_2 = l*350\
                         h*200\
                         l*200 h*~
set lut_rom_data_3_0_1 = l*~
set lut_rom_data_3_0_0 = l*750 h*~

option sigunit   = 1n
option outacc    = 100p
option level     = 3
option initialize random = on
option simperiod = 1000

print \
      lut_clk,\
      lut_rst,\
      lut_mask_7_0_7,\
      lut_mask_7_0_6,\
      lut_mask_7_0_5,\
      lut_mask_7_0_4,\
      lut_mask_7_0_3,\
      lut_mask_7_0_2,\
      lut_mask_7_0_1,\
      lut_mask_7_0_0,\
      lut_mask_select_1_0_1,\
      lut_mask_select_1_0_0,\
      lut_x_2_0_2,\
      lut_x_2_0_1,\
      lut_x_2_0_0,\
      lut_y_3_0_3,\
      lut_y_3_0_2,\
      lut_y_3_0_1,\
      lut_y_3_0_0,\
      lut_rot_1_0_1,\
      lut_rot_1_0_0,\
      lut_piece_type_2_0_2,\
      lut_piece_type_2_0_1,\
      lut_piece_type_2_0_0,\
      lut_next_piece,\
      lut_ready,\
      lut_error_side,\
      lut_error_bot,\
      lut_start,\
      lut_rom_addr_6_0_6,\
      lut_rom_addr_6_0_5,\
      lut_rom_addr_6_0_4,\
      lut_rom_addr_6_0_3,\
      lut_rom_addr_6_0_2,\
      lut_rom_addr_6_0_1,\
      lut_rom_addr_6_0_0,\
      lut_rom_data_3_0_3,\
      lut_rom_data_3_0_2,\
      lut_rom_data_3_0_1,\
      lut_rom_data_3_0_0

plot \
      lut_clk,\
      lut_rst,\
      lut_mask_7_0_7,\
      lut_mask_7_0_6,\
      lut_mask_7_0_5,\
      lut_mask_7_0_4,\
      lut_mask_7_0_3,\
      lut_mask_7_0_2,\
      lut_mask_7_0_1,\
      lut_mask_7_0_0,\
      lut_mask_select_1_0_1,\
      lut_mask_select_1_0_0,\
      lut_x_2_0_2,\
      lut_x_2_0_1,\
      lut_x_2_0_0,\
      lut_y_3_0_3,\
      lut_y_3_0_2,\
      lut_y_3_0_1,\
      lut_y_3_0_0,\
      lut_rot_1_0_1,\
      lut_rot_1_0_0,\
      lut_piece_type_2_0_2,\
      lut_piece_type_2_0_1,\
      lut_piece_type_2_0_0,\
      lut_next_piece,\
      lut_ready,\
      lut_error_side,\
      lut_error_bot,\
      lut_start,\
      lut_rom_addr_6_0_6,\
      lut_rom_addr_6_0_5,\
      lut_rom_addr_6_0_4,\
      lut_rom_addr_6_0_3,\
      lut_rom_addr_6_0_2,\
      lut_rom_addr_6_0_1,\
      lut_rom_addr_6_0_0,\
      lut_rom_data_3_0_3,\
      lut_rom_data_3_0_2,\
      lut_rom_data_3_0_1,\
      lut_rom_data_3_0_0
/*
*%
tstep 0.1n
trise 0.5n
tfall 0.5n
*%
.options cptime = 1000
*%
*/


