library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.vga_params.all;

architecture vga_np_check_arch of vga_np_check is
	signal in_np_state, in_np_new : std_logic;
	signal end_np_line_state, end_np_line_new : std_logic;
begin
	in_np_out <= in_np_state;
	end_np_line_out <= end_np_line_state;
	
	process(pos_x_in, pos_y_in)
	begin
		if (
			unsigned(pos_y_in) >= np_start_y and
			unsigned(pos_y_in) < np_start_y + np_height and
			
			unsigned(pos_x_in) = total_width-1
			) then
			end_np_line_new <= '1';
		else
			end_np_line_new <= '0';
		end if;
	end process;

	process(pos_x_in, pos_y_in)
	begin
		if (
			unsigned(pos_x_in) >= np_start_x and
			unsigned(pos_x_in) < np_start_x + np_width and
			
			unsigned(pos_y_in) >= np_start_y and
			unsigned(pos_y_in) < np_start_y + np_height
		) then
			in_np_new <= '1';
		else
			in_np_new <= '0';
		end if;
	end process;

	process(clk, rst)
	begin
		if (rst = '1') then
			in_np_state <= '0';
			end_np_line_state <= '0';
		elsif (clk'event and clk = '1') then
			in_np_state <= in_np_new;
			end_np_line_state <= end_np_line_new;
		end if;
	end process;
end;