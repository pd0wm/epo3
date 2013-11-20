library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture sramdp32_behav of sramdp32 is
	type mem is array (0 to 2 ** 5 - 1) of std_logic;
	signal mem_block : mem;
begin
	process(clk, rst) is
	begin
		if (rst = '1') then
			mem_block <= (others => '0');
			mem_block(16) <= '1';
			mem_block(8) <= '1';
		elsif (clk'event and clk = '1') then
			-- R/W interface read
			if (rw_re = '1') then
				rw_data_out <= mem_block(to_integer(unsigned(rw_addr)));
			else
				rw_data_out <= 'Z';
			end if;

			-- RO interface read
			if (ro_re = '1') then
				ro_data_out <= mem_block(to_integer(unsigned(ro_addr)));
			else
				ro_data_out <= 'Z';
			end if;
			
			-- R/W interface write
			if (rw_we = '1') then
				mem_block(to_integer(unsigned(rw_addr))) <= rw_data_in;
				
				rw_data_out <= rw_data_in;
				ro_data_out <= rw_data_in;
			end if;
		end if;
	end process;
end;