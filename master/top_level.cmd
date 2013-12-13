set vdd = h*~
set vss = l*~
set rst = h*1740 l*~
set clk = (h*80 l*80)*12500\
          h*~
set dbg_inputs_5_0_5 = h*~
set dbg_inputs_5_0_4 = h*3340 l*~
set dbg_inputs_5_0_3 = h*~
set dbg_inputs_5_0_2 = h*~
set dbg_inputs_5_0_1 = h*~
set dbg_inputs_5_0_0 = l*3340 h*~

option sigunit   = 1n
option outacc    = 100p
option level     = 3
option initialize random = on
option simperiod = 2000000

print \
      rst,\
      clk,\
      dbg_inputs_5_0_5,\
      dbg_inputs_5_0_4,\
      dbg_inputs_5_0_3,\
      dbg_inputs_5_0_2,\
      dbg_inputs_5_0_1,\
      dbg_inputs_5_0_0,\
      vga_hsync,\
      vga_vsync,\
      vga_clk,\
      vga_r,\
      vga_g,\
      vga_b

plot \
      rst,\
      clk,\
      dbg_inputs_5_0_5,\
      dbg_inputs_5_0_4,\
      dbg_inputs_5_0_3,\
      dbg_inputs_5_0_2,\
      dbg_inputs_5_0_1,\
      dbg_inputs_5_0_0,\
      vga_hsync,\
      vga_vsync,\
      vga_clk,\
      vga_r,\
      vga_g,\
      vga_b
/*
*%
tstep 0.1n
trise 0.5n
tfall 0.5n
*%
.options cptime = 1000
*%
*/


