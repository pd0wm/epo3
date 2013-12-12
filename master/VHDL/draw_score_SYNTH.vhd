
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of draw_score is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
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
   
   component na310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component tinv10
      port( A, E : in std_logic;  Y : out std_logic);
   end component;
   
   component dfr11
      port( D, R, CK : in std_logic;  Q : out std_logic);
   end component;
   
   signal state_1_port, state_0_port, i_2_port, i_1_port, i_0_port, 
      new_state_1_port, new_state_0_port, next_i_2_port, next_i_1_port, n3, n38
      , ds_ready_port, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, 
      n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73
      , n74, n75, n76, n77, n78, n79, n80, n81, n82, n83 : std_logic;

begin
   ds_ready <= ds_ready_port;
   
   state_reg_0_inst : dfr11 port map( D => new_state_0_port, R => ds_rst, CK =>
                           ds_clk, Q => state_0_port);
   i_reg_0_inst : dfr11 port map( D => n81, R => ds_rst, CK => ds_clk, Q => 
                           i_0_port);
   i_reg_1_inst : dfr11 port map( D => next_i_1_port, R => ds_rst, CK => ds_clk
                           , Q => i_1_port);
   i_reg_2_inst : dfr11 port map( D => next_i_2_port, R => ds_rst, CK => ds_clk
                           , Q => i_2_port);
   state_reg_1_inst : dfr11 port map( D => new_state_1_port, R => ds_rst, CK =>
                           ds_clk, Q => state_1_port);
   ds_addr_tri_0_inst : tinv10 port map( A => i_0_port, E => state_0_port, Y =>
                           ds_addr(0));
   ds_addr_tri_1_inst : tinv10 port map( A => i_1_port, E => state_0_port, Y =>
                           ds_addr(1));
   ds_addr_tri_2_inst : tinv10 port map( A => i_2_port, E => state_0_port, Y =>
                           ds_addr(2));
   ds_addr_tri_3_inst : tinv10 port map( A => n82, E => state_0_port, Y => 
                           ds_addr(3));
   ds_addr_tri_4_inst : tinv10 port map( A => n83, E => state_0_port, Y => 
                           ds_addr(4));
   ds_addr_tri_5_inst : tinv10 port map( A => n82, E => state_0_port, Y => 
                           ds_addr(5));
   ds_addr_tri_6_inst : tinv10 port map( A => n82, E => state_0_port, Y => 
                           ds_addr(6));
   ds_addr_tri_7_inst : tinv10 port map( A => n83, E => state_0_port, Y => 
                           ds_addr(7));
   ds_data_out_tri : tinv10 port map( A => n38, E => state_0_port, Y => 
                           ds_data_out);
   ds_write_tri : tinv10 port map( A => n3, E => state_0_port, Y => ds_write);
   n3 <= '0';
   U54 : iv110 port map( A => n48, Y => next_i_2_port);
   U55 : mu111 port map( A => n49, B => n50, S => i_2_port, Y => n48);
   U56 : na210 port map( A => n51, B => n52, Y => n49);
   U57 : na210 port map( A => n53, B => n54, Y => next_i_1_port);
   U58 : na210 port map( A => n55, B => n52, Y => n54);
   U59 : na210 port map( A => n81, B => i_1_port, Y => n53);
   U60 : na210 port map( A => n56, B => n57, Y => new_state_1_port);
   U61 : na310 port map( A => n52, B => n51, C => i_2_port, Y => n57);
   U62 : iv110 port map( A => n58, Y => n51);
   U63 : na210 port map( A => ds_draw, B => ds_ready_port, Y => n56);
   U64 : na310 port map( A => n59, B => n60, C => n50, Y => new_state_0_port);
   U65 : no210 port map( A => n81, B => n61, Y => n50);
   U66 : no210 port map( A => n62, B => i_1_port, Y => n61);
   U67 : na310 port map( A => n63, B => n64, C => ds_draw, Y => n60);
   U68 : iv110 port map( A => state_0_port, Y => n63);
   U69 : na210 port map( A => n52, B => n65, Y => n59);
   U70 : iv110 port map( A => i_2_port, Y => n65);
   U71 : iv110 port map( A => n62, Y => n52);
   U72 : no210 port map( A => n62, B => i_0_port, Y => n81);
   U73 : na210 port map( A => state_0_port, B => n64, Y => n62);
   U74 : iv110 port map( A => n66, Y => n38);
   U75 : mu111 port map( A => n67, B => n68, S => i_2_port, Y => n66);
   U76 : no310 port map( A => n69, B => n70, C => n71, Y => n68);
   U77 : no210 port map( A => ds_input(5), B => n72, Y => n71);
   U78 : no210 port map( A => i_0_port, B => n73, Y => n70);
   U79 : mu111 port map( A => ds_input(4), B => ds_input(6), S => i_1_port, Y 
                           => n73);
   U80 : no210 port map( A => ds_input(7), B => n58, Y => n69);
   U81 : na210 port map( A => i_1_port, B => i_0_port, Y => n58);
   U82 : na210 port map( A => n74, B => n75, Y => n67);
   U83 : na210 port map( A => ds_input(1), B => n55, Y => n75);
   U84 : iv110 port map( A => n72, Y => n55);
   U85 : na210 port map( A => i_0_port, B => n76, Y => n72);
   U86 : iv110 port map( A => i_1_port, Y => n76);
   U87 : mu111 port map( A => n77, B => n78, S => i_1_port, Y => n74);
   U88 : iv110 port map( A => n79, Y => n78);
   U89 : mu111 port map( A => ds_input(2), B => ds_input(3), S => i_0_port, Y 
                           => n79);
   U90 : na210 port map( A => ds_input(0), B => n80, Y => n77);
   U91 : iv110 port map( A => i_0_port, Y => n80);
   U92 : no210 port map( A => n64, B => state_0_port, Y => ds_ready_port);
   U93 : iv110 port map( A => state_1_port, Y => n64);
   n82 <= '1';
   n83 <= '0';

end synthesised;



