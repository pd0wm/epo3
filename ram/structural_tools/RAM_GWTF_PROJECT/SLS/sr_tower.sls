extern network bit4 (terminal do_2, addr1_1, addr1_2, addr2_1, addr2_2, we1, 
                              we2, we3, we4, we_com, re_1, re_2, clk, rst, di, 
                              do_1, vss, vdd)
extern network demux8_inv (terminal di, do_7_0_7, do_7_0_6, do_7_0_5, do_7_0_4, 
                                    do_7_0_3, do_7_0_2, do_7_0_1, do_7_0_0, 
                                    s_2_0_2, s_2_0_1, s_2_0_0, vss, vdd)
extern network dec8 (terminal do_7_0_7, do_7_0_6, do_7_0_5, do_7_0_4, do_7_0_3, 
                              do_7_0_2, do_7_0_1, do_7_0_0, s_2_0_2, s_2_0_1, 
                              s_2_0_0, vss, vdd)
extern network demux4_inv (terminal di, do_3_0_3, do_3_0_2, do_3_0_1, do_3_0_0, 
                                    s_1_0_1, s_1_0_0, vss, vdd)
network sr_tower (terminal clk, rst, di, do1, do2, we, addr1_4_0_4, 
                           addr1_4_0_3, addr1_4_0_2, addr1_4_0_1, addr1_4_0_0, 
                           addr2_4_0_4, addr2_4_0_3, addr2_4_0_2, addr2_4_0_1, 
                           addr2_4_0_0, vss, vdd)
{
   {bit4_mod_0} bit4 (do2, addr1_4_0_0, addr1_4_0_1, addr2_4_0_0, addr2_4_0_1, 
                      we_i_0_port, we_i_1_port, we_i_2_port, we_i_3_port, 
                      we_com_0_port, re_1_0_port, re_2_0_port, clk, rst, di, 
                      do1, vss, vdd);
   {bit4_mod_1} bit4 (do2, addr1_4_0_0, addr1_4_0_1, addr2_4_0_0, addr2_4_0_1, 
                      we_i_0_port, we_i_1_port, we_i_2_port, we_i_3_port, 
                      we_com_1_port, re_1_1_port, re_2_1_port, clk, rst, di, 
                      do1, vss, vdd);
   {bit4_mod_2} bit4 (do2, addr1_4_0_0, addr1_4_0_1, addr2_4_0_0, addr2_4_0_1, 
                      we_i_0_port, we_i_1_port, we_i_2_port, we_i_3_port, 
                      we_com_2_port, re_1_2_port, re_2_2_port, clk, rst, di, 
                      do1, vss, vdd);
   {bit4_mod_3} bit4 (do2, addr1_4_0_0, addr1_4_0_1, addr2_4_0_0, addr2_4_0_1, 
                      we_i_0_port, we_i_1_port, we_i_2_port, we_i_3_port, 
                      we_com_3_port, re_1_3_port, re_2_3_port, clk, rst, di, 
                      do1, vss, vdd);
   {bit4_mod_4} bit4 (do2, addr1_4_0_0, addr1_4_0_1, addr2_4_0_0, addr2_4_0_1, 
                      we_i_0_port, we_i_1_port, we_i_2_port, we_i_3_port, 
                      we_com_4_port, re_1_4_port, re_2_4_port, clk, rst, di, 
                      do1, vss, vdd);
   {bit4_mod_5} bit4 (do2, addr1_4_0_0, addr1_4_0_1, addr2_4_0_0, addr2_4_0_1, 
                      we_i_0_port, we_i_1_port, we_i_2_port, we_i_3_port, 
                      we_com_5_port, re_1_5_port, re_2_5_port, clk, rst, di, 
                      do1, vss, vdd);
   {bit4_mod_6} bit4 (do2, addr1_4_0_0, addr1_4_0_1, addr2_4_0_0, addr2_4_0_1, 
                      we_i_0_port, we_i_1_port, we_i_2_port, we_i_3_port, 
                      we_com_6_port, re_1_6_port, re_2_6_port, clk, rst, di, 
                      do1, vss, vdd);
   {bit4_mod_7} bit4 (do2, addr1_4_0_0, addr1_4_0_1, addr2_4_0_0, addr2_4_0_1, 
                      we_i_0_port, we_i_1_port, we_i_2_port, we_i_3_port, 
                      we_com_7_port, re_1_7_port, re_2_7_port, clk, rst, di, 
                      do1, vss, vdd);
   {demux8_inv_we_com} demux8_inv (we, we_com_7_port, we_com_6_port, 
                                   we_com_5_port, we_com_4_port, we_com_3_port, 
                                   we_com_2_port, we_com_1_port, we_com_0_port, 
                                   addr1_4_0_4, addr1_4_0_3, addr1_4_0_2, vss, 
                                   vdd);
   {dec8_re_1} dec8 (re_1_7_port, re_1_6_port, re_1_5_port, re_1_4_port, 
                     re_1_3_port, re_1_2_port, re_1_1_port, re_1_0_port, 
                     addr1_4_0_4, addr1_4_0_3, addr1_4_0_2, vss, vdd);
   {dec8_re_2} dec8 (re_2_7_port, re_2_6_port, re_2_5_port, re_2_4_port, 
                     re_2_3_port, re_2_2_port, re_2_1_port, re_2_0_port, 
                     addr2_4_0_4, addr2_4_0_3, addr2_4_0_2, vss, vdd);
   {demux4_inv_we_i} demux4_inv (we, we_i_3_port, we_i_2_port, we_i_1_port, 
                                 we_i_0_port, addr1_4_0_1, addr1_4_0_0, vss, 
                                 vdd);
}



