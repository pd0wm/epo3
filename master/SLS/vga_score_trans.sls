extern network dfa11 (terminal D, CK, R, Q, vss, vdd)
extern network ex210 (terminal A, B, Y, vss, vdd)
extern network no310 (terminal A, B, C, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network mu111 (terminal A, B, S, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network na310 (terminal A, B, C, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
network vga_score_trans (terminal clk, rst, mem_addr_out_7_0_7, 
                                  mem_addr_out_7_0_6, mem_addr_out_7_0_5, 
                                  mem_addr_out_7_0_4, mem_addr_out_7_0_3, 
                                  mem_addr_out_7_0_2, mem_addr_out_7_0_1, 
                                  mem_addr_out_7_0_0, end_score_line_in, 
                                  end_frame_in, vss, vdd)
{
   net {mem_addr_out_7_0_7, X_Logic1_port};
   net {mem_addr_out_7_0_6, mem_addr_out_6};
   net {mem_addr_out_7_0_5, mem_addr_out_5};
   net {mem_addr_out_7_0_4, X_Logic1_port};
   net {mem_addr_out_7_0_3, mem_addr_out_3_port};
   net {mem_addr_out_7_0_2, mem_addr_out_2_port};
   net {mem_addr_out_7_0_1, mem_addr_out_1_port};
   net {mem_addr_out_7_0_0, mem_addr_out_0_port};
   net {X_Logic1_port, vdd};
   {counter_state_reg_0_inst} dfa11 (n26, clk, rst, counter_state_0_port, vss, 
                                     vdd);
   {mem_addr_state_reg_0_inst} dfa11 (n22, clk, rst, mem_addr_out_0_port, vss, 
                                      vdd);
   {mem_addr_state_reg_1_inst} dfa11 (n20, clk, rst, mem_addr_out_1_port, vss, 
                                      vdd);
   {mem_addr_state_reg_2_inst} dfa11 (n18, clk, rst, mem_addr_out_2_port, vss, 
                                      vdd);
   {mem_addr_state_reg_3_inst} dfa11 (n16, clk, rst, mem_addr_out_3_port, vss, 
                                      vdd);
   {mem_addr_state_reg_4_inst} dfa11 (n14, clk, rst, mem_addr_state_4, vss, 
                                      vdd);
   {mem_addr_state_reg_5_inst} dfa11 (n12, clk, rst, mem_addr_out_5, vss, vdd);
   {mem_addr_state_reg_6_inst} dfa11 (n10, clk, rst, mem_addr_out_6, vss, vdd);
   {counter_state_reg_1_inst} dfa11 (n8, clk, rst, counter_state_1_port, vss, 
                                     vdd);
   {counter_state_reg_2_inst} dfa11 (n6, clk, rst, counter_state_2_port, vss, 
                                     vdd);
   {counter_state_reg_3_inst} dfa11 (n4, clk, rst, counter_state_3_port, vss, 
                                     vdd);
   {counter_state_reg_4_inst} dfa11 (n2, clk, rst, counter_state_4_port, vss, 
                                     vdd);
   {U3} no210 (end_frame_in, n1, n2, vss, vdd);
   {U4} iv110 (N40, n1, vss, vdd);
   {U5} no210 (end_frame_in, n3, n4, vss, vdd);
   {U6} iv110 (N39, n3, vss, vdd);
   {U7} no210 (end_frame_in, n5, n6, vss, vdd);
   {U8} iv110 (N38, n5, vss, vdd);
   {U9} no210 (end_frame_in, n7, n8, vss, vdd);
   {U10} iv110 (N37, n7, vss, vdd);
   {U11} no210 (end_frame_in, n9, n10, vss, vdd);
   {U12} iv110 (N47, n9, vss, vdd);
   {U13} no210 (end_frame_in, n11, n12, vss, vdd);
   {U14} iv110 (N46, n11, vss, vdd);
   {U15} no210 (end_frame_in, n13, n14, vss, vdd);
   {U16} iv110 (N45, n13, vss, vdd);
   {U17} no210 (end_frame_in, n15, n16, vss, vdd);
   {U18} iv110 (N44, n15, vss, vdd);
   {U19} no210 (end_frame_in, n17, n18, vss, vdd);
   {U20} iv110 (N43, n17, vss, vdd);
   {U21} no210 (end_frame_in, n19, n20, vss, vdd);
   {U22} iv110 (N42, n19, vss, vdd);
   {U23} no210 (end_frame_in, n21, n22, vss, vdd);
   {U24} iv110 (N41, n21, vss, vdd);
   {U27} no210 (end_frame_in, n25, n26, vss, vdd);
   {U28} iv110 (N36, n25, vss, vdd);
   {U76} iv110 (n61, N47, vss, vdd);
   {U77} ex210 (mem_addr_out_6, n62, n61, vss, vdd);
   {U78} na210 (n63, mem_addr_out_5, n62, vss, vdd);
   {U79} ex210 (mem_addr_out_5, n63, N46, vss, vdd);
   {U80} iv110 (n64, n63, vss, vdd);
   {U81} na310 (mem_addr_state_4, mem_addr_out_3_port, n65, n64, vss, vdd);
   {U82} iv110 (n66, N45, vss, vdd);
   {U83} ex210 (mem_addr_state_4, n67, n66, vss, vdd);
   {U84} na210 (n65, mem_addr_out_3_port, n67, vss, vdd);
   {U85} ex210 (mem_addr_out_3_port, n65, N44, vss, vdd);
   {U86} no210 (n68, n69, n65, vss, vdd);
   {U87} na310 (mem_addr_out_1_port, mem_addr_out_0_port, mem_addr_out_2_port, 
                n69, vss, vdd);
   {U88} iv110 (n70, N43, vss, vdd);
   {U89} ex210 (mem_addr_out_2_port, n71, n70, vss, vdd);
   {U90} na210 (n72, mem_addr_out_1_port, n71, vss, vdd);
   {U91} ex210 (mem_addr_out_1_port, n72, N42, vss, vdd);
   {U92} no210 (n68, n73, n72, vss, vdd);
   {U93} ex210 (n73, n68, N41, vss, vdd);
   {U94} iv110 (n74, n68, vss, vdd);
   {U95} no210 (n75, n76, n74, vss, vdd);
   {U96} iv110 (mem_addr_out_0_port, n73, vss, vdd);
   {U97} na210 (n77, n78, N40, vss, vdd);
   {U98} na310 (counter_state_3_port, n79, n80, n78, vss, vdd);
   {U99} na210 (counter_state_4_port, n81, n77, vss, vdd);
   {U100} na210 (n82, n83, n81, vss, vdd);
   {U101} iv110 (n84, n82, vss, vdd);
   {U102} mu111 (n85, n84, counter_state_3_port, N39, vss, vdd);
   {U103} na210 (end_score_line_in, n79, n84, vss, vdd);
   {U104} no210 (n86, n83, n85, vss, vdd);
   {U105} mu111 (n87, n88, counter_state_2_port, N38, vss, vdd);
   {U106} na210 (n89, counter_state_1_port, n88, vss, vdd);
   {U107} iv110 (n90, n89, vss, vdd);
   {U108} no310 (n83, n91, n92, n87, vss, vdd);
   {U109} iv110 (counter_state_1_port, n92, vss, vdd);
   {U110} mu111 (n93, n90, counter_state_1_port, N37, vss, vdd);
   {U111} na210 (end_score_line_in, counter_state_0_port, n90, vss, vdd);
   {U112} no210 (n91, n83, n93, vss, vdd);
   {U113} mu111 (n75, n80, n91, N36, vss, vdd);
   {U114} iv110 (counter_state_0_port, n91, vss, vdd);
   {U115} iv110 (n83, n80, vss, vdd);
   {U116} na210 (end_score_line_in, n76, n83, vss, vdd);
   {U117} na310 (counter_state_3_port, n79, counter_state_4_port, n76, vss, 
                 vdd);
   {U118} iv110 (n86, n79, vss, vdd);
   {U119} na310 (counter_state_1_port, counter_state_0_port, 
                 counter_state_2_port, n86, vss, vdd);
   {U120} iv110 (end_score_line_in, n75, vss, vdd);
}



