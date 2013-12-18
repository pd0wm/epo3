set vdd = h*~
set vss = l*~
set t1 = h*1740 l*~
set t2 = h*3501740\
                   l*500000 h*~
set t3 = h*501740\
                   (l*500000 h*500000)*2\
                   l*500000 h*~
set t4 = h*~
set t5 = h*~
set t6 = h*~
set t7 = l*501740 h*~
set t31 = (h*80 l*80)*62500\
         h*~

option sigunit   = 1n
option outacc    = 100p
option level     = 3
option initialize random = on
option simperiod = 10000000

print \
      t1,\
      t2,\
      t3,\
      t4,\
      t5,\
      t6,\
      t7,\
      t8,\
      t9,\
      t10,\
      t11,\
      t12,\
      t13,\
      t14,\
      t15,\
      t16,\
      t17,\
      t18,\
      t19,\
      t20,\
      t21,\
      t22,\
      t23,\
      t24,\
      t25,\
      t26,\
      t27,\
      t28,\
      t29,\
      t30,\
      t31,\
      t32

plot \
      t1,\
      t2,\
      t3,\
      t4,\
      t5,\
      t6,\
      t7,\
      t8,\
      t9,\
      t10,\
      t11,\
      t12,\
      t13,\
      t14,\
      t15,\
      t16,\
      t17,\
      t18,\
      t19,\
      t20,\
      t21,\
      t22,\
      t23,\
      t24,\
      t25,\
      t26,\
      t27,\
      t28,\
      t29,\
      t30,\
      t31,\
      t32
/*
*%
tstep 0.1n
trise 0.5n
tfall 0.5n
*%
.options cptime = 1000
*%
*/


