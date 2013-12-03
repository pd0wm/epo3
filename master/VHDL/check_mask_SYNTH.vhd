
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of check_mask is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component na310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component mu111
      port( A, B, S : in std_logic;  Y : out std_logic);
   end component;
   
   component no310
      port( A, B, C : in std_logic;  Y : out std_logic);
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
   
   signal mask_select_1_port, mask_select_0_port, empty_port, lut_start_port, 
      state_2_port, state_1_port, state_0_port, next_state_2_port, 
      next_state_1_port, next_state_0_port, n45, n46, n47, n48, n49, n50, n51, 
      n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66
      , n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, 
      n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92 : std_logic;

begin
   mask_select <= ( mask_select_1_port, mask_select_0_port );
   empty <= empty_port;
   lut_start <= lut_start_port;
   
   write <= '0';
   pixel_reg_0_inst : dfn10 port map( D => n56, CK => clk, Q => 
                           mask_select_0_port);
   state_reg_2_inst : dfr11 port map( D => next_state_2_port, R => rst, CK => 
                           clk, Q => state_2_port);
   state_reg_0_inst : dfr11 port map( D => next_state_0_port, R => rst, CK => 
                           clk, Q => state_0_port);
   state_reg_1_inst : dfr11 port map( D => next_state_1_port, R => rst, CK => 
                           clk, Q => state_1_port);
   pixel_reg_1_inst : dfn10 port map( D => n55, CK => clk, Q => 
                           mask_select_1_port);
   empty_s_reg : dfn10 port map( D => n54, CK => clk, Q => empty_port);
   addr_tri_0_inst : tinv10 port map( A => n53, E => n46, Y => addr(0));
   addr_tri_1_inst : tinv10 port map( A => n52, E => n46, Y => addr(1));
   addr_tri_2_inst : tinv10 port map( A => n51, E => n46, Y => addr(2));
   addr_tri_3_inst : tinv10 port map( A => n50, E => n46, Y => addr(3));
   addr_tri_4_inst : tinv10 port map( A => n49, E => n46, Y => addr(4));
   addr_tri_5_inst : tinv10 port map( A => n48, E => n46, Y => addr(5));
   addr_tri_6_inst : tinv10 port map( A => n47, E => n46, Y => addr(6));
   addr_tri_7_inst : tinv10 port map( A => n45, E => n46, Y => addr(7));
   U64 : na210 port map( A => n57, B => n58, Y => ready);
   U65 : na210 port map( A => data_in, B => n59, Y => n58);
   U66 : na310 port map( A => n60, B => n61, C => n62, Y => next_state_2_port);
   U67 : no210 port map( A => n63, B => n64, Y => n62);
   U68 : no210 port map( A => n57, B => n65, Y => n64);
   U69 : iv110 port map( A => start, Y => n65);
   U70 : no210 port map( A => n66, B => n67, Y => n63);
   U71 : na210 port map( A => n68, B => n69, Y => n60);
   U72 : na210 port map( A => n70, B => n71, Y => next_state_1_port);
   U73 : na210 port map( A => n72, B => n68, Y => n71);
   U74 : iv110 port map( A => n69, Y => n72);
   U75 : na210 port map( A => n73, B => n74, Y => n69);
   U76 : na210 port map( A => lut_ready, B => lut_error, Y => n74);
   U77 : na310 port map( A => n75, B => n66, C => n76, Y => next_state_0_port);
   U78 : na310 port map( A => n77, B => n78, C => start, Y => n76);
   U79 : na310 port map( A => lut_ready, B => n73, C => n68, Y => n75);
   U80 : mu111 port map( A => n79, B => n80, S => mask_select_0_port, Y => n56)
                           ;
   U81 : no310 port map( A => n80, B => data_in, C => n66, Y => n79);
   U82 : na210 port map( A => n81, B => n82, Y => n55);
   U83 : na310 port map( A => n59, B => n67, C => n83, Y => n82);
   U84 : mu111 port map( A => mask_select_1_port, B => n84, S => 
                           mask_select_0_port, Y => n83);
   U85 : no210 port map( A => mask_select_1_port, B => n80, Y => n84);
   U86 : iv110 port map( A => data_in, Y => n67);
   U87 : na210 port map( A => mask_select_1_port, B => n80, Y => n81);
   U88 : iv110 port map( A => n85, Y => n80);
   U89 : no310 port map( A => lut_start_port, B => rst, C => n86, Y => n85);
   U90 : na210 port map( A => n57, B => n77, Y => n86);
   U91 : iv110 port map( A => n87, Y => n77);
   U92 : mu111 port map( A => empty_port, B => n88, S => n89, Y => n54);
   U93 : no210 port map( A => n90, B => rst, Y => n89);
   U94 : iv110 port map( A => n57, Y => n90);
   U95 : na310 port map( A => state_2_port, B => n78, C => state_0_port, Y => 
                           n57);
   U96 : no210 port map( A => data_in, B => n61, Y => n88);
   U97 : na310 port map( A => mask_select_0_port, B => n59, C => 
                           mask_select_1_port, Y => n61);
   U98 : iv110 port map( A => n66, Y => n59);
   U99 : na310 port map( A => n73, B => n78, C => state_2_port, Y => n66);
   U100 : iv110 port map( A => mask(0), Y => n53);
   U101 : iv110 port map( A => mask(1), Y => n52);
   U102 : iv110 port map( A => mask(2), Y => n51);
   U103 : iv110 port map( A => mask(3), Y => n50);
   U104 : iv110 port map( A => mask(4), Y => n49);
   U105 : iv110 port map( A => mask(5), Y => n48);
   U106 : iv110 port map( A => mask(6), Y => n47);
   U107 : no210 port map( A => n91, B => n78, Y => n46);
   U108 : no210 port map( A => state_0_port, B => state_2_port, Y => n91);
   U109 : iv110 port map( A => mask(7), Y => n45);
   U110 : na210 port map( A => n70, B => n92, Y => lut_start_port);
   U111 : na210 port map( A => n68, B => n73, Y => n92);
   U112 : no210 port map( A => n78, B => state_2_port, Y => n68);
   U113 : na210 port map( A => n87, B => n78, Y => n70);
   U114 : iv110 port map( A => state_1_port, Y => n78);
   U115 : no210 port map( A => n73, B => state_2_port, Y => n87);
   U116 : iv110 port map( A => state_0_port, Y => n73);

end synthesised;



