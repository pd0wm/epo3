library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture sramdp32_regs_arch of sramdp32_regs is
begin
	process(clk, rst)
	begin
		if (rst = '1') then
			mem_out <= (others => '0');
		elsif (clk'event and clk = '1') then
			mem_out <= mem_in;	
		end if;
	end process;
end sramdp32_regs_arch;