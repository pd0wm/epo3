library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture dff_arch of dff is
begin
	process (clk, rst)
	begin
		if (rst = '1') then
			do <= '0';
		elsif (clk'event and clk = '1') then
			do <= di;
		end if;
	end process;
end;