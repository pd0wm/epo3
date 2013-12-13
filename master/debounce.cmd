set vdd = h*~
set vss = l*~
set clk = (h*82 l*82)*6097\
          h*82 l*~
set rst = h*8000 l*~
set inv_inputs_5_0_5 = h*4000\
                       l*23000\
                       h*293000\
                       l*80000\
                       h*160000\
                       l*200000 h*~
set inv_inputs_5_0_4 = h*28000\
                       l*288000\
                       h*244000\
                       l*200000 h*~
set inv_inputs_5_0_3 = h*440000\
                       l*200\
                       h*600\
                       l*400\
                       h*200\
                       l*74600\
                       h*200\
                       l*600\
                       h*400\
                       l*600 h*~
set inv_inputs_5_0_2 = h*~
set inv_inputs_5_0_1 = h*~
set inv_inputs_5_0_0 = h*~

option sigunit   = 1n
option outacc    = 100p
option level     = 3
option initialize random = on
option simperiod = 999990

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


