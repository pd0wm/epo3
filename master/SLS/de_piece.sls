extern network dfn10 (terminal D, CK, Q, vss, vdd)
extern network tinv10 (terminal A, E, Y, vss, vdd)
extern network na310 (terminal A, B, C, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network mu111 (terminal A, B, S, Y, vss, vdd)
extern network no310 (terminal A, B, C, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
network de_piece (terminal clk, rst, mask_7_0_7, mask_7_0_6, mask_7_0_5, 
                           mask_7_0_4, mask_7_0_3, mask_7_0_2, mask_7_0_1, 
                           mask_7_0_0, draw_erase, ready, start, 
                           mask_select_1_0_1, mask_select_1_0_0, lut_start, 
                           lut_ready, write, addr_7_0_7, addr_7_0_6, 
                           addr_7_0_5, addr_7_0_4, addr_7_0_3, addr_7_0_2, 
                           addr_7_0_1, addr_7_0_0, data, vss, vdd)
{
   net {ready, ready_port};
   net {lut_start, lut_start_port};
   {cur_block_reg_0_inst} dfn10 (n100, clk, cur_block_0_port, vss, vdd);
   {cur_block_reg_1_inst} dfn10 (n99, clk, cur_block_1_port, vss, vdd);
   {state_reg_2_inst} dfn10 (new_state_2_port, clk, state_2_port, vss, vdd);
   {state_reg_0_inst} dfn10 (new_state_0_port, clk, state_0_port, vss, vdd);
   {state_reg_1_inst} dfn10 (new_state_1_port, clk, state_1_port, vss, vdd);
   {cur_ready_reg} dfn10 (n98, clk, ready_port, vss, vdd);
   {cur_addr_reg_7_inst} dfn10 (new_addr_7_port, clk, cur_addr_7_port, vss, 
                                vdd);
   {cur_addr_reg_6_inst} dfn10 (new_addr_6_port, clk, cur_addr_6_port, vss, 
                                vdd);
   {cur_addr_reg_5_inst} dfn10 (new_addr_5_port, clk, cur_addr_5_port, vss, 
                                vdd);
   {cur_addr_reg_4_inst} dfn10 (new_addr_4_port, clk, cur_addr_4_port, vss, 
                                vdd);
   {cur_addr_reg_3_inst} dfn10 (new_addr_3_port, clk, cur_addr_3_port, vss, 
                                vdd);
   {cur_addr_reg_2_inst} dfn10 (new_addr_2_port, clk, cur_addr_2_port, vss, 
                                vdd);
   {cur_addr_reg_1_inst} dfn10 (new_addr_1_port, clk, cur_addr_1_port, vss, 
                                vdd);
   {cur_addr_reg_0_inst} dfn10 (new_addr_0_port, clk, cur_addr_0_port, vss, 
                                vdd);
   {cur_mask_select_reg_1_inst} dfn10 (new_mask_select_1_port, clk, 
                                       cur_mask_select_1_port, vss, vdd);
   {cur_mask_select_reg_0_inst} dfn10 (new_mask_select_0_port, clk, 
                                       cur_mask_select_0_port, vss, vdd);
   {cur_lut_start_reg} dfn10 (n97, clk, lut_start_port, vss, vdd);
   {cur_data_reg} dfn10 (new_data, clk, cur_data, vss, vdd);
   {cur_write_reg} dfn10 (new_write, clk, cur_write, vss, vdd);
   {new_data_tri} tinv10 (n96, n84, new_data, vss, vdd);
   {new_mask_select_tri_0_inst} tinv10 (n95, n94, new_mask_select_0_port, vss, 
                                        vdd);
   {new_mask_select_tri_1_inst} tinv10 (n93, n94, new_mask_select_1_port, vss, 
                                        vdd);
   {new_addr_tri_0_inst} tinv10 (n92, n84, new_addr_0_port, vss, vdd);
   {new_addr_tri_1_inst} tinv10 (n91, n84, new_addr_1_port, vss, vdd);
   {new_addr_tri_2_inst} tinv10 (n90, n84, new_addr_2_port, vss, vdd);
   {new_addr_tri_3_inst} tinv10 (n89, n84, new_addr_3_port, vss, vdd);
   {new_addr_tri_4_inst} tinv10 (n88, n84, new_addr_4_port, vss, vdd);
   {new_addr_tri_5_inst} tinv10 (n87, n84, new_addr_5_port, vss, vdd);
   {new_addr_tri_6_inst} tinv10 (n86, n84, new_addr_6_port, vss, vdd);
   {new_addr_tri_7_inst} tinv10 (n85, n84, new_addr_7_port, vss, vdd);
   {new_write_tri} tinv10 (n83, n84, new_write, vss, vdd);
   {data_tri} tinv10 (n82, n101, data, vss, vdd);
   {addr_tri_0_inst} tinv10 (n81, n101, addr_7_0_0, vss, vdd);
   {addr_tri_1_inst} tinv10 (n80, n73, addr_7_0_1, vss, vdd);
   {addr_tri_2_inst} tinv10 (n79, n73, addr_7_0_2, vss, vdd);
   {addr_tri_3_inst} tinv10 (n78, n101, addr_7_0_3, vss, vdd);
   {addr_tri_4_inst} tinv10 (n77, n101, addr_7_0_4, vss, vdd);
   {addr_tri_5_inst} tinv10 (n76, n73, addr_7_0_5, vss, vdd);
   {addr_tri_6_inst} tinv10 (n75, n73, addr_7_0_6, vss, vdd);
   {addr_tri_7_inst} tinv10 (n74, n101, addr_7_0_7, vss, vdd);
   {write_tri} tinv10 (n72, n101, write, vss, vdd);
   {mask_select_tri_0_inst} tinv10 (n71, n73, mask_select_1_0_0, vss, vdd);
   {mask_select_tri_1_inst} tinv10 (n70, n73, mask_select_1_0_1, vss, vdd);
   {U106} na210 (n106, n128, n101, vss, vdd);
   {U107} iv110 (state_0_port, n102, vss, vdd);
   {U108} na310 (n103, n104, n105, new_state_2_port, vss, vdd);
   {U109} na210 (start, n106, n105, vss, vdd);
   {U110} na310 (n107, n108, state_1_port, n104, vss, vdd);
   {U111} iv110 (lut_ready, n108, vss, vdd);
   {U112} na210 (n109, n110, n103, vss, vdd);
   {U113} na210 (n111, n112, new_state_1_port, vss, vdd);
   {U114} na210 (lut_ready, n107, n112, vss, vdd);
   {U115} na210 (n109, n113, n111, vss, vdd);
   {U116} na310 (n114, n115, n116, new_state_0_port, vss, vdd);
   {U117} no210 (n117, n118, n116, vss, vdd);
   {U118} no210 (n73, n119, n118, vss, vdd);
   {U119} iv110 (start, n119, vss, vdd);
   {U120} no210 (n110, n120, n117, vss, vdd);
   {U121} iv110 (n113, n110, vss, vdd);
   {U122} na210 (cur_block_1_port, cur_block_0_port, n113, vss, vdd);
   {U123} na210 (n107, n121, n114, vss, vdd);
   {U124} na210 (lut_ready, n122, n121, vss, vdd);
   {U125} mu111 (n123, n124, cur_block_1_port, n99, vss, vdd);
   {U126} na210 (n125, n126, n124, vss, vdd);
   {U127} na310 (n127, n128, state_1_port, n126, vss, vdd);
   {U128} no210 (n127, n120, n123, vss, vdd);
   {U129} na210 (n129, n130, n98, vss, vdd);
   {U130} na310 (start, n106, state_2_port, n130, vss, vdd);
   {U131} na210 (ready_port, n131, n129, vss, vdd);
   {U132} na210 (n120, n125, n131, vss, vdd);
   {U133} na210 (n115, n132, n97, vss, vdd);
   {U134} na210 (lut_start_port, n107, n132, vss, vdd);
   {U135} no210 (n102, state_2_port, n107, vss, vdd);
   {U136} na310 (state_0_port, n122, state_2_port, n115, vss, vdd);
   {U137} na210 (n134, n135, n96, vss, vdd);
   {U138} mu111 (cur_data, draw_erase, n102, n134, vss, vdd);
   {U139} na210 (n136, n135, n95, vss, vdd);
   {U140} mu111 (cur_block_0_port, cur_mask_select_0_port, n128, n136, vss, 
                 vdd);
   {U141} na210 (n102, n135, n94, vss, vdd);
   {U142} na210 (n137, n135, n93, vss, vdd);
   {U143} mu111 (cur_block_1_port, cur_mask_select_1_port, n128, n137, vss, 
                 vdd);
   {U144} na210 (n138, n135, n92, vss, vdd);
   {U145} mu111 (cur_addr_0_port, mask_7_0_0, n133, n138, vss, vdd);
   {U146} na210 (n139, n135, n91, vss, vdd);
   {U147} mu111 (cur_addr_1_port, mask_7_0_1, n133, n139, vss, vdd);
   {U148} na210 (n140, n135, n90, vss, vdd);
   {U149} mu111 (cur_addr_2_port, mask_7_0_2, n133, n140, vss, vdd);
   {U150} na210 (n141, n135, n89, vss, vdd);
   {U151} mu111 (cur_addr_3_port, mask_7_0_3, n133, n141, vss, vdd);
   {U152} na210 (n142, n135, n88, vss, vdd);
   {U153} mu111 (cur_addr_4_port, mask_7_0_4, n133, n142, vss, vdd);
   {U154} na210 (n143, n135, n87, vss, vdd);
   {U155} mu111 (cur_addr_5_port, mask_7_0_5, n133, n143, vss, vdd);
   {U156} na210 (n144, n135, n86, vss, vdd);
   {U157} mu111 (cur_addr_6_port, mask_7_0_6, n133, n144, vss, vdd);
   {U158} na210 (n145, n135, n85, vss, vdd);
   {U159} mu111 (cur_addr_7_port, mask_7_0_7, n133, n145, vss, vdd);
   {U160} iv110 (state_0_port, n133, vss, vdd);
   {U161} iv110 (n106, n84, vss, vdd);
   {U162} na210 (n128, n146, n83, vss, vdd);
   {U163} na210 (state_0_port, n72, n146, vss, vdd);
   {U164} iv110 (cur_data, n82, vss, vdd);
   {U165} iv110 (cur_addr_0_port, n81, vss, vdd);
   {U166} iv110 (cur_addr_1_port, n80, vss, vdd);
   {U167} iv110 (cur_addr_2_port, n79, vss, vdd);
   {U168} iv110 (cur_addr_3_port, n78, vss, vdd);
   {U169} iv110 (cur_addr_4_port, n77, vss, vdd);
   {U170} iv110 (cur_addr_5_port, n76, vss, vdd);
   {U171} iv110 (cur_addr_6_port, n75, vss, vdd);
   {U172} iv110 (cur_addr_7_port, n74, vss, vdd);
   {U173} na210 (n106, n128, n73, vss, vdd);
   {U174} iv110 (state_2_port, n128, vss, vdd);
   {U175} no210 (state_1_port, state_0_port, n106, vss, vdd);
   {U176} iv110 (cur_write, n72, vss, vdd);
   {U177} iv110 (cur_mask_select_0_port, n71, vss, vdd);
   {U178} iv110 (cur_mask_select_1_port, n70, vss, vdd);
   {U179} iv110 (n147, n100, vss, vdd);
   {U180} mu111 (n125, n120, n127, n147, vss, vdd);
   {U181} iv110 (cur_block_0_port, n127, vss, vdd);
   {U182} iv110 (n109, n120, vss, vdd);
   {U183} no310 (state_0_port, state_2_port, n122, n109, vss, vdd);
   {U184} iv110 (state_1_port, n122, vss, vdd);
   {U185} na210 (state_0_port, n135, n125, vss, vdd);
   {U186} na210 (state_2_port, state_1_port, n135, vss, vdd);
}



