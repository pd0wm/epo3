set vdd = h*~
set vss = l*~
set clk = (h*1000 l*1000)*50\
          h*~
set rst = x*4000\
          h*4000 l*~
set increase = x*10200\
               h*2000\
               l*40000\
               h*2000\
               l*20000 h*~
set increase_value_2_0_2 = l*74200 h*~
set increase_value_2_0_1 = l*74200 h*~
set increase_value_2_0_0 = l*52200 h*~

option sigunit   = 1n
option outacc    = 100p
option level     = 3
option initialize random = on
option simperiod = 100000

print \
      clk,\
      rst,\
      increase,\
      increase_value_2_0_2,\
      increase_value_2_0_1,\
      increase_value_2_0_0,\
      output_7_0_7,\
      output_7_0_6,\
      output_7_0_5,\
      output_7_0_4,\
      output_7_0_3,\
      output_7_0_2,\
      output_7_0_1,\
      output_7_0_0

plot \
      clk,\
      rst,\
      increase,\
      increase_value_2_0_2,\
      increase_value_2_0_1,\
      increase_value_2_0_0,\
      output_7_0_7,\
      output_7_0_6,\
      output_7_0_5,\
      output_7_0_4,\
      output_7_0_3,\
      output_7_0_2,\
      output_7_0_1,\
      output_7_0_0
/*
*%
tstep 0.1n
trise 0.5n
tfall 0.5n
*%
.options cptime = 1000
*%
*/


