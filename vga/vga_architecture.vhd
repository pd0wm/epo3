library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.typedef.all;

-- Interface 1
-- Read/write line and address line
-- data				   addr

-- Interface 2
-- Read line and address line
-- vga_out       vga_addr

-- Write enabled: write_enable
-- Clock: clk
-- Reset: rst

architecture ram_behav of ram is
	-- Memory
	signal ram, ram_new : mem;

	-- Addresses
	signal addr1, addr1_new : std_logic_vector(7 downto 0);
	signal addr2, addr2_new : std_logic_vector(7 downto 0);

	-- Data read signals for tri-state buffers
	signal dr1, dr2 : std_logic;
begin
	-- Debugging
	ramdata <= ram;

	-- Combinatorial networks for address buffering
	addr1b : process(addr)
	begin
		addr1_new <= addr;
	end process;

	addr2b : process(vga_addr)
	begin
		addr2_new <= vga_addr;
	end process;

	-- Combinatorial networks for data outs
	out1_comb : process(dr1, write_enable)
	begin
		-- Tri-state buffer for interface 1
		if (write_enable = '0') then
			data <= dr1;
		else
			data <= 'Z';
		end if;
	end process;

	out2_comb : process(dr2)
	begin
		vga_out <= dr2;
	end process;
	
	-- Combinatorial networks for reading data
	read1_comb : process (addr1, ram)
	begin
		dr1 <= ram(to_integer(unsigned(addr1)));
	end process;
	
	read2_comb : process (addr2, ram)
	begin
		dr2 <= ram(to_integer(unsigned(addr2)));
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

			-- Use the new address because the buffered address will be set now
			if (write_enable = '1') then
				ram(to_integer(unsigned(addr1_new))) <= data;
			end if;
		end if;
	end process;
end ram_behav;