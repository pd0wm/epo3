library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture tri_arch of tri is
begin
	process (di, e)
	begin
		if (e = '1') then
			do <= di;
		else
			do <= 'Z';
		end if;
	end process;
end;