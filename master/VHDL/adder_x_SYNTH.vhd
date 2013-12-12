
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of adder_x is

   component ex210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component na310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component no310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   signal n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33 : 
      std_logic;

begin
   
   U19 : na210 port map( A => n22, B => n23, Y => x_out(3));
   U20 : na210 port map( A => n24, B => n25, Y => n23);
   U21 : na210 port map( A => x(2), B => n26, Y => n22);
   U22 : ex210 port map( A => n25, B => n24, Y => x_out(2));
   U23 : no310 port map( A => n27, B => rom_data(3), C => n28, Y => n24);
   U24 : iv110 port map( A => rom_data(2), Y => n28);
   U25 : iv110 port map( A => next_piece, Y => n27);
   U26 : ex210 port map( A => n26, B => x(2), Y => n25);
   U27 : na210 port map( A => n29, B => n30, Y => n26);
   U28 : na310 port map( A => rom_data(0), B => n31, C => x(0), Y => n30);
   U29 : na210 port map( A => rom_data(1), B => x(1), Y => n29);
   U30 : iv110 port map( A => n32, Y => x_out(1));
   U31 : ex210 port map( A => n33, B => n31, Y => n32);
   U32 : ex210 port map( A => rom_data(1), B => x(1), Y => n31);
   U33 : na210 port map( A => rom_data(0), B => x(0), Y => n33);
   U34 : ex210 port map( A => x(0), B => rom_data(0), Y => x_out(0));

end synthesised;



