library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture sramdp_whole_mp_behav of sramdp_whole_mp is
begin

	process(ro_subaddr, rw_subaddr, rw_we)
		variable ro_mod, rw_mod : integer range 0 to 2**5-1;
	begin
		ro_mod := to_integer(unsigned(ro_subaddr));
		rw_mod := to_integer(unsigned(rw_subaddr));

		-- RO interface
		ro_re_i <= (others => '0');
		ro_re_i(ro_mod) <= '1';

		-- R/W interface
		rw_we_i <= (others => '0');
		rw_we_i(rw_mod) <= rw_we;

		rw_re_i <= (others => '0');
		rw_re_i(rw_mod) <= '1';
	end process;
end sramdp_whole_mp_behav;