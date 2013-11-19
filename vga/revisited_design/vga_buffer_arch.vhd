library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture vga_buffer_behav of vga_buffer is
	signal h_sync_next, v_sync_next        : std_logic;
	signal red_next, green_next, blue_next : std_logic;
begin
	comb : process(data, h_sync_in, v_sync_in, draw)
	begin
		h_sync_next <= h_sync_in;
		v_sync_next <= v_sync_in;

		if (data = '1' and draw = '1') then
			red_next   <= '0';
			green_next <= '0';
			blue_next  <= '0';
		else
			red_next   <= '1';
			green_next <= '1';
			blue_next  <= '1';
		end if;
	end process;

	regs : process(clk, rst)
	begin
		if (rst = '1') then
			h_sync <= '0';
			v_sync <= '0';

			red   <= '0';
			green <= '0';
			blue  <= '0';
		elsif (clk'event and clk = '1') then
			h_sync <= h_sync_next;
			v_sync <= v_sync_next;

			red   <= red_next;
			green <= green_next;
			blue  <= blue_next;
		end if;
	end process;
end vga_buffer_behav;


