
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of vga_sync is

   component ex210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component na310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component no310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component dfr11
      port( D, R, CK : in std_logic;  Q : out std_logic);
   end component;
   
   signal n4, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20 : std_logic;

begin
   
   v_sync_state_reg : dfr11 port map( D => n19, R => n20, CK => clk, Q => 
                           v_sync_out);
   h_sync_state_reg : dfr11 port map( D => n4, R => rst, CK => clk, Q => 
                           h_sync_out);
   U13 : iv110 port map( A => rst, Y => n19);
   U14 : no310 port map( A => n11, B => n12, C => n13, Y => n20);
   U15 : na210 port map( A => pos_y_in(8), B => pos_y_in(7), Y => n13);
   U16 : na210 port map( A => pos_y_in(6), B => pos_y_in(5), Y => n12);
   U17 : na310 port map( A => pos_y_in(4), B => pos_y_in(2), C => n14, Y => n11
                           );
   U18 : no310 port map( A => pos_y_in(1), B => pos_y_in(9), C => pos_y_in(3), 
                           Y => n14);
   U19 : na310 port map( A => pos_x_in(7), B => pos_x_in(5), C => n15, Y => n4)
                           ;
   U20 : no210 port map( A => pos_x_in(6), B => n16, Y => n15);
   U21 : no210 port map( A => n17, B => n18, Y => n16);
   U22 : ex210 port map( A => pos_x_in(3), B => pos_x_in(2), Y => n18);
   U23 : ex210 port map( A => pos_x_in(4), B => pos_x_in(2), Y => n17);

end synthesised;



