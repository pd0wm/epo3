extern network dfa11 (terminal D, CK, R, Q, vss, vdd)
extern network ex210 (terminal A, B, Y, vss, vdd)
extern network na310 (terminal A, B, C, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
network vga_trans_reset (terminal clk, rst, mem_addr_reset_out_6_0_6, 
                                  mem_addr_reset_out_6_0_5, 
                                  mem_addr_reset_out_6_0_4, 
                                  mem_addr_reset_out_6_0_3, 
                                  mem_addr_reset_out_6_0_2, 
                                  mem_addr_reset_out_6_0_1, 
                                  mem_addr_reset_out_6_0_0, end_field_line_in, 
                                  end_frame_in, vss, vdd)
{
   net {mem_addr_reset_out_6_0_6, mem_addr_reset_out_6_port};
   net {mem_addr_reset_out_6_0_5, mem_addr_reset_out_5_port};
   net {mem_addr_reset_out_6_0_4, mem_addr_reset_out_4_port};
   net {mem_addr_reset_out_6_0_3, mem_addr_reset_out_3_port};
   net {mem_addr_reset_out_6_0_2, N18};
   net {mem_addr_reset_out_6_0_1, N17};
   net {mem_addr_reset_out_6_0_0, N16};
   {counter_state_reg_0_inst} dfa11 (n26, clk, rst, counter_state_0_port, vss, 
                                     vdd);
   {counter_state_reg_1_inst} dfa11 (n25, clk, rst, counter_state_1_port, vss, 
                                     vdd);
   {mem_addr_state_reg_3_inst} dfa11 (n18_port, clk, rst, 
                                      mem_addr_reset_out_3_port, vss, vdd);
   {mem_addr_state_reg_4_inst} dfa11 (n16_port, clk, rst, 
                                      mem_addr_reset_out_4_port, vss, vdd);
   {mem_addr_state_reg_5_inst} dfa11 (n14, clk, rst, mem_addr_reset_out_5_port, 
                                      vss, vdd);
   {mem_addr_state_reg_6_inst} dfa11 (n12, clk, rst, mem_addr_reset_out_6_port, 
                                      vss, vdd);
   {counter_state_reg_2_inst} dfa11 (n10, clk, rst, counter_state_2_port, vss, 
                                     vdd);
   {counter_state_reg_3_inst} dfa11 (n9, clk, rst, counter_state_3_port, vss, 
                                     vdd);
   {U15} no210 (end_frame_in, n11, n12, vss, vdd);
   {U16} iv110 (N22, n11, vss, vdd);
   {U17} no210 (end_frame_in, n13, n14, vss, vdd);
   {U18} iv110 (N21, n13, vss, vdd);
   {U19} no210 (end_frame_in, n15, n16_port, vss, vdd);
   {U20} iv110 (N20, n15, vss, vdd);
   {U21} no210 (end_frame_in, n17_port, n18_port, vss, vdd);
   {U22} iv110 (N19, n17_port, vss, vdd);
   net {N16, vss};
   net {N17, vss};
   net {N18, vss};
   {U32} iv110 (n27, n9, vss, vdd);
   {U33} ex210 (counter_state_3_port, n28, n27, vss, vdd);
   {U34} na210 (counter_state_2_port, n29, n28, vss, vdd);
   {U35} ex210 (end_field_line_in, counter_state_0_port, n26, vss, vdd);
   {U36} ex210 (n30, n31, n25, vss, vdd);
   {U37} ex210 (counter_state_2_port, n29, n10, vss, vdd);
   {U38} ex210 (mem_addr_reset_out_6_port, n32, N22, vss, vdd);
   {U39} no210 (n33, n34, n32, vss, vdd);
   {U40} ex210 (n34, n33, N21, vss, vdd);
   {U41} na210 (mem_addr_reset_out_4_port, n35, n33, vss, vdd);
   {U42} iv110 (mem_addr_reset_out_5_port, n34, vss, vdd);
   {U43} ex210 (mem_addr_reset_out_4_port, n35, N20, vss, vdd);
   {U44} no210 (n36, n37, n35, vss, vdd);
   {U45} ex210 (n36, n37, N19, vss, vdd);
   {U46} na310 (counter_state_2_port, n29, counter_state_3_port, n37, vss, vdd);
   {U47} no210 (n30, n31, n29, vss, vdd);
   {U48} na210 (end_field_line_in, counter_state_0_port, n31, vss, vdd);
   {U49} iv110 (counter_state_1_port, n30, vss, vdd);
   {U50} iv110 (mem_addr_reset_out_3_port, n36, vss, vdd);
}



