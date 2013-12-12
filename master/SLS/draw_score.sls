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
   {i_reg_0_inst} dfr11 (n81, ds_rst, ds_clk, i_0_port, vss, vdd);
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
   {ds_addr_tri_3_inst} tinv10 (n82, state_0_port, ds_addr_7_0_3, vss, vdd);
   {ds_addr_tri_4_inst} tinv10 (n83, state_0_port, ds_addr_7_0_4, vss, vdd);
   {ds_addr_tri_5_inst} tinv10 (n82, state_0_port, ds_addr_7_0_5, vss, vdd);
   {ds_addr_tri_6_inst} tinv10 (n82, state_0_port, ds_addr_7_0_6, vss, vdd);
   {ds_addr_tri_7_inst} tinv10 (n83, state_0_port, ds_addr_7_0_7, vss, vdd);
   {ds_data_out_tri} tinv10 (n38, state_0_port, ds_data_out, vss, vdd);
   {ds_write_tri} tinv10 (n3, state_0_port, ds_write, vss, vdd);
   net {n3, vss};
   {U54} iv110 (n48, next_i_2_port, vss, vdd);
   {U55} mu111 (n49, n50, i_2_port, n48, vss, vdd);
   {U56} na210 (n51, n52, n49, vss, vdd);
   {U57} na210 (n53, n54, next_i_1_port, vss, vdd);
   {U58} na210 (n55, n52, n54, vss, vdd);
   {U59} na210 (n81, i_1_port, n53, vss, vdd);
   {U60} na210 (n56, n57, new_state_1_port, vss, vdd);
   {U61} na310 (n52, n51, i_2_port, n57, vss, vdd);
   {U62} iv110 (n58, n51, vss, vdd);
   {U63} na210 (ds_draw, ds_ready_port, n56, vss, vdd);
   {U64} na310 (n59, n60, n50, new_state_0_port, vss, vdd);
   {U65} no210 (n81, n61, n50, vss, vdd);
   {U66} no210 (n62, i_1_port, n61, vss, vdd);
   {U67} na310 (n63, n64, ds_draw, n60, vss, vdd);
   {U68} iv110 (state_0_port, n63, vss, vdd);
   {U69} na210 (n52, n65, n59, vss, vdd);
   {U70} iv110 (i_2_port, n65, vss, vdd);
   {U71} iv110 (n62, n52, vss, vdd);
   {U72} no210 (n62, i_0_port, n81, vss, vdd);
   {U73} na210 (state_0_port, n64, n62, vss, vdd);
   {U74} iv110 (n66, n38, vss, vdd);
   {U75} mu111 (n67, n68, i_2_port, n66, vss, vdd);
   {U76} no310 (n69, n70, n71, n68, vss, vdd);
   {U77} no210 (ds_input_7_0_5, n72, n71, vss, vdd);
   {U78} no210 (i_0_port, n73, n70, vss, vdd);
   {U79} mu111 (ds_input_7_0_4, ds_input_7_0_6, i_1_port, n73, vss, vdd);
   {U80} no210 (ds_input_7_0_7, n58, n69, vss, vdd);
   {U81} na210 (i_1_port, i_0_port, n58, vss, vdd);
   {U82} na210 (n74, n75, n67, vss, vdd);
   {U83} na210 (ds_input_7_0_1, n55, n75, vss, vdd);
   {U84} iv110 (n72, n55, vss, vdd);
   {U85} na210 (i_0_port, n76, n72, vss, vdd);
   {U86} iv110 (i_1_port, n76, vss, vdd);
   {U87} mu111 (n77, n78, i_1_port, n74, vss, vdd);
   {U88} iv110 (n79, n78, vss, vdd);
   {U89} mu111 (ds_input_7_0_2, ds_input_7_0_3, i_0_port, n79, vss, vdd);
   {U90} na210 (ds_input_7_0_0, n80, n77, vss, vdd);
   {U91} iv110 (i_0_port, n80, vss, vdd);
   {U92} no210 (n64, state_0_port, ds_ready_port, vss, vdd);
   {U93} iv110 (state_1_port, n64, vss, vdd);
   net {n82, vdd};
   net {n83, vss};
}



