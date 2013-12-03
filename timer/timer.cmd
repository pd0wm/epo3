set vdd = h*~
set vss = l*~
set timer_clk = (h*50 l*50)*30\
                h*~
set timer_vga_clk = (h*80 l*80)*18\
                    h*80 l*~
set timer_rst = h*120 l*~
set timer_time_7_0_7 = l*~
set timer_time_7_0_6 = l*~
set timer_time_7_0_5 = l*~
set timer_time_7_0_4 = l*~
set timer_time_7_0_3 = l*~
set timer_time_7_0_2 = h*~
set timer_time_7_0_1 = l*~
set timer_time_7_0_0 = l*~
set timer_start = l*220\
                  h*1302\
                  l*508 h*~

option sigunit   = 1n
option outacc    = 100p
option level     = 3
option initialize random = on
option simperiod = 3000

print \
      timer_clk,\
      timer_vga_clk,\
      timer_rst,\
      timer_time_7_0_7,\
      timer_time_7_0_6,\
      timer_time_7_0_5,\
      timer_time_7_0_4,\
      timer_time_7_0_3,\
      timer_time_7_0_2,\
      timer_time_7_0_1,\
      timer_time_7_0_0,\
      timer_start,\
      timer_done

plot \
      timer_clk,\
      timer_vga_clk,\
      timer_rst,\
      timer_time_7_0_7,\
      timer_time_7_0_6,\
      timer_time_7_0_5,\
      timer_time_7_0_4,\
      timer_time_7_0_3,\
      timer_time_7_0_2,\
      timer_time_7_0_1,\
      timer_time_7_0_0,\
      timer_start,\
      timer_done
/*
*%
tstep 0.1n
trise 0.5n
tfall 0.5n
*%
.options cptime = 1000
*%
*/


