set vdd = h*~
set vss = l*~
set clk = (h*80 l*80)*43\
          h*80 l*~
set rst = h*220\
          l*3840\
          h*220 l*~
set di = x*220\
         l*640\
         h*640\
         l*1280\
         h*640\
         l*1500\
         h*640\
         l*1280 h*~
set we = l*860\
         h*640\
         l*1280\
         h*640\
         l*1500\
         h*640\
         l*1280 h*~
set addr1_7_0_7 = x*220\
                  l*1920\
                  h*2140\
                  l*1920 h*~
set addr1_7_0_6 = x*220 l*~
set addr1_7_0_5 = x*220 l*~
set addr1_7_0_4 = x*220 l*~
set addr1_7_0_3 = x*220 l*~
set addr1_7_0_2 = x*220 l*~
set addr1_7_0_1 = x*220\
                  h*1920\
                  l*2140\
                  h*1920 l*~
set addr1_7_0_0 = x*220 l*~
set addr2_7_0_7 = x*220 l*~
set addr2_7_0_6 = x*220 l*~
set addr2_7_0_5 = x*220 l*~
set addr2_7_0_4 = x*220 l*~
set addr2_7_0_3 = x*220 l*~
set addr2_7_0_2 = x*220 l*~
set addr2_7_0_1 = x*220 h*~
set addr2_7_0_0 = x*220 l*~

option sigunit   = 1n
option outacc    = 100p
option level     = 3
option initialize random = on
option simperiod = 6960

print \
      clk,\
      rst,\
      di,\
      do1,\
      do2,\
      we,\
      addr1_7_0_7,\
      addr1_7_0_6,\
      addr1_7_0_5,\
      addr1_7_0_4,\
      addr1_7_0_3,\
      addr1_7_0_2,\
      addr1_7_0_1,\
      addr1_7_0_0,\
      addr2_7_0_7,\
      addr2_7_0_6,\
      addr2_7_0_5,\
      addr2_7_0_4,\
      addr2_7_0_3,\
      addr2_7_0_2,\
      addr2_7_0_1,\
      addr2_7_0_0

plot \
      clk,\
      rst,\
      di,\
      do1,\
      do2,\
      we,\
      addr1_7_0_7,\
      addr1_7_0_6,\
      addr1_7_0_5,\
      addr1_7_0_4,\
      addr1_7_0_3,\
      addr1_7_0_2,\
      addr1_7_0_1,\
      addr1_7_0_0,\
      addr2_7_0_7,\
      addr2_7_0_6,\
      addr2_7_0_5,\
      addr2_7_0_4,\
      addr2_7_0_3,\
      addr2_7_0_2,\
      addr2_7_0_1,\
      addr2_7_0_0
/*
*%
tstep 0.1n
trise 0.5n
tfall 0.5n
*%
.options cptime = 1000
*%
*/


