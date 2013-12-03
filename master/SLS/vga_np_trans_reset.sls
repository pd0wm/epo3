extern network dfa11 (terminal D, CK, R, Q, vss, vdd)
extern network ex210 (terminal A, B, Y, vss, vdd)
extern network no310 (terminal A, B, C, Y, vss, vdd)
extern network mu111 (terminal A, B, S, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network na310 (terminal A, B, C, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
network vga_np_trans_reset (terminal clk, rst, mem_addr_reset_out_7_0_7, 
                                     mem_addr_reset_out_7_0_6, 
                                     mem_addr_reset_out_7_0_5, 
                                     mem_addr_reset_out_7_0_4, 
                                     mem_addr_reset_out_7_0_3, 
                                     mem_addr_reset_out_7_0_2, 
                                     mem_addr_reset_out_7_0_1, 
                                     mem_addr_reset_out_7_0_0, end_np_line_in, 
                                     end_frame_in, vss, vdd)
{
   net {mem_addr_reset_out_7_0_7, mem_addr_reset_out_7_port};
   net {mem_addr_reset_out_7_0_6, mem_addr_reset_out_6_port};
   net {mem_addr_reset_out_7_0_5, mem_addr_reset_out_5_port};
   net {mem_addr_reset_out_7_0_4, mem_addr_reset_out_4_port};
   net {mem_addr_reset_out_7_0_3, mem_addr_reset_out_3_port};
   net {mem_addr_reset_out_7_0_2, mem_addr_reset_out_2_port};
   net {mem_addr_reset_out_7_0_1, N32};
   net {mem_addr_reset_out_7_0_0, N31};
   {counter_state_reg_0_inst} dfa11 (n28_port, clk, rst, counter_state_0_port, 
                                     vss, vdd);
   {mem_addr_state_reg_2_inst} dfa11 (n22, clk, rst, mem_addr_reset_out_2_port, 
                                      vss, vdd);
   {mem_addr_state_reg_3_inst} dfa11 (n20, clk, rst, mem_addr_reset_out_3_port, 
                                      vss, vdd);
   {mem_addr_state_reg_4_inst} dfa11 (n18, clk, rst, mem_addr_reset_out_4_port, 
                                      vss, vdd);
   {mem_addr_state_reg_5_inst} dfa11 (n16, clk, rst, mem_addr_reset_out_5_port, 
                                      vss, vdd);
   {mem_addr_state_reg_6_inst} dfa11 (n14, clk, rst, mem_addr_reset_out_6_port, 
                                      vss, vdd);
   {mem_addr_state_reg_7_inst} dfa11 (n12, clk, rst, mem_addr_reset_out_7_port, 
                                      vss, vdd);
   {counter_state_reg_4_inst} dfa11 (n10, clk, rst, counter_state_4_port, vss, 
                                     vdd);
   {counter_state_reg_1_inst} dfa11 (n8, clk, rst, counter_state_1_port, vss, 
                                     vdd);
   {counter_state_reg_2_inst} dfa11 (n6, clk, rst, counter_state_2_port, vss, 
                                     vdd);
   {counter_state_reg_3_inst} dfa11 (n4, clk, rst, counter_state_3_port, vss, 
                                     vdd);
   {U3} no210 (end_frame_in, n3, n4, vss, vdd);
   {U4} iv110 (N29, n3, vss, vdd);
   {U6} no210 (end_frame_in, n5, n6, vss, vdd);
   {U7} iv110 (N28, n5, vss, vdd);
   {U8} no210 (end_frame_in, n7, n8, vss, vdd);
   {U9} iv110 (N27, n7, vss, vdd);
   {U10} no210 (end_frame_in, n9, n10, vss, vdd);
   {U11} iv110 (N30, n9, vss, vdd);
   {U12} no210 (end_frame_in, n11, n12, vss, vdd);
   {U13} iv110 (N38, n11, vss, vdd);
   {U14} no210 (end_frame_in, n13, n14, vss, vdd);
   {U15} iv110 (N37, n13, vss, vdd);
   {U16} no210 (end_frame_in, n15, n16, vss, vdd);
   {U17} iv110 (N36, n15, vss, vdd);
   {U18} no210 (end_frame_in, n17, n18, vss, vdd);
   {U19} iv110 (N35, n17, vss, vdd);
   {U20} no210 (end_frame_in, n19, n20, vss, vdd);
   {U21} iv110 (N34, n19, vss, vdd);
   {U22} no210 (end_frame_in, n21, n22, vss, vdd);
   {U23} iv110 (N33, n21, vss, vdd);
   {U28} no210 (end_frame_in, n27_port, n28_port, vss, vdd);
   {U29} iv110 (N26, n27_port, vss, vdd);
   net {N31, vss};
   net {N32, vss};
   {U55} ex210 (mem_addr_reset_out_7_port, n46, N38, vss, vdd);
   {U56} no310 (n47, n48, n49, n46, vss, vdd);
   {U57} iv110 (mem_addr_reset_out_6_port, n47, vss, vdd);
   {U58} ex210 (mem_addr_reset_out_6_port, n50, N37, vss, vdd);
   {U59} no210 (n48, n49, n50, vss, vdd);
   {U60} ex210 (n49, n48, N36, vss, vdd);
   {U61} na210 (mem_addr_reset_out_4_port, n51, n48, vss, vdd);
   {U62} iv110 (mem_addr_reset_out_5_port, n49, vss, vdd);
   {U63} ex210 (mem_addr_reset_out_4_port, n51, N35, vss, vdd);
   {U64} no210 (n52, n53, n51, vss, vdd);
   {U65} ex210 (n52, n53, N34, vss, vdd);
   {U66} na210 (mem_addr_reset_out_2_port, n54, n53, vss, vdd);
   {U67} iv110 (mem_addr_reset_out_3_port, n52, vss, vdd);
   {U68} ex210 (mem_addr_reset_out_2_port, n54, N33, vss, vdd);
   {U69} no310 (n55, n56, n57, n54, vss, vdd);
   {U70} na210 (n58, n59, N30, vss, vdd);
   {U71} na310 (n60, counter_state_3_port, n61, n59, vss, vdd);
   {U72} no210 (counter_state_4_port, n56, n61, vss, vdd);
   {U73} na210 (counter_state_4_port, n62, n58, vss, vdd);
   {U74} mu111 (n62, n63, n64, N29, vss, vdd);
   {U75} no210 (n56, n65, n63, vss, vdd);
   {U76} na210 (end_np_line_in, n66, n62, vss, vdd);
   {U77} iv110 (n56, n66, vss, vdd);
   {U78} mu111 (n67, n68, counter_state_2_port, N28, vss, vdd);
   {U79} na210 (n69, counter_state_1_port, n68, vss, vdd);
   {U80} iv110 (n70, n67, vss, vdd);
   {U81} na310 (n60, counter_state_0_port, counter_state_1_port, n70, vss, vdd);
   {U82} mu111 (n71, n72, counter_state_1_port, N27, vss, vdd);
   {U83} iv110 (n69, n72, vss, vdd);
   {U84} no210 (n57, n73, n69, vss, vdd);
   {U85} no210 (n73, n65, n71, vss, vdd);
   {U86} iv110 (n60, n65, vss, vdd);
   {U87} iv110 (counter_state_0_port, n73, vss, vdd);
   {U88} mu111 (n60, n57, counter_state_0_port, N26, vss, vdd);
   {U89} no210 (n57, n74, n60, vss, vdd);
   {U90} no210 (n55, n56, n74, vss, vdd);
   {U91} na310 (counter_state_1_port, counter_state_0_port, 
                counter_state_2_port, n56, vss, vdd);
   {U92} na210 (counter_state_4_port, n64, n55, vss, vdd);
   {U93} iv110 (counter_state_3_port, n64, vss, vdd);
   {U94} iv110 (end_np_line_in, n57, vss, vdd);
}



