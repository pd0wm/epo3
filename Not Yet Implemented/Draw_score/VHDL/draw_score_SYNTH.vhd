
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
      new_state_1_port, new_state_0_port, next_i_2_port, next_i_1_port, n36, 
      ds_write_port, ds_ready_port, n47, n48, n49, n50, n51, n52, n53, n54, n55
      , n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, 
      n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81 : std_logic;

begin
   ds_ready <= ds_ready_port;
   ds_write <= ds_write_port;
   
   state_reg_0_inst : dfr11 port map( D => new_state_0_port, R => ds_rst, CK =>
                           ds_clk, Q => state_0_port);
   i_reg_0_inst : dfr11 port map( D => n79, R => ds_rst, CK => ds_clk, Q => 
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
   ds_addr_tri_3_inst : tinv10 port map( A => n80, E => state_0_port, Y => 
                           ds_addr(3));
   ds_addr_tri_4_inst : tinv10 port map( A => n81, E => state_0_port, Y => 
                           ds_addr(4));
   ds_addr_tri_5_inst : tinv10 port map( A => n80, E => state_0_port, Y => 
                           ds_addr(5));
   ds_addr_tri_6_inst : tinv10 port map( A => n80, E => state_0_port, Y => 
                           ds_addr(6));
   ds_addr_tri_7_inst : tinv10 port map( A => n81, E => state_0_port, Y => 
                           ds_addr(7));
   ds_data_out_tri : tinv10 port map( A => n36, E => state_0_port, Y => 
                           ds_data_out);
   U53 : iv110 port map( A => n47, Y => next_i_2_port);
   U54 : mu111 port map( A => n48, B => n49, S => i_2_port, Y => n47);
   U55 : na210 port map( A => n50, B => ds_write_port, Y => n48);
   U56 : na210 port map( A => n51, B => n52, Y => next_i_1_port);
   U57 : na210 port map( A => n53, B => ds_write_port, Y => n52);
   U58 : na210 port map( A => n79, B => i_1_port, Y => n51);
   U59 : na210 port map( A => n54, B => n55, Y => new_state_1_port);
   U60 : na310 port map( A => ds_write_port, B => n50, C => i_2_port, Y => n55)
                           ;
   U61 : iv110 port map( A => n56, Y => n50);
   U62 : na210 port map( A => ds_draw, B => ds_ready_port, Y => n54);
   U63 : na310 port map( A => n57, B => n58, C => n49, Y => new_state_0_port);
   U64 : no210 port map( A => n79, B => n59, Y => n49);
   U65 : no210 port map( A => n60, B => i_1_port, Y => n59);
   U66 : na310 port map( A => n61, B => n62, C => ds_draw, Y => n58);
   U67 : iv110 port map( A => state_0_port, Y => n61);
   U68 : na210 port map( A => ds_write_port, B => n63, Y => n57);
   U69 : iv110 port map( A => i_2_port, Y => n63);
   U70 : no210 port map( A => n60, B => i_0_port, Y => n79);
   U71 : iv110 port map( A => n64, Y => n36);
   U72 : mu111 port map( A => n65, B => n66, S => i_2_port, Y => n64);
   U73 : no310 port map( A => n67, B => n68, C => n69, Y => n66);
   U74 : no210 port map( A => ds_input(5), B => n70, Y => n69);
   U75 : no210 port map( A => i_0_port, B => n71, Y => n68);
   U76 : mu111 port map( A => ds_input(4), B => ds_input(6), S => i_1_port, Y 
                           => n71);
   U77 : no210 port map( A => ds_input(7), B => n56, Y => n67);
   U78 : na210 port map( A => i_1_port, B => i_0_port, Y => n56);
   U79 : na210 port map( A => n72, B => n73, Y => n65);
   U80 : na210 port map( A => ds_input(1), B => n53, Y => n73);
   U81 : iv110 port map( A => n70, Y => n53);
   U82 : na210 port map( A => i_0_port, B => n74, Y => n70);
   U83 : iv110 port map( A => i_1_port, Y => n74);
   U84 : mu111 port map( A => n75, B => n76, S => i_1_port, Y => n72);
   U85 : iv110 port map( A => n77, Y => n76);
   U86 : mu111 port map( A => ds_input(2), B => ds_input(3), S => i_0_port, Y 
                           => n77);
   U87 : na210 port map( A => ds_input(0), B => n78, Y => n75);
   U88 : iv110 port map( A => i_0_port, Y => n78);
   U89 : iv110 port map( A => n60, Y => ds_write_port);
   U90 : na210 port map( A => state_0_port, B => n62, Y => n60);
   U91 : no210 port map( A => n62, B => state_0_port, Y => ds_ready_port);
   U92 : iv110 port map( A => state_1_port, Y => n62);
   n80 <= '1';
   n81 <= '0';

end synthesised;



