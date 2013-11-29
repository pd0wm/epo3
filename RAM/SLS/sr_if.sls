extern network sr_tower (terminal clk, rst, di, do1, do2, we, addr1_4_0_4, 
                                  addr1_4_0_3, addr1_4_0_2, addr1_4_0_1, 
                                  addr1_4_0_0, addr2_4_0_4, addr2_4_0_3, 
                                  addr2_4_0_2, addr2_4_0_1, addr2_4_0_0, vss, 
                                  vdd)
extern network mux5 (terminal di_4_0_4, di_4_0_3, di_4_0_2, di_4_0_1, di_4_0_0, 
                              do, s_2_0_2, s_2_0_1, s_2_0_0, vss, vdd)
extern network demux5 (terminal di, do_4_0_4, do_4_0_3, do_4_0_2, do_4_0_1, 
                                do_4_0_0, s_2_0_2, s_2_0_1, s_2_0_0, vss, vdd)
extern network dfa11 (terminal D, CK, R, Q, vss, vdd)
extern network buf40 (terminal A, Y, vss, vdd)
network sr_if (terminal clk, rst, di, do1, do2, we, addr1_7_0_7, addr1_7_0_6, 
                        addr1_7_0_5, addr1_7_0_4, addr1_7_0_3, addr1_7_0_2, 
                        addr1_7_0_1, addr1_7_0_0, addr2_7_0_7, addr2_7_0_6, 
                        addr2_7_0_5, addr2_7_0_4, addr2_7_0_3, addr2_7_0_2, 
                        addr2_7_0_1, addr2_7_0_0, vss, vdd)
{
   {tower_mod_0} sr_tower (clk, rst, di, do1_i_0_port, do2_i_0_port, n2, 
                           addr1_7_0_4, addr1_7_0_3, addr1_7_0_2, addr1_7_0_1, 
                           addr1_7_0_0, addr2_7_0_4, addr2_7_0_3, addr2_7_0_2, 
                           addr2_7_0_1, addr2_7_0_0, vss, vdd);
   {tower_mod_1} sr_tower (clk, rst, di, do1_i_1_port, do2_i_1_port, n3, 
                           addr1_7_0_4, addr1_7_0_3, addr1_7_0_2, addr1_7_0_1, 
                           addr1_7_0_0, addr2_7_0_4, addr2_7_0_3, addr2_7_0_2, 
                           addr2_7_0_1, addr2_7_0_0, vss, vdd);
   {tower_mod_2} sr_tower (clk, rst, di, do1_i_2_port, do2_i_2_port, n4, 
                           addr1_7_0_4, addr1_7_0_3, addr1_7_0_2, addr1_7_0_1, 
                           addr1_7_0_0, addr2_7_0_4, addr2_7_0_3, addr2_7_0_2, 
                           addr2_7_0_1, addr2_7_0_0, vss, vdd);
   {tower_mod_3} sr_tower (clk, rst, di, do1_i_3_port, do2_i_3_port, n5, 
                           addr1_7_0_4, addr1_7_0_3, addr1_7_0_2, addr1_7_0_1, 
                           addr1_7_0_0, addr2_7_0_4, addr2_7_0_3, addr2_7_0_2, 
                           addr2_7_0_1, addr2_7_0_0, vss, vdd);
   {tower_mod_4} sr_tower (clk, rst, di, do1_i_4_port, do2_i_4_port, n1, 
                           addr1_7_0_4, addr1_7_0_3, addr1_7_0_2, addr1_7_0_1, 
                           addr1_7_0_0, addr2_7_0_4, addr2_7_0_3, addr2_7_0_2, 
                           addr2_7_0_1, addr2_7_0_0, vss, vdd);
   {mux5_do1} mux5 (do1_i_4_port, do1_i_3_port, do1_i_2_port, do1_i_1_port, 
                    do1_i_0_port, do1_buf, addr1_7_0_7, addr1_7_0_6, 
                    addr1_7_0_5, vss, vdd);
   {mux5_do2} mux5 (do2_i_4_port, do2_i_3_port, do2_i_2_port, do2_i_1_port, 
                    do2_i_0_port, do2_buf, addr2_7_0_7, addr2_7_0_6, 
                    addr2_7_0_5, vss, vdd);
   {demux5_we} demux5 (we, we_i_4_port, we_i_3_port, we_i_2_port, we_i_1_port, 
                       we_i_0_port, addr1_7_0_7, addr1_7_0_6, addr1_7_0_5, vss, 
                       vdd);
   {do1_reg} dfa11 (do1_buf, clk, rst, do1, vss, vdd);
   {do2_reg} dfa11 (do2_buf, clk, rst, do2, vss, vdd);
   {U3} buf40 (we_i_4_port, n1, vss, vdd);
   {U4} buf40 (we_i_0_port, n2, vss, vdd);
   {U5} buf40 (we_i_1_port, n3, vss, vdd);
   {U6} buf40 (we_i_2_port, n4, vss, vdd);
   {U7} buf40 (we_i_3_port, n5, vss, vdd);
}



