set vdd = h*~
set vss = l*~
set clk = (h*10 l*10)*201000\
          h*~
set rst = h*20 l*~
set data = l*192960\
           (h*240 l*3760)*23\
           h*240\
           l*3280\
           (h*240 l*3760)*23\
           h*240\
           l*1252600\
           (h*2740 l*1260)*23\
           h*414740\
           l*192900\
           (h*240 l*3760)*23\
           h*240\
           l*3280\
           (h*240 l*3760)*23\
           h*240\
           l*1252600\
           (h*2740 l*1260)*23\
           h*~

option sigunit   = 1n
option outacc    = 100p
option level     = 3
option initialize random = on
option simperiod = 4020000

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


