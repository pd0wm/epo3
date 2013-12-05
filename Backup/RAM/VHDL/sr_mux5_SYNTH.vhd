
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of mux5 is

   component mu210
      port( A, B, C, D, S1, S2 : in std_logic;  Y : out std_logic);
   end component;
   
   component mu111
      port( A, B, S : in std_logic;  Y : out std_logic);
   end component;
   
   signal n15 : std_logic;

begin
   
   U16 : mu111 port map( A => n15, B => di(4), S => s(2), Y => do);
   U17 : mu210 port map( A => di(0), B => di(2), C => di(1), D => di(3), S1 => 
                           s(1), S2 => s(0), Y => n15);

end synthesised;



