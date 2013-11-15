library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.typedef.all;

architecture ram_behav of ram is
	-- Memory
	signal ram, ram_new : mem;

	-- Addresses
	signal addr1, addr1_new : std_logic_vector(7 downto 0);
	
	signal addr2, addr2_new : std_logic_vector(7 downto 0);
	signal addr3, addr3_new : std_logic_vector(7 downto 0);
	signal addr4, addr4_new : std_logic_vector(7 downto 0);

	-- Data read signals for tri-state buffers
	signal dr1, dr2, dr3, dr4 : std_logic;
begin
	-- Combinatorial networks for address buffering
	main_addr_buf : process(addr)
	begin
		addr1_new <= addr;
	end process;

	ro1_addr_buf : process(ro1_addr)
	begin
		addr2_new <= ro1_addr;
	end process;
	
	ro2_addr_buf : process(ro2_addr)
	begin
		addr3_new <= ro2_addr;
	end process;
	
	ro3_addr_buf : process(ro3_addr)
	begin
		addr4_new <= ro3_addr;
	end process;

	-- Combinatorial networks for data outs
	main_out : process(dr1, write_enable)
	begin
		-- Tri-state buffer for interface 1
		if (write_enable = '0') then
			data <= dr1;
		else
			data <= 'Z';
		end if;
	end process;

	ro1_out_comb : process(dr2)
	begin
		ro1_out <= dr2;
	end process;
	
	ro2_out_comb : process(dr3)
	begin
		ro2_out <= dr3;
	end process;
	
	ro3_out_comb : process(dr4)
	begin
		ro3_out <= dr4;
	end process;
	
	-- Combinatorial networks for reading data
	main_read : process (addr1, ram)
	begin
		dr1 <= ram(to_integer(unsigned(addr1)));
	end process;
	
	ro1_read : process (addr2, ram)
	begin
		dr2 <= ram(to_integer(unsigned(addr2)));
	end process;
	
	ro2_read : process (addr3, ram)
	begin
		dr3 <= ram(to_integer(unsigned(addr3)));
	end process;
	
	ro3_read : process (addr4, ram)
	begin
		dr4 <= ram(to_integer(unsigned(addr4)));
	end process;
	
	-- State register
	regs : process (clk, rst)
	begin
		if (rst = '1') then
			ram <= (others => '0');
			ram_new <= (others => '0');
			
		elsif (clk'event and clk = '1') then
			addr1 <= addr1_new;
			addr2 <= addr2_new;
			addr3 <= addr3_new;
			addr4 <= addr4_new;

			-- Use the new address because the buffered address will be set now
			if (write_enable = '1') then
				ram(to_integer(unsigned(addr1_new))) <= data;
			end if;
		end if;
	end process;
end ram_behav;