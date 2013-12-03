set vdd = h*~
set vss = l*~
set clk = (h*85 l*85)*11\
          h*85 l*~
set rst = x*90\
          h*90 l*~
set increase = l*270\
               h*900\
               l*100\
               h*100 l*~

option sigunit   = 1n
option outacc    = 100p
option level     = 3
option initialize random = on
option simperiod = 1955

print \
      clk,\
      rst,\
      increase,\
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


