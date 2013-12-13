
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
   
   component na310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
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
   
   signal lut_start_port, state_2_port, state_1_port, state_0_port, 
      cur_block_1_port, cur_block_0_port, new_state_2_port, new_state_1_port, 
      new_state_0_port, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, 
      n40, n41, n42, n43, n44, n45, n47, n48, n49, n50, n51, n52, n53, n54, n55
      , n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, 
      n70, n71, n72, n73, n74, n75 : std_logic;

begin
   lut_start <= lut_start_port;
   
   state_reg_0_inst : dfn10 port map( D => new_state_0_port, CK => clk, Q => 
                           state_0_port);
   state_reg_2_inst : dfn10 port map( D => new_state_2_port, CK => clk, Q => 
                           state_2_port);
   cur_block_reg_1_inst : dfn10 port map( D => n45, CK => clk, Q => 
                           cur_block_1_port);
   state_reg_1_inst : dfn10 port map( D => new_state_1_port, CK => clk, Q => 
                           state_1_port);
   cur_block_reg_0_inst : dfn10 port map( D => n44, CK => clk, Q => 
                           cur_block_0_port);
   data_tri : tinv10 port map( A => n42, E => n43, Y => data);
   mask_select_tri_0_inst : tinv10 port map( A => n41, E => n40, Y => 
                           mask_select(0));
   mask_select_tri_1_inst : tinv10 port map( A => n39, E => n40, Y => 
                           mask_select(1));
   addr_tri_0_inst : tinv10 port map( A => n38, E => n43, Y => addr(0));
   addr_tri_1_inst : tinv10 port map( A => n37, E => n43, Y => addr(1));
   addr_tri_2_inst : tinv10 port map( A => n36, E => n43, Y => addr(2));
   addr_tri_3_inst : tinv10 port map( A => n35, E => n43, Y => addr(3));
   addr_tri_4_inst : tinv10 port map( A => n34, E => n43, Y => addr(4));
   addr_tri_5_inst : tinv10 port map( A => n33, E => n43, Y => addr(5));
   addr_tri_6_inst : tinv10 port map( A => n32, E => n43, Y => addr(6));
   addr_tri_7_inst : tinv10 port map( A => n31, E => n43, Y => addr(7));
   write_tri : tinv10 port map( A => n29, E => n30, Y => write);
   U53 : no310 port map( A => n47, B => state_1_port, C => state_0_port, Y => 
                           ready);
   U54 : na210 port map( A => n48, B => n49, Y => new_state_2_port);
   U55 : iv110 port map( A => n50, Y => n49);
   U56 : no210 port map( A => n51, B => n29, Y => n50);
   U57 : mu111 port map( A => n52, B => n53, S => state_1_port, Y => n48);
   U58 : na210 port map( A => n54, B => n55, Y => n53);
   U59 : iv110 port map( A => lut_ready, Y => n55);
   U60 : na210 port map( A => start, B => n56, Y => n52);
   U61 : na210 port map( A => n57, B => n58, Y => new_state_1_port);
   U62 : na210 port map( A => n51, B => n59, Y => n58);
   U63 : na210 port map( A => lut_ready, B => n54, Y => n57);
   U64 : na310 port map( A => n60, B => n61, C => n62, Y => new_state_0_port);
   U65 : na210 port map( A => start, B => n63, Y => n62);
   U66 : iv110 port map( A => n30, Y => n63);
   U67 : na210 port map( A => lut_start_port, B => n64, Y => n61);
   U68 : na210 port map( A => lut_ready, B => n47, Y => n64);
   U69 : na210 port map( A => state_1_port, B => n65, Y => n60);
   U70 : na210 port map( A => n66, B => n67, Y => n65);
   U71 : na210 port map( A => n51, B => n47, Y => n67);
   U72 : na210 port map( A => cur_block_1_port, B => cur_block_0_port, Y => n51
                           );
   U73 : mu111 port map( A => n68, B => n69, S => cur_block_1_port, Y => n45);
   U74 : na210 port map( A => n70, B => n71, Y => n69);
   U75 : na210 port map( A => n59, B => n41, Y => n71);
   U76 : iv110 port map( A => n29, Y => n59);
   U77 : no210 port map( A => n41, B => n29, Y => n68);
   U78 : iv110 port map( A => n72, Y => n44);
   U79 : mu111 port map( A => n29, B => n70, S => cur_block_0_port, Y => n72);
   U80 : no210 port map( A => lut_start_port, B => n54, Y => n70);
   U81 : no210 port map( A => n54, B => n73, Y => n43);
   U82 : iv110 port map( A => n66, Y => n54);
   U83 : na210 port map( A => state_0_port, B => n47, Y => n66);
   U84 : iv110 port map( A => draw_erase, Y => n42);
   U85 : iv110 port map( A => cur_block_0_port, Y => n41);
   U86 : na210 port map( A => n74, B => n75, Y => n40);
   U87 : na210 port map( A => state_1_port, B => state_2_port, Y => n75);
   U88 : iv110 port map( A => cur_block_1_port, Y => n39);
   U89 : iv110 port map( A => mask(0), Y => n38);
   U90 : iv110 port map( A => mask(1), Y => n37);
   U91 : iv110 port map( A => mask(2), Y => n36);
   U92 : iv110 port map( A => mask(3), Y => n35);
   U93 : iv110 port map( A => mask(4), Y => n34);
   U94 : iv110 port map( A => mask(5), Y => n33);
   U95 : iv110 port map( A => mask(6), Y => n32);
   U96 : iv110 port map( A => mask(7), Y => n31);
   U97 : na310 port map( A => n73, B => n47, C => n56, Y => n30);
   U98 : na310 port map( A => n56, B => n47, C => state_1_port, Y => n29);
   U99 : iv110 port map( A => state_2_port, Y => n47);
   U100 : iv110 port map( A => state_0_port, Y => n56);
   U101 : iv110 port map( A => n74, Y => lut_start_port);
   U102 : na210 port map( A => state_0_port, B => n73, Y => n74);
   U103 : iv110 port map( A => state_1_port, Y => n73);

end synthesised;



