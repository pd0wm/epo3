set vdd = h*~
set vss = l*~
set clk = (h*100 l*100)*20000\
          h*~
set rst = h*750 l*~
set data = l*1930200\
           (h*2400 l*37600)*23\
           h*2400\
           l*32800\
           (h*2400 l*37600)*23\
           h*2400 l*~

option sigunit   = 1n
option outacc    = 100p
option level     = 3
option initialize random = on
option simperiod = 4000000

print \
      clk,\
      rst,\
      mem_addr_7_0_7,\
      mem_addr_7_0_6,\
      mem_addr_7_0_5,\
      mem_addr_7_0_4,\
      mem_addr_7_0_3,\
      mem_addr_7_0_2,\
      mem_addr_7_0_1,\
      mem_addr_7_0_0,\
      data,\
      h_sync,\
      v_sync,\
      red,\
      green,\
      blue

plot \
      clk,\
      rst,\
      mem_addr_7_0_7,\
      mem_addr_7_0_6,\
      mem_addr_7_0_5,\
      mem_addr_7_0_4,\
      mem_addr_7_0_3,\
      mem_addr_7_0_2,\
      mem_addr_7_0_1,\
      mem_addr_7_0_0,\
      data,\
      h_sync,\
      v_sync,\
      red,\
      green,\
      blue
/*
*%
tstep 0.1n
trise 0.5n
tfall 0.5n
*%
.options cptime = 1000
*%
*/


