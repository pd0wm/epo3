extern network dfr11 (terminal D, R, CK, Q, vss, vdd)
extern network dfn10 (terminal D, CK, Q, vss, vdd)
extern network ex210 (terminal A, B, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network no310 (terminal A, B, C, Y, vss, vdd)
extern network na310 (terminal A, B, C, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network mu111 (terminal A, B, S, Y, vss, vdd)
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
   {new_change_reg} dfn10 (n106, clk, new_change, vss, vdd);
   {cur_change_reg} dfn10 (n105, clk, cur_change, vss, vdd);
   {state_reg_0_inst} dfr11 (next_state_0_port, rst, clk, state_0_port, vss, 
                             vdd);
   {state_reg_1_inst} dfr11 (next_state_1_port, rst, clk, state_1_port, vss, 
                             vdd);
   {state_reg_2_inst} dfr11 (next_state_2_port, rst, clk, state_2_port, vss, 
                             vdd);
   {cur_mask_reg_7_inst} dfn10 (n116, clk, cur_mask_7_port, vss, vdd);
   {cur_y_out_reg_4_inst} dfn10 (n115, clk, cur_y_out_4_port, vss, vdd);
   {cur_y_out_reg_3_inst} dfn10 (n124, clk, cur_y_out_3_port, vss, vdd);
   {cur_mask_reg_6_inst} dfn10 (n117, clk, cur_mask_6_port, vss, vdd);
   {cur_y_out_reg_2_inst} dfn10 (n125, clk, cur_y_out_2_port, vss, vdd);
   {cur_mask_reg_5_inst} dfn10 (n118, clk, cur_mask_5_port, vss, vdd);
   {cur_y_out_reg_1_inst} dfn10 (n126, clk, cur_y_out_1_port, vss, vdd);
   {cur_mask_reg_4_inst} dfn10 (n119, clk, cur_mask_4_port, vss, vdd);
   {cur_y_out_reg_0_inst} dfn10 (n127, clk, cur_y_out_0_port, vss, vdd);
   {cur_mask_reg_3_inst} dfn10 (n120, clk, cur_mask_3_port, vss, vdd);
   {cur_x_out_reg_3_inst} dfn10 (n128, clk, cur_x_out_3_port, vss, vdd);
   {cur_overflow_reg} dfn10 (n114, clk, cur_overflow, vss, vdd);
   {cur_x_out_reg_2_inst} dfn10 (n129, clk, cur_x_out_2_port, vss, vdd);
   {cur_mask_reg_2_inst} dfn10 (n121, clk, cur_mask_2_port, vss, vdd);
   {cur_x_out_reg_1_inst} dfn10 (n130, clk, cur_x_out_1_port, vss, vdd);
   {cur_mask_reg_1_inst} dfn10 (n122, clk, cur_mask_1_port, vss, vdd);
   {cur_x_out_reg_0_inst} dfn10 (n131, clk, cur_x_out_0_port, vss, vdd);
   {cur_mask_reg_0_inst} dfn10 (n123, clk, cur_mask_0_port, vss, vdd);
   {cur_ready_reg} dfn10 (n132, clk, cur_ready, vss, vdd);
   {cur_rom_addr_reg_6_inst} dfn10 (n113, clk, cur_rom_addr_6_port, vss, vdd);
   {cur_rom_addr_reg_5_inst} dfn10 (n112, clk, cur_rom_addr_5_port, vss, vdd);
   {cur_rom_addr_reg_4_inst} dfn10 (n111, clk, cur_rom_addr_4_port, vss, vdd);
   {cur_rom_addr_reg_3_inst} dfn10 (n110, clk, cur_rom_addr_3_port, vss, vdd);
   {cur_rom_addr_reg_2_inst} dfn10 (n109, clk, cur_rom_addr_2_port, vss, vdd);
   {cur_rom_addr_reg_1_inst} dfn10 (n108, clk, cur_rom_addr_1_port, vss, vdd);
   {cur_rom_addr_reg_0_inst} dfn10 (n107, clk, cur_rom_addr_0_port, vss, vdd);
   {overflow_reg} dfn10 (cur_overflow, clk, overflow, vss, vdd);
   {mask_reg_7_inst} dfn10 (cur_mask_7_port, clk, mask_7_0_7, vss, vdd);
   {mask_reg_6_inst} dfn10 (cur_mask_6_port, clk, mask_7_0_6, vss, vdd);
   {mask_reg_5_inst} dfn10 (cur_mask_5_port, clk, mask_7_0_5, vss, vdd);
   {mask_reg_4_inst} dfn10 (cur_mask_4_port, clk, mask_7_0_4, vss, vdd);
   {mask_reg_3_inst} dfn10 (cur_mask_3_port, clk, mask_7_0_3, vss, vdd);
   {mask_reg_2_inst} dfn10 (cur_mask_2_port, clk, mask_7_0_2, vss, vdd);
   {mask_reg_1_inst} dfn10 (cur_mask_1_port, clk, mask_7_0_1, vss, vdd);
   {mask_reg_0_inst} dfn10 (cur_mask_0_port, clk, mask_7_0_0, vss, vdd);
   {ready_reg} dfn10 (cur_ready, clk, ready, vss, vdd);
   {rom_addr_reg_6_inst} dfn10 (cur_rom_addr_6_port, clk, rom_addr_6_0_6, vss, 
                                vdd);
   {rom_addr_reg_5_inst} dfn10 (cur_rom_addr_5_port, clk, rom_addr_6_0_5, vss, 
                                vdd);
   {rom_addr_reg_4_inst} dfn10 (cur_rom_addr_4_port, clk, rom_addr_6_0_4, vss, 
                                vdd);
   {rom_addr_reg_3_inst} dfn10 (cur_rom_addr_3_port, clk, rom_addr_6_0_3, vss, 
                                vdd);
   {rom_addr_reg_2_inst} dfn10 (cur_rom_addr_2_port, clk, rom_addr_6_0_2, vss, 
                                vdd);
   {rom_addr_reg_1_inst} dfn10 (cur_rom_addr_1_port, clk, rom_addr_6_0_1, vss, 
                                vdd);
   {rom_addr_reg_0_inst} dfn10 (cur_rom_addr_0_port, clk, rom_addr_6_0_0, vss, 
                                vdd);
   {U135} na310 (n133, n134, n135, next_state_2_port, vss, vdd);
   {U136} iv110 (n136, n134, vss, vdd);
   {U137} na310 (n137, n138, n135, next_state_1_port, vss, vdd);
   {U138} no210 (n139, n140, n135, vss, vdd);
   {U139} na210 (n141, n142, next_state_0_port, vss, vdd);
   {U140} na310 (n143, n144, n145, n142, vss, vdd);
   {U141} no210 (cur_change, n146, n145, vss, vdd);
   {U142} mu111 (n140, cur_ready, n147, n132, vss, vdd);
   {U143} na210 (n141, n148, n147, vss, vdd);
   {U144} iv110 (n149, n141, vss, vdd);
   {U145} no210 (n146, n150, n140, vss, vdd);
   {U146} na210 (n151, n152, n131, vss, vdd);
   {U147} na210 (n153, n154, n152, vss, vdd);
   {U148} ex210 (x_2_0_0, rom_data_3_0_0, n154, vss, vdd);
   {U149} na210 (cur_x_out_0_port, n155, n151, vss, vdd);
   {U150} na210 (n156, n157, n130, vss, vdd);
   {U151} na210 (n153, n158, n157, vss, vdd);
   {U152} ex210 (n159, n160, n158, vss, vdd);
   {U153} iv110 (n161, n159, vss, vdd);
   {U154} na210 (x_2_0_0, rom_data_3_0_0, n161, vss, vdd);
   {U155} na210 (cur_x_out_1_port, n155, n156, vss, vdd);
   {U156} na210 (n162, n163, n129, vss, vdd);
   {U157} na210 (n164, n153, n163, vss, vdd);
   {U158} ex210 (n165, x_2_0_2, n164, vss, vdd);
   {U159} na210 (cur_x_out_2_port, n155, n162, vss, vdd);
   {U160} na210 (n166, n167, n128, vss, vdd);
   {U161} na310 (n153, n165, x_2_0_2, n167, vss, vdd);
   {U162} na210 (n168, n169, n165, vss, vdd);
   {U163} na310 (x_2_0_0, n160, rom_data_3_0_0, n169, vss, vdd);
   {U164} ex210 (rom_data_3_0_1, x_2_0_1, n160, vss, vdd);
   {U165} na210 (rom_data_3_0_1, x_2_0_1, n168, vss, vdd);
   {U166} na210 (cur_x_out_3_port, n155, n166, vss, vdd);
   {U167} na210 (n170, n171, n127, vss, vdd);
   {U168} na210 (n153, n172, n171, vss, vdd);
   {U169} ex210 (y_3_0_0, rom_data_3_0_2, n172, vss, vdd);
   {U170} na210 (cur_y_out_0_port, n155, n170, vss, vdd);
   {U171} na210 (n173, n174, n126, vss, vdd);
   {U172} na210 (n153, n175, n174, vss, vdd);
   {U173} ex210 (n176, n177, n175, vss, vdd);
   {U174} na210 (cur_y_out_1_port, n155, n173, vss, vdd);
   {U175} na210 (n178, n179, n125, vss, vdd);
   {U176} na210 (n180, n153, n179, vss, vdd);
   {U177} ex210 (n181, y_3_0_2, n180, vss, vdd);
   {U178} na210 (cur_y_out_2_port, n155, n178, vss, vdd);
   {U179} na210 (n182, n183, n124, vss, vdd);
   {U180} na210 (n153, n184, n183, vss, vdd);
   {U181} ex210 (y_3_0_3, n185, n184, vss, vdd);
   {U182} na210 (cur_y_out_3_port, n155, n182, vss, vdd);
   {U183} na210 (n186, n187, n123, vss, vdd);
   {U184} na210 (n188, cur_x_out_0_port, n187, vss, vdd);
   {U185} na210 (cur_mask_0_port, n189, n186, vss, vdd);
   {U186} na210 (n190, n191, n122, vss, vdd);
   {U187} na210 (n188, cur_x_out_1_port, n191, vss, vdd);
   {U188} na210 (cur_mask_1_port, n189, n190, vss, vdd);
   {U189} na210 (n192, n193, n121, vss, vdd);
   {U190} na210 (n188, cur_x_out_2_port, n193, vss, vdd);
   {U191} na210 (cur_mask_2_port, n189, n192, vss, vdd);
   {U192} na210 (n194, n195, n120, vss, vdd);
   {U193} na210 (n188, cur_y_out_0_port, n195, vss, vdd);
   {U194} na210 (cur_mask_3_port, n189, n194, vss, vdd);
   {U195} na210 (n196, n197, n119, vss, vdd);
   {U196} na210 (n188, cur_y_out_1_port, n197, vss, vdd);
   {U197} na210 (cur_mask_4_port, n189, n196, vss, vdd);
   {U198} na210 (n198, n199, n118, vss, vdd);
   {U199} na210 (n188, cur_y_out_2_port, n199, vss, vdd);
   {U200} na210 (cur_mask_5_port, n189, n198, vss, vdd);
   {U201} na210 (n200, n201, n117, vss, vdd);
   {U202} na210 (n188, cur_y_out_3_port, n201, vss, vdd);
   {U203} na210 (cur_mask_6_port, n189, n200, vss, vdd);
   {U204} na210 (n202, n203, n116, vss, vdd);
   {U205} na210 (next_piece, n188, n203, vss, vdd);
   {U206} no210 (n204, n189, n188, vss, vdd);
   {U207} na210 (cur_mask_7_port, n189, n202, vss, vdd);
   {U208} na210 (n205, n138, n189, vss, vdd);
   {U209} na210 (n206, n207, n115, vss, vdd);
   {U210} na310 (y_3_0_3, n153, n185, n207, vss, vdd);
   {U211} iv110 (n208, n185, vss, vdd);
   {U212} na210 (y_3_0_2, n181, n208, vss, vdd);
   {U213} na210 (n209, n210, n181, vss, vdd);
   {U214} na210 (n176, n177, n210, vss, vdd);
   {U215} ex210 (rom_data_3_0_3, y_3_0_1, n177, vss, vdd);
   {U216} iv110 (n211, n176, vss, vdd);
   {U217} na210 (rom_data_3_0_2, y_3_0_0, n211, vss, vdd);
   {U218} na210 (rom_data_3_0_3, y_3_0_1, n209, vss, vdd);
   {U219} no210 (n133, n155, n153, vss, vdd);
   {U220} na210 (cur_y_out_4_port, n155, n206, vss, vdd);
   {U221} na310 (n137, n150, n148, n155, vss, vdd);
   {U222} mu111 (cur_overflow, n212, n205, n114, vss, vdd);
   {U223} no310 (n149, n136, n213, n205, vss, vdd);
   {U224} iv110 (n214, n213, vss, vdd);
   {U225} no210 (rst, n215, n214, vss, vdd);
   {U226} na210 (n133, n137, n149, vss, vdd);
   {U227} no210 (n216, n204, n212, vss, vdd);
   {U228} no210 (cur_x_out_3_port, cur_y_out_4_port, n216, vss, vdd);
   {U229} na210 (n217, n218, n113, vss, vdd);
   {U230} na210 (piece_type_2_0_2, n219, n218, vss, vdd);
   {U231} na210 (cur_rom_addr_6_port, n220, n217, vss, vdd);
   {U232} na210 (n221, n222, n112, vss, vdd);
   {U233} na210 (piece_type_2_0_1, n219, n222, vss, vdd);
   {U234} na210 (cur_rom_addr_5_port, n220, n221, vss, vdd);
   {U235} na210 (n223, n224, n111, vss, vdd);
   {U236} na210 (piece_type_2_0_0, n219, n224, vss, vdd);
   {U237} na210 (cur_rom_addr_4_port, n220, n223, vss, vdd);
   {U238} na210 (n225, n226, n110, vss, vdd);
   {U239} na210 (rot_1_0_1, n219, n226, vss, vdd);
   {U240} na210 (cur_rom_addr_3_port, n220, n225, vss, vdd);
   {U241} na210 (n227, n228, n109, vss, vdd);
   {U242} na210 (rot_1_0_0, n219, n228, vss, vdd);
   {U243} na210 (cur_rom_addr_2_port, n220, n227, vss, vdd);
   {U244} na210 (n229, n230, n108, vss, vdd);
   {U245} na210 (mask_select_1_0_1, n219, n230, vss, vdd);
   {U246} na210 (cur_rom_addr_1_port, n220, n229, vss, vdd);
   {U247} na210 (n231, n232, n107, vss, vdd);
   {U248} na210 (mask_select_1_0_0, n219, n232, vss, vdd);
   {U249} no210 (n137, n220, n219, vss, vdd);
   {U250} na310 (n143, n233, state_1_port, n137, vss, vdd);
   {U251} na210 (cur_rom_addr_0_port, n220, n231, vss, vdd);
   {U252} na310 (n133, n150, n148, n220, vss, vdd);
   {U253} iv110 (n234, n148, vss, vdd);
   {U254} na310 (n204, n138, n235, n234, vss, vdd);
   {U255} no210 (rst, n136, n235, vss, vdd);
   {U256} no310 (n143, state_2_port, n144, n136, vss, vdd);
   {U257} na310 (n144, n233, state_0_port, n138, vss, vdd);
   {U258} iv110 (n139, n204, vss, vdd);
   {U259} no310 (n143, state_1_port, n233, n139, vss, vdd);
   {U260} iv110 (n215, n150, vss, vdd);
   {U261} no310 (n144, state_0_port, n233, n215, vss, vdd);
   {U262} iv110 (state_2_port, n233, vss, vdd);
   {U263} na310 (n143, n144, state_2_port, n133, vss, vdd);
   {U264} iv110 (state_1_port, n144, vss, vdd);
   {U265} iv110 (state_0_port, n143, vss, vdd);
   {U266} mu111 (n236, new_change, rst, n106, vss, vdd);
   {U267} iv110 (n146, n236, vss, vdd);
   {U268} no210 (draw_start, check_start, n146, vss, vdd);
   {U269} mu111 (new_change, cur_change, rst, n105, vss, vdd);
}



