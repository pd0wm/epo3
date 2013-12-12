set vdd = h*~
set vss = l*~
set clk = (h*82 l*82)*609\
          h*82 l*~
set vga_clk = (h*800 l*800)*62\
              h*800 l*~
set rst = h*287 l*~
set cnt_rst = l*~
set time = x*287 h*~
set start = x*287\
            l*164\
            h*164 l*~

option sigunit   = 1n
option outacc    = 100p
option level     = 3
option initialize random = on
option simperiod = 100000

print \
      clk,\
      vga_clk,\
      rst,\
      cnt_rst,\
      time,\
      start,\
      ready

plot \
      clk,\
      vga_clk,\
      rst,\
      cnt_rst,\
      time,\
      start,\
      ready
/*
*%
tstep 0.1n
trise 0.5n
tfall 0.5n
*%
.options cptime = 1000
*%
*/


