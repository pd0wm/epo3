
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

package CONV_PACK_check_mask is

-- define attributes
attribute ENUM_ENCODING : STRING;

end CONV_PACK_check_mask;

library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

use work.CONV_PACK_check_mask.all;

entity check_mask is

   port( clk, rst : in std_logic;  mask : in std_logic_vector (7 downto 0);  
         mask_select : out std_logic_vector (1 downto 0);  ready, empty : out 
         std_logic;  start : in std_logic;  lut_start : out std_logic;  
         lut_ready, lut_error : in std_logic;  write : out std_logic;  addr : 
         out std_logic_vector (7 downto 0);  data_in : in std_logic);

end check_mask;

architecture synthesised of check_mask is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component no310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component mu111
      port( A, B, S : in std_logic;  Y : out std_logic);
   end component;
   
   component na310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component SYNOP_BASIC_FF
      port( next_state, clocked_on, force_00, force_01, force_10, force_11 : in
            std_logic;  Q, QN : out std_logic);
   end component;
   
   component tinv10
      port( A, E : in std_logic;  Y : out std_logic);
   end component;
   
   component dfn10
      port( D, CK : in std_logic;  Q : out std_logic);
   end component;
   
   component dfr11
      port( D, R, CK : in std_logic;  Q : out std_logic);
   end component;
   
   signal mask_select_1_port, mask_select_0_port, empty_port, state_2_port, 
      state_1_port, state_0_port, next_state_2_port, next_state_1_port, 
      next_state_0_port, n51, n77, n78, n79, n80, n81, n82, n74, n70, n66, n83,
      n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98
      , n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, 
      n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122, 
      n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133, n134, 
      n135, n136, n137, n138, n139, n140, n141, n_1000, n_1001, n_1002 : 
      std_logic;

begin
   mask_select <= ( mask_select_1_port, mask_select_0_port );
   empty <= empty_port;
   
   write <= '0';
   pixel_reg_0_inst : dfn10 port map( D => n82, CK => clk, Q => 
                           mask_select_0_port);
   state_reg_2_inst : dfr11 port map( D => next_state_2_port, R => rst, CK => 
                           clk, Q => state_2_port);
   state_reg_0_inst : dfr11 port map( D => next_state_0_port, R => rst, CK => 
                           clk, Q => state_0_port);
   state_reg_1_inst : dfr11 port map( D => next_state_1_port, R => rst, CK => 
                           clk, Q => state_1_port);
   pixel_reg_1_inst : dfn10 port map( D => n81, CK => clk, Q => 
                           mask_select_1_port);
   empty_reg : dfn10 port map( D => n80, CK => clk, Q => empty_port);
   addr_tri_0_inst : tinv10 port map( A => n141, E => n51, Y => addr(0));
   addr_tri_1_inst : tinv10 port map( A => n140, E => n51, Y => addr(1));
   addr_tri_2_inst : tinv10 port map( A => n139, E => n51, Y => addr(2));
   addr_tri_3_inst : tinv10 port map( A => n138, E => n51, Y => addr(3));
   addr_tri_4_inst : tinv10 port map( A => n137, E => n51, Y => addr(4));
   addr_tri_5_inst : tinv10 port map( A => n136, E => n51, Y => addr(5));
   addr_tri_6_inst : tinv10 port map( A => n135, E => n51, Y => addr(6));
   addr_tri_7_inst : tinv10 port map( A => n134, E => n51, Y => addr(7));
   next_pixel_reg_0_inst : SYNOP_BASIC_FF port map( next_state => n119, 
                           clocked_on => n120, force_00 => n127, force_01 => 
                           n70, force_10 => n133, force_11 => n128, Q => n79, 
                           QN => n_1000);
   next_pixel_reg_1_inst : SYNOP_BASIC_FF port map( next_state => n121, 
                           clocked_on => n122, force_00 => n129, force_01 => 
                           n74, force_10 => n132, force_11 => n130, Q => n78, 
                           QN => n_1001);
   next_empty_reg : SYNOP_BASIC_FF port map( next_state => n123, clocked_on => 
                           n124, force_00 => n125, force_01 => n66, force_10 =>
                           n131, force_11 => n126, Q => n77, QN => n_1002);
   U84 : no210 port map( A => n83, B => n84, Y => ready);
   U85 : na310 port map( A => n85, B => n86, C => n87, Y => next_state_2_port);
   U86 : na210 port map( A => n88, B => state_1_port, Y => n87);
   U87 : na310 port map( A => lut_error, B => n89, C => lut_ready, Y => n86);
   U88 : na210 port map( A => n90, B => n91, Y => n85);
   U89 : mu111 port map( A => n92, B => start, S => state_0_port, Y => n90);
   U90 : na210 port map( A => n93, B => n94, Y => next_state_1_port);
   U91 : na210 port map( A => n89, B => n95, Y => n94);
   U92 : na210 port map( A => lut_ready, B => lut_error, Y => n95);
   U93 : na310 port map( A => n96, B => n97, C => n98, Y => next_state_0_port);
   U94 : na210 port map( A => lut_ready, B => n89, Y => n98);
   U95 : na210 port map( A => start, B => n99, Y => n97);
   U96 : na210 port map( A => n91, B => n100, Y => n96);
   U97 : iv110 port map( A => mask(7), Y => n134);
   U98 : iv110 port map( A => mask(6), Y => n135);
   U99 : iv110 port map( A => mask(5), Y => n136);
   U100 : iv110 port map( A => mask(4), Y => n137);
   U101 : iv110 port map( A => mask(3), Y => n138);
   U102 : iv110 port map( A => mask(2), Y => n139);
   U103 : iv110 port map( A => mask(1), Y => n140);
   U104 : iv110 port map( A => mask(0), Y => n141);
   U105 : mu111 port map( A => n79, B => mask_select_0_port, S => rst, Y => n82
                           );
   U106 : mu111 port map( A => n78, B => mask_select_1_port, S => rst, Y => n81
                           );
   U107 : mu111 port map( A => n77, B => empty_port, S => rst, Y => n80);
   U108 : no210 port map( A => n101, B => n132, Y => n74);
   U109 : iv110 port map( A => n102, Y => n132);
   U110 : na310 port map( A => n103, B => n104, C => n91, Y => n102);
   U111 : na210 port map( A => n105, B => n106, Y => n104);
   U112 : na210 port map( A => mask_select_0_port, B => n100, Y => n105);
   U113 : na210 port map( A => n92, B => n100, Y => n103);
   U114 : na210 port map( A => n107, B => n108, Y => n92);
   U115 : na210 port map( A => mask_select_1_port, B => mask_select_0_port, Y 
                           => n108);
   U116 : iv110 port map( A => data_in, Y => n107);
   U117 : no210 port map( A => n101, B => n133, Y => n70);
   U118 : iv110 port map( A => n109, Y => n133);
   U119 : na210 port map( A => n110, B => n91, Y => n109);
   U120 : mu111 port map( A => n111, B => mask_select_0_port, S => state_0_port
                           , Y => n110);
   U121 : no210 port map( A => data_in, B => mask_select_0_port, Y => n111);
   U122 : iv110 port map( A => n99, Y => n101);
   U123 : na210 port map( A => n84, B => n112, Y => n99);
   U124 : na210 port map( A => n100, B => n113, Y => n112);
   U125 : no210 port map( A => n131, B => n114, Y => n66);
   U126 : no310 port map( A => n115, B => n89, C => n88, Y => n114);
   U127 : no210 port map( A => state_1_port, B => state_0_port, Y => n115);
   U128 : no310 port map( A => n116, B => n106, C => n117, Y => n131);
   U129 : na210 port map( A => n91, B => mask_select_0_port, Y => n117);
   U130 : iv110 port map( A => n84, Y => n91);
   U131 : na210 port map( A => state_2_port, B => n113, Y => n84);
   U132 : iv110 port map( A => mask_select_1_port, Y => n106);
   U133 : iv110 port map( A => n83, Y => n116);
   U134 : no210 port map( A => state_0_port, B => data_in, Y => n83);
   U135 : no210 port map( A => n89, B => n113, Y => n51);
   U136 : na210 port map( A => n118, B => n93, Y => lut_start);
   U137 : na210 port map( A => n88, B => n113, Y => n93);
   U138 : no210 port map( A => n100, B => state_2_port, Y => n88);
   U139 : iv110 port map( A => state_0_port, Y => n100);
   U140 : iv110 port map( A => n89, Y => n118);
   U141 : no310 port map( A => state_0_port, B => state_2_port, C => n113, Y =>
                           n89);
   U142 : iv110 port map( A => state_1_port, Y => n113);
   n119 <= '0';
   n120 <= '0';
   n121 <= '0';
   n122 <= '0';
   n123 <= '0';
   n124 <= '0';
   n125 <= '0';
   n126 <= '0';
   n127 <= '0';
   n128 <= '0';
   n129 <= '0';
   n130 <= '0';

end synthesised;

-- This is the basic technology-independent flip-flop.
-- All flip-flops and latches are written in terms of this.

library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;
entity SYNOP_BASIC_FF is

   port(next_state, clocked_on, force_00, force_01, force_10, force_11: in 
         std_logic;
         Q, QN: out std_logic);

end SYNOP_BASIC_FF;

architecture RTL of SYNOP_BASIC_FF is
   signal t_q: std_logic;
begin
   process ( force_00, force_01, force_10, force_11, clocked_on )
   begin
      if ( force_00 = '1' or force_01 = '1' ) then
         t_q <= '0';
      elsif ( force_10 = '1' or force_11 = '1' ) then
         t_q <= '1';
      elsif ( clocked_on'event and clocked_on = '1' ) then
         t_q <= next_state;
      end if;
   end process;
   
   process ( t_q, force_00, force_11 )
   begin
      Q <= t_q;
      if ( force_00 = '1' or force_11 = '1' ) then
         QN <= t_q;
      else
         QN <= not t_q;
      end if;
   end process;
end RTL;
