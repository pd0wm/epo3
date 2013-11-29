library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture ram_simple_arch of ram_simple is
	type mem is array (0 to 2 ** 7 - 1) of std_logic;

	-- Memory
	signal ram: mem;


begin
	-- State register
	regs : process(clk, rst)
	begin
		if (rst = '1') then
			ram     <= (others => '0');

		elsif (clk'event and clk = '1') then
			rw_data_out <= ram(to_integer(unsigned(rw_addr)));
			ro_data_out <= ram(to_integer(unsigned(ro_addr)));

			-- Use the new address because the buffered address will be set now
			if (rw_write_enable = '1') then
				ram(to_integer(unsigned(rw_addr))) <= rw_data_in;
			end if;
			
		
		end if;
	end process;
end ram_simple_arch;


