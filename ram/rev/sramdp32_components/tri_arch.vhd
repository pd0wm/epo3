library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture sramdp32_tri_arch of sramdp32_tri is
begin
	process (clk, rst)
	begin
		if (rst = '1') then
			data_out <= '0';
		elsif (clk'event and clk = '1') then
			if (enable = '1') then
				data_out <= data_in;
			else
				data_out <= 'Z';
			end if;
		end if;
	end process;
end sramdp32_tri_arch;