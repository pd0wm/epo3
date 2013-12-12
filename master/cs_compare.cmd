set vdd = h*~
set vss = l*~
set clk = (h*82 l*82)*701\
          h*~
set rst = h*287 l*~
set start_in = x*287\
               l*164\
               h*164 l*~
set ram_data_in = x*328\
                  h*1804\
                  l*492\
                  h*164\
                  l*164\
                  h*4100\
                  l*1476\
                  h*164\
                  l*164\
                  h*1968\
                  l*492\
                  h*164\
                  l*328\
                  h*820\
                  (l*164 h*328)*5\
                  l*164\
                  h*164\
                  l*492\
                  h*164\
                  l*164\
                  h*164\
                  l*3116\
                  (h*164 l*328)*7\
                  h*164\
                  l*164\
                  h*328\
                  l*2624\
                  h*2460\
                  l*2460\
                  h*984\
                  l*14924\
                  h*1968\
                  l*492\
                  h*164\
                  l*328\
                  (h*328 l*164)*7\
                  h*164\
                  l*27224\
                  h*164\
                  l*328\
                  h*164\
                  l*3116\
                  h*164\
                  l*164\
                  h*328\
                  l*164\
                  h*164\
                  l*1640\
                  (h*164 l*328)*7\
                  h*164\
                  l*164\
                  h*1640\
                  (l*164 h*328)*7\
                  l*164\
                  h*164\
                  l*1148\
                  h*164\
                  l*3608\
                  h*164\
                  l*164\
                  h*164 l*~

option sigunit   = 1n
option outacc    = 100p
option level     = 3
option initialize random = on
option simperiod = 114964

print \
      clk,\
      rst,\
      start_in,\
      ready_out,\
      score_out,\
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
      score_out,\
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


