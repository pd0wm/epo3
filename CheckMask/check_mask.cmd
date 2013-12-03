set vdd = h*~
set vss = l*~
set clk = (h*10 l*10)*110\
          h*~
set rst = h*30 l*~
set mask_7_0_7 = x*50 l*~
set mask_7_0_6 = x*50\
                 h*940\
                 l*1000 h*~
set mask_7_0_5 = x*50\
                 h*940\
                 l*1000 h*~
set mask_7_0_4 = x*50 l*~
set mask_7_0_3 = x*50\
                 h*1940 l*~
set mask_7_0_2 = x*50 h*~
set mask_7_0_1 = x*50\
                 l*940 h*~
set mask_7_0_0 = x*50\
                 l*940\
                 h*1000 l*~
set start = l*50\
            h*1940 l*~
set lut_ready = l*210\
                (h*40 l*460)*3\
                h*40 l*~
set lut_error = l*~
set data_in = x*70 l*~

option sigunit   = 1n
option outacc    = 100p
option level     = 3
option initialize random = on
option simperiod = 2200

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
      ready,\
      empty,\
      start,\
      lut_start,\
      lut_ready,\
      lut_error,\
      write,\
      addr_7_0_7,\
      addr_7_0_6,\
      addr_7_0_5,\
      addr_7_0_4,\
      addr_7_0_3,\
      addr_7_0_2,\
      addr_7_0_1,\
      addr_7_0_0,\
      data_in

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
      ready,\
      empty,\
      start,\
      lut_start,\
      lut_ready,\
      lut_error,\
      write,\
      addr_7_0_7,\
      addr_7_0_6,\
      addr_7_0_5,\
      addr_7_0_4,\
      addr_7_0_3,\
      addr_7_0_2,\
      addr_7_0_1,\
      addr_7_0_0,\
      data_in
/*
*%
tstep 0.1n
trise 0.5n
tfall 0.5n
*%
.options cptime = 1000
*%
*/


