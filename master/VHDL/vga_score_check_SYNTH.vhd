
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of vga_score_check is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component na310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component ex210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component no310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component dfa11
      port( D, CK, R : in std_logic;  Q : out std_logic);
   end component;
   
   signal N15, N18, n14, n15_port, n16, n17, n18_port, n19, n20, n21, n22, n23,
      n24, n25, n26, n27, n28, n29, n30 : std_logic;

begin
   
   end_score_line_state_reg : dfa11 port map( D => N15, CK => clk, R => rst, Q 
                           => end_score_line_out);
   in_score_state_reg : dfa11 port map( D => N18, CK => clk, R => rst, Q => 
                           in_score_out);
   U18 : iv110 port map( A => n14, Y => N18);
   U19 : na310 port map( A => n15_port, B => pos_x_in(4), C => pos_x_in(5), Y 
                           => n14);
   U20 : no310 port map( A => n16, B => pos_x_in(7), C => n17, Y => n15_port);
   U21 : no210 port map( A => n18_port, B => n19, Y => n16);
   U22 : no310 port map( A => pos_x_in(1), B => pos_x_in(2), C => n20, Y => n19
                           );
   U23 : no310 port map( A => n21, B => n17, C => n22, Y => N15);
   U24 : iv110 port map( A => n23, Y => n22);
   U25 : no210 port map( A => pos_x_in(4), B => pos_x_in(5), Y => n23);
   U26 : na210 port map( A => n24, B => pos_x_in(6), Y => n17);
   U27 : no210 port map( A => pos_y_in(9), B => n25, Y => n24);
   U28 : ex210 port map( A => n26, B => pos_y_in(8), Y => n25);
   U29 : na210 port map( A => pos_y_in(7), B => n27, Y => n26);
   U30 : na210 port map( A => n28, B => n29, Y => n27);
   U31 : iv110 port map( A => pos_y_in(6), Y => n29);
   U32 : na210 port map( A => pos_y_in(5), B => pos_y_in(4), Y => n28);
   U33 : na310 port map( A => pos_x_in(0), B => n18_port, C => pos_x_in(7), Y 
                           => n21);
   U34 : iv110 port map( A => n30, Y => n18_port);
   U35 : na310 port map( A => pos_x_in(1), B => n20, C => pos_x_in(2), Y => n30
                           );
   U36 : iv110 port map( A => pos_x_in(3), Y => n20);

end synthesised;



