library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of tri_buff is
begin

outp <= (others => 'Z')
when (sel = '0')
else inp;

end behaviour;








