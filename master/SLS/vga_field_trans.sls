extern network vga_counter_8bitset (terminal clk, rst, rst_ext, en, set, 
                                             di_7_0_7, di_7_0_6, di_7_0_5, 
                                             di_7_0_4, di_7_0_3, di_7_0_2, 
                                             di_7_0_1, di_7_0_0, val_7_0_7, 
                                             val_7_0_6, val_7_0_5, val_7_0_4, 
                                             val_7_0_3, val_7_0_2, val_7_0_1, 
                                             val_7_0_0, vss, vdd)
extern network dfa11 (terminal D, CK, R, Q, vss, vdd)
extern network no310 (terminal A, B, C, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
extern network mu111 (terminal A, B, S, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network ex210 (terminal A, B, Y, vss, vdd)
network vga_field_trans (terminal clk, rst, mem_addr_reset_in_3_0_3, 
                                  mem_addr_reset_in_3_0_2, 
                                  mem_addr_reset_in_3_0_1, 
                                  mem_addr_reset_in_3_0_0, mem_addr_out_7_0_7, 
                                  mem_addr_out_7_0_6, mem_addr_out_7_0_5, 
                                  mem_addr_out_7_0_4, mem_addr_out_7_0_3, 
                                  mem_addr_out_7_0_2, mem_addr_out_7_0_1, 
                                  mem_addr_out_7_0_0, in_field_in, new_line_in, 
                                  new_frame_in, vss, vdd)
{
   {mem_addr_counter} vga_counter_8bitset (clk, rst, X_Logic0_port, 
                                           mem_addr_enable, n9, X_Logic0_port, 
                                           mem_addr_reset_in_3_0_3, 
                                           mem_addr_reset_in_3_0_2, 
                                           mem_addr_reset_in_3_0_1, 
                                           mem_addr_reset_in_3_0_0, 
                                           X_Logic0_port, X_Logic0_port, 
                                           X_Logic0_port, mem_addr_out_7_0_7, 
                                           mem_addr_out_7_0_6, 
                                           mem_addr_out_7_0_5, 
                                           mem_addr_out_7_0_4, 
                                           mem_addr_out_7_0_3, 
                                           mem_addr_out_7_0_2, 
                                           mem_addr_out_7_0_1, 
                                           mem_addr_out_7_0_0, vss, vdd);
   net {X_Logic0_port, vss};
   {counter_state_reg_0_inst} dfa11 (n6, clk, rst, counter_state_0_port, vss, 
                                     vdd);
   {counter_state_reg_1_inst} dfa11 (n4, clk, rst, counter_state_1_port, vss, 
                                     vdd);
   {counter_state_reg_2_inst} dfa11 (n2, clk, rst, counter_state_2_port, vss, 
                                     vdd);
   {U3} na210 (N18, n11, n1, vss, vdd);
   {U4} iv110 (n1, n2, vss, vdd);
   {U5} na210 (N17, n11, n3, vss, vdd);
   {U6} iv110 (n3, n4, vss, vdd);
   {U7} na210 (N16, n11, n5, vss, vdd);
   {U8} iv110 (n5, n6, vss, vdd);
   {U24} iv110 (n11, n9, vss, vdd);
   {U25} no210 (new_frame_in, new_line_in, n11, vss, vdd);
   {U26} no310 (n18_port, counter_state_1_port, n19, mem_addr_enable, vss, vdd);
   {U27} iv110 (counter_state_2_port, n18_port, vss, vdd);
   {U28} mu111 (n20, n19, counter_state_2_port, N18, vss, vdd);
   {U29} no210 (n19, n21, n20, vss, vdd);
   {U30} iv110 (counter_state_1_port, n21, vss, vdd);
   {U31} mu111 (n22, n19, counter_state_1_port, N17, vss, vdd);
   {U32} no210 (counter_state_2_port, n19, n22, vss, vdd);
   {U33} na210 (in_field_in, counter_state_0_port, n19, vss, vdd);
   {U34} ex210 (in_field_in, counter_state_0_port, N16, vss, vdd);
}



