
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of check_mask is

   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component no310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component na310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component mu111
      port( A, B, S : in std_logic;  Y : out std_logic);
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
   
   signal empty_port, state_2_port, state_1_port, state_0_port, 
      next_state_2_port, next_state_1_port, next_state_0_port, pixel_1_port, 
      pixel_0_port, n1, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, 
      n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69
      , n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, 
      n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97 : 
      std_logic;

begin
   empty <= empty_port;
   
   pixel_reg_0_inst : dfn10 port map( D => n58, CK => clk, Q => pixel_0_port);
   state_reg_2_inst : dfr11 port map( D => next_state_2_port, R => rst, CK => 
                           clk, Q => state_2_port);
   state_reg_0_inst : dfr11 port map( D => next_state_0_port, R => rst, CK => 
                           clk, Q => state_0_port);
   state_reg_1_inst : dfr11 port map( D => next_state_1_port, R => rst, CK => 
                           clk, Q => state_1_port);
   pixel_reg_1_inst : dfn10 port map( D => n57, CK => clk, Q => pixel_1_port);
   empty_s_reg : dfn10 port map( D => n56, CK => clk, Q => empty_port);
   addr_tri_0_inst : tinv10 port map( A => n55, E => n48, Y => addr(0));
   addr_tri_1_inst : tinv10 port map( A => n54, E => n48, Y => addr(1));
   addr_tri_2_inst : tinv10 port map( A => n53, E => n48, Y => addr(2));
   addr_tri_3_inst : tinv10 port map( A => n52, E => n48, Y => addr(3));
   addr_tri_4_inst : tinv10 port map( A => n51, E => n48, Y => addr(4));
   addr_tri_5_inst : tinv10 port map( A => n50, E => n48, Y => addr(5));
   addr_tri_6_inst : tinv10 port map( A => n49, E => n48, Y => addr(6));
   addr_tri_7_inst : tinv10 port map( A => n47, E => n48, Y => addr(7));
   mask_select_tri_0_inst : tinv10 port map( A => n46, E => n44, Y => 
                           mask_select(0));
   mask_select_tri_1_inst : tinv10 port map( A => n45, E => n44, Y => 
                           mask_select(1));
   write_tri : tinv10 port map( A => n1, E => n44, Y => write);
   n1 <= '1';
   U66 : na210 port map( A => n59, B => n60, Y => ready);
   U67 : na210 port map( A => data_in, B => n61, Y => n60);
   U68 : na310 port map( A => n62, B => n63, C => n64, Y => next_state_2_port);
   U69 : no310 port map( A => n65, B => n66, C => n67, Y => n64);
   U70 : no210 port map( A => n68, B => n69, Y => n67);
   U71 : iv110 port map( A => n70, Y => n66);
   U72 : no210 port map( A => n71, B => n72, Y => n65);
   U73 : na210 port map( A => start, B => n73, Y => n63);
   U74 : iv110 port map( A => n74, Y => n62);
   U75 : no210 port map( A => n75, B => state_2_port, Y => n74);
   U76 : mu111 port map( A => n76, B => n77, S => n78, Y => next_state_1_port);
   U77 : iv110 port map( A => n79, Y => n77);
   U78 : na210 port map( A => n68, B => n80, Y => n79);
   U79 : na210 port map( A => lut_ready, B => lut_error, Y => n68);
   U80 : no210 port map( A => state_2_port, B => state_1_port, Y => n76);
   U81 : na310 port map( A => n81, B => n71, C => n82, Y => next_state_0_port);
   U82 : na210 port map( A => start, B => n83, Y => n82);
   U83 : na210 port map( A => n44, B => n59, Y => n83);
   U84 : na310 port map( A => lut_ready, B => n78, C => n80, Y => n81);
   U85 : iv110 port map( A => n69, Y => n80);
   U86 : na210 port map( A => state_1_port, B => n84, Y => n69);
   U87 : mu111 port map( A => n85, B => n86, S => n46, Y => n58);
   U88 : no310 port map( A => n85, B => data_in, C => n71, Y => n86);
   U89 : iv110 port map( A => n61, Y => n71);
   U90 : na210 port map( A => n87, B => n88, Y => n57);
   U91 : na310 port map( A => n61, B => n72, C => n89, Y => n88);
   U92 : mu111 port map( A => n90, B => pixel_1_port, S => n46, Y => n89);
   U93 : no210 port map( A => pixel_1_port, B => n85, Y => n90);
   U94 : iv110 port map( A => data_in, Y => n72);
   U95 : na210 port map( A => n85, B => pixel_1_port, Y => n87);
   U96 : na210 port map( A => n91, B => n92, Y => n85);
   U97 : na210 port map( A => n93, B => n84, Y => n92);
   U98 : mu111 port map( A => empty_port, B => n94, S => n91, Y => n56);
   U99 : no210 port map( A => rst, B => n73, Y => n91);
   U100 : no210 port map( A => data_in, B => n70, Y => n94);
   U101 : na310 port map( A => pixel_1_port, B => pixel_0_port, C => n61, Y => 
                           n70);
   U102 : no210 port map( A => n84, B => n93, Y => n61);
   U103 : iv110 port map( A => mask(0), Y => n55);
   U104 : iv110 port map( A => mask(1), Y => n54);
   U105 : iv110 port map( A => mask(2), Y => n53);
   U106 : iv110 port map( A => mask(3), Y => n52);
   U107 : iv110 port map( A => mask(4), Y => n51);
   U108 : iv110 port map( A => mask(5), Y => n50);
   U109 : iv110 port map( A => mask(6), Y => n49);
   U110 : iv110 port map( A => n95, Y => n48);
   U111 : na310 port map( A => n96, B => n93, C => n59, Y => n95);
   U112 : iv110 port map( A => n73, Y => n59);
   U113 : no310 port map( A => n84, B => state_1_port, C => n78, Y => n73);
   U114 : iv110 port map( A => state_0_port, Y => n78);
   U115 : iv110 port map( A => n97, Y => n93);
   U116 : iv110 port map( A => mask(7), Y => n47);
   U117 : iv110 port map( A => pixel_0_port, Y => n46);
   U118 : iv110 port map( A => pixel_1_port, Y => n45);
   U119 : na210 port map( A => n97, B => n84, Y => n44);
   U120 : no210 port map( A => n97, B => n96, Y => lut_start);
   U121 : na210 port map( A => n84, B => n75, Y => n96);
   U122 : na210 port map( A => state_1_port, B => state_0_port, Y => n75);
   U123 : iv110 port map( A => state_2_port, Y => n84);
   U124 : no210 port map( A => state_0_port, B => state_1_port, Y => n97);

end synthesised;



