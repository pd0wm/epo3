library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.vga_params.all;

architecture controller_arch of controller is
	type state_type
	is (reset, init, clear_shift_3, draw_next_piece_1, draw_next_piece_2, draw_next_piece_3, draw_next_piece_4, hard_drop_1, rotate_cw_1, rotate_cw_3, rotate_cw_4, rotate_cw_2, rotate_ccw_1, rotate_ccw_2, rotate_ccw_3, rotate_ccw_4, move_left_1, soft_drop_1, soft_drop_2, soft_drop_3, move_left_2, move_left_3, move_left_4, move_left_5, move_left_6, move_left_7, move_left_8, move_left_9, move_left_10, move_left_11, move_right_1, move_right_2, move_right_3, move_right_4, first_draw_1, first_draw_2, first_draw_3, first_draw_4, drop_timer_reset, gen_piece_1, gen_piece_2, collision_1, collision_3, collision_4, collision_5, draw, kernel_panic, reset_timers_a_1, reset_timers_a_2, clear_shift_1, clear_shift_2, space_1, space_2, space_3, space_4, space_5, space_6, put_back_1, put_back_3, put_back_4, move_down_1, move_down_3, move_down_4, reset_timers_b_1, reset_timers_b_2, drop_overflow, key, game_over);
	signal cur_state, next_state : state_type;

	signal cur_piece, new_cur_piece     : std_logic_vector(2 downto 0);
	signal cur_x, new_cur_x             : std_logic_vector(2 downto 0);
	signal cur_x_new, new_cur_x_new     : std_logic_vector(2 downto 0);
	signal cur_y, new_cur_y             : std_logic_vector(3 downto 0);
	signal cur_y_new, new_cur_y_new     : std_logic_vector(3 downto 0);
	signal cur_rot, new_cur_rot         : std_logic_vector(1 downto 0);
	signal cur_rot_new, new_cur_rot_new : std_logic_vector(1 downto 0);

	-- Output buffers
	signal new_lut_x             : std_logic_vector(2 downto 0);
	signal new_lut_y             : std_logic_vector(3 downto 0);
	signal new_lut_rot           : std_logic_vector(1 downto 0);
	signal new_lut_piece_type    : std_logic_vector(2 downto 0);
	signal new_new_piece         : std_logic;
	signal new_check_start       : std_logic;
	signal new_draw_erase_draw   : std_logic;
	signal new_draw_erase_start  : std_logic;
	signal new_clear_shift_start : std_logic;
	signal new_draw_score_draw   : std_logic;
	signal new_timer_1_time      : std_logic_vector(7 downto 0);
	signal new_timer_1_start     : std_logic;
	signal new_timer_1_reset     : std_logic;
	signal new_lut_next_piece    : std_logic;

	signal cur_lut_x             : std_logic_vector(2 downto 0);
	signal cur_lut_y             : std_logic_vector(3 downto 0);
	signal cur_lut_rot           : std_logic_vector(1 downto 0);
	signal cur_lut_next_piece    : std_logic;
	signal cur_lut_piece_type    : std_logic_vector(2 downto 0);
	signal cur_new_piece         : std_logic;
	signal cur_check_start       : std_logic;
	signal cur_draw_erase_draw   : std_logic;
	signal cur_draw_erase_start  : std_logic;
	signal cur_clear_shift_start : std_logic;
	signal cur_draw_score_draw   : std_logic;
	signal cur_timer_1_time      : std_logic_vector(7 downto 0);
	signal cur_timer_1_start     : std_logic;
	signal cur_timer_1_reset     : std_logic;
	signal inv_inputs            : std_logic_vector(7 downto 0);

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
				cur_piece   <= new_cur_piece;
				cur_x       <= new_cur_x;
				cur_x_new   <= new_cur_x_new;
				cur_y       <= new_cur_y;
				cur_y_new   <= new_cur_y_new;
				cur_rot     <= new_cur_rot;
				cur_rot_new <= new_cur_rot_new;
				cur_state   <= next_state;

				cur_lut_next_piece <= new_lut_next_piece;
				cur_lut_x          <= new_lut_x;
				cur_lut_y          <= new_lut_y;
				cur_lut_rot        <= new_lut_rot;
				cur_lut_piece_type <= new_lut_piece_type;

				cur_new_piece         <= new_new_piece;
				cur_check_start       <= new_check_start;
				cur_draw_erase_draw   <= new_draw_erase_draw;
				cur_draw_erase_start  <= new_draw_erase_start;
				cur_clear_shift_start <= new_clear_shift_start;
				cur_draw_score_draw   <= new_draw_score_draw;
				cur_timer_1_time      <= new_timer_1_time;
				cur_timer_1_start     <= new_timer_1_start;
				cur_timer_1_reset     <= new_timer_1_reset;
				inv_inputs            <= not inputs;
			end if;
		end if;

		-- Outputs
		lut_x             <= new_lut_x;
		lut_y             <= new_lut_y;
		lut_rot           <= new_lut_rot;
		lut_piece_type    <= new_lut_piece_type;
		new_piece         <= new_new_piece;
		check_start       <= new_check_start;
		draw_erase_draw   <= new_draw_erase_draw;
		draw_erase_start  <= new_draw_erase_start;
		clear_shift_start <= new_clear_shift_start;
		draw_score_draw   <= new_draw_score_draw;
		timer_1_time      <= new_timer_1_time;
		timer_1_start     <= new_timer_1_start;
		timer_1_reset     <= new_timer_1_reset;
		lut_next_piece    <= cur_lut_next_piece;

	end process;


	process(cur_state)
	begin
		-- Keep signals
		new_cur_x        <= cur_x;
		new_cur_y        <= cur_y;
		new_cur_piece    <= cur_piece;
		new_cur_x_new    <= cur_x_new;
		new_cur_y_new    <= cur_y_new;
		new_cur_rot      <= cur_rot;
		new_cur_rot_new  <= cur_rot_new;
		new_future_piece <= cur_future_piece;

		-- Keep outputs
		new_lut_x          <= cur_lut_x;
		new_lut_y          <= cur_lut_y;
		new_lut_rot        <= cur_lut_rot;
		new_lut_piece_type <= cur_lut_piece_type;
		new_lut_next_piece <= cur_lut_next_piece;

		new_new_piece         <= cur_new_piece;
		new_check_start       <= cur_check_start;
		new_draw_erase_draw   <= cur_draw_erase_draw;
		new_draw_erase_start  <= cur_draw_erase_start;
		new_clear_shift_start <= cur_clear_shift_start;
		new_draw_score_draw   <= cur_draw_score_draw;
		new_timer_1_time      <= cur_timer_1_time;
		new_timer_1_start     <= cur_timer_1_start;
		new_timer_1_reset     <= cur_timer_1_reset;

		case cur_state is
			when reset =>
				-- LUT
				new_lut_x             <= (others => '0');
				new_lut_y             <= (others => '0');
				new_lut_rot           <= (others => '0');
				new_lut_piece_type    <= (others => '0');
				new_future_piece      <= (others => '0');
				new_lut_next_piece    <= '0';
				-- next piece
				new_new_piece         <= '0';
				--check mask
				new_check_start       <= '0';
				-- draw erase
				new_draw_erase_draw   <= '0';
				new_draw_erase_start  <= '0';
				-- clear shift
				new_clear_shift_start <= '0';
				-- draw_score
				new_draw_score_draw   <= '0';
				-- timers
				new_timer_1_time      <= (others => '0');
				new_timer_1_start     <= '0';
				new_timer_1_reset     <= '0';

				-- local signals
				new_cur_piece   <= (others => '0');
				new_cur_x       <= (others => '0');
				new_cur_y       <= (others => '0');
				new_cur_rot     <= (others => '0');
				new_new_piece   <= '0';
				new_cur_x_new   <= (others => '0');
				new_cur_y_new   <= (others => '0');
				new_cur_rot_new <= (others => '0');

				next_state <= init;

			when init =>
				new_timer_1_time <= "00011110"; -- 30, .5 second
				new_future_piece <= next_piece;
				new_new_piece    <= '1';

				next_state <= gen_piece_1;

			when gen_piece_1 =>
				new_cur_piece    <= cur_future_piece;
				new_future_piece <= next_piece;
				new_new_piece    <= '1';

				new_cur_x <= "011";
				new_cur_y <= "0000";

				next_state <= gen_piece_2;

			when gen_piece_2 =>
				new_new_piece <= '0';
				next_state    <= draw_next_piece_1;
				
			when draw_next_piece_1 =>
				new_lut_rot        <= (others => '0');
				new_lut_x          <= (others => '0');
				new_lut_y          <= (others => '0');
				
				new_lut_piece_type <= cur_piece;
				new_lut_next_piece <= '1';
				
				new_draw_erase_draw  <= '0';
				new_draw_erase_start  <= '1';
				
				next_state <= draw_next_piece_2;

			when draw_next_piece_2 =>
				if (draw_erase_ready = '1') then
					new_draw_erase_start <= '0';
					next_state           <= draw_next_piece_3;
				else
					new_draw_erase_start <= '1';
					next_state           <= draw_next_piece_2;
				end if;				
				

			when draw_next_piece_3 =>
				new_lut_rot        <= (others => '0');
				new_lut_x          <= (others => '0');
				new_lut_y          <= (others => '0');
				new_lut_piece_type <= cur_future_piece;
				new_lut_next_piece <= '1';

				new_draw_erase_draw  <= '1';
				new_draw_erase_start <= '1';

				next_state <= draw_next_piece_4;

			when draw_next_piece_4 =>
				if (draw_erase_ready = '1') then
					new_draw_erase_start <= '0';
					new_lut_next_piece   <= '0';
					next_state           <= collision_1;
				else
					new_draw_erase_start <= '1';
					new_lut_next_piece   <= '1';
					next_state           <= draw_next_piece_4;
				end if;

			when collision_1 =>
				-- Generate mask for cur_piece
				new_lut_rot        <= cur_rot;
				new_lut_x          <= cur_x;
				new_lut_y          <= cur_y;
				new_lut_piece_type <= cur_piece;

				next_state <= collision_3;

			when collision_3 =>
				-- Check mask
				new_check_start <= '1';

				next_state <= collision_4;

			when collision_4 =>
				-- Wait for check mask ready, about ?
				if (check_ready = '1') then
					next_state <= collision_5;
				else
					next_state <= collision_4;
				end if;

			when collision_5 =>
				new_check_start <= '0';

				if (check_empty = '0') then
					next_state <= game_over;
				else
					next_state <= first_draw_1;
				end if;

			when first_draw_1 =>
				new_timer_1_start <= '1';

				new_draw_erase_draw  <= '1';
				new_draw_erase_start <= '1';

				next_state <= first_draw_2;

			when first_draw_2 =>
				if (draw_erase_ready = '1') then
					next_state <= first_draw_3;
				else
					next_state <= first_draw_2;
				end if;

			when first_draw_3 =>
				new_draw_erase_start <= '1';

				next_state <= first_draw_4;

			when first_draw_4 =>
				if (draw_erase_ready = '1') then
					new_draw_erase_start <= '0';
					next_state           <= draw;
				else
					new_draw_erase_start <= '1';
					next_state           <= first_draw_4;
				end if;

				next_state <= draw;

			when draw =>
				next_state <= drop_overflow;

			when reset_timers_a_1 =>
				new_timer_1_start <= '0';
				new_timer_1_reset <= '1';
				new_timer_1_time  <= "00011110"; -- 30, .5 second


				next_state <= reset_timers_a_2;

			when reset_timers_a_2 =>
				if (inv_inputs = "00000000" or inv_inputs = "00010000") then
					next_state <= clear_shift_1;
				else
					next_state <= reset_timers_a_2;
				end if;

				new_timer_1_reset <= '0';

			when clear_shift_1 =>
				new_clear_shift_start <= '1';

				next_state <= clear_shift_2;

			when clear_shift_2 =>
				if (clear_shift_ready = '1') then
					next_state <= clear_shift_3;
					new_draw_score_draw <= '1';
					new_clear_shift_start <= '0';
				else
					next_state <= clear_shift_2;
					new_draw_score_draw <= '0';
					new_clear_shift_start <= '1';
				end if;
				
			when clear_shift_3 =>
				if (draw_score_ready = '1') then
					new_draw_score_draw <= '0';
					next_state <= gen_piece_1;
				else
					new_draw_score_draw <= '1';
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
				new_draw_erase_draw  <= '0'; -- erase
				new_draw_erase_start <= '1';

				next_state <= space_2;

			when space_2 =>
				if (draw_erase_ready = '1') then
					next_state <= space_3;
				else
					next_state <= space_2;
				end if;

			when space_3 =>
				new_draw_erase_start <= '0';
				new_cur_y_new        <= std_logic_vector(unsigned(cur_y) + 1);

				next_state <= space_4;

			when space_4 =>
				new_lut_rot        <= new_cur_rot;
				new_lut_x          <= new_cur_x;
				new_lut_y          <= new_cur_y_new;
				new_lut_piece_type <= new_cur_piece;

				new_check_start <= '1';

				next_state <= space_5;

			when space_5 =>
				if (check_ready = '1') then
					next_state <= space_6;
				else
					next_state <= space_5;
				end if;

			when space_6 =>
				new_check_start <= '0';

				if (check_empty = '1') then
					new_cur_y  <= cur_y_new;
					next_state <= move_down_1;
				else
					new_cur_y  <= cur_y;
					next_state <= put_back_1;
				end if;

			when put_back_1 =>
				new_lut_rot        <= new_cur_rot;
				new_lut_x          <= new_cur_x;
				new_lut_y          <= new_cur_y;
				new_lut_piece_type <= new_cur_piece;

				next_state <= put_back_3;

			when put_back_3 =>
				new_draw_erase_draw  <= '1'; --draw
				new_draw_erase_start <= '1';

				next_state <= put_back_4;

			when put_back_4 =>
				if (draw_erase_ready = '1') then
					new_draw_erase_start <= '0';
					next_state <= reset_timers_a_1;
				else
					new_draw_erase_start <= '1';
					next_state <= put_back_4;
				end if;

			when move_down_1 =>
				next_state <= move_down_3;

			when move_down_3 =>
				new_draw_erase_draw  <= '1'; --draw
				new_draw_erase_start <= '1';

				next_state <= move_down_4;

			when move_down_4 =>
				if (draw_erase_ready = '1') then
					next_state <= reset_timers_b_1;
				else
					next_state <= move_down_4;
				end if;

			when reset_timers_b_1 =>
				new_draw_erase_start <= '0';
				new_timer_1_start    <= '0';
				new_timer_1_time     <= "00011110"; -- 30, .5 second


				next_state <= reset_timers_b_2;

			when reset_timers_b_2 =>
				new_timer_1_start <= '1';

				next_state <= draw;

			when key =>
				if (inv_inputs = "00000000") then
					-- no input
					next_state <= drop_timer_reset;
				else
					next_state <= move_left_1;
				end if;

			when drop_timer_reset =>
				new_timer_1_time <= "00011110"; -- 30, .5 second

				next_state <= draw;

			when move_left_1 =>
				if (inv_inputs(0) = '1') then
					next_state <= move_left_2;
				else
					next_state <= move_right_1;
				end if;

			when move_left_2 =>
				-- first erase current piece

				new_draw_erase_draw  <= '0'; -- erase
				new_draw_erase_start <= '1'; --start


				next_state <= move_left_3;

			when move_left_3 =>
				-- wait for erasse ready 
				if (draw_erase_ready = '1') then
					next_state <= move_left_4;
				else
					next_state <= move_left_3;
				end if;

			when move_left_4 =>
				-- calculate new position				
				new_draw_erase_start <= '0';
				new_cur_x_new        <= std_logic_vector(unsigned(cur_x) - 1);
				new_cur_y_new        <= cur_y;
				new_cur_rot_new      <= cur_rot;

				next_state <= move_left_5;

			when move_left_5 =>
				-- create mask for new position

				-- Generate mask for cur_piece
				new_lut_rot        <= new_cur_rot_new;
				new_lut_x          <= new_cur_x_new;
				new_lut_y          <= new_cur_y_new;
				new_lut_piece_type <= new_cur_piece;

				new_check_start <= '1';

				next_state <= move_left_6;

			when move_left_6 =>
				-- Wait for check
				if (check_ready = '1') then
					next_state <= move_left_7;
				else
					next_state <= move_left_6;
				end if;

			when move_left_7 =>
				new_check_start <= '0';
				if (check_empty = '1') then
					next_state <= move_left_8;
				else
					next_state <= move_left_9;
				end if;

			when move_left_8 =>
				-- Save new coordinates
				new_cur_x   <= new_cur_x_new;
				new_cur_y   <= new_cur_y_new;
				new_cur_rot <= new_cur_rot_new;

				next_state <= move_left_9;

			when move_left_9 =>
				-- Generate mask for cur_piece
				new_lut_rot        <= new_cur_rot;
				new_lut_x          <= new_cur_x;
				new_lut_y          <= new_cur_y;
				new_lut_piece_type <= new_cur_piece;

				new_draw_erase_draw  <= '1'; --draw
				new_draw_erase_start <= '1';

				next_state <= move_left_10;

			when move_left_10 =>
				if (draw_erase_ready = '1') then
					next_state <= move_left_11;
				else
					next_state <= move_left_10;
				end if;

			when move_left_11 =>
				new_draw_erase_start <= '0';

				if (inv_inputs = "00000000" or inv_inputs = "00010000") then
					next_state <= draw;
				else
					next_state <= move_left_11;
				end if;

			when move_right_1 =>
				if (inv_inputs(1) = '1') then
					next_state <= move_right_2;
				else
					next_state <= rotate_cw_1;
				end if;

			when move_right_2 =>
				-- first erase current piece

				new_draw_erase_draw  <= '0'; -- erase
				new_draw_erase_start <= '1'; --start


				next_state <= move_right_3;

			when move_right_3 =>
				-- wait for erasse ready 
				if (draw_erase_ready = '1') then
					next_state <= move_right_4;
				else
					next_state <= move_right_3;
				end if;

			when move_right_4 =>
				-- calculate new position				
				new_draw_erase_start <= '0';
				new_cur_x_new        <= std_logic_vector(unsigned(cur_x) + 1);
				new_cur_y_new        <= cur_y;
				new_cur_rot_new      <= cur_rot;

				next_state <= move_left_5;

			when rotate_cw_1 =>
				if (inv_inputs(2) = '1') then
					next_state <= rotate_cw_2;
				else
					next_state <= rotate_ccw_1;
				end if;

			when rotate_cw_2 =>
				-- first erase current piece

				new_draw_erase_draw  <= '0'; -- erase
				new_draw_erase_start <= '1'; --start


				next_state <= rotate_cw_3;

			when rotate_cw_3 =>
				-- wait for erasse ready 
				if (draw_erase_ready = '1') then
					next_state <= rotate_cw_4;
				else
					next_state <= rotate_cw_3;
				end if;

			when rotate_cw_4 =>
				-- calculate new position				
				new_draw_erase_start <= '0';
				new_cur_x_new        <= cur_x;
				new_cur_y_new        <= cur_y;
				new_cur_rot_new      <= std_logic_vector(unsigned(cur_rot) + 1);

				next_state <= move_left_5;

			when rotate_ccw_1 =>
				if (inv_inputs(3) = '1') then
					next_state <= rotate_ccw_2;
				else
					next_state <= soft_drop_1;
				end if;

			when rotate_ccw_2 =>
				-- first erase current piece

				new_draw_erase_draw  <= '0'; -- erase
				new_draw_erase_start <= '1'; --start


				next_state <= rotate_ccw_3;

			when rotate_ccw_3 =>
				-- wait for erasse ready 
				if (draw_erase_ready = '1') then
					next_state <= rotate_ccw_4;
				else
					next_state <= rotate_ccw_3;
				end if;

			when rotate_ccw_4 =>
				-- calculate new position				
				new_draw_erase_start <= '0';
				new_cur_x_new        <= cur_x;
				new_cur_y_new        <= cur_y;
				new_cur_rot_new      <= std_logic_vector(unsigned(cur_rot) - 1);

				next_state <= move_left_5;

			when soft_drop_1 =>
				if (inv_inputs(4) = '1' and cur_timer_1_time = "00011110") then
					next_state <= soft_drop_2;
				else
					next_state <= hard_drop_1;
				end if;

			when soft_drop_2 =>
				new_timer_1_reset <= '1';
				new_timer_1_start <= '0';
				new_timer_1_time  <= "00000011";

				next_state <= soft_drop_3;

			when soft_drop_3 =>
				new_timer_1_reset <= '0';
				new_timer_1_start <= '1';

				next_state <= draw;

			when hard_drop_1 =>
				if (inv_inputs(5) = '1' and cur_timer_1_time = "00011110") then
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
