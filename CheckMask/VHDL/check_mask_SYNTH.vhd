
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
   
   component no310
      port( A, B, C : in std_logic;  Y : out std_logic);
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
      pixel_0_port, n1, n2, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, 
      n52, n53, ready_port, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, 
      n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79
      , n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, 
      n94, n95 : std_logic;

begin
   ready <= ready_port;
   empty <= empty_port;
   
   write <= '0';
   pixel_reg_0_inst : dfn10 port map( D => n53, CK => clk, Q => pixel_0_port);
   pixel_reg_1_inst : dfn10 port map( D => n52, CK => clk, Q => pixel_1_port);
   state_reg_2_inst : dfr11 port map( D => next_state_2_port, R => rst, CK => 
                           clk, Q => state_2_port);
   state_reg_0_inst : dfr11 port map( D => next_state_0_port, R => rst, CK => 
                           clk, Q => state_0_port);
   state_reg_1_inst : dfr11 port map( D => next_state_1_port, R => rst, CK => 
                           clk, Q => state_1_port);
   empty_s_reg : dfn10 port map( D => n51, CK => clk, Q => empty_port);
   data_out_tri : tinv10 port map( A => n1, E => n2, Y => data_out);
   addr_tri_0_inst : tinv10 port map( A => n50, E => n55, Y => addr(0));
   addr_tri_1_inst : tinv10 port map( A => n49, E => n43, Y => addr(1));
   addr_tri_2_inst : tinv10 port map( A => n48, E => n43, Y => addr(2));
   addr_tri_3_inst : tinv10 port map( A => n47, E => n55, Y => addr(3));
   addr_tri_4_inst : tinv10 port map( A => n46, E => n55, Y => addr(4));
   addr_tri_5_inst : tinv10 port map( A => n45, E => n43, Y => addr(5));
   addr_tri_6_inst : tinv10 port map( A => n44, E => n43, Y => addr(6));
   addr_tri_7_inst : tinv10 port map( A => n42, E => n55, Y => addr(7));
   n2 <= '0';
   n1 <= '1';
   U63 : no310 port map( A => n89, B => ready_port, C => n69, Y => n55);
   U64 : na310 port map( A => n56, B => n57, C => n58, Y => next_state_2_port);
   U65 : no210 port map( A => n59, B => n60, Y => n58);
   U66 : no210 port map( A => n61, B => n62, Y => n60);
   U67 : iv110 port map( A => start, Y => n62);
   U68 : no210 port map( A => n63, B => n64, Y => n59);
   U69 : na310 port map( A => n65, B => n63, C => n66, Y => next_state_0_port);
   U70 : na210 port map( A => start, B => n67, Y => n66);
   U71 : iv110 port map( A => n68, Y => n67);
   U72 : no210 port map( A => ready_port, B => n69, Y => n68);
   U73 : na310 port map( A => n70, B => n71, C => state_1_port, Y => n65);
   U74 : mu111 port map( A => n72, B => pixel_0_port, S => n73, Y => n53);
   U75 : no210 port map( A => pixel_0_port, B => n63, Y => n72);
   U76 : mu111 port map( A => n74, B => n75, S => pixel_1_port, Y => n52);
   U77 : na210 port map( A => n76, B => n77, Y => n75);
   U78 : na210 port map( A => n78, B => n79, Y => n77);
   U79 : iv110 port map( A => n73, Y => n76);
   U80 : no310 port map( A => n73, B => n63, C => n79, Y => n74);
   U81 : na210 port map( A => n80, B => n81, Y => n73);
   U82 : na210 port map( A => n82, B => n83, Y => n81);
   U83 : na210 port map( A => n84, B => n64, Y => n82);
   U84 : na210 port map( A => n85, B => n86, Y => n51);
   U85 : na310 port map( A => n64, B => n80, C => n87, Y => n86);
   U86 : iv110 port map( A => n56, Y => n87);
   U87 : na310 port map( A => pixel_0_port, B => n78, C => pixel_1_port, Y => 
                           n56);
   U88 : iv110 port map( A => n63, Y => n78);
   U89 : iv110 port map( A => data_in, Y => n64);
   U90 : na210 port map( A => empty_port, B => n88, Y => n85);
   U91 : na210 port map( A => n80, B => n61, Y => n88);
   U92 : iv110 port map( A => ready_port, Y => n61);
   U93 : iv110 port map( A => rst, Y => n80);
   U94 : iv110 port map( A => mask(0), Y => n50);
   U95 : iv110 port map( A => mask(1), Y => n49);
   U96 : iv110 port map( A => mask(2), Y => n48);
   U97 : iv110 port map( A => mask(3), Y => n47);
   U98 : iv110 port map( A => mask(4), Y => n46);
   U99 : iv110 port map( A => mask(5), Y => n45);
   U100 : iv110 port map( A => mask(6), Y => n44);
   U101 : no310 port map( A => n89, B => ready_port, C => n69, Y => n43);
   U102 : iv110 port map( A => mask(7), Y => n42);
   U103 : iv110 port map( A => n90, Y => mask_select(1));
   U104 : na210 port map( A => n83, B => pixel_1_port, Y => n90);
   U105 : no210 port map( A => n91, B => n79, Y => mask_select(0));
   U106 : iv110 port map( A => pixel_0_port, Y => n79);
   U107 : iv110 port map( A => n83, Y => n91);
   U108 : na210 port map( A => n84, B => n63, Y => n83);
   U109 : na210 port map( A => n69, B => state_2_port, Y => n63);
   U110 : no310 port map( A => next_state_1_port, B => ready_port, C => n92, Y 
                           => n84);
   U111 : iv110 port map( A => n57, Y => n92);
   U112 : na210 port map( A => n93, B => n71, Y => n57);
   U113 : no310 port map( A => n70, B => state_1_port, C => n71, Y => 
                           ready_port);
   U114 : iv110 port map( A => state_2_port, Y => n71);
   U115 : no210 port map( A => n94, B => n69, Y => next_state_1_port);
   U116 : no210 port map( A => state_0_port, B => state_1_port, Y => n69);
   U117 : iv110 port map( A => n89, Y => n94);
   U118 : no210 port map( A => state_2_port, B => n93, Y => n89);
   U119 : no210 port map( A => n95, B => n70, Y => n93);
   U120 : iv110 port map( A => state_0_port, Y => n70);
   U121 : iv110 port map( A => state_1_port, Y => n95);

end synthesised;



