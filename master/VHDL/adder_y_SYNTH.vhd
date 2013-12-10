
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of adder_y is

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
   
   signal n3, n4, n5, n6, n7, n8, n9, n10, n11 : std_logic;

begin
   
   U3 : iv110 port map( A => n3, Y => y_out(4));
   U4 : na310 port map( A => y_in(3), B => n4, C => y_in(2), Y => n3);
   U5 : iv110 port map( A => n5, Y => y_out(3));
   U6 : ex210 port map( A => y_in(3), B => n6, Y => n5);
   U7 : na210 port map( A => y_in(2), B => n4, Y => n6);
   U8 : ex210 port map( A => n4, B => y_in(2), Y => y_out(2));
   U9 : na210 port map( A => n7, B => n8, Y => n4);
   U10 : na310 port map( A => rom_in(0), B => n9, C => y_in(0), Y => n8);
   U11 : na210 port map( A => rom_in(1), B => y_in(1), Y => n7);
   U12 : iv110 port map( A => n10, Y => y_out(1));
   U13 : ex210 port map( A => n11, B => n9, Y => n10);
   U14 : ex210 port map( A => rom_in(1), B => y_in(1), Y => n9);
   U15 : na210 port map( A => rom_in(0), B => y_in(0), Y => n11);
   U16 : ex210 port map( A => y_in(0), B => rom_in(0), Y => y_out(0));

end synthesised;



