
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of rom_mux44 is

   component rom_mux4
      port( input_1, input_2, input_3, input_4 : in std_logic;  selector : in 
            std_logic_vector (1 downto 0);  output : out std_logic);
   end component;

begin
   
   bit1 : rom_mux4 port map( input_1 => data_1(0), input_2 => data_2(0), 
                           input_3 => data_3(0), input_4 => data_4(0), 
                           selector(1) => selector(1), selector(0) => 
                           selector(0), output => output(0));
   bit2 : rom_mux4 port map( input_1 => data_1(1), input_2 => data_2(1), 
                           input_3 => data_3(1), input_4 => data_4(1), 
                           selector(1) => selector(1), selector(0) => 
                           selector(0), output => output(1));
   bit3 : rom_mux4 port map( input_1 => data_1(2), input_2 => data_2(2), 
                           input_3 => data_3(2), input_4 => data_4(2), 
                           selector(1) => selector(1), selector(0) => 
                           selector(0), output => output(2));
   bit4 : rom_mux4 port map( input_1 => data_1(3), input_2 => data_2(3), 
                           input_3 => data_3(3), input_4 => data_4(3), 
                           selector(1) => selector(1), selector(0) => 
                           selector(0), output => output(3));

end synthesised;



