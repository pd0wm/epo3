library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.vga_params.all;

architecture fake_ram_arch of fake_ram is
begin
L1:	process(clk, rst)
	begin
		if (clk'event and clk = '1') then
			if (rst = '1') then
				ro_data_out <= '0';
			else
				ro_data_out <= ro_addr(0);
			end if;
		end if;
	end process;
end;


