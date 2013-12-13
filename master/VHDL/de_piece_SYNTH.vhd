
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
   
   component dfr11
      port( D, R, CK : in std_logic;  Q : out std_logic);
   end component;
   
   signal state_2_port, state_1_port, state_0_port, cur_block_1_port, 
      cur_block_0_port, new_state_2_port, new_state_1_port, new_state_0_port, 
      new_cur_block_1_port, new_cur_block_0_port, n1, n34, n35, n36, n37, n38, 
      n39, n40, n41, n42, n43, n44, n45, n46, lut_start_port, n49, n50, n51, 
      n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66
      , n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80 : 
      std_logic;

begin
   lut_start <= lut_start_port;
   
   state_reg_0_inst : dfr11 port map( D => new_state_0_port, R => rst, CK => 
                           clk, Q => state_0_port);
   state_reg_2_inst : dfr11 port map( D => new_state_2_port, R => rst, CK => 
                           clk, Q => state_2_port);
   cur_block_reg_0_inst : dfr11 port map( D => new_cur_block_0_port, R => rst, 
                           CK => clk, Q => cur_block_0_port);
   cur_block_reg_1_inst : dfr11 port map( D => new_cur_block_1_port, R => rst, 
                           CK => clk, Q => cur_block_1_port);
   state_reg_1_inst : dfr11 port map( D => new_state_1_port, R => rst, CK => 
                           clk, Q => state_1_port);
   data_tri : tinv10 port map( A => n46, E => n34, Y => data);
   mask_select_tri_0_inst : tinv10 port map( A => n45, E => n44, Y => 
                           mask_select(0));
   mask_select_tri_1_inst : tinv10 port map( A => n43, E => n44, Y => 
                           mask_select(1));
   addr_tri_0_inst : tinv10 port map( A => n42, E => n34, Y => addr(0));
   addr_tri_1_inst : tinv10 port map( A => n41, E => n34, Y => addr(1));
   addr_tri_2_inst : tinv10 port map( A => n40, E => n34, Y => addr(2));
   addr_tri_3_inst : tinv10 port map( A => n39, E => n34, Y => addr(3));
   addr_tri_4_inst : tinv10 port map( A => n38, E => n34, Y => addr(4));
   addr_tri_5_inst : tinv10 port map( A => n37, E => n34, Y => addr(5));
   addr_tri_6_inst : tinv10 port map( A => n36, E => n34, Y => addr(6));
   addr_tri_7_inst : tinv10 port map( A => n35, E => n34, Y => addr(7));
   write_tri : tinv10 port map( A => n1, E => n34, Y => write);
   n1 <= '0';
   U56 : no210 port map( A => n49, B => n50, Y => ready);
   U57 : iv110 port map( A => n51, Y => n49);
   U58 : na310 port map( A => n52, B => n53, C => n54, Y => new_state_2_port);
   U59 : na210 port map( A => n55, B => n56, Y => n54);
   U60 : na210 port map( A => start, B => n51, Y => n53);
   U61 : na210 port map( A => n57, B => n58, Y => n52);
   U62 : iv110 port map( A => n59, Y => n58);
   U63 : na210 port map( A => n60, B => n61, Y => new_state_1_port);
   U64 : iv110 port map( A => n62, Y => n61);
   U65 : no210 port map( A => n56, B => n63, Y => n62);
   U66 : no210 port map( A => n64, B => n55, Y => n63);
   U67 : na310 port map( A => n65, B => n60, C => n66, Y => new_state_0_port);
   U68 : no310 port map( A => n67, B => n68, C => n55, Y => n66);
   U69 : iv110 port map( A => n69, Y => n67);
   U70 : na310 port map( A => start, B => n50, C => n51, Y => n69);
   U71 : na210 port map( A => n57, B => n59, Y => n60);
   U72 : na210 port map( A => cur_block_1_port, B => cur_block_0_port, Y => n59
                           );
   U73 : na210 port map( A => n64, B => n56, Y => n65);
   U74 : iv110 port map( A => lut_ready, Y => n56);
   U75 : mu111 port map( A => n70, B => n71, S => cur_block_1_port, Y => 
                           new_cur_block_1_port);
   U76 : na210 port map( A => n72, B => n73, Y => n71);
   U77 : na210 port map( A => n57, B => n45, Y => n73);
   U78 : no210 port map( A => n45, B => n74, Y => n70);
   U79 : iv110 port map( A => n57, Y => n74);
   U80 : mu111 port map( A => n57, B => n75, S => cur_block_0_port, Y => 
                           new_cur_block_0_port);
   U81 : no310 port map( A => state_0_port, B => state_2_port, C => n76, Y => 
                           n57);
   U82 : iv110 port map( A => draw_erase, Y => n46);
   U83 : iv110 port map( A => cur_block_0_port, Y => n45);
   U84 : na210 port map( A => n77, B => n78, Y => n44);
   U85 : na210 port map( A => state_1_port, B => state_2_port, Y => n78);
   U86 : iv110 port map( A => cur_block_1_port, Y => n43);
   U87 : iv110 port map( A => mask(0), Y => n42);
   U88 : iv110 port map( A => mask(1), Y => n41);
   U89 : iv110 port map( A => mask(2), Y => n40);
   U90 : iv110 port map( A => mask(3), Y => n39);
   U91 : iv110 port map( A => mask(4), Y => n38);
   U92 : iv110 port map( A => mask(5), Y => n37);
   U93 : iv110 port map( A => mask(6), Y => n36);
   U94 : iv110 port map( A => mask(7), Y => n35);
   U95 : no210 port map( A => n51, B => n75, Y => n34);
   U96 : iv110 port map( A => n72, Y => n75);
   U97 : no210 port map( A => n55, B => lut_start_port, Y => n72);
   U98 : no310 port map( A => n76, B => state_2_port, C => n79, Y => n55);
   U99 : iv110 port map( A => state_0_port, Y => n79);
   U100 : no210 port map( A => state_0_port, B => state_1_port, Y => n51);
   U101 : iv110 port map( A => n80, Y => lut_start_port);
   U102 : no210 port map( A => n64, B => n68, Y => n80);
   U103 : no210 port map( A => n77, B => n50, Y => n68);
   U104 : iv110 port map( A => state_2_port, Y => n50);
   U105 : no210 port map( A => n77, B => state_2_port, Y => n64);
   U106 : na210 port map( A => state_0_port, B => n76, Y => n77);
   U107 : iv110 port map( A => state_1_port, Y => n76);

end synthesised;



