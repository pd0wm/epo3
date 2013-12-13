set vdd = h*~
set vss = l*~
set clk = (h*82 l*82)*121\
          h*82 l*~
set rst = h*287 l*~
set mask_7_0_7 = h*~
set mask_7_0_6 = h*~
set mask_7_0_5 = h*~
set mask_7_0_4 = l*~
set mask_7_0_3 = h*~
set mask_7_0_2 = h*~
set mask_7_0_1 = h*~
set mask_7_0_0 = h*~
set draw_erase = l*451 h*~
set start = l*451\
            h*3772 l*~
set lut_ready = l*943\
                (h*328 l*492)*3\
                h*328 l*~

option sigunit   = 1n
option outacc    = 100p
option level     = 3
option initialize random = on
option simperiod = 19926

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
      draw_erase,\
      ready,\
      start,\
      mask_select_1_0_1,\
      mask_select_1_0_0,\
      lut_start,\
      lut_ready,\
      write,\
      addr_7_0_7,\
      addr_7_0_6,\
      addr_7_0_5,\
      addr_7_0_4,\
      addr_7_0_3,\
      addr_7_0_2,\
      addr_7_0_1,\
      addr_7_0_0,\
      data

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
      draw_erase,\
      ready,\
      start,\
      mask_select_1_0_1,\
      mask_select_1_0_0,\
      lut_start,\
      lut_ready,\
      write,\
      addr_7_0_7,\
      addr_7_0_6,\
      addr_7_0_5,\
      addr_7_0_4,\
      addr_7_0_3,\
      addr_7_0_2,\
      addr_7_0_1,\
      addr_7_0_0,\
      data
/*
*%
tstep 0.1n
trise 0.5n
tfall 0.5n
*%
.options cptime = 1000
*%
*/


