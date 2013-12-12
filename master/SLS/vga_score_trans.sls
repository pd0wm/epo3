extern network vga_counter_3bit (terminal clk, rst, rst_ext, en, val_2_0_2, 
                                          val_2_0_1, val_2_0_0, vss, vdd)
extern network dfa11 (terminal D, CK, R, Q, vss, vdd)
extern network no310 (terminal A, B, C, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network mu111 (terminal A, B, S, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
extern network na310 (terminal A, B, C, Y, vss, vdd)
network vga_score_trans (terminal clk, rst, mem_addr_out_7_0_7, 
                                  mem_addr_out_7_0_6, mem_addr_out_7_0_5, 
                                  mem_addr_out_7_0_4, mem_addr_out_7_0_3, 
                                  mem_addr_out_7_0_2, mem_addr_out_7_0_1, 
                                  mem_addr_out_7_0_0, end_score_line_in, 
                                  end_frame_in, vss, vdd)
{
   net {mem_addr_out_7_0_7, X_Logic1_port};
   net {mem_addr_out_7_0_6, X_Logic0_port};
   net {mem_addr_out_7_0_5, X_Logic0_port};
   net {mem_addr_out_7_0_4, X_Logic1_port};
   net {mem_addr_out_7_0_3, X_Logic0_port};
   net {mem_addr_out_7_0_2, mem_addr_out_2_port};
   net {mem_addr_out_7_0_1, mem_addr_out_1_port};
   net {mem_addr_out_7_0_0, mem_addr_out_0_port};
   {mem_addr_counter} vga_counter_3bit (clk, rst, end_frame_in, 
                                        mem_addr_enable, mem_addr_out_2_port, 
                                        mem_addr_out_1_port, 
                                        mem_addr_out_0_port, vss, vdd);
   net {X_Logic1_port, vdd};
   net {X_Logic0_port, vss};
   {counter_state_reg_0_inst} dfa11 (n10, clk, rst, counter_state_0_port, vss, 
                                     vdd);
   {counter_state_reg_1_inst} dfa11 (n8, clk, rst, counter_state_1_port, vss, 
                                     vdd);
   {counter_state_reg_2_inst} dfa11 (n6, clk, rst, counter_state_2_port, vss, 
                                     vdd);
   {counter_state_reg_3_inst} dfa11 (n4, clk, rst, counter_state_3_port, vss, 
                                     vdd);
   {counter_state_reg_4_inst} dfa11 (n2, clk, rst, counter_state_4_port, vss, 
                                     vdd);
   {U3} no210 (end_frame_in, n1, n2, vss, vdd);
   {U4} iv110 (N23, n1, vss, vdd);
   {U5} no210 (end_frame_in, n3, n4, vss, vdd);
   {U6} iv110 (N22, n3, vss, vdd);
   {U7} no210 (end_frame_in, n5, n6, vss, vdd);
   {U8} iv110 (N21, n5, vss, vdd);
   {U9} no210 (end_frame_in, n7, n8, vss, vdd);
   {U10} iv110 (N20, n7, vss, vdd);
   {U11} no210 (end_frame_in, n9, n10, vss, vdd);
   {U12} iv110 (N19, n9, vss, vdd);
   {U35} no210 (n27, n28, mem_addr_enable, vss, vdd);
   {U36} na210 (n29, n30, N23, vss, vdd);
   {U37} na310 (counter_state_3_port, n31, n32, n30, vss, vdd);
   {U38} na210 (counter_state_4_port, n33, n29, vss, vdd);
   {U39} iv110 (n34, n33, vss, vdd);
   {U40} no210 (n35, n32, n34, vss, vdd);
   {U41} mu111 (n36, n35, counter_state_3_port, N22, vss, vdd);
   {U42} na210 (end_score_line_in, n31, n35, vss, vdd);
   {U43} no210 (n37, n38, n36, vss, vdd);
   {U44} mu111 (n39, n40, counter_state_2_port, N21, vss, vdd);
   {U45} iv110 (n41, n40, vss, vdd);
   {U46} no210 (n42, n43, n41, vss, vdd);
   {U47} no310 (n38, n44, n43, n39, vss, vdd);
   {U48} mu111 (n42, n45, n43, N20, vss, vdd);
   {U49} iv110 (counter_state_1_port, n43, vss, vdd);
   {U50} no210 (n44, n38, n45, vss, vdd);
   {U51} iv110 (counter_state_0_port, n44, vss, vdd);
   {U52} na210 (end_score_line_in, counter_state_0_port, n42, vss, vdd);
   {U53} mu111 (n32, n28, counter_state_0_port, N19, vss, vdd);
   {U54} iv110 (end_score_line_in, n28, vss, vdd);
   {U55} iv110 (n38, n32, vss, vdd);
   {U56} na210 (end_score_line_in, n27, n38, vss, vdd);
   {U57} na310 (counter_state_3_port, n31, counter_state_4_port, n27, vss, vdd);
   {U58} iv110 (n37, n31, vss, vdd);
   {U59} na310 (counter_state_1_port, counter_state_0_port, 
                counter_state_2_port, n37, vss, vdd);
}



