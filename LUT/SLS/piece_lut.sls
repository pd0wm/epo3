extern network dfr11 (terminal D, R, CK, Q, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network na310 (terminal A, B, C, Y, vss, vdd)
extern network ex210 (terminal A, B, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network no310 (terminal A, B, C, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
network piece_lut (terminal lut_clk, lut_rst, lut_mask_7_0_7, lut_mask_7_0_6, 
                            lut_mask_7_0_5, lut_mask_7_0_4, lut_mask_7_0_3, 
                            lut_mask_7_0_2, lut_mask_7_0_1, lut_mask_7_0_0, 
                            lut_mask_select_1_0_1, lut_mask_select_1_0_0, 
                            lut_x_2_0_2, lut_x_2_0_1, lut_x_2_0_0, lut_y_3_0_3, 
                            lut_y_3_0_2, lut_y_3_0_1, lut_y_3_0_0, 
                            lut_rot_1_0_1, lut_rot_1_0_0, lut_piece_type_2_0_2, 
                            lut_piece_type_2_0_1, lut_piece_type_2_0_0, 
                            lut_next_piece, lut_ready, lut_error_side, 
                            lut_error_bot, lut_start, lut_rom_addr_6_0_6, 
                            lut_rom_addr_6_0_5, lut_rom_addr_6_0_4, 
                            lut_rom_addr_6_0_3, lut_rom_addr_6_0_2, 
                            lut_rom_addr_6_0_1, lut_rom_addr_6_0_0, 
                            lut_rom_data_3_0_3, lut_rom_data_3_0_2, 
                            lut_rom_data_3_0_1, lut_rom_data_3_0_0, vss, vdd)
{
   net {lut_mask_7_0_7, lut_next_piece};
   net {lut_mask_7_0_6, lut_mask_6_port};
   net {lut_mask_7_0_5, lut_mask_5_port};
   net {lut_mask_7_0_4, lut_mask_4_port};
   net {lut_mask_7_0_3, lut_mask_3_port};
   net {lut_mask_7_0_2, lut_mask_2_port};
   net {lut_mask_7_0_1, lut_mask_1_port};
   net {lut_mask_7_0_0, lut_mask_0_port};
   net {lut_rom_addr_6_0_6, lut_piece_type_2_0_2};
   net {lut_rom_addr_6_0_5, lut_piece_type_2_0_1};
   net {lut_rom_addr_6_0_4, lut_piece_type_2_0_0};
   net {lut_rom_addr_6_0_3, lut_rot_1_0_1};
   net {lut_rom_addr_6_0_2, lut_rot_1_0_0};
   net {lut_rom_addr_6_0_1, lut_mask_select_1_0_1};
   net {lut_rom_addr_6_0_0, lut_mask_select_1_0_0};
   {lut_state_reg_0_inst} dfr11 (lut_next_state_0_port, lut_rst, lut_clk, 
                                 lut_state_0_port, vss, vdd);
   {lut_state_reg_1_inst} dfr11 (lut_next_state_1_port, lut_rst, lut_clk, 
                                 lut_state_1_port, vss, vdd);
   {lut_state_reg_2_inst} dfr11 (lut_next_state_2_port, lut_rst, lut_clk, 
                                 lut_state_2_port, vss, vdd);
   {U40} iv110 (n47, lut_mask_1_port, vss, vdd);
   {U41} ex210 (n48, n49, n47, vss, vdd);
   {U42} na210 (lut_rom_data_3_0_0, lut_x_2_0_0, n48, vss, vdd);
   {U43} na310 (n50, n51, n52, lut_next_state_2_port, vss, vdd);
   {U44} na210 (lut_state_0_port, n53, n52, vss, vdd);
   {U45} ex210 (n54, n55, n53, vss, vdd);
   {U46} na210 (n56, n57, lut_next_state_1_port, vss, vdd);
   {U47} na210 (lut_state_0_port, n55, n57, vss, vdd);
   {U48} na210 (n56, n58, lut_next_state_0_port, vss, vdd);
   {U49} na210 (n59, n60, n58, vss, vdd);
   {U50} na210 (n50, n61, n59, vss, vdd);
   {U51} na210 (lut_start, n54, n61, vss, vdd);
   {U52} na310 (n62, n55, lut_state_2_port, n50, vss, vdd);
   {U53} na210 (lut_x_2_0_2, n63, n62, vss, vdd);
   {U54} iv110 (n64, n56, vss, vdd);
   {U55} na210 (n51, n65, n64, vss, vdd);
   {U56} na310 (n60, n54, lut_state_1_port, n65, vss, vdd);
   {U57} na310 (n66, n60, n67, n51, vss, vdd);
   {U58} no210 (n55, n54, n67, vss, vdd);
   {U59} iv110 (n68, lut_mask_6_port, vss, vdd);
   {U60} ex210 (lut_y_3_0_3, n69, n68, vss, vdd);
   {U61} na210 (lut_y_3_0_2, n70, n69, vss, vdd);
   {U62} ex210 (n70, lut_y_3_0_2, lut_mask_5_port, vss, vdd);
   {U63} iv110 (n71, lut_mask_4_port, vss, vdd);
   {U64} ex210 (n72, n73, n71, vss, vdd);
   {U65} na210 (lut_rom_data_3_0_2, lut_y_3_0_0, n72, vss, vdd);
   {U66} ex210 (lut_y_3_0_0, lut_rom_data_3_0_2, lut_mask_3_port, vss, vdd);
   {U67} ex210 (n63, lut_x_2_0_2, lut_mask_2_port, vss, vdd);
   {U68} ex210 (lut_x_2_0_0, lut_rom_data_3_0_0, lut_mask_0_port, vss, vdd);
   {U69} no310 (n74, n54, n75, lut_error_side, vss, vdd);
   {U70} iv110 (lut_x_2_0_2, n75, vss, vdd);
   {U71} na310 (n60, n55, n63, n74, vss, vdd);
   {U72} na210 (n76, n77, n63, vss, vdd);
   {U73} na310 (lut_rom_data_3_0_0, n49, lut_x_2_0_0, n77, vss, vdd);
   {U74} ex210 (lut_rom_data_3_0_1, lut_x_2_0_1, n49, vss, vdd);
   {U75} na210 (lut_rom_data_3_0_1, lut_x_2_0_1, n76, vss, vdd);
   {U76} no310 (n78, n54, n66, lut_error_bot, vss, vdd);
   {U77} na310 (lut_y_3_0_2, n70, lut_y_3_0_3, n66, vss, vdd);
   {U78} na210 (n79, n80, n70, vss, vdd);
   {U79} na310 (lut_rom_data_3_0_2, n73, lut_y_3_0_0, n80, vss, vdd);
   {U80} ex210 (lut_rom_data_3_0_3, lut_y_3_0_1, n73, vss, vdd);
   {U81} na210 (lut_rom_data_3_0_3, lut_y_3_0_1, n79, vss, vdd);
   {U82} na210 (lut_state_1_port, n60, n78, vss, vdd);
   {U83} no310 (n60, n55, n54, lut_ready, vss, vdd);
   {U84} iv110 (lut_state_2_port, n54, vss, vdd);
   {U85} iv110 (lut_state_1_port, n55, vss, vdd);
   {U86} iv110 (lut_state_0_port, n60, vss, vdd);
}



