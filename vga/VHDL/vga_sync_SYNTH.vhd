
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of vga_sync is

   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component no310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component ex210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component na310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component dfa11
      port( D, CK, R : in std_logic;  Q : out std_logic);
   end component;
   
   signal n1, n2, n9, n10, n11, n12, n13, n14, n15, n16, n17 : std_logic;

begin
   
   v_sync_state_reg : dfa11 port map( D => n1, CK => clk, R => rst, Q => 
                           v_sync_out);
   h_sync_state_reg : dfa11 port map( D => n2, CK => clk, R => rst, Q => 
                           h_sync_out);
   U11 : na310 port map( A => pos_x_in(7), B => pos_x_in(5), C => n9, Y => n2);
   U12 : no210 port map( A => pos_x_in(6), B => n10, Y => n9);
   U13 : no210 port map( A => n11, B => n12, Y => n10);
   U14 : ex210 port map( A => pos_x_in(3), B => pos_x_in(2), Y => n12);
   U15 : ex210 port map( A => pos_x_in(4), B => pos_x_in(2), Y => n11);
   U16 : na210 port map( A => n13, B => n14, Y => n1);
   U17 : no310 port map( A => n15, B => pos_y_in(3), C => pos_y_in(1), Y => n14
                           );
   U18 : na210 port map( A => pos_y_in(4), B => pos_y_in(2), Y => n15);
   U19 : no210 port map( A => n16, B => n17, Y => n13);
   U20 : na210 port map( A => pos_y_in(8), B => pos_y_in(7), Y => n17);
   U21 : na210 port map( A => pos_y_in(6), B => pos_y_in(5), Y => n16);

end synthesised;



