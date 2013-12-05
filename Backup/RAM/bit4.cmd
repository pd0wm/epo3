set vdd = h*~
set vss = l*~
set addr1_1 = x*80\
              l*1600\
              h*1600\
              l*1600\
              h*1680 l*~
set addr1_2 = x*80\
              l*3200\
              h*3280 l*~
set addr2_1 = x*80\
              l*1600\
              h*1600\
              l*1600\
              h*1680 l*~
set addr2_2 = x*80\
              l*3200\
              h*3280 l*~
set we1 = x*80\
          (h*100 l*100)*2\
          h*1300\
          l*100\
          h*100\
          l*100\
          h*1300\
          l*100\
          h*100\
          l*100\
          h*1300\
          l*100\
          h*100\
          l*100\
          h*1380\
          l*100\
          h*100\
          l*100 h*~
set we2 = x*80\
          h*500\
          l*100\
          h*100\
          l*100\
          h*1300\
          l*100\
          h*100\
          l*100\
          h*1300\
          l*100\
          h*100\
          l*100\
          h*1300\
          l*100\
          h*100\
          l*100 h*~
set we3 = x*80\
          h*900\
          l*100\
          h*100\
          l*100\
          h*1300\
          l*100\
          h*100\
          l*100\
          h*1300\
          l*100\
          h*100\
          l*100\
          h*1300\
          l*100\
          h*100\
          l*100 h*~
set we4 = x*80\
          h*1300\
          l*100\
          h*100\
          l*100\
          h*1300\
          l*100\
          h*100\
          l*100\
          h*1300\
          l*100\
          h*100\
          l*100\
          h*1300\
          l*100\
          h*100\
          l*180 h*~
set we_com = x*80 l*~
set re_1 = x*80 h*~
set re_2 = x*80 h*~
set clk = (h*50 l*50)*70\
          h*~
set rst = h*80\
          l*6400\
          h*80 l*~
set di = x*80\
         l*100\
         (h*100 l*300)*15\
         h*100\
         l*380\
         h*100 l*~

option sigunit   = 1n
option outacc    = 100p
option level     = 3
option initialize random = on
option simperiod = 7000

print \
      do_2,\
      addr1_1,\
      addr1_2,\
      addr2_1,\
      addr2_2,\
      we1,\
      we2,\
      we3,\
      we4,\
      we_com,\
      re_1,\
      re_2,\
      clk,\
      rst,\
      di,\
      do_1

plot \
      do_2,\
      addr1_1,\
      addr1_2,\
      addr2_1,\
      addr2_2,\
      we1,\
      we2,\
      we3,\
      we4,\
      we_com,\
      re_1,\
      re_2,\
      clk,\
      rst,\
      di,\
      do_1
/*
*%
tstep 0.1n
trise 0.5n
tfall 0.5n
*%
.options cptime = 1000
*%
*/


