library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.vga_params.all;

architecture vga_trans_reset_arch of vga_trans_reset is
	signal counter_state, counter_new   : std_logic_vector(field_counter_block_height_len-1 downto 0);
	signal mem_addr_state, mem_addr_new : std_logic_vector(mem_addr_len - 1 downto 0);
begin
	mem_addr_reset_out <= mem_addr_state;

	process(end_field_line_in, counter_state, mem_addr_state, end_frame_in)
	begin
		mem_addr_new <= mem_addr_state;
		counter_new <= counter_state;
	
		if (end_field_line_in = '1') then
			counter_new <= std_logic_vector(unsigned(counter_state) + 1);

			if (unsigned(counter_state) = field_block_height - 1) then
				-- Reset counter
				counter_new <= (others => '0');

				-- Increase mem_addr
				mem_addr_new <= std_logic_vector(unsigned(mem_addr_state) + field_width/field_block_width);
			end if;
		end if;

		if (end_frame_in = '1') then
			counter_new <= (others => '0');
			mem_addr_new <= (others => '0');
		end if;
	end process;

	process(clk, rst)
	begin
		if (rst = '1') then
			counter_state  <= (others => '0');
			mem_addr_state <= (others => '0');
		elsif (clk'event and clk = '1') then
			counter_state <= counter_new;
			mem_addr_state <= mem_addr_new;
		end if;
	end process;
end;