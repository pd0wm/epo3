library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.vga_params.all;

architecture controller_drop_arch of controller_drop is
	type state_type is (reset, done_fit, done_error);

	signal next_state, cur_state : state_type;
begin
	process(clk, rst)
	begin
		if (rising_edge(clk)) then
			if (rst = '1') then
				cur_state <= reset;
			else
				cur_state <= next_state;
			end if;
		end if;

	end process;

	process(cur_state)
	begin
		y                <= '0';
		draw_erase_draw  <= '0';
		draw_erase_start <= '0';
		check_start      <= '0';
		ready <= '0';

		next_state <= cur_state;

		case cur_state is
			when reset  =>
				if (start = '1') then
					next_state <= done_fit;
				end if;	
				
			

			when done_fit =>
				ready <= '1';
				
				if (start = '0') then
					next_state <= reset;
				end if;

			when done_error =>
				ready <= '1';
				
				if (start = '0') then
					next_state <= reset;
				end if;
				
		end case;
	end process;
end;



