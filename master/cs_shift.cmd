set vdd = h*~
set vss = l*~
set clk = (h*82 l*82)*365\
          h*82 l*~
set rst = h*287\
          l*33128\
          h*287 l*~
set start_in = x*287\
               l*164\
               h*164\
               l*33251\
               h*164 l*~
set ram_addr_in_6_0_6 = x*287 l*~
set ram_addr_in_6_0_5 = x*287 l*~
set ram_addr_in_6_0_4 = x*287 h*~
set ram_addr_in_6_0_3 = x*287 h*~
set ram_addr_in_6_0_2 = x*287 l*~
set ram_addr_in_6_0_1 = x*287 l*~
set ram_addr_in_6_0_0 = x*287 l*~
set ram_data_in = x*328\
                  h*492\
                  l*328\
                  h*820\
                  (l*164 h*328)*5\
                  (l*164 h*164)*2\
                  l*164\
                  h*492\
                  l*164\
                  (h*164 l*328)*5\
                  (h*164 l*164)*2\
                  (h*328 l*164)*7\
                  h*164\
                  l*21156\
                  h*492\
                  l*328\
                  h*820\
                  (l*164 h*328)*5\
                  (l*164 h*164)*2\
                  l*164\
                  h*492\
                  l*164\
                  (h*164 l*328)*5\
                  (h*164 l*164)*2\
                  (h*328 l*164)*7\
                  h*164 l*~

option sigunit   = 1n
option outacc    = 100p
option level     = 3
option initialize random = on
option simperiod = 59942

print \
      clk,\
      rst,\
      start_in,\
      ready_out,\
      ram_addr_in_6_0_6,\
      ram_addr_in_6_0_5,\
      ram_addr_in_6_0_4,\
      ram_addr_in_6_0_3,\
      ram_addr_in_6_0_2,\
      ram_addr_in_6_0_1,\
      ram_addr_in_6_0_0,\
      ram_addr_out_7_0_7,\
      ram_addr_out_7_0_6,\
      ram_addr_out_7_0_5,\
      ram_addr_out_7_0_4,\
      ram_addr_out_7_0_3,\
      ram_addr_out_7_0_2,\
      ram_addr_out_7_0_1,\
      ram_addr_out_7_0_0,\
      ram_we,\
      ram_data_in,\
      ram_data_out

plot \
      clk,\
      rst,\
      start_in,\
      ready_out,\
      ram_addr_in_6_0_6,\
      ram_addr_in_6_0_5,\
      ram_addr_in_6_0_4,\
      ram_addr_in_6_0_3,\
      ram_addr_in_6_0_2,\
      ram_addr_in_6_0_1,\
      ram_addr_in_6_0_0,\
      ram_addr_out_7_0_7,\
      ram_addr_out_7_0_6,\
      ram_addr_out_7_0_5,\
      ram_addr_out_7_0_4,\
      ram_addr_out_7_0_3,\
      ram_addr_out_7_0_2,\
      ram_addr_out_7_0_1,\
      ram_addr_out_7_0_0,\
      ram_we,\
      ram_data_in,\
      ram_data_out
/*
*%
tstep 0.1n
trise 0.5n
tfall 0.5n
*%
.options cptime = 1000
*%
*/


