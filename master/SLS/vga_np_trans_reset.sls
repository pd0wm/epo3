extern network vga_counter_2bit (terminal clk, rst, rst_ext, en, val_1_0_1, 
                                          val_1_0_0, vss, vdd)
extern network dfa11 (terminal D, CK, R, Q, vss, vdd)
extern network no310 (terminal A, B, C, Y, vss, vdd)
extern network mu111 (terminal A, B, S, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network na310 (terminal A, B, C, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
network vga_np_trans_reset (terminal clk, rst, mem_addr_reset_out_1_0_1, 
                                     mem_addr_reset_out_1_0_0, end_np_line_in, 
                                     end_frame_in, vss, vdd)
{
   {mem_addr_counter} vga_counter_2bit (clk, rst, end_frame_in, 
                                        mem_addr_enable, 
                                        mem_addr_reset_out_1_0_1, 
                                        mem_addr_reset_out_1_0_0, vss, vdd);
   {counter_state_reg_0_inst} dfa11 (n10, clk, rst, counter_state_0_port, vss, 
                                     vdd);
   {counter_state_reg_4_inst} dfa11 (n8, clk, rst, counter_state_4_port, vss, 
                                     vdd);
   {counter_state_reg_1_inst} dfa11 (n6, clk, rst, counter_state_1_port, vss, 
                                     vdd);
   {counter_state_reg_2_inst} dfa11 (n4, clk, rst, counter_state_2_port, vss, 
                                     vdd);
   {counter_state_reg_3_inst} dfa11 (n2, clk, rst, counter_state_3_port, vss, 
                                     vdd);
   {U3} no210 (end_frame_in, n1, n2, vss, vdd);
   {U4} iv110 (N27, n1, vss, vdd);
   {U5} no210 (end_frame_in, n3, n4, vss, vdd);
   {U6} iv110 (N26, n3, vss, vdd);
   {U7} no210 (end_frame_in, n5, n6, vss, vdd);
   {U8} iv110 (N25, n5, vss, vdd);
   {U9} no210 (end_frame_in, n7, n8, vss, vdd);
   {U10} iv110 (N28, n7, vss, vdd);
   {U11} no210 (end_frame_in, n9, n10, vss, vdd);
   {U12} iv110 (N24, n9, vss, vdd);
   {U36} no310 (n28_port, n29, n30, mem_addr_enable, vss, vdd);
   {U37} iv110 (n31, n30, vss, vdd);
   {U38} na210 (n32, n33, N28, vss, vdd);
   {U39} na310 (n34, counter_state_3_port, n35, n33, vss, vdd);
   {U40} no210 (counter_state_4_port, n29, n35, vss, vdd);
   {U41} na210 (counter_state_4_port, n36, n32, vss, vdd);
   {U42} mu111 (n37, n36, counter_state_3_port, N27, vss, vdd);
   {U43} na210 (end_np_line_in, n38, n36, vss, vdd);
   {U44} no210 (n29, n39, n37, vss, vdd);
   {U45} mu111 (n40, n41, counter_state_2_port, N26, vss, vdd);
   {U46} iv110 (n42, n41, vss, vdd);
   {U47} no210 (n43, n44, n42, vss, vdd);
   {U48} no310 (n39, n45, n44, n40, vss, vdd);
   {U49} mu111 (n43, n46, n44, N25, vss, vdd);
   {U50} iv110 (counter_state_1_port, n44, vss, vdd);
   {U51} no210 (n45, n39, n46, vss, vdd);
   {U52} iv110 (counter_state_0_port, n45, vss, vdd);
   {U53} na210 (end_np_line_in, counter_state_0_port, n43, vss, vdd);
   {U54} mu111 (n34, n28_port, counter_state_0_port, N24, vss, vdd);
   {U55} iv110 (end_np_line_in, n28_port, vss, vdd);
   {U56} iv110 (n39, n34, vss, vdd);
   {U57} na210 (end_np_line_in, n47, n39, vss, vdd);
   {U58} na210 (n31, n38, n47, vss, vdd);
   {U59} iv110 (n29, n38, vss, vdd);
   {U60} na310 (counter_state_1_port, counter_state_0_port, 
                counter_state_2_port, n29, vss, vdd);
   {U61} no210 (n48, counter_state_3_port, n31, vss, vdd);
   {U62} iv110 (counter_state_4_port, n48, vss, vdd);
}



