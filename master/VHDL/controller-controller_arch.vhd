library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.vga_params.all;

architecture controller_arch of controller is
	type state_type
	is (reset, init, move_1, move_2, move_3, move_4, move_5, clear_shift_3, clear_shift_4, draw_next_piece_1, draw_next_piece_2, draw_next_piece_3, draw_next_piece_4, draw_next_piece_5, hard_drop_1, rotate_cw_1, rotate_cw_3, rotate_cw_4, rotate_cw_5, rotate_cw_2, rotate_ccw_1, rotate_ccw_2, rotate_ccw_3, rotate_ccw_4, rotate_ccw_5, move_left_1, move_left_2, move_left_3, move_left_4, move_left_5, soft_drop_1, soft_drop_2, soft_drop_3, move_right_1, move_right_2, move_right_3, move_right_4, move_right_5, first_draw_1, first_draw_2, first_draw_4, drop_timer_reset, gen_piece_1, collision_1, collision_3, collision_4, collision_5, draw, kernel_panic, reset_timers_a_1, reset_timers_a_2, clear_shift_1, clear_shift_2, space_1, space_2, space_4, space_5, space_6, put_back_4, move_down_3, move_down_4, reset_timers_b_1, reset_timers_b_2, drop_overflow, key, game_over);
	signal cur_state, next_state : state_type;

	signal cur_piece, new_cur_piece : std_logic_vector(2 downto 0);
	signal cur_x, new_cur_x         : std_logic_vector(2 downto 0);
	signal cur_y, new_cur_y         : std_logic_vector(3 downto 0);
	signal cur_rot, new_cur_rot     : std_logic_vector(1 downto 0);

	-- Output buffers
	signal new_timer_1_time  : std_logic;
	signal new_timer_1_start : std_logic;
	signal new_timer_1_reset : std_logic;

	signal cur_timer_1_time  : std_logic;
	signal cur_timer_1_start : std_logic;
	signal cur_timer_1_reset : std_logic;
	signal inv_inputs        : std_logic_vector(5 downto 0);

	signal cur_future_piece, new_future_piece : std_logic_vector(2 downto 0);

begin
	process(clk, rst)
	begin
		if (rising_edge(clk)) then
			if (rst = '1') then
				cur_state <= reset;

			else
				cur_future_piece <= new_future_piece;

				-- Signals
				cur_piece <= new_cur_piece;
				cur_x     <= new_cur_x;
				cur_y     <= new_cur_y;
				cur_rot   <= new_cur_rot;
				cur_state <= next_state;

				cur_timer_1_time  <= new_timer_1_time;
				cur_timer_1_start <= new_timer_1_start;
				cur_timer_1_reset <= new_timer_1_reset;
				inv_inputs        <= inputs;
			end if;
		end if;

		-- Outputs

		timer_1_time  <= new_timer_1_time;
		timer_1_start <= new_timer_1_start;
		timer_1_reset <= new_timer_1_reset;

		lut_x          <= cur_x;
		lut_y          <= cur_y;
		lut_rot        <= cur_rot;
		lut_piece_type <= cur_piece;

	end process;

	process(cur_state)
	begin
		-- Keep signals
		new_cur_x        <= cur_x;
		new_cur_y        <= cur_y;
		new_cur_piece    <= cur_piece;
		new_cur_rot      <= cur_rot;
		new_future_piece <= cur_future_piece;

		-- Keep outputs

		new_timer_1_time  <= cur_timer_1_time;
		new_timer_1_start <= cur_timer_1_start;
		new_timer_1_reset <= cur_timer_1_reset;

		new_piece         <= '0';
		check_start       <= '0';
		draw_erase_draw   <= '0';
		draw_erase_start  <= '0';
		lut_next_piece    <= '0';
		clear_shift_start <= '0';
		draw_score_draw   <= '0';

		x       <= '0';
		y       <= '0';
		add_sub <= '0';
		rot     <= '0';

		case cur_state is
			when reset =>
				-- LUT
				new_future_piece  <= (others => '0');
				-- timers
				new_timer_1_time  <= '0';
				new_timer_1_start <= '0';
				new_timer_1_reset <= '0';

				-- local signals
				new_cur_piece <= (others => '0');
				new_cur_x     <= (others => '0');
				new_cur_y     <= (others => '0');
				new_cur_rot   <= (others => '0');

				next_state <= init;

			when init =>
				new_timer_1_time <= '1'; -- 30, .5 second
				new_future_piece <= next_piece;
				new_piece        <= '1';

				next_state <= gen_piece_1;

			when gen_piece_1 =>
				new_cur_piece <= cur_future_piece;

				next_state <= draw_next_piece_1;

			when draw_next_piece_1 =>
				new_cur_rot <= (others => '0');
				new_cur_x   <= (others => '0');
				new_cur_y   <= (others => '0');

				lut_next_piece   <= '1';
				draw_erase_draw  <= '0';
				draw_erase_start <= '1';

				next_state <= draw_next_piece_2;

			when draw_next_piece_2 =>
				lut_next_piece   <= '1';
				draw_erase_draw  <= '0';
				draw_erase_start <= '1';

				if (draw_erase_ready = '1') then
					next_state <= draw_next_piece_3;
				else
					next_state <= draw_next_piece_2;
				end if;

			when draw_next_piece_3 =>
				lut_next_piece <= '1';
				new_piece      <= '1';
				new_cur_piece  <= next_piece;

				next_state <= draw_next_piece_4;

			when draw_next_piece_4 =>
				lut_next_piece   <= '1';
				draw_erase_draw  <= '1';
				draw_erase_start <= '1';

				next_state <= draw_next_piece_5;

			when draw_next_piece_5 =>
				draw_erase_draw  <= '1';
				draw_erase_start <= '1';
				lut_next_piece   <= '1';

				if (draw_erase_ready = '1') then
					next_state <= collision_1;
				else
					next_state <= draw_next_piece_5;
				end if;

			when collision_1 =>
				new_cur_piece    <= cur_future_piece;
				new_future_piece <= cur_piece;

				new_cur_x <= "011";

				next_state <= collision_3;

			when collision_3 =>
				-- Check mask
				check_start <= '1';

				next_state <= collision_4;

			when collision_4 =>
				check_start <= '1';
				-- Wait for check mask ready, about ?
				if (check_ready = '1') then
					next_state <= collision_5;
				else
					next_state <= collision_4;
				end if;

			when collision_5 =>
				if (check_empty = '0') then
					next_state <= game_over;
				else
					next_state <= first_draw_1;
				end if;

			when first_draw_1 =>
				new_timer_1_start <= '1';

				draw_erase_draw  <= '1';
				draw_erase_start <= '1';

				next_state <= first_draw_2;

			when first_draw_2 =>
				draw_erase_draw  <= '1';
				draw_erase_start <= '1';

				if (draw_erase_ready = '1') then
					next_state <= first_draw_4;
				else
					next_state <= first_draw_2;
				end if;

			when first_draw_4 =>
				draw_erase_draw  <= '1';
				draw_erase_start <= '1';

				if (draw_erase_ready = '1') then
					next_state <= draw;
				else
					next_state <= first_draw_4;
				end if;

				next_state <= draw;

			when draw =>
				next_state <= drop_overflow;

			when reset_timers_a_1 =>
				new_timer_1_start <= '0';
				new_timer_1_reset <= '1';
				new_timer_1_time  <= '1'; -- 30, .5 second


				next_state <= reset_timers_a_2;

			when reset_timers_a_2 =>
				if (inv_inputs = "000000" or inv_inputs = "010000") then
					next_state <= clear_shift_1;
				else
					next_state <= reset_timers_a_2;
				end if;

				new_timer_1_reset <= '0';

			when clear_shift_1 =>
				clear_shift_start <= '1';

				next_state <= clear_shift_2;

			when clear_shift_2 =>
				clear_shift_start <= '1';

				if (clear_shift_ready = '1') then
					next_state <= clear_shift_3;
				else
					next_state <= clear_shift_2;
				end if;

			when clear_shift_3 =>
				draw_score_draw <= '1';

				next_state <= clear_shift_4;

			when clear_shift_4 =>
				draw_score_draw <= '1';

				if (draw_score_ready = '1') then
					next_state <= gen_piece_1;
				else
					next_state <= clear_shift_3;
				end if;

			when drop_overflow =>
				if (timer_1_done = '1') then
					next_state <= space_1;
				else
					next_state <= key;
				end if;

			when space_1 =>
				-- First remove current piece
				draw_erase_draw  <= '0'; -- erase
				draw_erase_start <= '1';

				next_state <= space_2;

			when space_2 =>
				draw_erase_start <= '1';
				if (draw_erase_ready = '1') then
					next_state <= space_4;
				else
					next_state <= space_2;
				end if;

			when space_4 =>
				add_sub <= '1';
				y       <= '1';

				check_start <= '1';

				next_state <= space_5;

			when space_5 =>
				check_start <= '1';
				add_sub     <= '1';
				y           <= '1';

				if (check_ready = '1') then
					next_state <= space_6;
				else
					next_state <= space_5;
				end if;

			when space_6 =>
				add_sub <= '1';
				y       <= '1';

				if (check_empty = '1') then
					new_cur_y  <= calc_y;
					next_state <= move_down_4;
				else
					new_cur_y  <= cur_y;
					next_state <= put_back_4;
				end if;

			when put_back_4 =>
				draw_erase_draw  <= '1'; --draw
				draw_erase_start <= '1';

				if (draw_erase_ready = '1') then
					next_state <= reset_timers_a_1;
				else
					next_state <= put_back_4;
				end if;

			when move_down_3 =>
				draw_erase_draw  <= '1'; --draw
				draw_erase_start <= '1';

				next_state <= move_down_4;

			when move_down_4 =>
				draw_erase_draw  <= '1'; --draw
				draw_erase_start <= '1';

				if (draw_erase_ready = '1') then
					next_state <= reset_timers_b_1;
				else
					next_state <= move_down_4;
				end if;

			when reset_timers_b_1 =>
				draw_erase_start  <= '0';
				new_timer_1_start <= '0';
				new_timer_1_time  <= '1'; -- 30, .5 second


				next_state <= reset_timers_b_2;

			when reset_timers_b_2 =>
				new_timer_1_start <= '1';

				next_state <= draw;

			when key =>
				if (inv_inputs = "000000") then
					next_state <= drop_timer_reset;
				else
					next_state <= move_1;
				end if;

			when drop_timer_reset =>
				new_timer_1_time <= '1'; -- 30, .5 second

				next_state <= draw;
			when move_1 =>
				if ((inv_inputs and "001111") = "000000") then
					next_state <= soft_drop_1;
				else
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
					next_state <= move_left_2;
				else
					next_state <= move_3;
				end if;

			when move_4 =>
				draw_erase_draw  <= '1'; -- draw
				draw_erase_start <= '1'; --start

				next_state <= move_5;

			when move_5 =>
				draw_erase_draw  <= '1'; -- draw
				draw_erase_start <= '1'; --start

				-- wait for draw ready 
				if (draw_erase_ready = '1' and (inv_inputs = "000000" or inv_inputs = "010000")) then
					next_state <= draw;
				else
					next_state <= move_5;
				end if;

			when move_left_1 =>
				if (inv_inputs(0) = '1') then
					next_state <= move_left_2;
				else
					next_state <= move_right_1;
				end if;

			when move_left_2 =>
				x       <= inputs(0) or inputs(1);
				rot     <= inputs(2) or inputs(3);
				add_sub <= inputs(1) or inputs(3);

				check_start <= '1';

				next_state <= move_left_3;

			when move_left_3 =>
				x       <= inputs(0) or inputs(1);
				rot     <= inputs(2) or inputs(3);
				add_sub <= inputs(1) or inputs(3);
				
				check_start <= '1';

				-- Wait for check
				if (check_ready = '1') then
					next_state <= move_left_4;
				else
					next_state <= move_left_3;
				end if;

			when move_left_4 =>
				x       <= inputs(0) or inputs(1);
				rot     <= inputs(2) or inputs(3);
				add_sub <= inputs(1) or inputs(3);

				if (check_empty = '1') then
					next_state <= move_left_5;
				else
					next_state <= move_4;
				end if;

			when move_left_5 =>
				x       <= inputs(0) or inputs(1);
				rot     <= inputs(2) or inputs(3);
				add_sub <= inputs(1) or inputs(3);
				
				new_cur_x <= calc_x;
				new_cur_rot <= calc_rot;

				next_state <= move_4;

			when move_right_1 =>
				if (inv_inputs(1) = '1') then
					next_state <= move_right_2;
				else
					next_state <= rotate_cw_1;
				end if;

			when move_right_2 =>
				x           <= '1';
				add_sub     <= '1';
				check_start <= '1';

				next_state <= move_right_3;

			when move_right_3 =>
				x           <= '1';
				add_sub     <= '1';
				check_start <= '1';

				-- Wait for check
				if (check_ready = '1') then
					next_state <= move_right_4;
				else
					next_state <= move_right_3;
				end if;

			when move_right_4 =>
				x       <= '1';
				add_sub <= '1';

				if (check_empty = '1') then
					next_state <= move_right_5;
				else
					next_state <= move_4;
				end if;

			when move_right_5 =>
				x       <= '1';
				add_sub <= '1';

				new_cur_x <= calc_x;

				next_state <= move_4;

			when rotate_cw_1 =>
				if (inv_inputs(2) = '1') then
					next_state <= rotate_cw_2;
				else
					next_state <= rotate_ccw_1;
				end if;

			when rotate_cw_2 =>
				rot         <= '1';
				add_sub     <= '1';
				check_start <= '1';

				next_state <= rotate_cw_3;

			when rotate_cw_3 =>
				rot         <= '1';
				add_sub     <= '1';
				check_start <= '1';

				-- Wait for check
				if (check_ready = '1') then
					next_state <= rotate_cw_4;
				else
					next_state <= rotate_cw_3;
				end if;

			when rotate_cw_4 =>
				rot     <= '1';
				add_sub <= '1';

				if (check_empty = '1') then
					next_state <= rotate_cw_5;
				else
					next_state <= move_4;
				end if;

			when rotate_cw_5 =>
				rot     <= '1';
				add_sub <= '1';

				new_cur_rot <= calc_rot;

				next_state <= move_4;

			when rotate_ccw_1 =>
				if (inv_inputs(3) = '1') then
					next_state <= rotate_ccw_2;
				else
					next_state <= soft_drop_1;
				end if;

			when rotate_ccw_2 =>
				rot         <= '1';
				check_start <= '1';

				check_start <= '1';

				next_state <= rotate_ccw_3;

			when rotate_ccw_3 =>
				rot         <= '1';
				check_start <= '1';

				-- Wait for check
				if (check_ready = '1') then
					next_state <= rotate_ccw_4;
				else
					next_state <= rotate_ccw_3;
				end if;

			when rotate_ccw_4 =>
				rot <= '1';

				if (check_empty = '1') then
					next_state <= rotate_ccw_5;
				else
					next_state <= move_4;
				end if;

			when rotate_ccw_5 =>
				rot     <= '1';
				add_sub <= '1';

				new_cur_rot <= calc_rot;

				next_state <= move_4;

			when soft_drop_1 =>
				if (inv_inputs(4) = '1' and cur_timer_1_time = '1') then
					next_state <= soft_drop_2;
				else
					next_state <= hard_drop_1;
				end if;

			when soft_drop_2 =>
				new_timer_1_reset <= '1';
				new_timer_1_start <= '0';
				new_timer_1_time  <= '0';

				next_state <= soft_drop_3;

			when soft_drop_3 =>
				new_timer_1_reset <= '0';
				new_timer_1_start <= '1';

				next_state <= draw;

			when hard_drop_1 =>
				if (inv_inputs(5) = '1' and cur_timer_1_time = '1') then
					next_state <= space_1;
				else
					next_state <= draw;
				end if;

			when kernel_panic =>
				-- Kill it!
				next_state <= game_over;

			when game_over =>
				-- Kill it!
				next_state <= game_over;

		end case;
	end process;
end;
