extern network adder_x (terminal x_2_0_2, x_2_0_1, x_2_0_0, rom_data_1_0_1, 
                                 rom_data_1_0_0, next_piece, x_out_3_0_3, 
                                 x_out_3_0_2, x_out_3_0_1, x_out_3_0_0, vss, 
                                 vdd)
extern network adder_y (terminal y_3_0_3, y_3_0_2, y_3_0_1, y_3_0_0, 
                                 rom_data_1_0_1, rom_data_1_0_0, next_piece, 
                                 y_out_4_0_4, y_out_4_0_3, y_out_4_0_2, 
                                 y_out_4_0_1, y_out_4_0_0, vss, vdd)
extern network dfr11 (terminal D, R, CK, Q, vss, vdd)
extern network na310 (terminal A, B, C, Y, vss, vdd)
extern network no310 (terminal A, B, C, Y, vss, vdd)
extern network mu111 (terminal A, B, S, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
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
   net {mask_7_0_7, mask_7_port};
   net {mask_7_0_6, mask_6_port};
   net {mask_7_0_5, mask_5_port};
   net {mask_7_0_4, mask_4_port};
   net {mask_7_0_3, mask_3_port};
   net {mask_7_0_2, mask_2_port};
   net {mask_7_0_1, mask_1_port};
   net {mask_7_0_0, mask_0_port};
   net {ready, ready_port};
   net {rom_addr_6_0_6, rom_addr_6_port};
   net {rom_addr_6_0_5, rom_addr_5_port};
   net {rom_addr_6_0_4, rom_addr_4_port};
   net {rom_addr_6_0_3, rom_addr_3_port};
   net {rom_addr_6_0_2, rom_addr_2_port};
   net {rom_addr_6_0_1, rom_addr_1_port};
   net {rom_addr_6_0_0, rom_addr_0_port};
   {lbl_adder_x} adder_x (x_2_0_2, x_2_0_1, x_2_0_0, rom_data_3_0_1, 
                          rom_data_3_0_0, next_piece, x_out_3_port, 
                          x_out_2_port, x_out_1_port, x_out_0_port, vss, vdd);
   {lbl_adder_y} adder_y (y_3_0_3, y_3_0_2, y_3_0_1, y_3_0_0, rom_data_3_0_3, 
                          rom_data_3_0_2, next_piece, y_out_4_port, 
                          y_out_3_port, y_out_2_port, y_out_1_port, 
                          y_out_0_port, vss, vdd);
   {state_reg_0_inst} dfr11 (next_state_0_port, rst, clk, state_0_port, vss, 
                             vdd);
   {state_reg_2_inst} dfr11 (next_state_2_port, rst, clk, state_2_port, vss, 
                             vdd);
   {state_reg_1_inst} dfr11 (next_state_1_port, rst, clk, state_1_port, vss, 
                             vdd);
   {cur_rom_addr_reg_6_inst} dfr11 (new_rom_addr_6_port, rst, clk, 
                                    rom_addr_6_port, vss, vdd);
   {cur_rom_addr_reg_5_inst} dfr11 (new_rom_addr_5_port, rst, clk, 
                                    rom_addr_5_port, vss, vdd);
   {cur_rom_addr_reg_4_inst} dfr11 (new_rom_addr_4_port, rst, clk, 
                                    rom_addr_4_port, vss, vdd);
   {cur_rom_addr_reg_3_inst} dfr11 (new_rom_addr_3_port, rst, clk, 
                                    rom_addr_3_port, vss, vdd);
   {cur_rom_addr_reg_2_inst} dfr11 (new_rom_addr_2_port, rst, clk, 
                                    rom_addr_2_port, vss, vdd);
   {cur_rom_addr_reg_1_inst} dfr11 (new_rom_addr_1_port, rst, clk, 
                                    rom_addr_1_port, vss, vdd);
   {cur_rom_addr_reg_0_inst} dfr11 (new_rom_addr_0_port, rst, clk, 
                                    rom_addr_0_port, vss, vdd);
   {cur_mask_reg_7_inst} dfr11 (new_mask_7_port, rst, clk, mask_7_port, vss, 
                                vdd);
   {cur_mask_reg_6_inst} dfr11 (new_mask_6_port, rst, clk, mask_6_port, vss, 
                                vdd);
   {cur_mask_reg_5_inst} dfr11 (new_mask_5_port, rst, clk, mask_5_port, vss, 
                                vdd);
   {cur_mask_reg_4_inst} dfr11 (new_mask_4_port, rst, clk, mask_4_port, vss, 
                                vdd);
   {cur_mask_reg_3_inst} dfr11 (new_mask_3_port, rst, clk, mask_3_port, vss, 
                                vdd);
   {cur_mask_reg_2_inst} dfr11 (new_mask_2_port, rst, clk, mask_2_port, vss, 
                                vdd);
   {cur_mask_reg_1_inst} dfr11 (new_mask_1_port, rst, clk, mask_1_port, vss, 
                                vdd);
   {cur_mask_reg_0_inst} dfr11 (new_mask_0_port, rst, clk, mask_0_port, vss, 
                                vdd);
   {U78} no310 (n57, state_0_port, n58, overflow, vss, vdd);
   {U79} mu111 (n59, n60, n57, next_state_2_port, vss, vdd);
   {U80} no210 (n58, n61, n60, vss, vdd);
   {U81} na210 (n62, state_1_port, n59, vss, vdd);
   {U82} iv110 (n63, next_state_1_port, vss, vdd);
   {U83} no310 (n64, ready_port, n65, n63, vss, vdd);
   {U84} na310 (n66, n67, n68, next_state_0_port, vss, vdd);
   {U85} na210 (ready_port, state_0_port, n68, vss, vdd);
   {U86} no310 (n58, n62, n57, ready_port, vss, vdd);
   {U87} iv110 (n69, n66, vss, vdd);
   {U88} no210 (n70, state_1_port, n69, vss, vdd);
   {U89} no210 (n71, n72, n70, vss, vdd);
   {U90} no210 (n57, n73, n72, vss, vdd);
   {U91} no210 (n61, n74, n73, vss, vdd);
   {U92} no210 (y_out_4_port, x_out_3_port, n74, vss, vdd);
   {U93} no210 (n62, state_0_port, n71, vss, vdd);
   {U94} no210 (draw_start, check_start, n62, vss, vdd);
   {U95} na210 (n75, n76, new_rom_addr_6_port, vss, vdd);
   {U96} na210 (rom_addr_6_port, n77, n76, vss, vdd);
   {U97} na210 (piece_type_2_0_2, n64, n75, vss, vdd);
   {U98} na210 (n78, n79, new_rom_addr_5_port, vss, vdd);
   {U99} na210 (rom_addr_5_port, n77, n79, vss, vdd);
   {U100} na210 (piece_type_2_0_1, n64, n78, vss, vdd);
   {U101} na210 (n80, n81, new_rom_addr_4_port, vss, vdd);
   {U102} na210 (rom_addr_4_port, n77, n81, vss, vdd);
   {U103} na210 (piece_type_2_0_0, n64, n80, vss, vdd);
   {U104} na210 (n82, n83, new_rom_addr_3_port, vss, vdd);
   {U105} na210 (rom_addr_3_port, n77, n83, vss, vdd);
   {U106} na210 (rot_1_0_1, n64, n82, vss, vdd);
   {U107} na210 (n84, n85, new_rom_addr_2_port, vss, vdd);
   {U108} na210 (rom_addr_2_port, n77, n85, vss, vdd);
   {U109} na210 (rot_1_0_0, n64, n84, vss, vdd);
   {U110} na210 (n86, n87, new_rom_addr_1_port, vss, vdd);
   {U111} na210 (rom_addr_1_port, n77, n87, vss, vdd);
   {U112} na210 (mask_select_1_0_1, n64, n86, vss, vdd);
   {U113} na210 (n88, n89, new_rom_addr_0_port, vss, vdd);
   {U114} na210 (rom_addr_0_port, n77, n89, vss, vdd);
   {U115} na210 (n90, n91, n77, vss, vdd);
   {U116} na210 (mask_select_1_0_0, n64, n88, vss, vdd);
   {U117} na210 (n92, n93, new_mask_7_port, vss, vdd);
   {U118} na210 (mask_7_port, n94, n93, vss, vdd);
   {U119} na210 (next_piece, n95, n92, vss, vdd);
   {U120} na210 (n96, n97, new_mask_6_port, vss, vdd);
   {U121} na210 (mask_6_port, n94, n97, vss, vdd);
   {U122} na210 (y_out_3_port, n95, n96, vss, vdd);
   {U123} na210 (n98, n99, new_mask_5_port, vss, vdd);
   {U124} na210 (mask_5_port, n94, n99, vss, vdd);
   {U125} na210 (y_out_2_port, n95, n98, vss, vdd);
   {U126} na210 (n100, n101, new_mask_4_port, vss, vdd);
   {U127} na210 (mask_4_port, n94, n101, vss, vdd);
   {U128} na210 (y_out_1_port, n95, n100, vss, vdd);
   {U129} na210 (n102, n103, new_mask_3_port, vss, vdd);
   {U130} na210 (mask_3_port, n94, n103, vss, vdd);
   {U131} na210 (y_out_0_port, n95, n102, vss, vdd);
   {U132} na210 (n104, n105, new_mask_2_port, vss, vdd);
   {U133} na210 (mask_2_port, n94, n105, vss, vdd);
   {U134} na210 (x_out_2_port, n95, n104, vss, vdd);
   {U135} na210 (n106, n107, new_mask_1_port, vss, vdd);
   {U136} na210 (mask_1_port, n94, n107, vss, vdd);
   {U137} na210 (x_out_1_port, n95, n106, vss, vdd);
   {U138} na210 (n108, n109, new_mask_0_port, vss, vdd);
   {U139} na210 (mask_0_port, n94, n109, vss, vdd);
   {U140} na210 (n90, n67, n94, vss, vdd);
   {U141} iv110 (n64, n67, vss, vdd);
   {U142} no310 (state_0_port, state_2_port, n58, n64, vss, vdd);
   {U143} iv110 (state_1_port, n58, vss, vdd);
   {U144} mu111 (n65, n61, n57, n90, vss, vdd);
   {U145} iv110 (state_2_port, n57, vss, vdd);
   {U146} na210 (x_out_0_port, n95, n108, vss, vdd);
   {U147} iv110 (n91, n95, vss, vdd);
   {U148} na210 (n65, state_2_port, n91, vss, vdd);
   {U149} no210 (n61, state_1_port, n65, vss, vdd);
   {U150} iv110 (state_0_port, n61, vss, vdd);
}



