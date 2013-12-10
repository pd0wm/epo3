
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of vga_counter_resets is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component na310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component no310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   signal n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
      n31 : std_logic;

begin
   
   U20 : no210 port map( A => n17, B => n18, Y => pos_y_reset);
   U21 : no210 port map( A => n19, B => n18, Y => pos_y_enable);
   U22 : iv110 port map( A => n17, Y => n19);
   U23 : na310 port map( A => n20, B => n21, C => n22, Y => n17);
   U24 : no210 port map( A => n23, B => n24, Y => n22);
   U25 : na210 port map( A => pos_y(9), B => pos_y(4), Y => n24);
   U26 : na310 port map( A => pos_y(1), B => n25, C => pos_y(2), Y => n23);
   U27 : iv110 port map( A => pos_y(0), Y => n25);
   U28 : no310 port map( A => pos_y(6), B => pos_y(8), C => pos_y(7), Y => n21)
                           ;
   U29 : no210 port map( A => pos_y(5), B => pos_y(3), Y => n20);
   U30 : iv110 port map( A => n18, Y => pos_x_reset);
   U31 : na310 port map( A => n26, B => n27, C => n28, Y => n18);
   U32 : no210 port map( A => n29, B => n30, Y => n28);
   U33 : na210 port map( A => pos_x(7), B => pos_x(6), Y => n30);
   U34 : na210 port map( A => pos_x(2), B => pos_x(1), Y => n29);
   U35 : no210 port map( A => pos_x(5), B => pos_x(4), Y => n27);
   U36 : no210 port map( A => pos_x(3), B => n31, Y => n26);
   U37 : iv110 port map( A => pos_x(0), Y => n31);

end synthesised;



