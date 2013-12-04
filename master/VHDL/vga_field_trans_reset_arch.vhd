library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.vga_params.all;

-- Important:
-- THIS MODULE ASSUMES THE MEMORY ADDRESS LENGTH IS 8 AND HEIGHT IS 16 (4 bits)

architecture vga_field_trans_reset_arch of vga_field_trans_reset is
	signal counter_state, counter_new   : std_logic_vector(field_counter_block_height_len - 1 downto 0);
	
	signal mem_addr_reset, mem_addr_enable : std_logic;

	component vga_counter_4bit
		port(clk     : in  std_logic;
			 rst     : in  std_logic;
			 rst_ext : in  std_logic;
			 en      : in  std_logic;
			 val     : out std_logic_vector(3 downto 0));
	end component vga_counter_4bit;
begin

	mem_addr_counter : vga_counter_4bit
		port map(clk     => clk,
			     rst     => rst,
			     rst_ext => mem_addr_reset,
			     en      => mem_addr_enable,
			     val     => mem_addr_reset_out);

	process(counter_state, end_field_line_in, end_frame_in)
	begin
		counter_new     <= counter_state;
		mem_addr_enable <= '0';
		mem_addr_reset  <= '0';

		if (end_field_line_in = '1') then
			counter_new <= std_logic_vector(unsigned(counter_state) + 1);

			if (unsigned(counter_state) = field_block_height - 1) then
				counter_new <= (others => '0');

				mem_addr_enable <= '1';
			end if;
		end if;

		if (end_frame_in = '1') then
			counter_new    <= (others => '0');
			mem_addr_reset <= '1';
		end if;
	end process;

	process(clk, rst)
	begin
		if (rst = '1') then
			counter_state <= (others => '0');
		elsif (clk'event and clk = '1') then
			counter_state <= counter_new;
		end if;
	end process;
end;





