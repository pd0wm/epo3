
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of demux4_inv is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component na310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   signal n3, n4 : std_logic;

begin
   
   U8 : na310 port map( A => s(0), B => di, C => s(1), Y => do(3));
   U9 : na310 port map( A => di, B => n3, C => s(1), Y => do(2));
   U10 : na310 port map( A => di, B => n4, C => s(0), Y => do(1));
   U11 : na310 port map( A => n3, B => n4, C => di, Y => do(0));
   U12 : iv110 port map( A => s(1), Y => n4);
   U13 : iv110 port map( A => s(0), Y => n3);

end synthesised;



