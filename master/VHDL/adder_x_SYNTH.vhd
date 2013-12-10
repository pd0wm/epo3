
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
   
   signal n10, n11, n12, n13, n14, n15, n16 : std_logic;

begin
   
   U12 : iv110 port map( A => n10, Y => x_out(3));
   U13 : na210 port map( A => n11, B => x_in(2), Y => n10);
   U14 : ex210 port map( A => n11, B => x_in(2), Y => x_out(2));
   U15 : na210 port map( A => n12, B => n13, Y => n11);
   U16 : na310 port map( A => rom_in(0), B => n14, C => x_in(0), Y => n13);
   U17 : na210 port map( A => rom_in(1), B => x_in(1), Y => n12);
   U18 : iv110 port map( A => n15, Y => x_out(1));
   U19 : ex210 port map( A => n16, B => n14, Y => n15);
   U20 : ex210 port map( A => rom_in(1), B => x_in(1), Y => n14);
   U21 : na210 port map( A => rom_in(0), B => x_in(0), Y => n16);
   U22 : ex210 port map( A => x_in(0), B => rom_in(0), Y => x_out(0));

end synthesised;



