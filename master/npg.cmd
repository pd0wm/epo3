set vdd = h*~
set vss = l*~
set clk = (h*82 l*82)*128\
          h*~
set rst = h*287 l*~
set button_seed = l*1927\
                  h*1804 l*~
set new_number = l*5371\
                 h*164 l*~

option sigunit   = 1n
option outacc    = 100p
option level     = 3
option initialize random = on
option simperiod = 20992

print \
      clk,\
      rst,\
      button_seed,\
      new_number,\
      output_2_0_2,\
      output_2_0_1,\
      output_2_0_0

plot \
      clk,\
      rst,\
      button_seed,\
      new_number,\
      output_2_0_2,\
      output_2_0_1,\
      output_2_0_0
/*
*%
tstep 0.1n
trise 0.5n
tfall 0.5n
*%
.options cptime = 1000
*%
*/


