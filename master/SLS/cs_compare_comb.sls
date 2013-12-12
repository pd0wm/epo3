extern network no310 (terminal A, B, C, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network na310 (terminal A, B, C, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
network cs_compare_comb (terminal state_3_0_3, state_3_0_2, state_3_0_1, 
                                  state_3_0_0, state_next_3_0_3, 
                                  state_next_3_0_2, state_next_3_0_1, 
                                  state_next_3_0_0, row_full, start_in, 
                                  ram_data_in, shift_ready, cnt_ram_addr_6_0_6, 
                                  cnt_ram_addr_6_0_5, cnt_ram_addr_6_0_4, 
                                  cnt_ram_addr_6_0_3, cnt_ram_addr_6_0_2, 
                                  cnt_ram_addr_6_0_1, cnt_ram_addr_6_0_0, 
                                  tri_en, cnt_en, ready_out, shift_start, 
                                  score_out, defset_en, row_full_next, vss, vdd)
{
   net {tri_en, defset_en_port};
   net {cnt_en, cnt_en_port};
   net {shift_start, shift_start_port};
   net {score_out, score_out_port};
   net {defset_en, defset_en_port};
   {U60} na310 (n51, n52, n53, state_next_3_0_3, vss, vdd);
   {U61} na210 (n54, n55, n53, vss, vdd);
   {U62} iv110 (score_out_port, n52, vss, vdd);
   {U63} na310 (n56, n57, n58, n51, vss, vdd);
   {U64} iv110 (n59, n58, vss, vdd);
   {U65} na310 (n60, n61, n62, n59, vss, vdd);
   {U66} no210 (cnt_ram_addr_6_0_1, cnt_ram_addr_6_0_2, n60, vss, vdd);
   {U67} no210 (cnt_ram_addr_6_0_6, cnt_ram_addr_6_0_5, n57, vss, vdd);
   {U68} no210 (cnt_ram_addr_6_0_4, cnt_ram_addr_6_0_3, n56, vss, vdd);
   {U69} na310 (n63, n64, n65, state_next_3_0_2, vss, vdd);
   {U70} no210 (n66, n67, n65, vss, vdd);
   {U71} no210 (n68, n55, n67, vss, vdd);
   {U72} iv110 (row_full, n55, vss, vdd);
   {U73} iv110 (n69, n66, vss, vdd);
   {U74} na310 (n63, n70, n71, state_next_3_0_1, vss, vdd);
   {U75} no210 (shift_start_port, cnt_en_port, n71, vss, vdd);
   {U76} iv110 (n72, n63, vss, vdd);
   {U77} na310 (n73, n74, n75, state_next_3_0_0, vss, vdd);
   {U78} no310 (n76, n62, n77, n75, vss, vdd);
   {U79} no310 (n78, n79, n61, n77, vss, vdd);
   {U80} iv110 (cnt_ram_addr_6_0_0, n61, vss, vdd);
   {U81} na210 (cnt_ram_addr_6_0_2, cnt_ram_addr_6_0_1, n78, vss, vdd);
   {U82} no210 (n80, n81, n76, vss, vdd);
   {U83} iv110 (start_in, n80, vss, vdd);
   {U84} na210 (shift_ready, n72, n74, vss, vdd);
   {U85} na210 (row_full, n54, n73, vss, vdd);
   {U86} na210 (n70, n82, row_full_next, vss, vdd);
   {U87} na210 (row_full, n83, n82, vss, vdd);
   {U88} na310 (n84, n81, n85, n83, vss, vdd);
   {U89} no210 (ram_data_in, n72, n85, vss, vdd);
   {U90} no310 (n86, state_3_0_0, n87, n72, vss, vdd);
   {U91} na310 (n84, n69, n88, defset_en_port, vss, vdd);
   {U92} no210 (cnt_en_port, n89, n88, vss, vdd);
   {U93} iv110 (n70, n89, vss, vdd);
   {U94} na310 (state_3_0_0, n87, n90, n70, vss, vdd);
   {U95} na310 (state_3_0_1, state_3_0_0, n90, n69, vss, vdd);
   {U96} no310 (score_out_port, n62, n91, n84, vss, vdd);
   {U97} na310 (n68, n64, n92, n91, vss, vdd);
   {U98} iv110 (shift_start_port, n64, vss, vdd);
   {U99} no310 (n86, state_3_0_1, n93, shift_start_port, vss, vdd);
   {U100} iv110 (n54, n68, vss, vdd);
   {U101} no310 (state_3_0_0, state_3_0_1, n86, n54, vss, vdd);
   {U102} no210 (n94, n81, n62, vss, vdd);
   {U103} no310 (n93, n86, n87, score_out_port, vss, vdd);
   {U104} na210 (state_3_0_2, n94, n86, vss, vdd);
   {U105} iv110 (state_3_0_3, n94, vss, vdd);
   {U106} iv110 (n79, cnt_en_port, vss, vdd);
   {U107} na310 (state_3_0_1, n93, n90, n79, vss, vdd);
   {U108} no210 (state_3_0_2, state_3_0_3, n90, vss, vdd);
   {U109} iv110 (n92, ready_out, vss, vdd);
   {U110} na210 (state_3_0_3, n81, n92, vss, vdd);
   {U111} na310 (n87, n95, n93, n81, vss, vdd);
   {U112} iv110 (state_3_0_0, n93, vss, vdd);
   {U113} iv110 (state_3_0_2, n95, vss, vdd);
   {U114} iv110 (state_3_0_1, n87, vss, vdd);
}



