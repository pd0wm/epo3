
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of de_piece is

   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component mu111
      port( A, B, S : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component tinv10
      port( A, E : in std_logic;  Y : out std_logic);
   end component;
   
   component dfr11
      port( D, R, CK : in std_logic;  Q : out std_logic);
   end component;
   
   signal state_1_port, state_0_port, current_block_1_port, 
      current_block_0_port, new_state_1_port, new_state_0_port, 
      new_current_block_1_port, new_current_block_0_port, n16, n17, n18, n19, 
      n20, n21, n22, n23, n24, n25, n26, write_port, lut_start_port, n30, n31, 
      n32, n33, n34, n35, n36, n37, n38, n39, n40 : std_logic;

begin
   lut_start <= lut_start_port;
   write <= write_port;
   
   state_reg_0_inst : dfr11 port map( D => new_state_0_port, R => rst, CK => 
                           clk, Q => state_0_port);
   state_reg_1_inst : dfr11 port map( D => new_state_1_port, R => rst, CK => 
                           clk, Q => state_1_port);
   current_block_reg_0_inst : dfr11 port map( D => new_current_block_0_port, R 
                           => rst, CK => clk, Q => current_block_0_port);
   current_block_reg_1_inst : dfr11 port map( D => new_current_block_1_port, R 
                           => rst, CK => clk, Q => current_block_1_port);
   data_tri : tinv10 port map( A => n26, E => write_port, Y => data);
   mask_select_tri_0_inst : tinv10 port map( A => n25, E => lut_start_port, Y 
                           => mask_select(0));
   mask_select_tri_1_inst : tinv10 port map( A => n24, E => lut_start_port, Y 
                           => mask_select(1));
   addr_tri_0_inst : tinv10 port map( A => n23, E => write_port, Y => addr(0));
   addr_tri_1_inst : tinv10 port map( A => n22, E => write_port, Y => addr(1));
   addr_tri_2_inst : tinv10 port map( A => n21, E => write_port, Y => addr(2));
   addr_tri_3_inst : tinv10 port map( A => n20, E => write_port, Y => addr(3));
   addr_tri_4_inst : tinv10 port map( A => n19, E => write_port, Y => addr(4));
   addr_tri_5_inst : tinv10 port map( A => n18, E => write_port, Y => addr(5));
   addr_tri_6_inst : tinv10 port map( A => n17, E => write_port, Y => addr(6));
   addr_tri_7_inst : tinv10 port map( A => n16, E => write_port, Y => addr(7));
   U36 : no210 port map( A => state_0_port, B => n30, Y => ready);
   U37 : na210 port map( A => n31, B => n32, Y => new_state_1_port);
   U38 : mu111 port map( A => n33, B => lut_ready, S => state_0_port, Y => n31)
                           ;
   U39 : iv110 port map( A => start, Y => n33);
   U40 : na210 port map( A => n34, B => n35, Y => new_state_0_port);
   U41 : iv110 port map( A => n36, Y => n35);
   U42 : mu111 port map( A => n37, B => current_block_1_port, S => state_0_port
                           , Y => n34);
   U43 : na210 port map( A => start, B => n30, Y => n37);
   U44 : mu111 port map( A => n38, B => n36, S => current_block_1_port, Y => 
                           new_current_block_1_port);
   U45 : na210 port map( A => n39, B => n40, Y => n36);
   U46 : na210 port map( A => state_0_port, B => n25, Y => n40);
   U47 : no210 port map( A => n25, B => n32, Y => n38);
   U48 : mu111 port map( A => write_port, B => lut_start_port, S => 
                           current_block_0_port, Y => new_current_block_0_port)
                           ;
   U49 : iv110 port map( A => n32, Y => write_port);
   U50 : na210 port map( A => state_0_port, B => n30, Y => n32);
   U51 : iv110 port map( A => state_1_port, Y => n30);
   U52 : iv110 port map( A => draw_erase, Y => n26);
   U53 : iv110 port map( A => current_block_0_port, Y => n25);
   U54 : iv110 port map( A => current_block_1_port, Y => n24);
   U55 : iv110 port map( A => mask(0), Y => n23);
   U56 : iv110 port map( A => mask(1), Y => n22);
   U57 : iv110 port map( A => mask(2), Y => n21);
   U58 : iv110 port map( A => mask(3), Y => n20);
   U59 : iv110 port map( A => mask(4), Y => n19);
   U60 : iv110 port map( A => mask(5), Y => n18);
   U61 : iv110 port map( A => mask(6), Y => n17);
   U62 : iv110 port map( A => mask(7), Y => n16);
   U63 : iv110 port map( A => n39, Y => lut_start_port);
   U64 : na210 port map( A => state_1_port, B => state_0_port, Y => n39);

end synthesised;



