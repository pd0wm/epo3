library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture sramdp_comb_arch of sramdp_comb is
begin
	process(rw_addr, ro_addr, rw_data_in, rw_we, mem_in)
		variable rw_addr_int, ro_addr_int : integer range 0 to 7;

	begin
		rw_addr_int := to_integer(unsigned(rw_addr));
		ro_addr_int := to_integer(unsigned(ro_addr));

		rw_data_out <= mem_in(rw_addr_int);
		ro_data_out <= mem_in(ro_addr_int);
		
		mem_out <= mem_in;

		if (rw_we = '1') then
			mem_out(rw_addr_int) <= rw_data_in;

			rw_data_out <= rw_data_in;

			if (rw_addr = ro_addr) then
				ro_data_out <= rw_data_in;
			end if;

		end if;
	end process;
end sramdp_comb_arch;