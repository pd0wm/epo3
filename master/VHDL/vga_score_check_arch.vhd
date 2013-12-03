library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.vga_params.all;

architecture vga_score_check_arch of vga_score_check is
	signal in_score_state, in_score_new : std_logic;
	signal end_score_line_state, end_score_line_new : std_logic;
begin
	in_score_out <= in_score_state;
	end_score_line_out <= end_score_line_state;
	
	process(pos_x_in, pos_y_in)
	begin
		if (
			unsigned(pos_y_in) >= score_start_y and
			unsigned(pos_y_in) < score_start_y + score_height and
			
			unsigned(pos_x_in) = total_width-1
			) then
			end_score_line_new <= '1';
		else
			end_score_line_new <= '0';
		end if;
	end process;

	process(pos_x_in, pos_y_in)
	begin
		if (
			unsigned(pos_x_in) >= score_start_x and
			unsigned(pos_x_in) < score_start_x + score_width and
			
			unsigned(pos_y_in) >= score_start_y and
			unsigned(pos_y_in) < score_start_y + score_height
		) then
			in_score_new <= '1';
		else
			in_score_new <= '0';
		end if;
	end process;

	process(clk, rst)
	begin
		if (rst = '1') then
			in_score_state <= '0';
			end_score_line_state <= '0';
		elsif (clk'event and clk = '1') then
			in_score_state <= in_score_new;
			end_score_line_state <= end_score_line_new;
		end if;
	end process;
end;