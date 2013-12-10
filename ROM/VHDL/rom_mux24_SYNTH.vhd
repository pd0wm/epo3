
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of rom_mux24 is

   component rom_mux2
      port( data_1, data_2, selector : in std_logic;  output : out std_logic);
   end component;

begin
   
   bit1 : rom_mux2 port map( data_1 => data_1(0), data_2 => data_2(0), selector
                           => selector, output => output(0));
   bit2 : rom_mux2 port map( data_1 => data_1(1), data_2 => data_2(1), selector
                           => selector, output => output(1));
   bit3 : rom_mux2 port map( data_1 => data_1(2), data_2 => data_2(2), selector
                           => selector, output => output(2));
   bit4 : rom_mux2 port map( data_1 => data_1(3), data_2 => data_2(3), selector
                           => selector, output => output(3));

end synthesised;



