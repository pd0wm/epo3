
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of rom_mux2 is

   component mu111
      port( A, B, S : in std_logic;  Y : out std_logic);
   end component;

begin
   
   U5 : mu111 port map( A => data_1, B => data_2, S => selector, Y => output);

end synthesised;



