library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.mem.all;

architecture sramdp32_comb_arch of sramdp32_comb is
begin
	process (mem_in, rw_addr, ro_addr, rw_data_in, rw_we)
	begin
		rw_data_out <= mem_in(to_integer(unsigned(rw_addr)));
		ro_data_out <= mem_in(to_integer(unsigned(ro_addr)));
		
		mem_out <= mem_in;

		if (rw_we = '1') then
			mem_out(to_integer(unsigned(rw_addr))) <= rw_data_in;
			
			rw_data_out <= rw_data_in;
			
			if (rw_addr = ro_addr) then
				ro_data_out <= rw_data_in;
			end if;
		end if;
	end process;
end sramdp32_comb_arch;