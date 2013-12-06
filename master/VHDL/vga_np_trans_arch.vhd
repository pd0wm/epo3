library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.vga_params.all;

architecture vga_np_trans_arch of vga_np_trans is
	signal counter_state, counter_new   : std_logic_vector(np_counter_block_width_len-1 downto 0);
	signal mem_addr_uncompressed : std_logic_vector(mem_addr_len - 1 downto 0);
	signal mem_addr_enable, mem_addr_reset : std_logic;
	
	
	component vga_counter_8bitset
		port(clk     : in  std_logic;
			 rst     : in  std_logic;
			 rst_ext : in  std_logic;
			 en      : in  std_logic;
			 set     : in  std_logic;
			 di      : in  std_logic_vector(7 downto 0);
			 val     : out std_logic_vector(7 downto 0));
	end component vga_counter_8bitset;
begin
	mem_addr_uncompressed <= '1' & '0' & '0' & '0' & mem_addr_reset_in & '0' & '0'; -- Bit shift and correction for next piece

	mem_addr_counter : vga_counter_8bitset
		port map(clk     => clk,
			     rst     => rst,
			     rst_ext => '0',
			     en      => mem_addr_enable,
			     set     => mem_addr_reset,
			     di      => mem_addr_uncompressed,
			     val     => mem_addr_out);

	process (counter_state, in_np_in, new_line_in, new_frame_in)
	begin
		counter_new <= counter_state;
		mem_addr_enable <= '0';
		mem_addr_reset <= '0';
	
		if (in_np_in = '1') then
			counter_new <= std_logic_vector(unsigned(counter_state) + 1);
			 
			 if (unsigned(counter_state) = np_block_width - 1) then
			 	counter_new <= (others => '0');
			 
			 	mem_addr_enable <= '1';
			 end if;
		end if;
		
		if (new_line_in = '1' or new_frame_in = '1') then
			counter_new <= (others => '0');
			mem_addr_reset <= '1';
		end if;
	end process;

	process(clk, rst)
	begin
		if (rst = '1') then
			counter_state  <= (others => '0');
		elsif (clk'event and clk = '1') then
			counter_state <= counter_new;
		end if;
	end process;
end;