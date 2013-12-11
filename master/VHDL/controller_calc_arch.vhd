library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.vga_params.all;

architecture controller_calc_arch of controller_calc is

begin
	process(clk, rst)
	begin
		if (rising_edge(clk)) then
			if (rst = '1') then
				null;
			else
				null;
			end if;
		end if;


	end process;

end;
