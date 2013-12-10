
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of vga_field_check is

   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component iv110
      port( A : in std_logic;  Y : out std_logic);
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
   
   component dfr11
      port( D, R, CK : in std_logic;  Q : out std_logic);
   end component;
   
   signal N15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
      n29, n30, n31, n32, n33, n34 : std_logic;

begin
   
   end_field_line_state_reg : dfr11 port map( D => N15, R => rst, CK => clk, Q 
                           => end_field_line_out);
   in_field_state_reg : dfr11 port map( D => n33, R => n34, CK => clk, Q => 
                           in_field_out);
   U20 : iv110 port map( A => rst, Y => n33);
   U21 : na310 port map( A => n16, B => n17, C => n18, Y => n34);
   U22 : no310 port map( A => pos_x_in(6), B => pos_y_in(9), C => pos_x_in(7), 
                           Y => n18);
   U23 : iv110 port map( A => n19, Y => n17);
   U24 : no210 port map( A => pos_x_in(4), B => pos_x_in(5), Y => n19);
   U25 : no210 port map( A => n20, B => n21, Y => n16);
   U26 : iv110 port map( A => n22, Y => n21);
   U27 : no310 port map( A => n23, B => n24, C => n25, Y => N15);
   U28 : na210 port map( A => pos_x_in(7), B => pos_x_in(6), Y => n25);
   U29 : na310 port map( A => pos_x_in(1), B => pos_x_in(0), C => pos_x_in(2), 
                           Y => n24);
   U30 : na310 port map( A => n26, B => n22, C => n27, Y => n23);
   U31 : no310 port map( A => pos_x_in(4), B => pos_y_in(9), C => pos_x_in(5), 
                           Y => n27);
   U32 : na310 port map( A => pos_y_in(7), B => n28, C => pos_y_in(8), Y => n22
                           );
   U33 : na210 port map( A => n29, B => n30, Y => n28);
   U34 : no210 port map( A => pos_x_in(3), B => n20, Y => n26);
   U35 : iv110 port map( A => n31, Y => n20);
   U36 : na310 port map( A => n29, B => n30, C => n32, Y => n31);
   U37 : no210 port map( A => pos_y_in(8), B => pos_y_in(7), Y => n32);
   U38 : iv110 port map( A => pos_y_in(6), Y => n30);
   U39 : na210 port map( A => pos_y_in(5), B => pos_y_in(4), Y => n29);

end synthesised;



