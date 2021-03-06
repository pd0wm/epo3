set vdd = h*~
set vss = l*~
set ds_clk = (l*82 h*82)*60\
             l*82 h*~
set ds_rst = h*200 l*~
set ds_draw = l*220 h*~
set ds_input_7_0_7 = l*220 h*~
set ds_input_7_0_6 = l*~
set ds_input_7_0_5 = l*220 h*~
set ds_input_7_0_4 = l*~
set ds_input_7_0_3 = l*220 h*~
set ds_input_7_0_2 = l*220 h*~
set ds_input_7_0_1 = l*~
set ds_input_7_0_0 = l*~

option sigunit   = 1n
option outacc    = 100p
option level     = 3
option initialize random = on
option simperiod = 9922

print \
      ds_clk,\
      ds_rst,\
      ds_draw,\
      ds_ready,\
      ds_input_7_0_7,\
      ds_input_7_0_6,\
      ds_input_7_0_5,\
      ds_input_7_0_4,\
      ds_input_7_0_3,\
      ds_input_7_0_2,\
      ds_input_7_0_1,\
      ds_input_7_0_0,\
      ds_write,\
      ds_addr_7_0_7,\
      ds_addr_7_0_6,\
      ds_addr_7_0_5,\
      ds_addr_7_0_4,\
      ds_addr_7_0_3,\
      ds_addr_7_0_2,\
      ds_addr_7_0_1,\
      ds_addr_7_0_0,\
      ds_data_out

plot \
      ds_clk,\
      ds_rst,\
      ds_draw,\
      ds_ready,\
      ds_input_7_0_7,\
      ds_input_7_0_6,\
      ds_input_7_0_5,\
      ds_input_7_0_4,\
      ds_input_7_0_3,\
      ds_input_7_0_2,\
      ds_input_7_0_1,\
      ds_input_7_0_0,\
      ds_write,\
      ds_addr_7_0_7,\
      ds_addr_7_0_6,\
      ds_addr_7_0_5,\
      ds_addr_7_0_4,\
      ds_addr_7_0_3,\
      ds_addr_7_0_2,\
      ds_addr_7_0_1,\
      ds_addr_7_0_0,\
      ds_data_out
/*
*%
tstep 0.1n
trise 0.5n
tfall 0.5n
*%
.options cptime = 1000
*%
*/


