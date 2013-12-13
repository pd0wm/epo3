set vdd = h*~
set vss = l*~
set addr_6_0_6 = l*6400 h*~
set addr_6_0_5 = l*3200\
                 h*3200\
                 l*3200 h*~
set addr_6_0_4 = (l*1600 h*1600)*3\
                 l*~
set addr_6_0_3 = (l*800 h*800)*6\
                 l*800 h*~
set addr_6_0_2 = (l*400 h*400)*13\
                 l*400 h*~
set addr_6_0_1 = (l*200 h*200)*27\
                 l*200 h*~
set addr_6_0_0 = (l*100 h*100)*55\
                 l*100 h*~

option sigunit   = 1n
option outacc    = 100p
option level     = 3
option initialize random = on
option simperiod = 11100

print \
      addr_6_0_6,\
      addr_6_0_5,\
      addr_6_0_4,\
      addr_6_0_3,\
      addr_6_0_2,\
      addr_6_0_1,\
      addr_6_0_0,\
      data_3_0_3,\
      data_3_0_2,\
      data_3_0_1,\
      data_3_0_0

plot \
      addr_6_0_6,\
      addr_6_0_5,\
      addr_6_0_4,\
      addr_6_0_3,\
      addr_6_0_2,\
      addr_6_0_1,\
      addr_6_0_0,\
      data_3_0_3,\
      data_3_0_2,\
      data_3_0_1,\
      data_3_0_0
/*
*%
tstep 0.1n
trise 0.5n
tfall 0.5n
*%
.options cptime = 1000
*%
*/


