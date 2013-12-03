extern network dfa11 (terminal D, CK, R, Q, vss, vdd)
extern network no310 (terminal A, B, C, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
extern network na310 (terminal A, B, C, Y, vss, vdd)
extern network mu111 (terminal A, B, S, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network ex210 (terminal A, B, Y, vss, vdd)
network vga_np_trans (terminal clk, rst, mem_addr_reset_in_7_0_7, 
                               mem_addr_reset_in_7_0_6, 
                               mem_addr_reset_in_7_0_5, 
                               mem_addr_reset_in_7_0_4, 
                               mem_addr_reset_in_7_0_3, 
                               mem_addr_reset_in_7_0_2, 
                               mem_addr_reset_in_7_0_1, 
                               mem_addr_reset_in_7_0_0, mem_addr_out_7_0_7, 
                               mem_addr_out_7_0_6, mem_addr_out_7_0_5, 
                               mem_addr_out_7_0_4, mem_addr_out_7_0_3, 
                               mem_addr_out_7_0_2, mem_addr_out_7_0_1, 
                               mem_addr_out_7_0_0, in_np_in, new_line_in, 
                               new_frame_in, vss, vdd)
{
   net {mem_addr_out_7_0_7, X_Logic1_port};
   net {mem_addr_out_7_0_6, mem_addr_out_6_port};
   net {mem_addr_out_7_0_5, mem_addr_out_5_port};
   net {mem_addr_out_7_0_4, mem_addr_out_4_port};
   net {mem_addr_out_7_0_3, mem_addr_out_3_port};
   net {mem_addr_out_7_0_2, mem_addr_out_2_port};
   net {mem_addr_out_7_0_1, mem_addr_out_1_port};
   net {mem_addr_out_7_0_0, mem_addr_out_0_port};
   net {X_Logic1_port, vdd};
   {counter_state_reg_0_inst} dfa11 (n6, clk, rst, counter_state_0_port, vss, 
                                     vdd);
   {counter_state_reg_1_inst} dfa11 (n4, clk, rst, counter_state_1_port, vss, 
                                     vdd);
   {counter_state_reg_2_inst} dfa11 (n2, clk, rst, counter_state_2_port, vss, 
                                     vdd);
   {mem_addr_state_reg_0_inst} dfa11 (n54, clk, rst, mem_addr_out_0_port, vss, 
                                      vdd);
   {mem_addr_state_reg_1_inst} dfa11 (n53, clk, rst, mem_addr_out_1_port, vss, 
                                      vdd);
   {mem_addr_state_reg_2_inst} dfa11 (n52, clk, rst, mem_addr_out_2_port, vss, 
                                      vdd);
   {mem_addr_state_reg_3_inst} dfa11 (n51, clk, rst, mem_addr_out_3_port, vss, 
                                      vdd);
   {mem_addr_state_reg_4_inst} dfa11 (n50, clk, rst, mem_addr_out_4_port, vss, 
                                      vdd);
   {mem_addr_state_reg_5_inst} dfa11 (n49, clk, rst, mem_addr_out_5_port, vss, 
                                      vdd);
   {mem_addr_state_reg_6_inst} dfa11 (n48, clk, rst, mem_addr_out_6_port, vss, 
                                      vdd);
   {U3} na210 (N28, n40, n1, vss, vdd);
   {U4} iv110 (n1, n2, vss, vdd);
   {U5} na210 (N27, n40, n3, vss, vdd);
   {U6} iv110 (n3, n4, vss, vdd);
   {U7} na210 (N26, n40, n5, vss, vdd);
   {U8} iv110 (n5, n6, vss, vdd);
   {U60} na210 (n55, n56, n54, vss, vdd);
   {U61} na210 (mem_addr_reset_in_7_0_0, n57, n56, vss, vdd);
   {U62} mu111 (n58, n59, mem_addr_out_0_port, n55, vss, vdd);
   {U63} na210 (n60, n61, n53, vss, vdd);
   {U64} na210 (mem_addr_reset_in_7_0_1, n57, n61, vss, vdd);
   {U65} mu111 (n62, n63, mem_addr_out_1_port, n60, vss, vdd);
   {U66} na210 (n64, mem_addr_out_0_port, n62, vss, vdd);
   {U67} na210 (n65, n66, n52, vss, vdd);
   {U68} na210 (mem_addr_reset_in_7_0_2, n57, n66, vss, vdd);
   {U69} mu111 (n67, n68, mem_addr_out_2_port, n65, vss, vdd);
   {U70} no210 (n69, n70, n68, vss, vdd);
   {U71} iv110 (n63, n70, vss, vdd);
   {U72} no210 (n71, n72, n63, vss, vdd);
   {U73} no210 (n58, mem_addr_out_0_port, n72, vss, vdd);
   {U74} no210 (mem_addr_out_1_port, n58, n69, vss, vdd);
   {U75} na310 (n64, mem_addr_out_0_port, mem_addr_out_1_port, n67, vss, vdd);
   {U76} na210 (n73, n74, n51, vss, vdd);
   {U77} na210 (mem_addr_reset_in_7_0_3, n57, n74, vss, vdd);
   {U78} mu111 (n75, n76, mem_addr_out_3_port, n73, vss, vdd);
   {U79} iv110 (n77, n76, vss, vdd);
   {U80} na210 (n78, n64, n75, vss, vdd);
   {U81} na210 (n79, n80, n50, vss, vdd);
   {U82} na210 (mem_addr_reset_in_7_0_4, n57, n80, vss, vdd);
   {U83} mu111 (n81, n82, mem_addr_out_4_port, n79, vss, vdd);
   {U84} no210 (n83, n77, n82, vss, vdd);
   {U85} na210 (n59, n84, n77, vss, vdd);
   {U86} na210 (n64, n85, n84, vss, vdd);
   {U87} no210 (mem_addr_out_3_port, n58, n83, vss, vdd);
   {U88} na310 (n78, n64, mem_addr_out_3_port, n81, vss, vdd);
   {U89} na210 (n86, n87, n49, vss, vdd);
   {U90} na210 (mem_addr_reset_in_7_0_5, n57, n87, vss, vdd);
   {U91} mu111 (n88, n89, mem_addr_out_5_port, n86, vss, vdd);
   {U92} iv110 (n90, n89, vss, vdd);
   {U93} na210 (n91, n64, n88, vss, vdd);
   {U94} na210 (n92, n93, n48, vss, vdd);
   {U95} na210 (mem_addr_reset_in_7_0_6, n57, n93, vss, vdd);
   {U96} mu111 (n94, n95, mem_addr_out_6_port, n92, vss, vdd);
   {U97} no210 (n96, n90, n95, vss, vdd);
   {U98} na210 (n59, n97, n90, vss, vdd);
   {U99} na210 (n64, n98, n97, vss, vdd);
   {U100} no210 (mem_addr_out_5_port, n58, n96, vss, vdd);
   {U101} na310 (n91, n64, mem_addr_out_5_port, n94, vss, vdd);
   {U102} iv110 (n58, n64, vss, vdd);
   {U103} na210 (n40, n59, n58, vss, vdd);
   {U104} iv110 (n71, n59, vss, vdd);
   {U105} no210 (n57, n99, n71, vss, vdd);
   {U106} no310 (n100, counter_state_1_port, n101, n99, vss, vdd);
   {U107} iv110 (counter_state_2_port, n101, vss, vdd);
   {U108} iv110 (n40, n57, vss, vdd);
   {U109} iv110 (n98, n91, vss, vdd);
   {U110} na310 (mem_addr_out_3_port, n78, mem_addr_out_4_port, n98, vss, vdd);
   {U111} iv110 (n85, n78, vss, vdd);
   {U112} na310 (mem_addr_out_1_port, mem_addr_out_0_port, mem_addr_out_2_port, 
                 n85, vss, vdd);
   {U113} no210 (new_line_in, new_frame_in, n40, vss, vdd);
   {U114} na210 (n102, n103, N28, vss, vdd);
   {U115} na210 (counter_state_1_port, n104, n103, vss, vdd);
   {U116} na210 (counter_state_2_port, n100, n102, vss, vdd);
   {U117} mu111 (n104, n100, counter_state_1_port, N27, vss, vdd);
   {U118} no210 (n100, counter_state_2_port, n104, vss, vdd);
   {U119} na210 (in_np_in, counter_state_0_port, n100, vss, vdd);
   {U120} ex210 (in_np_in, counter_state_0_port, N26, vss, vdd);
}



