library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.vga_params.all;

architecture vga_triggers_arch of vga_triggers is
	signal new_line_state, new_line_new   : std_logic;
	signal new_frame_state, new_frame_new : std_logic;
	
	signal end_line_state, end_line_new : std_logic;
	signal end_frame_state, end_frame_new : std_logic;
begin
	new_line_out  <= new_line_state;
	new_frame_out <= new_frame_state;
	
	end_frame_out <= end_frame_state;

	process(pos_x_in, pos_y_in)
	begin
		new_line_new  <= '0';
		new_frame_new <= '0';

		if (unsigned(pos_x_in) = 0) then
			if (unsigned(pos_y_in) = 0) then
				new_frame_new <= '1';
			else
				new_line_new <= '1';
			end if;
		end if;
	end process;
	
	process(pos_x_in, pos_y_in)
	begin
		end_frame_new <= '0';
		
		if (unsigned(pos_x_in) = total_width-1) then
			if (unsigned(pos_y_in) = total_height-1) then
				end_frame_new <= '1';
			end if;
		end if;
	end process;

	process(clk, rst)
	begin
		if (rst = '1') then
			new_line_state  <= '0';
			new_frame_state <= '0';
			
			end_frame_state <= '0';
		elsif (clk'event and clk = '1') then
			new_line_state  <= new_line_new;
			new_frame_state <= new_frame_new;
			
			end_frame_state <= end_frame_new;
		end if;
	end process;
end;