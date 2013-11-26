library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture ram_simple_arch of ram_simple is
	type mem is array (0 to 2 ** 7 - 1) of std_logic;

	-- Memory
	signal ram: mem;

	-- Addresses
	signal rw_addrs, rw_addrs_new : std_logic_vector(6 downto 0);
	signal ro_addrs, ro_addrs_new : std_logic_vector(6 downto 0);


begin
	-- Combinatorial networks for data outs
	rw_out_lbl : process(rw_addrs)
	begin
		rw_data_out <= ram(to_integer(unsigned(rw_addrs)));
	end process;

	ro_out_lbl : process(ro_addrs)
	begin
		ro_data_out <= ram(to_integer(unsigned(ro_addrs)));
	end process;
	
	rw_addrs_lbl : process(ro_addrs)
	begin
		rw_addrs_new <= rw_addr;
	end process;
	
	ro_addrs_lbl : process(ro_addrs)
	begin
		ro_addrs_new <= ro_addr;
	end process;


	-- State register
	regs : process(clk, rst)
	begin
		if (rst = '1') then
			ram     <= (others => '0');

		elsif (clk'event and clk = '1') then
			ro_addrs <= ro_addrs_new;
			rw_addrs <= rw_addrs_new;

			-- Use the new address because the buffered address will be set now
			if (rw_write_enable = '1') then
				ram(to_integer(unsigned(rw_addrs_new))) <= rw_data_in;
			end if;
			
		
		end if;
	end process;
end ram_simple_arch;


