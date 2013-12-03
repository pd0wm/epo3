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
   net {ds_write, ds_write_port};
   {state_reg_0_inst} dfr11 (new_state_0_port, ds_rst, ds_clk, state_0_port, 
                             vss, vdd);
   {i_reg_0_inst} dfr11 (n79, ds_rst, ds_clk, i_0_port, vss, vdd);
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
   {ds_data_out_tri} tinv10 (n36, state_0_port, ds_data_out, vss, vdd);
   {U53} iv110 (n47, next_i_2_port, vss, vdd);
   {U54} mu111 (n48, n49, i_2_port, n47, vss, vdd);
   {U55} na210 (n50, ds_write_port, n48, vss, vdd);
   {U56} na210 (n51, n52, next_i_1_port, vss, vdd);
   {U57} na210 (n53, ds_write_port, n52, vss, vdd);
   {U58} na210 (n79, i_1_port, n51, vss, vdd);
   {U59} na210 (n54, n55, new_state_1_port, vss, vdd);
   {U60} na310 (ds_write_port, n50, i_2_port, n55, vss, vdd);
   {U61} iv110 (n56, n50, vss, vdd);
   {U62} na210 (ds_draw, ds_ready_port, n54, vss, vdd);
   {U63} na310 (n57, n58, n49, new_state_0_port, vss, vdd);
   {U64} no210 (n79, n59, n49, vss, vdd);
   {U65} no210 (n60, i_1_port, n59, vss, vdd);
   {U66} na310 (n61, n62, ds_draw, n58, vss, vdd);
   {U67} iv110 (state_0_port, n61, vss, vdd);
   {U68} na210 (ds_write_port, n63, n57, vss, vdd);
   {U69} iv110 (i_2_port, n63, vss, vdd);
   {U70} no210 (n60, i_0_port, n79, vss, vdd);
   {U71} iv110 (n64, n36, vss, vdd);
   {U72} mu111 (n65, n66, i_2_port, n64, vss, vdd);
   {U73} no310 (n67, n68, n69, n66, vss, vdd);
   {U74} no210 (ds_input_7_0_5, n70, n69, vss, vdd);
   {U75} no210 (i_0_port, n71, n68, vss, vdd);
   {U76} mu111 (ds_input_7_0_4, ds_input_7_0_6, i_1_port, n71, vss, vdd);
   {U77} no210 (ds_input_7_0_7, n56, n67, vss, vdd);
   {U78} na210 (i_1_port, i_0_port, n56, vss, vdd);
   {U79} na210 (n72, n73, n65, vss, vdd);
   {U80} na210 (ds_input_7_0_1, n53, n73, vss, vdd);
   {U81} iv110 (n70, n53, vss, vdd);
   {U82} na210 (i_0_port, n74, n70, vss, vdd);
   {U83} iv110 (i_1_port, n74, vss, vdd);
   {U84} mu111 (n75, n76, i_1_port, n72, vss, vdd);
   {U85} iv110 (n77, n76, vss, vdd);
   {U86} mu111 (ds_input_7_0_2, ds_input_7_0_3, i_0_port, n77, vss, vdd);
   {U87} na210 (ds_input_7_0_0, n78, n75, vss, vdd);
   {U88} iv110 (i_0_port, n78, vss, vdd);
   {U89} iv110 (n60, ds_write_port, vss, vdd);
   {U90} na210 (state_0_port, n62, n60, vss, vdd);
   {U91} no210 (n62, state_0_port, ds_ready_port, vss, vdd);
   {U92} iv110 (state_1_port, n62, vss, vdd);
   net {n80, vdd};
   net {n81, vss};
}



