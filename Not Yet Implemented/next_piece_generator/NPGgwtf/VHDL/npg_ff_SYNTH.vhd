
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of npg_ff is

   component dfr11
      port( D, R, CK : in std_logic;  Q : out std_logic);
   end component;

begin
   
   q_reg : dfr11 port map( D => d, R => rst, CK => clk, Q => q);

end synthesised;



