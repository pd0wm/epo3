set vdd = h*~
set vss = l*~
set rst = h*1740 l*~
set clk = (h*80 l*80)*62500\
          h*~
set inputs_5_0_5 = h*~
set inputs_5_0_4 = h*501740\
                   (l*500000 h*500000)*2\
                   l*~
set inputs_5_0_3 = h*~
set inputs_5_0_2 = h*~
set inputs_5_0_1 = h*~
set inputs_5_0_0 = l*501740 h*~

option sigunit   = 1n
option outacc    = 100p
option level     = 3
option initialize random = on
option simperiod = 10000000

print \
      rst,\
      clk,\
      inputs_5_0_5,\
      inputs_5_0_4,\
      inputs_5_0_3,\
      inputs_5_0_2,\
      inputs_5_0_1,\
      inputs_5_0_0,\
      vga_h_sync,\
      vga_v_sync,\
      vga_red,\
      vga_green,\
      vga_blue

plot \
      rst,\
      clk,\
      inputs_5_0_5,\
      inputs_5_0_4,\
      inputs_5_0_3,\
      inputs_5_0_2,\
      inputs_5_0_1,\
      inputs_5_0_0,\
      vga_h_sync,\
      vga_v_sync,\
      vga_red,\
      vga_green,\
      vga_blue
/*
*%
tstep 0.1n
trise 0.5n
tfall 0.5n
*%
.options cptime = 1000
*%
*/


