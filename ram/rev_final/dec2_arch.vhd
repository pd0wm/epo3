library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture dec2_arch of dec2 is
begin
	process (s, di)
	begin
		do <= (others => '0');
	
		if (s = '0') then
			do(0) <= di;
		else
			do(1) <= di;
		end if;
	end process;
end;