
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of de_piece is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component no310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component mu111
      port( A, B, S : in std_logic;  Y : out std_logic);
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
   
   signal state_2_port, state_1_port, state_0_port, cur_block_1_port, 
      cur_block_0_port, new_state_2_port, new_state_1_port, new_state_0_port, 
      n1, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, 
      lut_start_port, n48, n49, n51, n52, n53, n54, n55, n56, n57, n58, n59, 
      n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74
      , n75, n76, n77, n78, n79, n80, n81, n82 : std_logic;

begin
   lut_start <= lut_start_port;
   
   state_reg_0_inst : dfn10 port map( D => new_state_0_port, CK => clk, Q => 
                           state_0_port);
   state_reg_2_inst : dfn10 port map( D => new_state_2_port, CK => clk, Q => 
                           state_2_port);
   cur_block_reg_0_inst : dfn10 port map( D => n48, CK => clk, Q => 
                           cur_block_0_port);
   cur_block_reg_1_inst : dfn10 port map( D => n49, CK => clk, Q => 
                           cur_block_1_port);
   state_reg_1_inst : dfn10 port map( D => new_state_1_port, CK => clk, Q => 
                           state_1_port);
   data_tri : tinv10 port map( A => n46, E => n42, Y => data);
   mask_select_tri_0_inst : tinv10 port map( A => n45, E => n44, Y => 
                           mask_select(0));
   mask_select_tri_1_inst : tinv10 port map( A => n43, E => n44, Y => 
                           mask_select(1));
   write_tri : tinv10 port map( A => n1, E => n42, Y => write);
   addr_tri_0_inst : tinv10 port map( A => n41, E => n42, Y => addr(0));
   addr_tri_1_inst : tinv10 port map( A => n40, E => n42, Y => addr(1));
   addr_tri_2_inst : tinv10 port map( A => n39, E => n42, Y => addr(2));
   addr_tri_3_inst : tinv10 port map( A => n38, E => n42, Y => addr(3));
   addr_tri_4_inst : tinv10 port map( A => n37, E => n42, Y => addr(4));
   addr_tri_5_inst : tinv10 port map( A => n36, E => n42, Y => addr(5));
   addr_tri_6_inst : tinv10 port map( A => n35, E => n42, Y => addr(6));
   addr_tri_7_inst : tinv10 port map( A => n34, E => n42, Y => addr(7));
   n1 <= '0';
   U56 : no210 port map( A => n51, B => n52, Y => ready);
   U57 : iv110 port map( A => n53, Y => n51);
   U58 : na310 port map( A => n54, B => n55, C => n56, Y => new_state_2_port);
   U59 : na210 port map( A => n57, B => n58, Y => n56);
   U60 : na210 port map( A => start, B => n53, Y => n55);
   U61 : na210 port map( A => n59, B => n60, Y => n54);
   U62 : iv110 port map( A => n61, Y => n60);
   U63 : na210 port map( A => n62, B => n63, Y => new_state_1_port);
   U64 : iv110 port map( A => n64, Y => n63);
   U65 : no210 port map( A => n58, B => n65, Y => n64);
   U66 : no210 port map( A => n66, B => n57, Y => n65);
   U67 : na310 port map( A => n67, B => n62, C => n68, Y => new_state_0_port);
   U68 : no310 port map( A => n69, B => n70, C => n57, Y => n68);
   U69 : iv110 port map( A => n71, Y => n69);
   U70 : na310 port map( A => start, B => n52, C => n53, Y => n71);
   U71 : na210 port map( A => n59, B => n61, Y => n62);
   U72 : na210 port map( A => cur_block_1_port, B => cur_block_0_port, Y => n61
                           );
   U73 : na210 port map( A => n66, B => n58, Y => n67);
   U74 : iv110 port map( A => lut_ready, Y => n58);
   U75 : mu111 port map( A => n72, B => n73, S => cur_block_1_port, Y => n49);
   U76 : na210 port map( A => n74, B => n75, Y => n73);
   U77 : na210 port map( A => n59, B => n45, Y => n75);
   U78 : no210 port map( A => n45, B => n76, Y => n72);
   U79 : iv110 port map( A => n59, Y => n76);
   U80 : mu111 port map( A => n59, B => n77, S => cur_block_0_port, Y => n48);
   U81 : no310 port map( A => state_0_port, B => state_2_port, C => n78, Y => 
                           n59);
   U82 : iv110 port map( A => draw_erase, Y => n46);
   U83 : iv110 port map( A => cur_block_0_port, Y => n45);
   U84 : na210 port map( A => n79, B => n80, Y => n44);
   U85 : na210 port map( A => state_1_port, B => state_2_port, Y => n80);
   U86 : iv110 port map( A => cur_block_1_port, Y => n43);
   U87 : no210 port map( A => n53, B => n77, Y => n42);
   U88 : iv110 port map( A => n74, Y => n77);
   U89 : no210 port map( A => n57, B => lut_start_port, Y => n74);
   U90 : no310 port map( A => n78, B => state_2_port, C => n81, Y => n57);
   U91 : iv110 port map( A => state_0_port, Y => n81);
   U92 : no210 port map( A => state_0_port, B => state_1_port, Y => n53);
   U93 : iv110 port map( A => mask(0), Y => n41);
   U94 : iv110 port map( A => mask(1), Y => n40);
   U95 : iv110 port map( A => mask(2), Y => n39);
   U96 : iv110 port map( A => mask(3), Y => n38);
   U97 : iv110 port map( A => mask(4), Y => n37);
   U98 : iv110 port map( A => mask(5), Y => n36);
   U99 : iv110 port map( A => mask(6), Y => n35);
   U100 : iv110 port map( A => mask(7), Y => n34);
   U101 : iv110 port map( A => n82, Y => lut_start_port);
   U102 : no210 port map( A => n66, B => n70, Y => n82);
   U103 : no210 port map( A => n79, B => n52, Y => n70);
   U104 : iv110 port map( A => state_2_port, Y => n52);
   U105 : no210 port map( A => n79, B => state_2_port, Y => n66);
   U106 : na210 port map( A => state_0_port, B => n78, Y => n79);
   U107 : iv110 port map( A => state_1_port, Y => n78);

end synthesised;



