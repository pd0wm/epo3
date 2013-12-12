extern network dfa11 (terminal D, CK, R, Q, vss, vdd)
extern network dfr11 (terminal D, R, CK, Q, vss, vdd)
extern network ex210 (terminal A, B, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network no310 (terminal A, B, C, Y, vss, vdd)
extern network na310 (terminal A, B, C, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
network debounce (terminal clk, rst, inv_inputs_5_0_5, inv_inputs_5_0_4, 
                           inv_inputs_5_0_3, inv_inputs_5_0_2, 
                           inv_inputs_5_0_1, inv_inputs_5_0_0, output_5_0_5, 
                           output_5_0_4, output_5_0_3, output_5_0_2, 
                           output_5_0_1, output_5_0_0, random_seed, vss, vdd)
{
   net {random_seed, random_seed_port};
   {count_reg_0_inst} dfa11 (n41, clk, N16, count_0_port, vss, vdd);
   {state_reg_0_inst} dfr11 (new_state_0_port, rst, clk, state_0_port, vss, 
                             vdd);
   {state_reg_1_inst} dfr11 (new_state_1_port, rst, clk, state_1_port, vss, 
                             vdd);
   {count_reg_6_inst} dfa11 (n40, clk, N16, count_6_port, vss, vdd);
   {count_reg_5_inst} dfa11 (n39, clk, N16, count_5_port, vss, vdd);
   {count_reg_4_inst} dfa11 (n38, clk, N16, count_4_port, vss, vdd);
   {count_reg_3_inst} dfa11 (n37, clk, N16, count_3_port, vss, vdd);
   {count_reg_2_inst} dfa11 (n36, clk, N16, count_2_port, vss, vdd);
   {count_reg_1_inst} dfa11 (n35, clk, N16, count_1_port, vss, vdd);
   {output_reg_5_inst} dfr11 (new_out_5_port, rst, clk, output_5_0_5, vss, vdd);
   {output_reg_4_inst} dfr11 (new_out_4_port, rst, clk, output_5_0_4, vss, vdd);
   {output_reg_3_inst} dfr11 (new_out_3_port, rst, clk, output_5_0_3, vss, vdd);
   {output_reg_2_inst} dfr11 (new_out_2_port, rst, clk, output_5_0_2, vss, vdd);
   {output_reg_1_inst} dfr11 (new_out_1_port, rst, clk, output_5_0_1, vss, vdd);
   {output_reg_0_inst} dfr11 (new_out_0_port, rst, clk, output_5_0_0, vss, vdd);
   {U53} na210 (n43, n44, new_state_1_port, vss, vdd);
   {U54} iv110 (n45, n44, vss, vdd);
   {U55} no310 (n46, rst, n47, n45, vss, vdd);
   {U56} na210 (n48, n49, n43, vss, vdd);
   {U57} na210 (n50, n51, new_state_0_port, vss, vdd);
   {U58} na210 (n49, n52, n51, vss, vdd);
   {U59} no310 (rst, state_1_port, n53, n49, vss, vdd);
   {U60} na210 (N16, random_seed_port, n50, vss, vdd);
   {U61} no210 (inv_inputs_5_0_5, n47, new_out_5_port, vss, vdd);
   {U62} no210 (inv_inputs_5_0_4, n47, new_out_4_port, vss, vdd);
   {U63} no210 (inv_inputs_5_0_3, n47, new_out_3_port, vss, vdd);
   {U64} no210 (inv_inputs_5_0_2, n47, new_out_2_port, vss, vdd);
   {U65} no210 (inv_inputs_5_0_1, n47, new_out_1_port, vss, vdd);
   {U66} no210 (inv_inputs_5_0_0, n47, new_out_0_port, vss, vdd);
   {U67} na210 (state_1_port, n53, n47, vss, vdd);
   {U68} iv110 (state_0_port, n53, vss, vdd);
   {U69} iv110 (n46, random_seed_port, vss, vdd);
   {U70} no210 (n54, n55, n46, vss, vdd);
   {U71} na310 (inv_inputs_5_0_2, inv_inputs_5_0_0, inv_inputs_5_0_1, n55, vss, 
                vdd);
   {U72} na310 (inv_inputs_5_0_5, inv_inputs_5_0_3, inv_inputs_5_0_4, n54, vss, 
                vdd);
   {U73} iv110 (n56, n40, vss, vdd);
   {U74} no210 (n57, count_6_port, n56, vss, vdd);
   {U75} no210 (n58, n59, n57, vss, vdd);
   {U76} ex210 (n59, n58, n39, vss, vdd);
   {U77} na210 (n60, n52, n58, vss, vdd);
   {U78} iv110 (count_5_port, n59, vss, vdd);
   {U79} ex210 (n61, n62, n38, vss, vdd);
   {U80} na210 (count_3_port, n63, n62, vss, vdd);
   {U81} ex210 (count_3_port, n63, n37, vss, vdd);
   {U82} no210 (n64, n48, n63, vss, vdd);
   {U83} iv110 (n52, n48, vss, vdd);
   {U84} ex210 (count_2_port, n65, n36, vss, vdd);
   {U85} no210 (n66, n41, n65, vss, vdd);
   {U86} ex210 (n66, n41, n35, vss, vdd);
   {U87} na210 (count_0_port, n52, n41, vss, vdd);
   {U88} na310 (count_5_port, n60, count_6_port, n52, vss, vdd);
   {U89} no310 (n67, n64, n61, n60, vss, vdd);
   {U90} iv110 (count_4_port, n61, vss, vdd);
   {U91} na310 (count_1_port, count_0_port, count_2_port, n64, vss, vdd);
   {U92} iv110 (count_3_port, n67, vss, vdd);
   {U93} iv110 (count_1_port, n66, vss, vdd);
   {U94} no210 (state_0_port, state_1_port, N16, vss, vdd);
}



