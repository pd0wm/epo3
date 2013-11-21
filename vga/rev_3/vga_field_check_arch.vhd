library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.vga_params.all;

architecture vga_field_check_arch of vga_field_check is
	signal in_field_state, in_field_new : std_logic;
	signal end_field_line_state, end_field_line_new : std_logic;
begin
	in_field_out <= in_field_state;
	end_field_line_out <= end_field_line_state;
	
	process(pos_x_in, pos_y_in)
	begin
		if (
			unsigned(pos_y_in) >= offset_y + field_start_y and
			unsigned(pos_y_in) < offset_y + field_start_y + field_height and
			
			unsigned(pos_x_in) = total_width-1
			) then
			end_field_line_new <= '1';
		else
			end_field_line_new <= '0';
		end if;
	end process;

	process(pos_x_in, pos_y_in)
	begin
		if (
			unsigned(pos_x_in) >= offset_x + field_start_x and
			unsigned(pos_x_in) < offset_x + field_start_x + field_width and
			
			unsigned(pos_y_in) >= offset_y + field_start_y and
			unsigned(pos_y_in) < offset_y + field_start_y + field_height
		) then
			in_field_new <= '1';
		else
			in_field_new <= '0';
		end if;
	end process;

	process(clk, rst)
	begin
		if (rst = '1') then
			in_field_state <= '0';
			end_field_line_state <= '0';
		elsif (clk'event and clk = '1') then
			in_field_state <= in_field_new;
			end_field_line_state <= end_field_line_new;
		end if;
	end process;
end;