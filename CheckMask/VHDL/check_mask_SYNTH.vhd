
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of check_mask is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component na310
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
   
   signal state_2_port, state_1_port, state_0_port, next_state_2_port, 
      next_state_1_port, next_state_0_port, pixel_1_port, pixel_0_port, n1, n2,
      n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52
      , n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, 
      n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81
      , n82, n83 : std_logic;

begin
   
   write <= '0';
   state_reg_0_inst : dfr11 port map( D => next_state_0_port, R => rst, CK => 
                           clk, Q => state_0_port);
   state_reg_1_inst : dfr11 port map( D => next_state_1_port, R => rst, CK => 
                           clk, Q => state_1_port);
   pixel_reg_0_inst : dfn10 port map( D => n50, CK => clk, Q => pixel_0_port);
   state_reg_2_inst : dfr11 port map( D => next_state_2_port, R => rst, CK => 
                           clk, Q => state_2_port);
   pixel_reg_1_inst : dfn10 port map( D => n49, CK => clk, Q => pixel_1_port);
   data_out_tri : tinv10 port map( A => n1, E => n2, Y => data_out);
   addr_tri_0_inst : tinv10 port map( A => n48, E => n51, Y => addr(0));
   addr_tri_1_inst : tinv10 port map( A => n47, E => n41, Y => addr(1));
   addr_tri_2_inst : tinv10 port map( A => n46, E => n41, Y => addr(2));
   addr_tri_3_inst : tinv10 port map( A => n45, E => n51, Y => addr(3));
   addr_tri_4_inst : tinv10 port map( A => n44, E => n51, Y => addr(4));
   addr_tri_5_inst : tinv10 port map( A => n43, E => n41, Y => addr(5));
   addr_tri_6_inst : tinv10 port map( A => n42, E => n41, Y => addr(6));
   addr_tri_7_inst : tinv10 port map( A => n40, E => n51, Y => addr(7));
   empty_tri : tinv10 port map( A => n38, E => n39, Y => empty);
   n2 <= '0';
   n1 <= '1';
   U60 : no310 port map( A => next_state_1_port, B => n76, C => n63, Y => n51);
   U61 : no210 port map( A => n52, B => n53, Y => ready);
   U62 : no210 port map( A => data_in, B => state_0_port, Y => n52);
   U63 : na210 port map( A => n54, B => n55, Y => next_state_2_port);
   U64 : na310 port map( A => n56, B => n57, C => n58, Y => n55);
   U65 : no210 port map( A => n59, B => n60, Y => n58);
   U66 : na210 port map( A => n61, B => n62, Y => next_state_0_port);
   U67 : na210 port map( A => n63, B => n64, Y => n62);
   U68 : iv110 port map( A => n65, Y => n64);
   U69 : no210 port map( A => start, B => state_1_port, Y => n65);
   U70 : na210 port map( A => n56, B => n57, Y => n61);
   U71 : mu111 port map( A => n66, B => n67, S => n59, Y => n50);
   U72 : no210 port map( A => n68, B => n66, Y => n67);
   U73 : mu111 port map( A => n69, B => n70, S => n60, Y => n49);
   U74 : no310 port map( A => n66, B => n68, C => n59, Y => n70);
   U75 : iv110 port map( A => n56, Y => n68);
   U76 : iv110 port map( A => n71, Y => n66);
   U77 : na210 port map( A => n71, B => n72, Y => n69);
   U78 : na210 port map( A => n56, B => n59, Y => n72);
   U79 : no210 port map( A => n53, B => state_0_port, Y => n56);
   U80 : no210 port map( A => n73, B => rst, Y => n71);
   U81 : no210 port map( A => n74, B => n75, Y => n73);
   U82 : no310 port map( A => data_in, B => state_0_port, C => 
                           next_state_1_port, Y => n75);
   U83 : iv110 port map( A => mask(0), Y => n48);
   U84 : iv110 port map( A => mask(1), Y => n47);
   U85 : iv110 port map( A => mask(2), Y => n46);
   U86 : iv110 port map( A => mask(3), Y => n45);
   U87 : iv110 port map( A => mask(4), Y => n44);
   U88 : iv110 port map( A => mask(5), Y => n43);
   U89 : iv110 port map( A => mask(6), Y => n42);
   U90 : no310 port map( A => next_state_1_port, B => n76, C => n63, Y => n41);
   U91 : iv110 port map( A => n77, Y => next_state_1_port);
   U92 : iv110 port map( A => mask(7), Y => n40);
   U93 : no210 port map( A => n78, B => n79, Y => n39);
   U94 : no210 port map( A => state_0_port, B => n38, Y => n78);
   U95 : na210 port map( A => n80, B => n57, Y => n38);
   U96 : iv110 port map( A => data_in, Y => n57);
   U97 : no210 port map( A => n74, B => n60, Y => mask_select(1));
   U98 : iv110 port map( A => pixel_1_port, Y => n60);
   U99 : no210 port map( A => n74, B => n59, Y => mask_select(0));
   U100 : iv110 port map( A => pixel_0_port, Y => n59);
   U101 : iv110 port map( A => n81, Y => n74);
   U102 : na310 port map( A => n54, B => n53, C => n77, Y => n81);
   U103 : mu111 port map( A => n82, B => n83, S => n80, Y => n77);
   U104 : iv110 port map( A => state_1_port, Y => n80);
   U105 : na210 port map( A => state_0_port, B => n79, Y => n83);
   U106 : iv110 port map( A => n63, Y => n82);
   U107 : no210 port map( A => state_2_port, B => state_0_port, Y => n63);
   U108 : iv110 port map( A => n76, Y => n53);
   U109 : no210 port map( A => n79, B => state_1_port, Y => n76);
   U110 : na310 port map( A => state_0_port, B => n79, C => state_1_port, Y => 
                           n54);
   U111 : iv110 port map( A => state_2_port, Y => n79);

end synthesised;



