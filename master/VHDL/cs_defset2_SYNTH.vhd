
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of cs_defset2 is

   component tinv10
      port( A, E : in std_logic;  Y : out std_logic);
   end component;
   
   signal n1 : std_logic;

begin
   
   out1_tri : tinv10 port map( A => n1, E => en, Y => out1);
   out2_tri : tinv10 port map( A => n1, E => en, Y => out2);
   n1 <= '1';

end synthesised;



