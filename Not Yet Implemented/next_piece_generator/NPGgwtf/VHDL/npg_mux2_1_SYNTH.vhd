
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of npg_mux2_1 is

   component mu111
      port( A, B, S : in std_logic;  Y : out std_logic);
   end component;

begin
   
   U5 : mu111 port map( A => in1, B => in2, S => sel, Y => out1);

end synthesised;



