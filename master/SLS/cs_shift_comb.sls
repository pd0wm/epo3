extern network tinv10 (terminal A, E, Y, vss, vdd)
extern network no310 (terminal A, B, C, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network na310 (terminal A, B, C, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
network cs_shift_comb (terminal state_2_0_2, state_2_0_1, state_2_0_0, 
                                state_next_2_0_2, state_next_2_0_1, 
                                state_next_2_0_0, start_in, ram_data_in, 
                                cnt_ram_addr_6_0_6, cnt_ram_addr_6_0_5, 
                                cnt_ram_addr_6_0_4, cnt_ram_addr_6_0_3, 
                                cnt_ram_addr_6_0_2, cnt_ram_addr_6_0_1, 
                                cnt_ram_addr_6_0_0, cnt_set, cnt_en, tri_en, 
                                tri_en_substr, ram_we, ready_out, ram_data_out, 
                                vss, vdd)
{
   net {cnt_set, cnt_set_port};
   net {cnt_en, cnt_en_port};
   net {tri_en_substr, tri_en_substr_port};
   {ram_data_out_tri} tinv10 (n27, n26, ram_data_out, vss, vdd);
   {ram_we_tri} tinv10 (n25, n26, ram_we, vss, vdd);
   {U38} na310 (n33, n34, n35, tri_en, vss, vdd);
   {U39} na210 (state_2_0_0, n36, n35, vss, vdd);
   {U40} iv110 (n37, state_next_2_0_2, vss, vdd);
   {U41} no310 (n38, tri_en_substr_port, n39, n37, vss, vdd);
   {U42} no210 (n34, n25, n39, vss, vdd);
   {U43} no310 (n40, state_2_0_2, n36, tri_en_substr_port, vss, vdd);
   {U44} no210 (n41, n42, n38, vss, vdd);
   {U45} na310 (n33, n43, n41, state_next_2_0_1, vss, vdd);
   {U46} iv110 (n44, n41, vss, vdd);
   {U47} iv110 (cnt_set_port, n43, vss, vdd);
   {U48} na310 (n45, n46, n47, state_next_2_0_0, vss, vdd);
   {U49} na210 (start_in, n48, n47, vss, vdd);
   {U50} iv110 (cnt_en_port, n46, vss, vdd);
   {U51} na210 (n44, n42, n45, vss, vdd);
   {U52} na310 (n49, cnt_ram_addr_6_0_6, n50, n42, vss, vdd);
   {U53} no210 (n51, n52, n50, vss, vdd);
   {U54} na210 (cnt_ram_addr_6_0_3, cnt_ram_addr_6_0_2, n52, vss, vdd);
   {U55} na210 (cnt_ram_addr_6_0_1, cnt_ram_addr_6_0_0, n51, vss, vdd);
   {U56} no210 (n53, n54, n49, vss, vdd);
   {U57} iv110 (cnt_ram_addr_6_0_5, n54, vss, vdd);
   {U58} no310 (n40, state_2_0_1, n34, n44, vss, vdd);
   {U59} na310 (n55, n48, ram_data_in, n27, vss, vdd);
   {U60} na310 (n56, n53, n57, n55, vss, vdd);
   {U61} no210 (cnt_ram_addr_6_0_6, cnt_ram_addr_6_0_5, n57, vss, vdd);
   {U62} iv110 (cnt_ram_addr_6_0_4, n53, vss, vdd);
   {U63} iv110 (cnt_ram_addr_6_0_3, n56, vss, vdd);
   {U64} na210 (n48, n34, n26, vss, vdd);
   {U65} iv110 (n48, n25, vss, vdd);
   {U66} no310 (state_2_0_1, state_2_0_2, n40, cnt_set_port, vss, vdd);
   {U67} na210 (n33, n58, cnt_en_port, vss, vdd);
   {U68} na210 (state_2_0_2, n48, n58, vss, vdd);
   {U69} no210 (state_2_0_1, state_2_0_0, n48, vss, vdd);
   {U70} na310 (n40, n34, state_2_0_1, n33, vss, vdd);
   {U71} iv110 (state_2_0_0, n40, vss, vdd);
   {U72} no210 (n36, n34, ready_out, vss, vdd);
   {U73} iv110 (state_2_0_2, n34, vss, vdd);
   {U74} iv110 (state_2_0_1, n36, vss, vdd);
}



