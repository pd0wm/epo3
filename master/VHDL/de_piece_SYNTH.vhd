
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of de_piece is

   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component no310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component mu111
      port( A, B, S : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component na310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component tinv10
      port( A, E : in std_logic;  Y : out std_logic);
   end component;
   
   component dfn10
      port( D, CK : in std_logic;  Q : out std_logic);
   end component;
   
   signal ready_port, lut_start_port, state_2_port, state_1_port, state_0_port,
      new_state_2_port, new_state_1_port, new_state_0_port, cur_block_1_port, 
      cur_block_0_port, cur_addr_7_port, cur_addr_6_port, cur_addr_5_port, 
      cur_addr_4_port, cur_addr_3_port, cur_addr_2_port, cur_addr_1_port, 
      cur_addr_0_port, new_addr_7_port, new_addr_6_port, new_addr_5_port, 
      new_addr_4_port, new_addr_3_port, new_addr_2_port, new_addr_1_port, 
      new_addr_0_port, cur_mask_select_1_port, cur_mask_select_0_port, 
      new_mask_select_1_port, new_mask_select_0_port, cur_data, new_data, 
      cur_write, new_write, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, 
      n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94
      , n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107
      , n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118, n119,
      n120, n121, n122, n123, n124, n125, n126, n127, n128, n129, n130, n131, 
      n132, n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, 
      n144, n145, n146, n147 : std_logic;

begin
   ready <= ready_port;
   lut_start <= lut_start_port;
   
   cur_block_reg_0_inst : dfn10 port map( D => n100, CK => clk, Q => 
                           cur_block_0_port);
   cur_block_reg_1_inst : dfn10 port map( D => n99, CK => clk, Q => 
                           cur_block_1_port);
   state_reg_2_inst : dfn10 port map( D => new_state_2_port, CK => clk, Q => 
                           state_2_port);
   state_reg_0_inst : dfn10 port map( D => new_state_0_port, CK => clk, Q => 
                           state_0_port);
   state_reg_1_inst : dfn10 port map( D => new_state_1_port, CK => clk, Q => 
                           state_1_port);
   cur_ready_reg : dfn10 port map( D => n98, CK => clk, Q => ready_port);
   cur_addr_reg_7_inst : dfn10 port map( D => new_addr_7_port, CK => clk, Q => 
                           cur_addr_7_port);
   cur_addr_reg_6_inst : dfn10 port map( D => new_addr_6_port, CK => clk, Q => 
                           cur_addr_6_port);
   cur_addr_reg_5_inst : dfn10 port map( D => new_addr_5_port, CK => clk, Q => 
                           cur_addr_5_port);
   cur_addr_reg_4_inst : dfn10 port map( D => new_addr_4_port, CK => clk, Q => 
                           cur_addr_4_port);
   cur_addr_reg_3_inst : dfn10 port map( D => new_addr_3_port, CK => clk, Q => 
                           cur_addr_3_port);
   cur_addr_reg_2_inst : dfn10 port map( D => new_addr_2_port, CK => clk, Q => 
                           cur_addr_2_port);
   cur_addr_reg_1_inst : dfn10 port map( D => new_addr_1_port, CK => clk, Q => 
                           cur_addr_1_port);
   cur_addr_reg_0_inst : dfn10 port map( D => new_addr_0_port, CK => clk, Q => 
                           cur_addr_0_port);
   cur_mask_select_reg_1_inst : dfn10 port map( D => new_mask_select_1_port, CK
                           => clk, Q => cur_mask_select_1_port);
   cur_mask_select_reg_0_inst : dfn10 port map( D => new_mask_select_0_port, CK
                           => clk, Q => cur_mask_select_0_port);
   cur_lut_start_reg : dfn10 port map( D => n97, CK => clk, Q => lut_start_port
                           );
   cur_data_reg : dfn10 port map( D => new_data, CK => clk, Q => cur_data);
   cur_write_reg : dfn10 port map( D => new_write, CK => clk, Q => cur_write);
   new_data_tri : tinv10 port map( A => n96, E => n84, Y => new_data);
   new_mask_select_tri_0_inst : tinv10 port map( A => n95, E => n94, Y => 
                           new_mask_select_0_port);
   new_mask_select_tri_1_inst : tinv10 port map( A => n93, E => n94, Y => 
                           new_mask_select_1_port);
   new_addr_tri_0_inst : tinv10 port map( A => n92, E => n84, Y => 
                           new_addr_0_port);
   new_addr_tri_1_inst : tinv10 port map( A => n91, E => n84, Y => 
                           new_addr_1_port);
   new_addr_tri_2_inst : tinv10 port map( A => n90, E => n84, Y => 
                           new_addr_2_port);
   new_addr_tri_3_inst : tinv10 port map( A => n89, E => n84, Y => 
                           new_addr_3_port);
   new_addr_tri_4_inst : tinv10 port map( A => n88, E => n84, Y => 
                           new_addr_4_port);
   new_addr_tri_5_inst : tinv10 port map( A => n87, E => n84, Y => 
                           new_addr_5_port);
   new_addr_tri_6_inst : tinv10 port map( A => n86, E => n84, Y => 
                           new_addr_6_port);
   new_addr_tri_7_inst : tinv10 port map( A => n85, E => n84, Y => 
                           new_addr_7_port);
   new_write_tri : tinv10 port map( A => n83, E => n84, Y => new_write);
   data_tri : tinv10 port map( A => n82, E => n101, Y => data);
   addr_tri_0_inst : tinv10 port map( A => n81, E => n101, Y => addr(0));
   addr_tri_1_inst : tinv10 port map( A => n80, E => n73, Y => addr(1));
   addr_tri_2_inst : tinv10 port map( A => n79, E => n73, Y => addr(2));
   addr_tri_3_inst : tinv10 port map( A => n78, E => n101, Y => addr(3));
   addr_tri_4_inst : tinv10 port map( A => n77, E => n101, Y => addr(4));
   addr_tri_5_inst : tinv10 port map( A => n76, E => n73, Y => addr(5));
   addr_tri_6_inst : tinv10 port map( A => n75, E => n73, Y => addr(6));
   addr_tri_7_inst : tinv10 port map( A => n74, E => n101, Y => addr(7));
   write_tri : tinv10 port map( A => n72, E => n101, Y => write);
   mask_select_tri_0_inst : tinv10 port map( A => n71, E => n73, Y => 
                           mask_select(0));
   mask_select_tri_1_inst : tinv10 port map( A => n70, E => n73, Y => 
                           mask_select(1));
   U106 : na210 port map( A => n106, B => n128, Y => n101);
   U107 : iv110 port map( A => state_0_port, Y => n102);
   U108 : na310 port map( A => n103, B => n104, C => n105, Y => 
                           new_state_2_port);
   U109 : na210 port map( A => start, B => n106, Y => n105);
   U110 : na310 port map( A => n107, B => n108, C => state_1_port, Y => n104);
   U111 : iv110 port map( A => lut_ready, Y => n108);
   U112 : na210 port map( A => n109, B => n110, Y => n103);
   U113 : na210 port map( A => n111, B => n112, Y => new_state_1_port);
   U114 : na210 port map( A => lut_ready, B => n107, Y => n112);
   U115 : na210 port map( A => n109, B => n113, Y => n111);
   U116 : na310 port map( A => n114, B => n115, C => n116, Y => 
                           new_state_0_port);
   U117 : no210 port map( A => n117, B => n118, Y => n116);
   U118 : no210 port map( A => n73, B => n119, Y => n118);
   U119 : iv110 port map( A => start, Y => n119);
   U120 : no210 port map( A => n110, B => n120, Y => n117);
   U121 : iv110 port map( A => n113, Y => n110);
   U122 : na210 port map( A => cur_block_1_port, B => cur_block_0_port, Y => 
                           n113);
   U123 : na210 port map( A => n107, B => n121, Y => n114);
   U124 : na210 port map( A => lut_ready, B => n122, Y => n121);
   U125 : mu111 port map( A => n123, B => n124, S => cur_block_1_port, Y => n99
                           );
   U126 : na210 port map( A => n125, B => n126, Y => n124);
   U127 : na310 port map( A => n127, B => n128, C => state_1_port, Y => n126);
   U128 : no210 port map( A => n127, B => n120, Y => n123);
   U129 : na210 port map( A => n129, B => n130, Y => n98);
   U130 : na310 port map( A => start, B => n106, C => state_2_port, Y => n130);
   U131 : na210 port map( A => ready_port, B => n131, Y => n129);
   U132 : na210 port map( A => n120, B => n125, Y => n131);
   U133 : na210 port map( A => n115, B => n132, Y => n97);
   U134 : na210 port map( A => lut_start_port, B => n107, Y => n132);
   U135 : no210 port map( A => n102, B => state_2_port, Y => n107);
   U136 : na310 port map( A => state_0_port, B => n122, C => state_2_port, Y =>
                           n115);
   U137 : na210 port map( A => n134, B => n135, Y => n96);
   U138 : mu111 port map( A => cur_data, B => draw_erase, S => n102, Y => n134)
                           ;
   U139 : na210 port map( A => n136, B => n135, Y => n95);
   U140 : mu111 port map( A => cur_block_0_port, B => cur_mask_select_0_port, S
                           => n128, Y => n136);
   U141 : na210 port map( A => n102, B => n135, Y => n94);
   U142 : na210 port map( A => n137, B => n135, Y => n93);
   U143 : mu111 port map( A => cur_block_1_port, B => cur_mask_select_1_port, S
                           => n128, Y => n137);
   U144 : na210 port map( A => n138, B => n135, Y => n92);
   U145 : mu111 port map( A => cur_addr_0_port, B => mask(0), S => n133, Y => 
                           n138);
   U146 : na210 port map( A => n139, B => n135, Y => n91);
   U147 : mu111 port map( A => cur_addr_1_port, B => mask(1), S => n133, Y => 
                           n139);
   U148 : na210 port map( A => n140, B => n135, Y => n90);
   U149 : mu111 port map( A => cur_addr_2_port, B => mask(2), S => n133, Y => 
                           n140);
   U150 : na210 port map( A => n141, B => n135, Y => n89);
   U151 : mu111 port map( A => cur_addr_3_port, B => mask(3), S => n133, Y => 
                           n141);
   U152 : na210 port map( A => n142, B => n135, Y => n88);
   U153 : mu111 port map( A => cur_addr_4_port, B => mask(4), S => n133, Y => 
                           n142);
   U154 : na210 port map( A => n143, B => n135, Y => n87);
   U155 : mu111 port map( A => cur_addr_5_port, B => mask(5), S => n133, Y => 
                           n143);
   U156 : na210 port map( A => n144, B => n135, Y => n86);
   U157 : mu111 port map( A => cur_addr_6_port, B => mask(6), S => n133, Y => 
                           n144);
   U158 : na210 port map( A => n145, B => n135, Y => n85);
   U159 : mu111 port map( A => cur_addr_7_port, B => mask(7), S => n133, Y => 
                           n145);
   U160 : iv110 port map( A => state_0_port, Y => n133);
   U161 : iv110 port map( A => n106, Y => n84);
   U162 : na210 port map( A => n128, B => n146, Y => n83);
   U163 : na210 port map( A => state_0_port, B => n72, Y => n146);
   U164 : iv110 port map( A => cur_data, Y => n82);
   U165 : iv110 port map( A => cur_addr_0_port, Y => n81);
   U166 : iv110 port map( A => cur_addr_1_port, Y => n80);
   U167 : iv110 port map( A => cur_addr_2_port, Y => n79);
   U168 : iv110 port map( A => cur_addr_3_port, Y => n78);
   U169 : iv110 port map( A => cur_addr_4_port, Y => n77);
   U170 : iv110 port map( A => cur_addr_5_port, Y => n76);
   U171 : iv110 port map( A => cur_addr_6_port, Y => n75);
   U172 : iv110 port map( A => cur_addr_7_port, Y => n74);
   U173 : na210 port map( A => n106, B => n128, Y => n73);
   U174 : iv110 port map( A => state_2_port, Y => n128);
   U175 : no210 port map( A => state_1_port, B => state_0_port, Y => n106);
   U176 : iv110 port map( A => cur_write, Y => n72);
   U177 : iv110 port map( A => cur_mask_select_0_port, Y => n71);
   U178 : iv110 port map( A => cur_mask_select_1_port, Y => n70);
   U179 : iv110 port map( A => n147, Y => n100);
   U180 : mu111 port map( A => n125, B => n120, S => n127, Y => n147);
   U181 : iv110 port map( A => cur_block_0_port, Y => n127);
   U182 : iv110 port map( A => n109, Y => n120);
   U183 : no310 port map( A => state_0_port, B => state_2_port, C => n122, Y =>
                           n109);
   U184 : iv110 port map( A => state_1_port, Y => n122);
   U185 : na210 port map( A => state_0_port, B => n135, Y => n125);
   U186 : na210 port map( A => state_2_port, B => state_1_port, Y => n135);

end synthesised;



