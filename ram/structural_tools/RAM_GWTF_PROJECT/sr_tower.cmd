set vdd = h*~
set vss = l*~
set clk = (h*10 l*10)*50\
          h*~
set rst = (h*15 l*480)*2\
          h*~
set di = x*15\
         l*80\
         h*80\
         l*160\
         h*80\
         l*175\
         h*80\
         l*160\
         h*80 l*~
set we = l*95\
         h*80\
         l*160\
         h*80\
         l*175\
         h*80\
         l*160\
         h*80 l*~
set addr1_4_0_4 = x*15\
                  l*240\
                  h*255\
                  l*240 h*~
set addr1_4_0_3 = x*15 l*~
set addr1_4_0_2 = x*15 l*~
set addr1_4_0_1 = x*15\
                  h*240\
                  l*255\
                  h*240 l*~
set addr1_4_0_0 = x*15 l*~
set addr2_4_0_4 = x*15 l*~
set addr2_4_0_3 = x*15 l*~
set addr2_4_0_2 = x*15 l*~
set addr2_4_0_1 = x*15 h*~
set addr2_4_0_0 = x*15 l*~

option sigunit   = 1n
option outacc    = 100p
option level     = 3
option initialize random = on
option simperiod = 1000

print \
      clk,\
      rst,\
      di,\
      do1,\
      do2,\
      we,\
      addr1_4_0_4,\
      addr1_4_0_3,\
      addr1_4_0_2,\
      addr1_4_0_1,\
      addr1_4_0_0,\
      addr2_4_0_4,\
      addr2_4_0_3,\
      addr2_4_0_2,\
      addr2_4_0_1,\
      addr2_4_0_0

plot \
      clk,\
      rst,\
      di,\
      do1,\
      do2,\
      we,\
      addr1_4_0_4,\
      addr1_4_0_3,\
      addr1_4_0_2,\
      addr1_4_0_1,\
      addr1_4_0_0,\
      addr2_4_0_4,\
      addr2_4_0_3,\
      addr2_4_0_2,\
      addr2_4_0_1,\
      addr2_4_0_0
/*
*%
tstep 0.1n
trise 0.5n
tfall 0.5n
*%
.options cptime = 1000
*%
*/


