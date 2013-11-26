library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture ram_behav of ram_simple is
	type mem is array (0 to 2 ** 8 - 1) of std_logic;

	-- Memory
	signal ram, ram_new : mem;

	-- Addresses
	signal addr1, addr1_new : std_logic_vector(7 downto 0);

	signal addr2, addr2_new : std_logic_vector(7 downto 0);

	-- Data read signals for tri-state buffers
	signal dr1, dr2 : std_logic;
begin
	-- Combinatorial networks for address buffering
	main_addr_buf : process(rw_addr)
	begin
		addr1_new <= rw_addr;
	end process;

	ro1_addr_buf : process(ro_addr)
	begin
		addr2_new <= ro_addr;
	end process;

	-- Combinatorial networks for data outs
	main_out : process(dr1, rw_write_enable)
	begin
		-- Tri-state buffer for interface 1
		if (rw_write_enable = '0') then
			rw_data <= dr1;
		else
			rw_data <= 'Z';
		end if;
	end process;

	ro1_out_comb : process(dr2)
	begin
		ro_out <= dr2;
	end process;

	-- Combinatorial networks for reading data
	main_read : process(addr1, ram)
	begin
		dr1 <= ram(to_integer(unsigned(addr1)));
	end process;

	ro_read : process(addr2, ram)
	begin
		dr2 <= ram(to_integer(unsigned(addr2)));
	end process;

	-- State register
	regs : process(clk, rst)
	begin
		if (rst = '1') then
			ram     <= (others => '0');
			ram_new <= (others => '0');

		elsif (clk'event and clk = '1') then
			addr1 <= addr1_new;
			addr2 <= addr2_new;

			-- Use the new address because the buffered address will be set now
			if (rw_write_enable = '1') then
				ram(to_integer(unsigned(addr1_new))) <= rw_data;
			end if;
		end if;
	end process;
end ram_behav;