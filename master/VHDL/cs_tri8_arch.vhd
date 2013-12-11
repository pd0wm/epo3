library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture cs_tri8_behav of cs_tri8 is
begin
	process (e, i)
	begin
		if (e = '1') then
			o <= i;
		else
			o <= (others => 'Z');
		end if;
	end process;
end architecture;