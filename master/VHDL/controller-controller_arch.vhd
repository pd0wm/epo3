library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.vga_params.all;

architecture controller_arch of controller is
	type state_type
	is (reset, init, gen_piece_1, gen_piece_2, collision_1, collision_2, collision_3, collision_4, collision_5, draw_1, draw_2, kernel_panic, lock_overflow, reset_timers_a_1, reset_timers_a_2, clear_shift_1, clear_shift_2, space_1, space_2, space_3, space_4, space_5, space_5, put_back_1, put_back_2, put_back_3, put_back_4, move_down_1, move_down_2, move_down_3, move_down_4, reset_timers_b_1, reset_timers_b_2, drop_timer_reset_1, drop_timer_reset_2, drop_timer_reset_3, rotate, game_over);
	signal cur_state, next_state : state_type;

	signal cur_piece        : std_logic_vector(2 downto 0);
	signal cur_x, new_x     : std_logic_vector(2 downto 0);
	signal cur_y, new_y     : std_logic_vector(3 downto 0);
	signal cur_rot, new_rot : std_logic_vector(1 downto 0);

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

	process(cur_state, lut_ready, draw_erase_ready, clear_shift_ready, draw_score_ready, timer_1_done, inputs)
	begin
		case cur_state is
			when reset =>
				-- LUT
				lut_x             <= '0';
				lut_y             <= '0';
				lut_rot           <= '0';
				lut_piece_type    <= '0';
				lut_start         <= '0';
				-- next piece
				new_piece         <= '0';
				--check mask
				check_start       <= '0';
				-- draw erase
				draw_erase_draw   <= '0';
				draw_erase_start  <= '0';
				-- clear shift
				clear_shift_start <= '0';
				-- draw_score
				draw_score_draw   <= '0';
				-- timers
				timer_1_time      <= (others => '0');
				timer_1_start     <= '0';
				timer_2_time      <= (others => '0');
				timer_2_start     <= '0';

				-- reset local signals
				cur_piece <= (others => '0');

				next_state <= init;

			when init =>
				timer_1_time <= "00111100"; -- 60, 1 second
				timer_2_time <= "00111100"; -- 60, 1 second
				cur_x        <= "011";
				cur_y        <= "0000";

				next_state <= gen_piece_1;

			when gen_piece_1 =>
				cur_piece <= next_piece;
				new_piece <= '1';       -- generate new piece for next time

				next_state <= gen_piece_2;
			when gen_piece_2 =>
				new_piece <= '0';

				next_state <= collision_1;

			when collision_1 =>
				-- Generate mask for cur_piece
				lut_rot        <= cur_rot;
				lut_x          <= cur_x;
				lut_y          <= cur_y;
				lut_piece_type <= cur_piece;
				lut_start      <= '1';

				next_state <= collision_2;

			when collision_2 =>
				-- Wait for lut ready, about 6 cycles
				if (lut_ready = '1') then
					lut_start  <= '0';
					next_state <= collision_3;
				else
					next_state <= collision_2;
				end if;

			when collision_3 =>
				-- Check mask
				check_start <= '1';

				next_state <= collision_4;

			when collision_4 =>
				-- Wait for check mask ready, about ?
				if (check_ready = '1') then
					next_state <= collision_5;
				else
					next_state <= collision_4;
				end if;

			when collision_5 =>
				if (check_epty = '1') then
					next_state <= game_over;
				else
					next_state <= draw_1;
				end if;

			when draw =>
				timer_1_start <= '1';
				next_state    <= lock_overflow;

			when lock_overflow =>
				if (timer_2_done = '1') then
					next_state <= reset_timers_a_1;
				else
					next_state <= drop_overflow;
				end if;

			when reset_timers_a_1 =>
				timer_1_start <= '0';
				timer_2_start <= '0';
				timer_1_reset <= '1';
				timer_2_reset <= '1';
				timer_1_time  <= "00111100"; -- 60, 1 second
				timer_2_time  <= "00111100"; -- 60, 1 second

				next_state <= reset_timers_a_2;

			when reset_timers_a_2 =>
				timer_1_reset <= '0';
				timer_2_reset <= '0';

				next_state <= clear_shift_1;

			when clear_shift_1 =>
				clear_shift_start <= '1';

				next_state <= clear_shift_2;

			when clear_shift_2 =>
				if (clear_shift_ready) then
					next_state <= gen_piece_1;
				else
					next_state <= clear_shift_2;
				end if;

			when drop_overflow =>
				if (timer_1_done = '1') then
					next_state <= space_1;
				else
					next_state <= key;
				end if;

			when space_1 =>
				-- First remove current piece
				draw_erase_draw <= '0'; -- erase
				draw_erase_star <= '1';

				next_state <= space_2;

			when space_2 =>
				if (draw_erase_ready = '1') then
					draw_erase_start <= '0';
					next_state       <= space_3;
				else
					next_state <= space_2;
				end if;

			when space_3 =>
				new_y <= std_logic_vector(unsigned(cur_y) + 1);

				next_state <= space_4;

			when space_4 =>
				lut_rot        <= cur_rot;
				lut_x          <= cur_x;
				lut_y          <= new_y;
				lut_piece_type <= cur_piece;
				lut_start      <= '1';

				next_state <= space_5;

			when space_5 =>
				if (lut_ready = '1') then
					lut_start  <= '0';
					next_state <= space_6;
				else
					next_state <= space_5;
				end if;

			when space_6 =>
				if (lut_error = '0') then
					cur_y      <= new_y;
					next_state <= move_down_1;
				else
					next_state <= put_back_1;
				end if;

			when put_back_1 =>
				lut_rot        <= cur_rot;
				lut_x          <= cur_x;
				lut_y          <= cur_y;
				lut_piece_type <= cur_piece;
				lut_start      <= '1';

				next_state <= put_back_2;

			when put_back_2 =>
				if (lut_ready = '1') then
					lut_start  <= '0';
					next_state <= put_back_3;
				else
					next_state <= put_back_2;
				end if;

			when put_back_3 =>
				draw_erase_draw  <= '1'; --draw
				draw_erase_start <= '1';

				next_state <= put_back_4;

			when put_back_4 =>
				if (draw_erase_ready = '1') then
					draw_erase_start <= '0';
					next_state       <= lock_timer_start;
				else
					next_state <= put_back_4;
				end if;

			when move_down_1 =>
				lut_rot        <= cur_rot;
				lut_x          <= cur_x;
				lut_y          <= cur_y;
				lut_piece_type <= cur_piece;
				lut_start      <= '1';

				next_state <= move_down_2;

			when move_down_2 =>
				if (lut_ready = '1') then
					lut_start  <= '0';
					next_state <= move_down_3;
				else
					next_state <= move_down_2;
				end if;

			when move_down_3 =>
				draw_erase_draw  <= '1'; --draw
				draw_erase_start <= '1';

				next_state <= move_down_4;

			when move_down_4 =>
				if (draw_erase_ready = '1') then
					draw_erase_start <= '0';
					next_state       <= reset_timers_b_1;
				else
					next_state <= move_down_4;
				end if;

			when reset_timers_b_1 =>
				timer_1_start <= '0';
				timer_1_reset <= '0';
				timer_1_time  <= timer_1_time <= "00111100"; -- 60, 1 second

				next_state <= reset_timers_b_2;
			when reset_timers_b_2 =>
				timer_1_reset <= '0';

				next_state <= draw;
			when key =>
				if (inputs = (others => '0')) then
					-- no input
					next_state <= drop_timer_reset;
				else
					next_state <= rotate;
				end if;

			when drop_timer_reset =>
				timer_1_time <= timer_1_time <= "00111100"; -- 60, 1 second

				next_state <= draw;
				
			when rotate => 
				next_state <= draw;

			when kernel_panic =>
				-- Kill it!
				next_state <= game_over;
			when others =>
				null;
		end case;
	end process;
end;