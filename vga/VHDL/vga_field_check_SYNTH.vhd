
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of vga_field_check is

   component na310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component no310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component ex210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component dfa11
      port( D, CK, R : in std_logic;  Q : out std_logic);
   end component;
   
   signal N15, N18, n14, n15_port, n16, n17, n18_port, n19, n20, n21, n22, n23,
      n24, n25, n26, n27, n28, n29 : std_logic;

begin
   
   end_field_line_state_reg : dfa11 port map( D => N15, CK => clk, R => rst, Q 
                           => end_field_line_out);
   in_field_state_reg : dfa11 port map( D => N18, CK => clk, R => rst, Q => 
                           in_field_out);
   U18 : iv110 port map( A => n14, Y => N18);
   U19 : na310 port map( A => n15_port, B => n16, C => n17, Y => n14);
   U20 : ex210 port map( A => n18_port, B => pos_x_in(5), Y => n17);
   U21 : iv110 port map( A => n19, Y => n18_port);
   U22 : na210 port map( A => pos_x_in(4), B => pos_x_in(3), Y => n19);
   U23 : no310 port map( A => pos_x_in(6), B => pos_x_in(7), C => n20, Y => 
                           n15_port);
   U24 : no310 port map( A => n21, B => n22, C => n23, Y => N15);
   U25 : na210 port map( A => pos_x_in(7), B => pos_x_in(6), Y => n23);
   U26 : na310 port map( A => pos_x_in(1), B => pos_x_in(0), C => pos_x_in(2), 
                           Y => n22);
   U27 : na310 port map( A => n16, B => n24, C => n25, Y => n21);
   U28 : no310 port map( A => pos_x_in(3), B => pos_x_in(5), C => pos_x_in(4), 
                           Y => n25);
   U29 : iv110 port map( A => n20, Y => n24);
   U30 : no310 port map( A => pos_y_in(7), B => pos_y_in(8), C => n26, Y => n20
                           );
   U31 : na210 port map( A => pos_y_in(8), B => n27, Y => n16);
   U32 : iv110 port map( A => n28, Y => n27);
   U33 : no210 port map( A => n26, B => pos_y_in(7), Y => n28);
   U34 : iv110 port map( A => n29, Y => n26);
   U35 : na310 port map( A => pos_y_in(5), B => pos_y_in(4), C => pos_y_in(6), 
                           Y => n29);

end synthesised;



