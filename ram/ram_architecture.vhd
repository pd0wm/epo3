library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

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
	type mem is array (0 to 7) of std_logic;
	signal ram, ram_new : mem;

	-- Addresses
	signal addr1, addr1_new : std_logic_vector(7 downto 0);
	signal addr2, addr2_new : std_logic_vector(7 downto 0);

	-- Data read signals for tri-state buffers
	signal dr1, dr2 : std_logic;
begin
	-- Combinatorial networks for address buffering
	addr1_new_comb : process(data)
	begin
		addr1_new <= addr;
	end process;

	addr2_new_comb : process(vga_addr)
	begin
		addr2_new <= vga_addr;
	end process;

	-- Combinatorial networks for data outs
	out1_comb : process(dr1, write_enable)
	begin
		-- Tri-state buffer for interface 1
		data <= dr1 when (write_enable = '0') else (others => 'Z');
	end process;

	out2_comb : process(dr2)
	begin
		vga_out <= dr2;
	end process;

	-- Combinatorial network for writing data from interface 1
	data_write_comb : process(addr1_new, data, write_enable)
	begin
		ram_new <= ram;
		if (write_enable = '1') then
			ram_new(to_integer(unsigned(addr1_new))) <= data;
		end if;
	end process;
	
	-- Combinatorial networks for reading data
	read1_comb : process (addr1)
	begin
		dr1 <= ram(to_integer(unsigned(addr1_new)));
	end process;
	
	read2_comb : process (addr2)
	begin
		dr2 <= ram(to_integer(unsigned(addr2_new)));
	end process;
	
	-- State register
	regs : process (clk, rst)
	begin
		if (rst = '1') then
			ram <= (others => '0');
			ram_new <= (others => '0');
		elsif (clk'event and clk = '1') then
			ram <= ram_new;
			addr1 <= addr1_new;
			addr2 <= addr2_new;
		end if;
	end process;
end ram_behav;