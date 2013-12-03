
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of rom_mux4 is

   component mu210
      port( A, B, C, D, S1, S2 : in std_logic;  Y : out std_logic);
   end component;

begin
   
   U12 : mu210 port map( A => input_1, B => input_3, C => input_2, D => input_4
                           , S1 => selector(1), S2 => selector(0), Y => output)
                           ;

end synthesised;



