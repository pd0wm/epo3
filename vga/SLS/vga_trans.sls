extern network dfa11 (terminal D, CK, R, Q, vss, vdd)
extern network mu111 (terminal A, B, S, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
extern network na310 (terminal A, B, C, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network ex210 (terminal A, B, Y, vss, vdd)
network vga_trans (terminal clk, rst, mem_addr_reset_in_6_0_6, 
                            mem_addr_reset_in_6_0_5, mem_addr_reset_in_6_0_4, 
                            mem_addr_reset_in_6_0_3, mem_addr_reset_in_6_0_2, 
                            mem_addr_reset_in_6_0_1, mem_addr_reset_in_6_0_0, 
                            mem_addr_out_6_0_6, mem_addr_out_6_0_5, 
                            mem_addr_out_6_0_4, mem_addr_out_6_0_3, 
                            mem_addr_out_6_0_2, mem_addr_out_6_0_1, 
                            mem_addr_out_6_0_0, in_field_in, new_line_in, 
                            new_frame_in, vss, vdd)
{
   net {mem_addr_out_6_0_6, mem_addr_out_6_port};
   net {mem_addr_out_6_0_5, mem_addr_out_5_port};
   net {mem_addr_out_6_0_4, mem_addr_out_4_port};
   net {mem_addr_out_6_0_3, mem_addr_out_3_port};
   net {mem_addr_out_6_0_2, mem_addr_out_2_port};
   net {mem_addr_out_6_0_1, mem_addr_out_1_port};
   net {mem_addr_out_6_0_0, mem_addr_out_0_port};
   {counter_state_reg_0_inst} dfa11 (n4, clk, rst, counter_state_0_port, vss, 
                                     vdd);
   {counter_state_reg_1_inst} dfa11 (n2, clk, rst, counter_state_1_port, vss, 
                                     vdd);
   {mem_addr_state_reg_6_inst} dfa11 (n35, clk, rst, mem_addr_out_6_port, vss, 
                                      vdd);
   {mem_addr_state_reg_0_inst} dfa11 (n41, clk, rst, mem_addr_out_0_port, vss, 
                                      vdd);
   {mem_addr_state_reg_1_inst} dfa11 (n40, clk, rst, mem_addr_out_1_port, vss, 
                                      vdd);
   {mem_addr_state_reg_2_inst} dfa11 (n39, clk, rst, mem_addr_out_2_port, vss, 
                                      vdd);
   {mem_addr_state_reg_3_inst} dfa11 (n38, clk, rst, mem_addr_out_3_port, vss, 
                                      vdd);
   {mem_addr_state_reg_4_inst} dfa11 (n37, clk, rst, mem_addr_out_4_port, vss, 
                                      vdd);
   {mem_addr_state_reg_5_inst} dfa11 (n36, clk, rst, mem_addr_out_5_port, vss, 
                                      vdd);
   {U3} na210 (n89, n32, n1, vss, vdd);
   {U4} iv110 (n1, n2, vss, vdd);
   {U5} na210 (N19, n32, n3, vss, vdd);
   {U6} iv110 (n3, n4, vss, vdd);
   {U45} ex210 (n42, n43, n89, vss, vdd);
   {U46} na210 (in_field_in, counter_state_0_port, n43, vss, vdd);
   {U47} iv110 (counter_state_1_port, n42, vss, vdd);
   {U48} na210 (n44, n45, n41, vss, vdd);
   {U49} na210 (mem_addr_reset_in_6_0_0, n46, n45, vss, vdd);
   {U50} mu111 (n47, n48, mem_addr_out_0_port, n44, vss, vdd);
   {U51} na210 (n49, n50, n40, vss, vdd);
   {U52} na210 (mem_addr_reset_in_6_0_1, n46, n50, vss, vdd);
   {U53} mu111 (n51, n52, mem_addr_out_1_port, n49, vss, vdd);
   {U54} na210 (n53, mem_addr_out_0_port, n51, vss, vdd);
   {U55} na210 (n54, n55, n39, vss, vdd);
   {U56} na210 (mem_addr_reset_in_6_0_2, n46, n55, vss, vdd);
   {U57} mu111 (n56, n57, mem_addr_out_2_port, n54, vss, vdd);
   {U58} no210 (n58, n59, n57, vss, vdd);
   {U59} iv110 (n52, n59, vss, vdd);
   {U60} no210 (n60, n61, n52, vss, vdd);
   {U61} no210 (n47, mem_addr_out_0_port, n61, vss, vdd);
   {U62} iv110 (n48, n60, vss, vdd);
   {U63} no210 (mem_addr_out_1_port, n47, n58, vss, vdd);
   {U64} na310 (n53, mem_addr_out_0_port, mem_addr_out_1_port, n56, vss, vdd);
   {U65} na210 (n62, n63, n38, vss, vdd);
   {U66} na210 (mem_addr_reset_in_6_0_3, n46, n63, vss, vdd);
   {U67} mu111 (n64, n65, mem_addr_out_3_port, n62, vss, vdd);
   {U68} iv110 (n66, n65, vss, vdd);
   {U69} na210 (n67, n53, n64, vss, vdd);
   {U70} na210 (n68, n69, n37, vss, vdd);
   {U71} na210 (mem_addr_reset_in_6_0_4, n46, n69, vss, vdd);
   {U72} mu111 (n70, n71, mem_addr_out_4_port, n68, vss, vdd);
   {U73} no210 (n72, n66, n71, vss, vdd);
   {U74} na210 (n48, n73, n66, vss, vdd);
   {U75} na210 (n53, n74, n73, vss, vdd);
   {U76} no210 (mem_addr_out_3_port, n47, n72, vss, vdd);
   {U77} na310 (n67, n53, mem_addr_out_3_port, n70, vss, vdd);
   {U78} na210 (n75, n76, n36, vss, vdd);
   {U79} na210 (mem_addr_reset_in_6_0_5, n46, n76, vss, vdd);
   {U80} mu111 (n77, n78, mem_addr_out_5_port, n75, vss, vdd);
   {U81} iv110 (n79, n78, vss, vdd);
   {U82} na210 (n80, n53, n77, vss, vdd);
   {U83} na210 (n81, n82, n35, vss, vdd);
   {U84} na210 (mem_addr_reset_in_6_0_6, n46, n82, vss, vdd);
   {U85} iv110 (n32, n46, vss, vdd);
   {U86} mu111 (n83, n84, mem_addr_out_6_port, n81, vss, vdd);
   {U87} no210 (n85, n79, n84, vss, vdd);
   {U88} na210 (n48, n86, n79, vss, vdd);
   {U89} na210 (n53, n87, n86, vss, vdd);
   {U90} no210 (mem_addr_out_5_port, n47, n85, vss, vdd);
   {U91} na310 (n80, n53, mem_addr_out_5_port, n83, vss, vdd);
   {U92} iv110 (n47, n53, vss, vdd);
   {U93} na210 (n32, n48, n47, vss, vdd);
   {U94} na210 (n32, n88, n48, vss, vdd);
   {U95} na310 (in_field_in, counter_state_0_port, counter_state_1_port, n88, 
                vss, vdd);
   {U96} iv110 (n87, n80, vss, vdd);
   {U97} na310 (mem_addr_out_3_port, n67, mem_addr_out_4_port, n87, vss, vdd);
   {U98} iv110 (n74, n67, vss, vdd);
   {U99} na310 (mem_addr_out_1_port, mem_addr_out_0_port, mem_addr_out_2_port, 
                n74, vss, vdd);
   {U100} no210 (new_line_in, new_frame_in, n32, vss, vdd);
   {U101} ex210 (in_field_in, counter_state_0_port, N19, vss, vdd);
}



