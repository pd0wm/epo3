set vdd = h*~
set vss = l*~
set clk = (h*160 l*160)*312\
          h*160 l*~
set reset = h*300 l*~
set start = l*1000 h*~
set ram_in = h*~

option sigunit   = 1n
option outacc    = 100p
option level     = 3
option initialize random = on
option simperiod = 100000

print \
      clk,\
      reset,\
      start,\
      ram_in,\
      ram_out,\
      ram_addr_7_0_7,\
      ram_addr_7_0_6,\
      ram_addr_7_0_5,\
      ram_addr_7_0_4,\
      ram_addr_7_0_3,\
      ram_addr_7_0_2,\
      ram_addr_7_0_1,\
      ram_addr_7_0_0,\
      ram_write,\
      score,\
      ready

plot \
      clk,\
      reset,\
      start,\
      ram_in,\
      ram_out,\
      ram_addr_7_0_7,\
      ram_addr_7_0_6,\
      ram_addr_7_0_5,\
      ram_addr_7_0_4,\
      ram_addr_7_0_3,\
      ram_addr_7_0_2,\
      ram_addr_7_0_1,\
      ram_addr_7_0_0,\
      ram_write,\
      score,\
      ready
/*
*%
tstep 0.1n
trise 0.5n
tfall 0.5n
*%
.options cptime = 1000
*%
*/


