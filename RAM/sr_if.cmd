set vdd = h*~
set vss = l*~
set clk = (h*80 l*80)*25\
          h*~
set rst = h*300\
          l*2080\
          h*300 l*~
set di = x*300\
         (l*160 h*160)*3\
         l*1580\
         (h*160 l*160)*2\
         h*160 l*~
set we = l*460\
         (h*160 l*160)*2\
         h*320\
         l*1420\
         (h*160 l*160)*2\
         h*320 l*~
set addr1_7_0_7 = x*300 l*~
set addr1_7_0_6 = x*300 l*~
set addr1_7_0_5 = x*300\
                  l*640\
                  h*480\
                  l*320\
                  h*940\
                  l*640\
                  h*480 l*~
set addr1_7_0_4 = x*300 l*~
set addr1_7_0_3 = x*300\
                  l*320\
                  h*800\
                  l*160\
                  h*1100\
                  l*320\
                  h*800\
                  l*160 h*~
set addr1_7_0_2 = x*300 l*~
set addr1_7_0_1 = x*300 h*~
set addr1_7_0_0 = x*300 l*~
set addr2_7_0_7 = x*300 l*~
set addr2_7_0_6 = x*300 l*~
set addr2_7_0_5 = x*300\
                  l*1920\
                  h*460 l*~
set addr2_7_0_4 = x*300 l*~
set addr2_7_0_3 = x*300\
                  h*1600\
                  l*160 h*~
set addr2_7_0_2 = x*300 l*~
set addr2_7_0_1 = x*300 h*~
set addr2_7_0_0 = x*300 l*~

option sigunit   = 1n
option outacc    = 100p
option level     = 3
option initialize random = on
option simperiod = 4000

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

