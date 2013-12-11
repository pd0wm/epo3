
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of adder_x is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component ex210
      port( A, B : in std_logic;  Y : out std_logic);
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
   
   signal n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32 : 
      std_logic;

begin
   
   U19 : na210 port map( A => n21, B => n22, Y => x_out(3));
   U20 : na210 port map( A => n23, B => n24, Y => n22);
   U21 : na210 port map( A => x(2), B => n25, Y => n21);
   U22 : ex210 port map( A => n24, B => n23, Y => x_out(2));
   U23 : no310 port map( A => n26, B => rom_data(1), C => n27, Y => n23);
   U24 : iv110 port map( A => next_piece, Y => n26);
   U25 : ex210 port map( A => n25, B => x(2), Y => n24);
   U26 : na210 port map( A => n28, B => n29, Y => n25);
   U27 : na310 port map( A => rom_data(0), B => n30, C => x(0), Y => n29);
   U28 : na210 port map( A => rom_data(1), B => x(1), Y => n28);
   U29 : ex210 port map( A => n31, B => n30, Y => x_out(1));
   U30 : ex210 port map( A => rom_data(1), B => x(1), Y => n30);
   U31 : no210 port map( A => n27, B => n32, Y => n31);
   U32 : ex210 port map( A => n32, B => n27, Y => x_out(0));
   U33 : iv110 port map( A => rom_data(0), Y => n27);
   U34 : iv110 port map( A => x(0), Y => n32);

end synthesised;



