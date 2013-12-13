set vdd = h*~
set vss = l*~
set clk = (h*50 l*50)*1000\
          h*~
set rst = h*2000 l*~
set mask_7_0_7 = h*~
set mask_7_0_6 = h*5000\
                 l*6000 h*~
set mask_7_0_5 = h*~
set mask_7_0_4 = l*5000 h*~
set mask_7_0_3 = h*5000 l*~
set mask_7_0_2 = h*5000 l*~
set mask_7_0_1 = h*5000 l*~
set mask_7_0_0 = h*11000 l*~
set draw_erase = l*3000\
                 h*5000\
                 l*6000 h*~
set start = l*3000\
            h*4000\
            l*1000\
            h*4000\
            l*2000\
            h*3000 l*~
set lut_ready = l*4000\
                (h*200 l*400)*3\
                h*200\
                l*3000\
                (h*200 l*400)*3\
                h*200\
                l*4000\
                (h*200 l*400)*3\
                h*200 l*~

option sigunit   = 1n
option outacc    = 100p
option level     = 3
option initialize random = on
option simperiod = 100000

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


