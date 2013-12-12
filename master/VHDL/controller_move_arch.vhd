library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.vga_params.all;

architecture controller_move_arch of controller_move is
	type state_type is (reset, move_2, move_3, move_5, move_6, do_move_1, do_move_2, do_move_3, done_fit, done_error);

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
		x                <= '0';
		add_sub          <= '0';
		rot              <= '0';
		draw_erase_draw  <= '0';
		draw_erase_start <= '0';
		check_start      <= '1';
		ready <= '1';

		next_state <= cur_state;

		case cur_state is
			when reset  =>
				if (start = '1') then
					next_state <= move_2;
				end if;	
				
			when move_2 =>
				-- first erase current piece
				draw_erase_draw  <= '0'; -- erase
				draw_erase_start <= '1'; --start

				next_state <= move_3;

			when move_3 =>
				draw_erase_draw  <= '0'; -- erase
				draw_erase_start <= '1'; --start

				-- wait for erase ready 
				if (draw_erase_ready = '1') then
					next_state <= do_move_1;
				end if;

			when move_5 =>
				draw_erase_draw  <= '1'; -- draw
				draw_erase_start <= '1'; --start

				-- wait for draw ready 
				if (draw_erase_ready = '1' and inputs = "0000") then
					next_state <= done_error;
				end if;

			when move_6 =>
				x       <= inputs(0) or inputs(1);
				rot     <= inputs(2) or inputs(3);
				add_sub <= inputs(1) or inputs(2);

				draw_erase_draw  <= '1'; -- draw
				draw_erase_start <= '1'; --start

				-- wait for draw ready 
				if (draw_erase_ready = '1' and inputs = "0000") then
					next_state <= done_fit;
				end if;

			when do_move_1 =>
				x       <= inputs(0) or inputs(1);
				rot     <= inputs(2) or inputs(3);
				add_sub <= inputs(1) or inputs(2);

				check_start <= '1';

				next_state <= do_move_2;

			when do_move_2 =>
				x       <= inputs(0) or inputs(1);
				rot     <= inputs(2) or inputs(3);
				add_sub <= inputs(1) or inputs(2);

				check_start <= '1';

				-- Wait for check
				if (check_ready = '1') then
					next_state <= do_move_3;
				end if;

			when do_move_3 =>
				x       <= inputs(0) or inputs(1);
				rot     <= inputs(2) or inputs(3);
				add_sub <= inputs(1) or inputs(2);

				if (check_empty = '1') then
					next_state <= move_6;
				else
					next_state <= move_5;
				end if;

			when done_fit =>
				ready <= '1';
				
				x       <= inputs(0) or inputs(1);
				rot     <= inputs(2) or inputs(3);
				add_sub <= inputs(1) or inputs(2);
				
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



