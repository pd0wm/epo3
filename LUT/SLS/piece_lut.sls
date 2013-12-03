extern network dfr11 (terminal D, R, CK, Q, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network mu111 (terminal A, B, S, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network ex210 (terminal A, B, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
extern network na310 (terminal A, B, C, Y, vss, vdd)
network piece_lut (terminal clk, rst, mask_7_0_7, mask_7_0_6, mask_7_0_5, 
                            mask_7_0_4, mask_7_0_3, mask_7_0_2, mask_7_0_1, 
                            mask_7_0_0, mask_select_1_0_1, mask_select_1_0_0, 
                            x_2_0_2, x_2_0_1, x_2_0_0, y_3_0_3, y_3_0_2, 
                            y_3_0_1, y_3_0_0, rot_1_0_1, rot_1_0_0, 
                            piece_type_2_0_2, piece_type_2_0_1, 
                            piece_type_2_0_0, next_piece, ready, overflow, 
                            check_start, draw_start, rom_addr_6_0_6, 
                            rom_addr_6_0_5, rom_addr_6_0_4, rom_addr_6_0_3, 
                            rom_addr_6_0_2, rom_addr_6_0_1, rom_addr_6_0_0, 
                            rom_data_3_0_3, rom_data_3_0_2, rom_data_3_0_1, 
                            rom_data_3_0_0, vss, vdd)
{
   net {mask_7_0_7, next_piece};
   net {mask_7_0_6, mask_6_port};
   net {mask_7_0_5, mask_5_port};
   net {mask_7_0_4, mask_4_port};
   net {mask_7_0_3, mask_3_port};
   net {mask_7_0_2, mask_2_port};
   net {mask_7_0_1, mask_1_port};
   net {mask_7_0_0, mask_0_port};
   net {ready, N42};
   net {overflow, overflow_port};
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
   {overflow1_reg} dfr11 (next_overflow, rst, clk, overflow_port, vss, vdd);
   {U48} na210 (n54, n55, next_state_2_port, vss, vdd);
   {U49} mu111 (state_1_port, n56, n57, n54, vss, vdd);
   {U50} na210 (state_1_port, state_0_port, n56, vss, vdd);
   {U51} na310 (n58, n59, n60, next_state_1_port, vss, vdd);
   {U52} ex210 (n61, state_1_port, n60, vss, vdd);
   {U53} iv110 (n62, n59, vss, vdd);
   {U54} na310 (n63, n64, x_2_0_2, n58, vss, vdd);
   {U55} na210 (n55, n65, next_state_0_port, vss, vdd);
   {U56} na210 (state_1_port, n61, n65, vss, vdd);
   {U57} iv110 (state_0_port, n61, vss, vdd);
   {U58} no210 (n62, n63, n55, vss, vdd);
   {U59} no210 (n66, n67, n62, vss, vdd);
   {U60} no210 (draw_start, check_start, n66, vss, vdd);
   {U61} na210 (n68, n69, next_overflow, vss, vdd);
   {U62} na210 (n70, n63, n69, vss, vdd);
   {U63} no210 (n57, state_0_port, n63, vss, vdd);
   {U64} iv110 (state_2_port, n57, vss, vdd);
   {U65} iv110 (n71, n70, vss, vdd);
   {U66} mu111 (n72, n73, state_1_port, n71, vss, vdd);
   {U67} na310 (y_3_0_3, n74, y_3_0_2, n73, vss, vdd);
   {U68} na210 (n64, x_2_0_2, n72, vss, vdd);
   {U69} na210 (overflow_port, N42, n68, vss, vdd);
   {U70} ex210 (n75, n76, mask_6_port, vss, vdd);
   {U71} na210 (y_3_0_2, n74, n76, vss, vdd);
   {U72} iv110 (y_3_0_3, n75, vss, vdd);
   {U73} ex210 (n74, y_3_0_2, mask_5_port, vss, vdd);
   {U74} na210 (n77, n78, n74, vss, vdd);
   {U75} na310 (rom_data_3_0_2, n79, y_3_0_0, n78, vss, vdd);
   {U76} na210 (rom_data_3_0_3, y_3_0_1, n77, vss, vdd);
   {U77} ex210 (n80, n79, mask_4_port, vss, vdd);
   {U78} ex210 (rom_data_3_0_3, y_3_0_1, n79, vss, vdd);
   {U79} iv110 (n81, n80, vss, vdd);
   {U80} na210 (rom_data_3_0_2, y_3_0_0, n81, vss, vdd);
   {U81} ex210 (y_3_0_0, rom_data_3_0_2, mask_3_port, vss, vdd);
   {U82} ex210 (n64, x_2_0_2, mask_2_port, vss, vdd);
   {U83} na210 (n82, n83, n64, vss, vdd);
   {U84} na310 (rom_data_3_0_0, n84, x_2_0_0, n83, vss, vdd);
   {U85} na210 (rom_data_3_0_1, x_2_0_1, n82, vss, vdd);
   {U86} ex210 (n85, n84, mask_1_port, vss, vdd);
   {U87} ex210 (rom_data_3_0_1, x_2_0_1, n84, vss, vdd);
   {U88} iv110 (n86, n85, vss, vdd);
   {U89} na210 (rom_data_3_0_0, x_2_0_0, n86, vss, vdd);
   {U90} ex210 (x_2_0_0, rom_data_3_0_0, mask_0_port, vss, vdd);
   {U91} iv110 (n67, N42, vss, vdd);
   {U92} na310 (state_0_port, state_2_port, state_1_port, n67, vss, vdd);
}



