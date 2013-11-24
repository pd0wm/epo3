library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture mp2_arch of mp2 is
begin
	process(s, di1, di2)
	begin
		if (s = '0') then
			do <= di1;
		else
			do <= di2;
		end if;
	end process;
end;