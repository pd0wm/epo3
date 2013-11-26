library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.vga_params.all;

architecture depiece_simple_arch of depiece_simple is
begin
L1:	process(clk, rst)
	begin
		if (clk'event and clk = '1') then
			if (rst = '1') then
				write <= '0';
				addr <= (others => '0');
				data_out <= '0';
			else
				addr <= "00000001";
				data_out <= '1';
				write <= '1';			
			end if;
		end if;
	end process;
end;
