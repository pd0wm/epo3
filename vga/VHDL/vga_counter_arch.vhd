library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.vga_params.all;

architecture vga_counter_behav of vga_counter is
	signal pos_x, pos_x_next : std_logic_vector(pos_x_len-1 downto 0);
	signal pos_y, pos_y_next : std_logic_vector(pos_y_len-1 downto 0);

begin
	pos_x_out <= pos_x;
	pos_y_out <= pos_y;

	process(pos_x, pos_y)
	begin
		if (unsigned(pos_x) = total_width - 1) then
			if (unsigned(pos_y) = total_height - 1) then
				pos_x_next <= (others => '0');
				pos_y_next <= (others => '0');
			else
				pos_x_next <= (others => '0');
				pos_y_next <= std_logic_vector(unsigned(pos_y) + 1);
			end if;
		else
			pos_x_next <= std_logic_vector(unsigned(pos_x) + 1);
			pos_y_next <= pos_y;
		end if;
	end process;

	process(clk, rst)
	begin
		if (rst = '1') then
			pos_x <= (others => '0');
			pos_y <= (others => '0');
		elsif (clk'event and clk = '1') then
			pos_x <= pos_x_next;
			pos_y <= pos_y_next;
		end if;
	end process;
end;