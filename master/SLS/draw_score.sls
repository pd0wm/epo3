extern network dfr11 (terminal D, R, CK, Q, vss, vdd)
extern network tinv10 (terminal A, E, Y, vss, vdd)
extern network na310 (terminal A, B, C, Y, vss, vdd)
extern network no310 (terminal A, B, C, Y, vss, vdd)
extern network mu111 (terminal A, B, S, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
network draw_score (terminal ds_clk, ds_rst, ds_draw, ds_ready, ds_input_7_0_7, 
                             ds_input_7_0_6, ds_input_7_0_5, ds_input_7_0_4, 
                             ds_input_7_0_3, ds_input_7_0_2, ds_input_7_0_1, 
                             ds_input_7_0_0, ds_write, ds_addr_7_0_7, 
                             ds_addr_7_0_6, ds_addr_7_0_5, ds_addr_7_0_4, 
                             ds_addr_7_0_3, ds_addr_7_0_2, ds_addr_7_0_1, 
                             ds_addr_7_0_0, ds_data_out, vss, vdd)
{
   net {ds_ready, ds_ready_port};
   {state_reg_0_inst} dfr11 (new_state_0_port, ds_rst, ds_clk, state_0_port, 
                             vss, vdd);
   {i_reg_0_inst} dfr11 (next_i_0_port, ds_rst, ds_clk, i_0_port, vss, vdd);
   {i_reg_1_inst} dfr11 (next_i_1_port, ds_rst, ds_clk, i_1_port, vss, vdd);
   {i_reg_2_inst} dfr11 (next_i_2_port, ds_rst, ds_clk, i_2_port, vss, vdd);
   {state_reg_1_inst} dfr11 (new_state_1_port, ds_rst, ds_clk, state_1_port, 
                             vss, vdd);
   {ds_addr_tri_0_inst} tinv10 (i_0_port, state_0_port, ds_addr_7_0_0, vss, 
                                vdd);
   {ds_addr_tri_1_inst} tinv10 (i_1_port, state_0_port, ds_addr_7_0_1, vss, 
                                vdd);
   {ds_addr_tri_2_inst} tinv10 (i_2_port, state_0_port, ds_addr_7_0_2, vss, 
                                vdd);
   {ds_addr_tri_3_inst} tinv10 (n80, state_0_port, ds_addr_7_0_3, vss, vdd);
   {ds_addr_tri_4_inst} tinv10 (n81, state_0_port, ds_addr_7_0_4, vss, vdd);
   {ds_addr_tri_5_inst} tinv10 (n80, state_0_port, ds_addr_7_0_5, vss, vdd);
   {ds_addr_tri_6_inst} tinv10 (n80, state_0_port, ds_addr_7_0_6, vss, vdd);
   {ds_addr_tri_7_inst} tinv10 (n81, state_0_port, ds_addr_7_0_7, vss, vdd);
   {ds_data_out_tri} tinv10 (n38, state_0_port, ds_data_out, vss, vdd);
   {ds_write_tri} tinv10 (n36, n79, ds_write, vss, vdd);
   {U54} mu111 (n48, n49, n50, next_i_2_port, vss, vdd);
   {U55} no210 (n36, n51, n49, vss, vdd);
   {U56} iv110 (n52, n48, vss, vdd);
   {U57} na210 (n53, n54, next_i_1_port, vss, vdd);
   {U58} na210 (n55, n56, n54, vss, vdd);
   {U59} na210 (next_i_0_port, i_1_port, n53, vss, vdd);
   {U60} na210 (n57, n58, new_state_1_port, vss, vdd);
   {U61} na310 (n59, n56, i_2_port, n58, vss, vdd);
   {U62} iv110 (n51, n59, vss, vdd);
   {U63} na210 (ds_draw, ds_ready_port, n57, vss, vdd);
   {U64} na310 (n60, n61, n52, new_state_0_port, vss, vdd);
   {U65} no210 (next_i_0_port, n62, n52, vss, vdd);
   {U66} no210 (n36, i_1_port, n62, vss, vdd);
   {U67} no210 (n36, i_0_port, next_i_0_port, vss, vdd);
   {U68} na210 (n56, n50, n61, vss, vdd);
   {U69} iv110 (n36, n56, vss, vdd);
   {U70} na210 (ds_draw, n63, n60, vss, vdd);
   {U71} iv110 (n63, n79, vss, vdd);
   {U72} no210 (state_1_port, state_0_port, n63, vss, vdd);
   {U73} iv110 (n64, n38, vss, vdd);
   {U74} mu111 (n65, n66, n50, n64, vss, vdd);
   {U75} iv110 (i_2_port, n50, vss, vdd);
   {U76} na210 (n67, n68, n66, vss, vdd);
   {U77} na210 (ds_input_7_0_1, n55, n68, vss, vdd);
   {U78} mu111 (n69, n70, i_1_port, n67, vss, vdd);
   {U79} iv110 (n71, n70, vss, vdd);
   {U80} mu111 (ds_input_7_0_3, ds_input_7_0_2, n72, n71, vss, vdd);
   {U81} na210 (ds_input_7_0_0, n72, n69, vss, vdd);
   {U82} no310 (n73, n74, n75, n65, vss, vdd);
   {U83} no210 (ds_input_7_0_5, n76, n75, vss, vdd);
   {U84} iv110 (n55, n76, vss, vdd);
   {U85} no210 (n72, i_1_port, n55, vss, vdd);
   {U86} iv110 (i_0_port, n72, vss, vdd);
   {U87} no210 (i_0_port, n77, n74, vss, vdd);
   {U88} mu111 (ds_input_7_0_4, ds_input_7_0_6, i_1_port, n77, vss, vdd);
   {U89} no210 (ds_input_7_0_7, n51, n73, vss, vdd);
   {U90} na210 (i_1_port, i_0_port, n51, vss, vdd);
   {U91} na210 (state_0_port, n78, n36, vss, vdd);
   {U92} no210 (n78, state_0_port, ds_ready_port, vss, vdd);
   {U93} iv110 (state_1_port, n78, vss, vdd);
   net {n80, vdd};
   net {n81, vss};
}



