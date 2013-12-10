
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of piece_lut is

   component mu111
      port( A, B, S : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component na310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component no310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component ex210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component dfn10
      port( D, CK : in std_logic;  Q : out std_logic);
   end component;
   
   component dfr11
      port( D, R, CK : in std_logic;  Q : out std_logic);
   end component;
   
   signal state_2_port, state_1_port, state_0_port, cur_x_out_3_port, 
      cur_x_out_2_port, cur_x_out_1_port, cur_x_out_0_port, cur_y_out_4_port, 
      cur_y_out_3_port, cur_y_out_2_port, cur_y_out_1_port, cur_y_out_0_port, 
      next_state_2_port, next_state_1_port, next_state_0_port, cur_ready, 
      cur_overflow, cur_mask_7_port, cur_mask_6_port, cur_mask_5_port, 
      cur_mask_4_port, cur_mask_3_port, cur_mask_2_port, cur_mask_1_port, 
      cur_mask_0_port, cur_change, new_change, cur_rom_addr_6_port, 
      cur_rom_addr_5_port, cur_rom_addr_4_port, cur_rom_addr_3_port, 
      cur_rom_addr_2_port, cur_rom_addr_1_port, cur_rom_addr_0_port, n105, n106
      , n107, n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
      n119, n120, n121, n122, n123, n124, n125, n126, n127, n128, n129, n130, 
      n131, n132, n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, 
      n143, n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, 
      n155, n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166, 
      n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n177, n178, 
      n179, n180, n181, n182, n183, n184, n185, n186, n187, n188, n189, n190, 
      n191, n192, n193, n194, n195, n196, n197, n198, n199, n200, n201, n202, 
      n203, n204, n205, n206, n207, n208, n209, n210, n211, n212, n213, n214, 
      n215, n216, n217, n218, n219, n220, n221, n222, n223, n224, n225, n226, 
      n227, n228, n229, n230, n231, n232, n233, n234, n235, n236 : std_logic;

begin
   
   new_change_reg : dfn10 port map( D => n106, CK => clk, Q => new_change);
   cur_change_reg : dfn10 port map( D => n105, CK => clk, Q => cur_change);
   state_reg_0_inst : dfr11 port map( D => next_state_0_port, R => rst, CK => 
                           clk, Q => state_0_port);
   state_reg_1_inst : dfr11 port map( D => next_state_1_port, R => rst, CK => 
                           clk, Q => state_1_port);
   state_reg_2_inst : dfr11 port map( D => next_state_2_port, R => rst, CK => 
                           clk, Q => state_2_port);
   cur_mask_reg_7_inst : dfn10 port map( D => n116, CK => clk, Q => 
                           cur_mask_7_port);
   cur_y_out_reg_4_inst : dfn10 port map( D => n115, CK => clk, Q => 
                           cur_y_out_4_port);
   cur_y_out_reg_3_inst : dfn10 port map( D => n124, CK => clk, Q => 
                           cur_y_out_3_port);
   cur_mask_reg_6_inst : dfn10 port map( D => n117, CK => clk, Q => 
                           cur_mask_6_port);
   cur_y_out_reg_2_inst : dfn10 port map( D => n125, CK => clk, Q => 
                           cur_y_out_2_port);
   cur_mask_reg_5_inst : dfn10 port map( D => n118, CK => clk, Q => 
                           cur_mask_5_port);
   cur_y_out_reg_1_inst : dfn10 port map( D => n126, CK => clk, Q => 
                           cur_y_out_1_port);
   cur_mask_reg_4_inst : dfn10 port map( D => n119, CK => clk, Q => 
                           cur_mask_4_port);
   cur_y_out_reg_0_inst : dfn10 port map( D => n127, CK => clk, Q => 
                           cur_y_out_0_port);
   cur_mask_reg_3_inst : dfn10 port map( D => n120, CK => clk, Q => 
                           cur_mask_3_port);
   cur_x_out_reg_3_inst : dfn10 port map( D => n128, CK => clk, Q => 
                           cur_x_out_3_port);
   cur_overflow_reg : dfn10 port map( D => n114, CK => clk, Q => cur_overflow);
   cur_x_out_reg_2_inst : dfn10 port map( D => n129, CK => clk, Q => 
                           cur_x_out_2_port);
   cur_mask_reg_2_inst : dfn10 port map( D => n121, CK => clk, Q => 
                           cur_mask_2_port);
   cur_x_out_reg_1_inst : dfn10 port map( D => n130, CK => clk, Q => 
                           cur_x_out_1_port);
   cur_mask_reg_1_inst : dfn10 port map( D => n122, CK => clk, Q => 
                           cur_mask_1_port);
   cur_x_out_reg_0_inst : dfn10 port map( D => n131, CK => clk, Q => 
                           cur_x_out_0_port);
   cur_mask_reg_0_inst : dfn10 port map( D => n123, CK => clk, Q => 
                           cur_mask_0_port);
   cur_ready_reg : dfn10 port map( D => n132, CK => clk, Q => cur_ready);
   cur_rom_addr_reg_6_inst : dfn10 port map( D => n113, CK => clk, Q => 
                           cur_rom_addr_6_port);
   cur_rom_addr_reg_5_inst : dfn10 port map( D => n112, CK => clk, Q => 
                           cur_rom_addr_5_port);
   cur_rom_addr_reg_4_inst : dfn10 port map( D => n111, CK => clk, Q => 
                           cur_rom_addr_4_port);
   cur_rom_addr_reg_3_inst : dfn10 port map( D => n110, CK => clk, Q => 
                           cur_rom_addr_3_port);
   cur_rom_addr_reg_2_inst : dfn10 port map( D => n109, CK => clk, Q => 
                           cur_rom_addr_2_port);
   cur_rom_addr_reg_1_inst : dfn10 port map( D => n108, CK => clk, Q => 
                           cur_rom_addr_1_port);
   cur_rom_addr_reg_0_inst : dfn10 port map( D => n107, CK => clk, Q => 
                           cur_rom_addr_0_port);
   overflow_reg : dfn10 port map( D => cur_overflow, CK => clk, Q => overflow);
   mask_reg_7_inst : dfn10 port map( D => cur_mask_7_port, CK => clk, Q => 
                           mask(7));
   mask_reg_6_inst : dfn10 port map( D => cur_mask_6_port, CK => clk, Q => 
                           mask(6));
   mask_reg_5_inst : dfn10 port map( D => cur_mask_5_port, CK => clk, Q => 
                           mask(5));
   mask_reg_4_inst : dfn10 port map( D => cur_mask_4_port, CK => clk, Q => 
                           mask(4));
   mask_reg_3_inst : dfn10 port map( D => cur_mask_3_port, CK => clk, Q => 
                           mask(3));
   mask_reg_2_inst : dfn10 port map( D => cur_mask_2_port, CK => clk, Q => 
                           mask(2));
   mask_reg_1_inst : dfn10 port map( D => cur_mask_1_port, CK => clk, Q => 
                           mask(1));
   mask_reg_0_inst : dfn10 port map( D => cur_mask_0_port, CK => clk, Q => 
                           mask(0));
   ready_reg : dfn10 port map( D => cur_ready, CK => clk, Q => ready);
   rom_addr_reg_6_inst : dfn10 port map( D => cur_rom_addr_6_port, CK => clk, Q
                           => rom_addr(6));
   rom_addr_reg_5_inst : dfn10 port map( D => cur_rom_addr_5_port, CK => clk, Q
                           => rom_addr(5));
   rom_addr_reg_4_inst : dfn10 port map( D => cur_rom_addr_4_port, CK => clk, Q
                           => rom_addr(4));
   rom_addr_reg_3_inst : dfn10 port map( D => cur_rom_addr_3_port, CK => clk, Q
                           => rom_addr(3));
   rom_addr_reg_2_inst : dfn10 port map( D => cur_rom_addr_2_port, CK => clk, Q
                           => rom_addr(2));
   rom_addr_reg_1_inst : dfn10 port map( D => cur_rom_addr_1_port, CK => clk, Q
                           => rom_addr(1));
   rom_addr_reg_0_inst : dfn10 port map( D => cur_rom_addr_0_port, CK => clk, Q
                           => rom_addr(0));
   U135 : na310 port map( A => n133, B => n134, C => n135, Y => 
                           next_state_2_port);
   U136 : iv110 port map( A => n136, Y => n134);
   U137 : na310 port map( A => n137, B => n138, C => n135, Y => 
                           next_state_1_port);
   U138 : no210 port map( A => n139, B => n140, Y => n135);
   U139 : na210 port map( A => n141, B => n142, Y => next_state_0_port);
   U140 : na310 port map( A => n143, B => n144, C => n145, Y => n142);
   U141 : no210 port map( A => cur_change, B => n146, Y => n145);
   U142 : mu111 port map( A => n140, B => cur_ready, S => n147, Y => n132);
   U143 : na210 port map( A => n141, B => n148, Y => n147);
   U144 : iv110 port map( A => n149, Y => n141);
   U145 : no210 port map( A => n146, B => n150, Y => n140);
   U146 : na210 port map( A => n151, B => n152, Y => n131);
   U147 : na210 port map( A => n153, B => n154, Y => n152);
   U148 : ex210 port map( A => x(0), B => rom_data(0), Y => n154);
   U149 : na210 port map( A => cur_x_out_0_port, B => n155, Y => n151);
   U150 : na210 port map( A => n156, B => n157, Y => n130);
   U151 : na210 port map( A => n153, B => n158, Y => n157);
   U152 : ex210 port map( A => n159, B => n160, Y => n158);
   U153 : iv110 port map( A => n161, Y => n159);
   U154 : na210 port map( A => x(0), B => rom_data(0), Y => n161);
   U155 : na210 port map( A => cur_x_out_1_port, B => n155, Y => n156);
   U156 : na210 port map( A => n162, B => n163, Y => n129);
   U157 : na210 port map( A => n164, B => n153, Y => n163);
   U158 : ex210 port map( A => n165, B => x(2), Y => n164);
   U159 : na210 port map( A => cur_x_out_2_port, B => n155, Y => n162);
   U160 : na210 port map( A => n166, B => n167, Y => n128);
   U161 : na310 port map( A => n153, B => n165, C => x(2), Y => n167);
   U162 : na210 port map( A => n168, B => n169, Y => n165);
   U163 : na310 port map( A => x(0), B => n160, C => rom_data(0), Y => n169);
   U164 : ex210 port map( A => rom_data(1), B => x(1), Y => n160);
   U165 : na210 port map( A => rom_data(1), B => x(1), Y => n168);
   U166 : na210 port map( A => cur_x_out_3_port, B => n155, Y => n166);
   U167 : na210 port map( A => n170, B => n171, Y => n127);
   U168 : na210 port map( A => n153, B => n172, Y => n171);
   U169 : ex210 port map( A => y(0), B => rom_data(2), Y => n172);
   U170 : na210 port map( A => cur_y_out_0_port, B => n155, Y => n170);
   U171 : na210 port map( A => n173, B => n174, Y => n126);
   U172 : na210 port map( A => n153, B => n175, Y => n174);
   U173 : ex210 port map( A => n176, B => n177, Y => n175);
   U174 : na210 port map( A => cur_y_out_1_port, B => n155, Y => n173);
   U175 : na210 port map( A => n178, B => n179, Y => n125);
   U176 : na210 port map( A => n180, B => n153, Y => n179);
   U177 : ex210 port map( A => n181, B => y(2), Y => n180);
   U178 : na210 port map( A => cur_y_out_2_port, B => n155, Y => n178);
   U179 : na210 port map( A => n182, B => n183, Y => n124);
   U180 : na210 port map( A => n153, B => n184, Y => n183);
   U181 : ex210 port map( A => y(3), B => n185, Y => n184);
   U182 : na210 port map( A => cur_y_out_3_port, B => n155, Y => n182);
   U183 : na210 port map( A => n186, B => n187, Y => n123);
   U184 : na210 port map( A => n188, B => cur_x_out_0_port, Y => n187);
   U185 : na210 port map( A => cur_mask_0_port, B => n189, Y => n186);
   U186 : na210 port map( A => n190, B => n191, Y => n122);
   U187 : na210 port map( A => n188, B => cur_x_out_1_port, Y => n191);
   U188 : na210 port map( A => cur_mask_1_port, B => n189, Y => n190);
   U189 : na210 port map( A => n192, B => n193, Y => n121);
   U190 : na210 port map( A => n188, B => cur_x_out_2_port, Y => n193);
   U191 : na210 port map( A => cur_mask_2_port, B => n189, Y => n192);
   U192 : na210 port map( A => n194, B => n195, Y => n120);
   U193 : na210 port map( A => n188, B => cur_y_out_0_port, Y => n195);
   U194 : na210 port map( A => cur_mask_3_port, B => n189, Y => n194);
   U195 : na210 port map( A => n196, B => n197, Y => n119);
   U196 : na210 port map( A => n188, B => cur_y_out_1_port, Y => n197);
   U197 : na210 port map( A => cur_mask_4_port, B => n189, Y => n196);
   U198 : na210 port map( A => n198, B => n199, Y => n118);
   U199 : na210 port map( A => n188, B => cur_y_out_2_port, Y => n199);
   U200 : na210 port map( A => cur_mask_5_port, B => n189, Y => n198);
   U201 : na210 port map( A => n200, B => n201, Y => n117);
   U202 : na210 port map( A => n188, B => cur_y_out_3_port, Y => n201);
   U203 : na210 port map( A => cur_mask_6_port, B => n189, Y => n200);
   U204 : na210 port map( A => n202, B => n203, Y => n116);
   U205 : na210 port map( A => next_piece, B => n188, Y => n203);
   U206 : no210 port map( A => n204, B => n189, Y => n188);
   U207 : na210 port map( A => cur_mask_7_port, B => n189, Y => n202);
   U208 : na210 port map( A => n205, B => n138, Y => n189);
   U209 : na210 port map( A => n206, B => n207, Y => n115);
   U210 : na310 port map( A => y(3), B => n153, C => n185, Y => n207);
   U211 : iv110 port map( A => n208, Y => n185);
   U212 : na210 port map( A => y(2), B => n181, Y => n208);
   U213 : na210 port map( A => n209, B => n210, Y => n181);
   U214 : na210 port map( A => n176, B => n177, Y => n210);
   U215 : ex210 port map( A => rom_data(3), B => y(1), Y => n177);
   U216 : iv110 port map( A => n211, Y => n176);
   U217 : na210 port map( A => rom_data(2), B => y(0), Y => n211);
   U218 : na210 port map( A => rom_data(3), B => y(1), Y => n209);
   U219 : no210 port map( A => n133, B => n155, Y => n153);
   U220 : na210 port map( A => cur_y_out_4_port, B => n155, Y => n206);
   U221 : na310 port map( A => n137, B => n150, C => n148, Y => n155);
   U222 : mu111 port map( A => cur_overflow, B => n212, S => n205, Y => n114);
   U223 : no310 port map( A => n149, B => n136, C => n213, Y => n205);
   U224 : iv110 port map( A => n214, Y => n213);
   U225 : no210 port map( A => rst, B => n215, Y => n214);
   U226 : na210 port map( A => n133, B => n137, Y => n149);
   U227 : no210 port map( A => n216, B => n204, Y => n212);
   U228 : no210 port map( A => cur_x_out_3_port, B => cur_y_out_4_port, Y => 
                           n216);
   U229 : na210 port map( A => n217, B => n218, Y => n113);
   U230 : na210 port map( A => piece_type(2), B => n219, Y => n218);
   U231 : na210 port map( A => cur_rom_addr_6_port, B => n220, Y => n217);
   U232 : na210 port map( A => n221, B => n222, Y => n112);
   U233 : na210 port map( A => piece_type(1), B => n219, Y => n222);
   U234 : na210 port map( A => cur_rom_addr_5_port, B => n220, Y => n221);
   U235 : na210 port map( A => n223, B => n224, Y => n111);
   U236 : na210 port map( A => piece_type(0), B => n219, Y => n224);
   U237 : na210 port map( A => cur_rom_addr_4_port, B => n220, Y => n223);
   U238 : na210 port map( A => n225, B => n226, Y => n110);
   U239 : na210 port map( A => rot(1), B => n219, Y => n226);
   U240 : na210 port map( A => cur_rom_addr_3_port, B => n220, Y => n225);
   U241 : na210 port map( A => n227, B => n228, Y => n109);
   U242 : na210 port map( A => rot(0), B => n219, Y => n228);
   U243 : na210 port map( A => cur_rom_addr_2_port, B => n220, Y => n227);
   U244 : na210 port map( A => n229, B => n230, Y => n108);
   U245 : na210 port map( A => mask_select(1), B => n219, Y => n230);
   U246 : na210 port map( A => cur_rom_addr_1_port, B => n220, Y => n229);
   U247 : na210 port map( A => n231, B => n232, Y => n107);
   U248 : na210 port map( A => mask_select(0), B => n219, Y => n232);
   U249 : no210 port map( A => n137, B => n220, Y => n219);
   U250 : na310 port map( A => n143, B => n233, C => state_1_port, Y => n137);
   U251 : na210 port map( A => cur_rom_addr_0_port, B => n220, Y => n231);
   U252 : na310 port map( A => n133, B => n150, C => n148, Y => n220);
   U253 : iv110 port map( A => n234, Y => n148);
   U254 : na310 port map( A => n204, B => n138, C => n235, Y => n234);
   U255 : no210 port map( A => rst, B => n136, Y => n235);
   U256 : no310 port map( A => n143, B => state_2_port, C => n144, Y => n136);
   U257 : na310 port map( A => n144, B => n233, C => state_0_port, Y => n138);
   U258 : iv110 port map( A => n139, Y => n204);
   U259 : no310 port map( A => n143, B => state_1_port, C => n233, Y => n139);
   U260 : iv110 port map( A => n215, Y => n150);
   U261 : no310 port map( A => n144, B => state_0_port, C => n233, Y => n215);
   U262 : iv110 port map( A => state_2_port, Y => n233);
   U263 : na310 port map( A => n143, B => n144, C => state_2_port, Y => n133);
   U264 : iv110 port map( A => state_1_port, Y => n144);
   U265 : iv110 port map( A => state_0_port, Y => n143);
   U266 : mu111 port map( A => n236, B => new_change, S => rst, Y => n106);
   U267 : iv110 port map( A => n146, Y => n236);
   U268 : no210 port map( A => draw_start, B => check_start, Y => n146);
   U269 : mu111 port map( A => new_change, B => cur_change, S => rst, Y => n105
                           );

end synthesised;



