library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture cs_defset2_behav of cs_defset2 is
begin
	process(en)
	begin
		if (en = '1') then
			out1 <= '0';
			out2 <= '0';
		else
			out1 <= 'Z';
			out2 <= 'Z';
		end if;
	end process;
end architecture;