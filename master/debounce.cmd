set vdd = h*~
set vss = l*~
set clk = (h*20 l*20)*9750\
          h*~
set rst = h*2000 l*~
set inv_inputs_5_0_5 = h*7000\
                       l*72000\
                       h*21000\
                       l*50\
                       h*150\
                       l*19800\
                       h*60000 l*~
set inv_inputs_5_0_4 = h*1000\
                       l*6000\
                       h*73000\
                       l*20050\
                       h*150\
                       l*19800\
                       h*60000 l*~
set inv_inputs_5_0_3 = h*1000\
                       l*78000\
                       h*1000\
                       l*20000\
                       h*300\
                       l*50\
                       h*18650\
                       l*50\
                       h*150\
                       l*100\
                       h*150 l*~
set inv_inputs_5_0_2 = h*1000\
                       l*78000\
                       h*1000\
                       l*20050\
                       h*150 l*~
set inv_inputs_5_0_1 = h*1000\
                       l*78000\
                       h*1000\
                       l*20050\
                       h*150 l*~
set inv_inputs_5_0_0 = h*1000\
                       l*78000\
                       h*1000\
                       l*20050\
                       h*150 l*~

option sigunit   = 1n
option outacc    = 100p
option level     = 3
option initialize random = on
option simperiod = 390000

print \
      clk,\
      rst,\
      inv_inputs_5_0_5,\
      inv_inputs_5_0_4,\
      inv_inputs_5_0_3,\
      inv_inputs_5_0_2,\
      inv_inputs_5_0_1,\
      inv_inputs_5_0_0,\
      output_5_0_5,\
      output_5_0_4,\
      output_5_0_3,\
      output_5_0_2,\
      output_5_0_1,\
      output_5_0_0,\
      random_seed

plot \
      clk,\
      rst,\
      inv_inputs_5_0_5,\
      inv_inputs_5_0_4,\
      inv_inputs_5_0_3,\
      inv_inputs_5_0_2,\
      inv_inputs_5_0_1,\
      inv_inputs_5_0_0,\
      output_5_0_5,\
      output_5_0_4,\
      output_5_0_3,\
      output_5_0_2,\
      output_5_0_1,\
      output_5_0_0,\
      random_seed
/*
*%
tstep 0.1n
trise 0.5n
tfall 0.5n
*%
.options cptime = 1000
*%
*/


