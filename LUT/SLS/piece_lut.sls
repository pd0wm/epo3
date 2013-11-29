extern network dfr11 (terminal D, R, CK, Q, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network na310 (terminal A, B, C, Y, vss, vdd)
extern network ex210 (terminal A, B, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network no310 (terminal A, B, C, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
network piece_lut (terminal clk, rst, mask_7_0_7, mask_7_0_6, mask_7_0_5, 
                            mask_7_0_4, mask_7_0_3, mask_7_0_2, mask_7_0_1, 
                            mask_7_0_0, mask_select_1_0_1, mask_select_1_0_0, 
                            x_2_0_2, x_2_0_1, x_2_0_0, y_3_0_3, y_3_0_2, 
                            y_3_0_1, y_3_0_0, rot_1_0_1, rot_1_0_0, 
                            piece_type_2_0_2, piece_type_2_0_1, 
                            piece_type_2_0_0, next_piece, ready, error_side, 
                            error_bot, start, rom_addr_6_0_6, rom_addr_6_0_5, 
                            rom_addr_6_0_4, rom_addr_6_0_3, rom_addr_6_0_2, 
                            rom_addr_6_0_1, rom_addr_6_0_0, rom_data_3_0_3, 
                            rom_data_3_0_2, rom_data_3_0_1, rom_data_3_0_0, 
                            vss, vdd)
{
   net {mask_7_0_7, next_piece};
   net {mask_7_0_6, mask_6_port};
   net {mask_7_0_5, mask_5_port};
   net {mask_7_0_4, mask_4_port};
   net {mask_7_0_3, mask_3_port};
   net {mask_7_0_2, mask_2_port};
   net {mask_7_0_1, mask_1_port};
   net {mask_7_0_0, mask_0_port};
   net {rom_addr_6_0_6, piece_type_2_0_2};
   net {rom_addr_6_0_5, piece_type_2_0_1};
   net {rom_addr_6_0_4, piece_type_2_0_0};
   net {rom_addr_6_0_3, rot_1_0_1};
   net {rom_addr_6_0_2, rot_1_0_0};
   net {rom_addr_6_0_1, mask_select_1_0_1};
   net {rom_addr_6_0_0, mask_select_1_0_0};
   {state_reg_0_inst} dfr11 (next_state_0_port, rst, clk, state_0_port, vss, 
                             vdd);
   {state_reg_1_inst} dfr11 (next_state_1_port, rst, clk, state_1_port, vss, 
                             vdd);
   {state_reg_2_inst} dfr11 (next_state_2_port, rst, clk, state_2_port, vss, 
                             vdd);
   {U40} na310 (n47, n48, n49, next_state_2_port, vss, vdd);
   {U41} na210 (state_0_port, n50, n49, vss, vdd);
   {U42} ex210 (n51, n52, n50, vss, vdd);
   {U43} na210 (n53, n54, next_state_1_port, vss, vdd);
   {U44} na210 (state_0_port, n52, n54, vss, vdd);
   {U45} na210 (n53, n55, next_state_0_port, vss, vdd);
   {U46} na210 (n56, n57, n55, vss, vdd);
   {U47} na210 (n47, n58, n56, vss, vdd);
   {U48} na210 (start, n51, n58, vss, vdd);
   {U49} na310 (n59, n52, state_2_port, n47, vss, vdd);
   {U50} na210 (x_2_0_2, n60, n59, vss, vdd);
   {U51} iv110 (n61, n53, vss, vdd);
   {U52} na210 (n48, n62, n61, vss, vdd);
   {U53} na310 (n57, n51, state_1_port, n62, vss, vdd);
   {U54} na310 (n63, n57, n64, n48, vss, vdd);
   {U55} no210 (n52, n51, n64, vss, vdd);
   {U56} iv110 (n65, mask_1_port, vss, vdd);
   {U57} ex210 (n66, n67, n65, vss, vdd);
   {U58} na210 (rom_data_3_0_0, x_2_0_0, n66, vss, vdd);
   {U59} iv110 (n68, mask_6_port, vss, vdd);
   {U60} ex210 (y_3_0_3, n69, n68, vss, vdd);
   {U61} na210 (y_3_0_2, n70, n69, vss, vdd);
   {U62} ex210 (n70, y_3_0_2, mask_5_port, vss, vdd);
   {U63} iv110 (n71, mask_4_port, vss, vdd);
   {U64} ex210 (n72, n73, n71, vss, vdd);
   {U65} na210 (rom_data_3_0_2, y_3_0_0, n72, vss, vdd);
   {U66} ex210 (y_3_0_0, rom_data_3_0_2, mask_3_port, vss, vdd);
   {U67} ex210 (n60, x_2_0_2, mask_2_port, vss, vdd);
   {U68} ex210 (x_2_0_0, rom_data_3_0_0, mask_0_port, vss, vdd);
   {U69} no310 (n74, n51, n75, error_side, vss, vdd);
   {U70} iv110 (x_2_0_2, n75, vss, vdd);
   {U71} na310 (n57, n52, n60, n74, vss, vdd);
   {U72} na210 (n76, n77, n60, vss, vdd);
   {U73} na310 (rom_data_3_0_0, n67, x_2_0_0, n77, vss, vdd);
   {U74} ex210 (rom_data_3_0_1, x_2_0_1, n67, vss, vdd);
   {U75} na210 (rom_data_3_0_1, x_2_0_1, n76, vss, vdd);
   {U76} no310 (n78, n51, n63, error_bot, vss, vdd);
   {U77} na310 (y_3_0_2, n70, y_3_0_3, n63, vss, vdd);
   {U78} na210 (n79, n80, n70, vss, vdd);
   {U79} na310 (rom_data_3_0_2, n73, y_3_0_0, n80, vss, vdd);
   {U80} ex210 (rom_data_3_0_3, y_3_0_1, n73, vss, vdd);
   {U81} na210 (rom_data_3_0_3, y_3_0_1, n79, vss, vdd);
   {U82} na210 (state_1_port, n57, n78, vss, vdd);
   {U83} no310 (n57, n52, n51, ready, vss, vdd);
   {U84} iv110 (state_2_port, n51, vss, vdd);
   {U85} iv110 (state_1_port, n52, vss, vdd);
   {U86} iv110 (state_0_port, n57, vss, vdd);
}



