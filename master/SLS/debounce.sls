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
   {count_reg_0_inst} dfa11 (n40, clk, N15, count_0_port, vss, vdd);
   {state_reg_0_inst} dfr11 (new_state_0_port, rst, clk, state_0_port, vss, 
                             vdd);
   {state_reg_1_inst} dfr11 (new_state_1_port, rst, clk, state_1_port, vss, 
                             vdd);
   {count_reg_6_inst} dfa11 (n39, clk, N15, count_6_port, vss, vdd);
   {count_reg_5_inst} dfa11 (n38, clk, N15, count_5_port, vss, vdd);
   {count_reg_4_inst} dfa11 (n37, clk, N15, count_4_port, vss, vdd);
   {count_reg_3_inst} dfa11 (n36, clk, N15, count_3_port, vss, vdd);
   {count_reg_2_inst} dfa11 (n35, clk, N15, count_2_port, vss, vdd);
   {count_reg_1_inst} dfa11 (n34, clk, N15, count_1_port, vss, vdd);
   {output_reg_5_inst} dfr11 (new_out_5_port, rst, clk, output_5_0_5, vss, vdd);
   {output_reg_4_inst} dfr11 (new_out_4_port, rst, clk, output_5_0_4, vss, vdd);
   {output_reg_3_inst} dfr11 (new_out_3_port, rst, clk, output_5_0_3, vss, vdd);
   {output_reg_2_inst} dfr11 (new_out_2_port, rst, clk, output_5_0_2, vss, vdd);
   {output_reg_1_inst} dfr11 (new_out_1_port, rst, clk, output_5_0_1, vss, vdd);
   {output_reg_0_inst} dfr11 (new_out_0_port, rst, clk, output_5_0_0, vss, vdd);
   {U52} no310 (n42, rst, n43, new_state_1_port, vss, vdd);
   {U53} no210 (n44, n45, n42, vss, vdd);
   {U54} iv110 (n46, n45, vss, vdd);
   {U55} no310 (n47, state_1_port, n48, n44, vss, vdd);
   {U56} no210 (n43, n49, new_state_0_port, vss, vdd);
   {U57} no210 (n50, N15, n49, vss, vdd);
   {U58} no310 (n51, state_1_port, rst, n50, vss, vdd);
   {U59} no210 (inv_inputs_5_0_5, n46, new_out_5_port, vss, vdd);
   {U60} no210 (inv_inputs_5_0_4, n46, new_out_4_port, vss, vdd);
   {U61} no210 (inv_inputs_5_0_3, n46, new_out_3_port, vss, vdd);
   {U62} no210 (inv_inputs_5_0_2, n46, new_out_2_port, vss, vdd);
   {U63} no210 (inv_inputs_5_0_1, n46, new_out_1_port, vss, vdd);
   {U64} no210 (inv_inputs_5_0_0, n46, new_out_0_port, vss, vdd);
   {U65} na210 (state_1_port, n47, n46, vss, vdd);
   {U66} iv110 (state_0_port, n47, vss, vdd);
   {U67} iv110 (n43, random_seed, vss, vdd);
   {U68} no210 (n52, n53, n43, vss, vdd);
   {U69} na310 (inv_inputs_5_0_2, inv_inputs_5_0_0, inv_inputs_5_0_1, n53, vss, 
                vdd);
   {U70} na310 (inv_inputs_5_0_5, inv_inputs_5_0_3, inv_inputs_5_0_4, n52, vss, 
                vdd);
   {U71} iv110 (n54, n39, vss, vdd);
   {U72} no210 (n55, count_6_port, n54, vss, vdd);
   {U73} no210 (n56, n57, n55, vss, vdd);
   {U74} ex210 (n57, n56, n38, vss, vdd);
   {U75} na210 (n58, n48, n56, vss, vdd);
   {U76} iv110 (count_5_port, n57, vss, vdd);
   {U77} ex210 (n59, n60, n37, vss, vdd);
   {U78} na210 (count_3_port, n61, n60, vss, vdd);
   {U79} ex210 (count_3_port, n61, n36, vss, vdd);
   {U80} no210 (n62, n51, n61, vss, vdd);
   {U81} iv110 (n48, n51, vss, vdd);
   {U82} ex210 (count_2_port, n63, n35, vss, vdd);
   {U83} no210 (n64, n40, n63, vss, vdd);
   {U84} ex210 (n64, n40, n34, vss, vdd);
   {U85} na210 (count_0_port, n48, n40, vss, vdd);
   {U86} na310 (count_5_port, n58, count_6_port, n48, vss, vdd);
   {U87} no310 (n65, n62, n59, n58, vss, vdd);
   {U88} iv110 (count_4_port, n59, vss, vdd);
   {U89} na310 (count_1_port, count_0_port, count_2_port, n62, vss, vdd);
   {U90} iv110 (count_3_port, n65, vss, vdd);
   {U91} iv110 (count_1_port, n64, vss, vdd);
   {U92} no210 (state_0_port, state_1_port, N15, vss, vdd);
}



