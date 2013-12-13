set vdd = h*~
set vss = l*~
set clk = (h*1000 l*1000)*250\
          h*~
set rst = h*40000 l*~
set button_seed = l*30000\
                  h*5000\
                  l*55000\
                  h*70000\
                  l*190000\
                  h*130000 l*~
set new_number = l*5000\
                 h*10000\
                 l*15000\
                 h*20000\
                 l*150000\
                 h*10000 l*~

option sigunit   = 1n
option outacc    = 100p
option level     = 3
option initialize random = on
option simperiod = 500000

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


