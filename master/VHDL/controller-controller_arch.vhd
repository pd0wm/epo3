library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.vga_params.all;

architecture controller_arch of controller is
	type state_type
	is (reset, init, drop_timer_reset, gen_piece_1, gen_piece_2, collision_1, collision_2, collision_3, collision_4, collision_5, draw, kernel_panic, lock_overflow, reset_timers_a_1, reset_timers_a_2, clear_shift_1, clear_shift_2, space_1, space_2, space_3, space_4, space_5, space_6, put_back_1, put_back_2, put_back_3, put_back_4, move_down_1, move_down_2, move_down_3, move_down_4, reset_timers_b_1, reset_timers_b_2, drop_overflow, rotate, key, lock_timer_start, game_over);
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
	signal new_lut_start         : std_logic;
	signal new_new_piece         : std_logic;
	signal new_check_start       : std_logic;
	signal new_draw_erase_draw   : std_logic;
	signal new_draw_erase_start  : std_logic;
	signal new_clear_shift_start : std_logic;
	signal new_draw_score_draw   : std_logic;
	signal new_timer_1_time      : std_logic_vector(7 downto 0);
	signal new_timer_1_start     : std_logic;
	signal new_timer_1_reset     : std_logic;
	signal new_timer_2_time      : std_logic_vector(7 downto 0);
	signal new_timer_2_start     : std_logic;
	signal new_timer_2_reset     : std_logic;

	signal cur_lut_x             : std_logic_vector(2 downto 0);
	signal cur_lut_y             : std_logic_vector(3 downto 0);
	signal cur_lut_rot           : std_logic_vector(1 downto 0);
	signal cur_lut_piece_type    : std_logic_vector(2 downto 0);
	signal cur_lut_start         : std_logic;
	signal cur_new_piece         : std_logic;
	signal cur_check_start       : std_logic;
	signal cur_draw_erase_draw   : std_logic;
	signal cur_draw_erase_start  : std_logic;
	signal cur_clear_shift_start : std_logic;
	signal cur_draw_score_draw   : std_logic;
	signal cur_timer_1_time      : std_logic_vector(7 downto 0);
	signal cur_timer_1_start     : std_logic;
	signal cur_timer_1_reset     : std_logic;
	signal cur_timer_2_time      : std_logic_vector(7 downto 0);
	signal cur_timer_2_start     : std_logic;
	signal cur_timer_2_reset     : std_logic;

begin
	process(clk, rst)
	begin
		if (rising_edge(clk)) then
			if (rst = '1') then
				cur_state <= reset;

			else

				-- Signals
				cur_piece   <= new_cur_piece;
				cur_x       <= new_cur_x;
				cur_x_new   <= new_cur_x_new;
				cur_y       <= new_cur_y;
				cur_y_new   <= new_cur_y_new;
				cur_rot     <= new_cur_rot;
				cur_rot_new <= new_cur_rot_new;
				cur_state   <= next_state;

				cur_lut_x             <= new_lut_x;
				cur_lut_y             <= new_lut_y;
				cur_lut_rot           <= new_lut_rot;
				cur_lut_piece_type    <= new_lut_piece_type;
				cur_lut_start         <= new_lut_start;
				cur_new_piece         <= new_new_piece;
				cur_check_start       <= new_check_start;
				cur_draw_erase_draw   <= new_draw_erase_draw;
				cur_draw_erase_start  <= new_draw_erase_start;
				cur_clear_shift_start <= new_clear_shift_start;
				cur_draw_score_draw   <= new_draw_score_draw;
				cur_timer_1_time      <= new_timer_1_time;
				cur_timer_1_start     <= new_timer_1_start;
				cur_timer_1_reset     <= new_timer_1_reset;
				cur_timer_2_time      <= new_timer_2_time;
				cur_timer_2_start     <= new_timer_2_start;
				cur_timer_2_reset     <= new_timer_2_reset;
			end if;
		end if;

		-- Outputs
		lut_x             <= new_lut_x;
		lut_y             <= new_lut_y;
		lut_rot           <= new_lut_rot;
		lut_piece_type    <= new_lut_piece_type;
		lut_start         <= new_lut_start;
		new_piece         <= new_new_piece;
		check_start       <= new_check_start;
		draw_erase_draw   <= new_draw_erase_draw;
		draw_erase_start  <= new_draw_erase_start;
		clear_shift_start <= new_clear_shift_start;
		draw_score_draw   <= new_draw_score_draw;
		timer_1_time      <= new_timer_1_time;
		timer_1_start     <= new_timer_1_start;
		timer_1_reset     <= new_timer_1_reset;
		timer_2_time      <= new_timer_2_time;
		timer_2_start     <= new_timer_2_start;
		timer_2_reset     <= new_timer_2_reset;

	end process;

	process(cur_state, lut_ready, draw_erase_ready, clear_shift_ready, draw_score_ready, timer_1_done, inputs)
	begin
		case cur_state is
			when reset =>
				-- LUT
				new_lut_x             <= (others => '0');
				new_lut_y             <= (others => '0');
				new_lut_rot           <= (others => '0');
				new_lut_piece_type    <= (others => '0');
				new_lut_start         <= '0';
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
				new_timer_2_time      <= (others => '0');
				new_timer_2_start     <= '0';
				new_timer_2_reset     <= '0';
				-- local signals
				new_cur_piece         <= (others => '0');
				new_cur_x             <= (others => '0');
				new_cur_y             <= (others => '0');
				new_cur_rot           <= (others => '0');
				new_new_piece         <= '0';
				new_cur_x_new         <= (others => '0');
				new_cur_y_new         <= (others => '0');
				new_cur_rot_new       <= (others => '0');

				next_state <= init;

			when init =>
				new_timer_1_time <= "00111100"; -- 60, 1 second
				new_timer_2_time <= "00111100"; -- 60, 1 second
				new_cur_x        <= "011";
				new_cur_y        <= "0000";

				-- Keep signals
				new_cur_piece   <= cur_piece;
				new_cur_x_new   <= cur_x_new;
				new_cur_y_new   <= cur_y_new;
				new_cur_rot     <= cur_rot;
				new_cur_rot_new <= cur_rot_new;

				-- Keep outputs
				new_lut_x             <= cur_lut_x;
				new_lut_y             <= cur_lut_y;
				new_lut_rot           <= cur_lut_rot;
				new_lut_piece_type    <= cur_lut_piece_type;
				new_lut_start         <= cur_lut_start;
				new_new_piece         <= cur_new_piece;
				new_check_start       <= cur_check_start;
				new_draw_erase_draw   <= cur_draw_erase_draw;
				new_draw_erase_start  <= cur_draw_erase_start;
				new_clear_shift_start <= cur_clear_shift_start;
				new_draw_score_draw   <= cur_draw_score_draw;
				new_timer_1_start     <= cur_timer_1_start;
				new_timer_1_reset     <= cur_timer_1_reset;
				new_timer_2_start     <= cur_timer_2_start;
				new_timer_2_reset     <= cur_timer_2_reset;

				next_state <= gen_piece_1;

			when gen_piece_1 =>
				new_cur_piece <= next_piece;
				new_new_piece <= '1';   -- generate new piece for next time

				-- Keep signals
				new_cur_x       <= cur_x;
				new_cur_x_new   <= cur_x_new;
				new_cur_y       <= cur_y;
				new_cur_y_new   <= cur_y_new;
				new_cur_rot     <= cur_rot;
				new_cur_rot_new <= cur_rot_new;

				-- Keep outputs
				new_lut_x             <= cur_lut_x;
				new_lut_y             <= cur_lut_y;
				new_lut_rot           <= cur_lut_rot;
				new_lut_piece_type    <= cur_lut_piece_type;
				new_lut_start         <= cur_lut_start;
				new_check_start       <= cur_check_start;
				new_draw_erase_draw   <= cur_draw_erase_draw;
				new_draw_erase_start  <= cur_draw_erase_start;
				new_clear_shift_start <= cur_clear_shift_start;
				new_draw_score_draw   <= cur_draw_score_draw;
				new_timer_1_time      <= cur_timer_1_time;
				new_timer_1_start     <= cur_timer_1_start;
				new_timer_1_reset     <= cur_timer_1_reset;
				new_timer_2_time      <= cur_timer_2_time;
				new_timer_2_start     <= cur_timer_2_start;
				new_timer_2_reset     <= cur_timer_2_reset;

				next_state <= gen_piece_2;

			when gen_piece_2 =>
				new_new_piece <= '0';

				-- Keep signals
				new_cur_piece   <= cur_piece;
				new_cur_x       <= cur_x;
				new_cur_x_new   <= cur_x_new;
				new_cur_y       <= cur_y;
				new_cur_y_new   <= cur_y_new;
				new_cur_rot     <= cur_rot;
				new_cur_rot_new <= cur_rot_new;

				-- Keep outputs
				new_lut_x             <= cur_lut_x;
				new_lut_y             <= cur_lut_y;
				new_lut_rot           <= cur_lut_rot;
				new_lut_piece_type    <= cur_lut_piece_type;
				new_lut_start         <= cur_lut_start;
				new_check_start       <= cur_check_start;
				new_draw_erase_draw   <= cur_draw_erase_draw;
				new_draw_erase_start  <= cur_draw_erase_start;
				new_clear_shift_start <= cur_clear_shift_start;
				new_draw_score_draw   <= cur_draw_score_draw;
				new_timer_1_time      <= cur_timer_1_time;
				new_timer_1_start     <= cur_timer_1_start;
				new_timer_1_reset     <= cur_timer_1_reset;
				new_timer_2_time      <= cur_timer_2_time;
				new_timer_2_start     <= cur_timer_2_start;
				new_timer_2_reset     <= cur_timer_2_reset;

				next_state <= collision_1;

			when collision_1 =>
				-- Generate mask for cur_piece
				new_lut_rot        <= new_cur_rot;
				new_lut_x          <= new_cur_x;
				new_lut_y          <= new_cur_y;
				new_lut_piece_type <= new_cur_piece;
				new_lut_start      <= '1';

				-- Keep signals
				new_cur_piece   <= cur_piece;
				new_cur_x       <= cur_x;
				new_cur_x_new   <= cur_x_new;
				new_cur_y       <= cur_y;
				new_cur_y_new   <= cur_y_new;
				new_cur_rot     <= cur_rot;
				new_cur_rot_new <= cur_rot_new;

				-- Keep outputs
				new_new_piece         <= cur_new_piece;
				new_check_start       <= cur_check_start;
				new_draw_erase_draw   <= cur_draw_erase_draw;
				new_draw_erase_start  <= cur_draw_erase_start;
				new_clear_shift_start <= cur_clear_shift_start;
				new_draw_score_draw   <= cur_draw_score_draw;
				new_timer_1_time      <= cur_timer_1_time;
				new_timer_1_start     <= cur_timer_1_start;
				new_timer_1_reset     <= cur_timer_1_reset;
				new_timer_2_time      <= cur_timer_2_time;
				new_timer_2_start     <= cur_timer_2_start;
				new_timer_2_reset     <= cur_timer_2_reset;

				next_state <= collision_2;

			when collision_2 =>
				-- Wait for lut ready, about 6 cycles
				if (lut_ready = '1') then
					new_lut_start <= '0';
					next_state    <= collision_3;
				else
					next_state <= collision_2;
				end if;

				-- Keep signals
				new_cur_piece   <= cur_piece;
				new_cur_x       <= cur_x;
				new_cur_x_new   <= cur_x_new;
				new_cur_y       <= cur_y;
				new_cur_y_new   <= cur_y_new;
				new_cur_rot     <= cur_rot;
				new_cur_rot_new <= cur_rot_new;

				-- Keep outputs
				new_lut_x             <= cur_lut_x;
				new_lut_y             <= cur_lut_y;
				new_lut_rot           <= cur_lut_rot;
				new_lut_piece_type    <= cur_lut_piece_type;
				new_lut_start         <= cur_lut_start;
				new_new_piece         <= cur_new_piece;
				new_check_start       <= cur_check_start;
				new_draw_erase_draw   <= cur_draw_erase_draw;
				new_draw_erase_start  <= cur_draw_erase_start;
				new_clear_shift_start <= cur_clear_shift_start;
				new_draw_score_draw   <= cur_draw_score_draw;
				new_timer_1_time      <= cur_timer_1_time;
				new_timer_1_start     <= cur_timer_1_start;
				new_timer_1_reset     <= cur_timer_1_reset;
				new_timer_2_time      <= cur_timer_2_time;
				new_timer_2_start     <= cur_timer_2_start;
				new_timer_2_reset     <= cur_timer_2_reset;

			when collision_3 =>
				-- Check mask
				new_check_start <= '1';

				-- Keep signals
				new_cur_piece   <= cur_piece;
				new_cur_x       <= cur_x;
				new_cur_x_new   <= cur_x_new;
				new_cur_y       <= cur_y;
				new_cur_y_new   <= cur_y_new;
				new_cur_rot     <= cur_rot;
				new_cur_rot_new <= cur_rot_new;

				-- Keep outputs
				new_lut_x             <= cur_lut_x;
				new_lut_y             <= cur_lut_y;
				new_lut_rot           <= cur_lut_rot;
				new_lut_piece_type    <= cur_lut_piece_type;
				new_lut_start         <= cur_lut_start;
				new_new_piece         <= cur_new_piece;
				new_draw_erase_draw   <= cur_draw_erase_draw;
				new_draw_erase_start  <= cur_draw_erase_start;
				new_clear_shift_start <= cur_clear_shift_start;
				new_draw_score_draw   <= cur_draw_score_draw;
				new_timer_1_time      <= cur_timer_1_time;
				new_timer_1_start     <= cur_timer_1_start;
				new_timer_1_reset     <= cur_timer_1_reset;
				new_timer_2_time      <= cur_timer_2_time;
				new_timer_2_start     <= cur_timer_2_start;
				new_timer_2_reset     <= cur_timer_2_reset;

				next_state <= collision_4;

			when collision_4 =>
				-- Wait for check mask ready, about ?
				if (check_ready = '1') then
					next_state <= collision_5;
				else
					next_state <= collision_4;
				end if;

				-- Keep signals
				new_cur_piece   <= cur_piece;
				new_cur_x       <= cur_x;
				new_cur_x_new   <= cur_x_new;
				new_cur_y       <= cur_y;
				new_cur_y_new   <= cur_y_new;
				new_cur_rot     <= cur_rot;
				new_cur_rot_new <= cur_rot_new;

				-- Keep outputs
				new_lut_x             <= cur_lut_x;
				new_lut_y             <= cur_lut_y;
				new_lut_rot           <= cur_lut_rot;
				new_lut_piece_type    <= cur_lut_piece_type;
				new_lut_start         <= cur_lut_start;
				new_new_piece         <= cur_new_piece;
				new_check_start       <= cur_check_start;
				new_draw_erase_draw   <= cur_draw_erase_draw;
				new_draw_erase_start  <= cur_draw_erase_start;
				new_clear_shift_start <= cur_clear_shift_start;
				new_draw_score_draw   <= cur_draw_score_draw;
				new_timer_1_time      <= cur_timer_1_time;
				new_timer_1_start     <= cur_timer_1_start;
				new_timer_1_reset     <= cur_timer_1_reset;
				new_timer_2_time      <= cur_timer_2_time;
				new_timer_2_start     <= cur_timer_2_start;
				new_timer_2_reset     <= cur_timer_2_reset;

			when collision_5 =>
				-- Keep signals
				new_cur_piece   <= cur_piece;
				new_cur_x       <= cur_x;
				new_cur_x_new   <= cur_x_new;
				new_cur_y       <= cur_y;
				new_cur_y_new   <= cur_y_new;
				new_cur_rot     <= cur_rot;
				new_cur_rot_new <= cur_rot_new;

				-- Keep outputs
				new_lut_x             <= cur_lut_x;
				new_lut_y             <= cur_lut_y;
				new_lut_rot           <= cur_lut_rot;
				new_lut_piece_type    <= cur_lut_piece_type;
				new_lut_start         <= cur_lut_start;
				new_new_piece         <= cur_new_piece;
				new_check_start       <= cur_check_start;
				new_draw_erase_draw   <= cur_draw_erase_draw;
				new_draw_erase_start  <= cur_draw_erase_start;
				new_clear_shift_start <= cur_clear_shift_start;
				new_draw_score_draw   <= cur_draw_score_draw;
				new_timer_1_time      <= cur_timer_1_time;
				new_timer_1_start     <= cur_timer_1_start;
				new_timer_1_reset     <= cur_timer_1_reset;
				new_timer_2_time      <= cur_timer_2_time;
				new_timer_2_start     <= cur_timer_2_start;
				new_timer_2_reset     <= cur_timer_2_reset;

				if (check_empty = '1') then
					next_state <= game_over;
				else
					next_state <= draw;
				end if;

			when draw =>
				new_timer_1_start <= '1';

				-- Keep signals
				new_cur_piece   <= cur_piece;
				new_cur_x       <= cur_x;
				new_cur_x_new   <= cur_x_new;
				new_cur_y       <= cur_y;
				new_cur_y_new   <= cur_y_new;
				new_cur_rot     <= cur_rot;
				new_cur_rot_new <= cur_rot_new;

				-- Keep outputs
				new_lut_x             <= cur_lut_x;
				new_lut_y             <= cur_lut_y;
				new_lut_rot           <= cur_lut_rot;
				new_lut_piece_type    <= cur_lut_piece_type;
				new_lut_start         <= cur_lut_start;
				new_new_piece         <= cur_new_piece;
				new_check_start       <= cur_check_start;
				new_draw_erase_draw   <= cur_draw_erase_draw;
				new_draw_erase_start  <= cur_draw_erase_start;
				new_clear_shift_start <= cur_clear_shift_start;
				new_draw_score_draw   <= cur_draw_score_draw;
				new_timer_1_time      <= cur_timer_1_time;
				new_timer_1_reset     <= cur_timer_1_reset;
				new_timer_2_time      <= cur_timer_2_time;
				new_timer_2_start     <= cur_timer_2_start;
				new_timer_2_reset     <= cur_timer_2_reset;

				next_state <= lock_overflow;

			when lock_overflow =>
				if (timer_2_done = '1') then
					next_state <= reset_timers_a_1;
				else
					next_state <= drop_overflow;
				end if;

				-- Keep signals
				new_cur_piece   <= cur_piece;
				new_cur_x       <= cur_x;
				new_cur_x_new   <= cur_x_new;
				new_cur_y       <= cur_y;
				new_cur_y_new   <= cur_y_new;
				new_cur_rot     <= cur_rot;
				new_cur_rot_new <= cur_rot_new;

				-- Keep outputs
				new_lut_x             <= cur_lut_x;
				new_lut_y             <= cur_lut_y;
				new_lut_rot           <= cur_lut_rot;
				new_lut_piece_type    <= cur_lut_piece_type;
				new_lut_start         <= cur_lut_start;
				new_new_piece         <= cur_new_piece;
				new_check_start       <= cur_check_start;
				new_draw_erase_draw   <= cur_draw_erase_draw;
				new_draw_erase_start  <= cur_draw_erase_start;
				new_clear_shift_start <= cur_clear_shift_start;
				new_draw_score_draw   <= cur_draw_score_draw;
				new_timer_1_time      <= cur_timer_1_time;
				new_timer_1_start     <= cur_timer_1_start;
				new_timer_1_reset     <= cur_timer_1_reset;
				new_timer_2_time      <= cur_timer_2_time;
				new_timer_2_start     <= cur_timer_2_start;
				new_timer_2_reset     <= cur_timer_2_reset;

			when reset_timers_a_1 =>
				new_timer_1_start <= '0';
				new_timer_2_start <= '0';
				new_timer_1_reset <= '1';
				new_timer_2_reset <= '1';
				new_timer_1_time  <= "00111100"; -- 60, 1 second
				new_timer_2_time  <= "00111100"; -- 60, 1 second

				-- Keep signals
				new_cur_piece   <= cur_piece;
				new_cur_x       <= cur_x;
				new_cur_x_new   <= cur_x_new;
				new_cur_y       <= cur_y;
				new_cur_y_new   <= cur_y_new;
				new_cur_rot     <= cur_rot;
				new_cur_rot_new <= cur_rot_new;

				-- Keep outputs
				new_lut_x             <= cur_lut_x;
				new_lut_y             <= cur_lut_y;
				new_lut_rot           <= cur_lut_rot;
				new_lut_piece_type    <= cur_lut_piece_type;
				new_lut_start         <= cur_lut_start;
				new_new_piece         <= cur_new_piece;
				new_check_start       <= cur_check_start;
				new_draw_erase_draw   <= cur_draw_erase_draw;
				new_draw_erase_start  <= cur_draw_erase_start;
				new_clear_shift_start <= cur_clear_shift_start;
				new_draw_score_draw   <= cur_draw_score_draw;

				next_state <= reset_timers_a_2;

			when reset_timers_a_2 =>
				new_timer_1_reset <= '0';
				new_timer_2_reset <= '0';

				-- Keep signals
				new_cur_piece   <= cur_piece;
				new_cur_x       <= cur_x;
				new_cur_x_new   <= cur_x_new;
				new_cur_y       <= cur_y;
				new_cur_y_new   <= cur_y_new;
				new_cur_rot     <= cur_rot;
				new_cur_rot_new <= cur_rot_new;

				-- Keep outputs
				new_lut_x             <= cur_lut_x;
				new_lut_y             <= cur_lut_y;
				new_lut_rot           <= cur_lut_rot;
				new_lut_piece_type    <= cur_lut_piece_type;
				new_lut_start         <= cur_lut_start;
				new_new_piece         <= cur_new_piece;
				new_check_start       <= cur_check_start;
				new_draw_erase_draw   <= cur_draw_erase_draw;
				new_draw_erase_start  <= cur_draw_erase_start;
				new_clear_shift_start <= cur_clear_shift_start;
				new_draw_score_draw   <= cur_draw_score_draw;
				new_timer_1_time      <= cur_timer_1_time;
				new_timer_1_start     <= cur_timer_1_start;
				new_timer_2_time      <= cur_timer_2_time;
				new_timer_2_start     <= cur_timer_2_start;

				next_state <= clear_shift_1;

			when clear_shift_1 =>
				new_clear_shift_start <= '1';

				-- Keep signals
				new_cur_piece   <= cur_piece;
				new_cur_x       <= cur_x;
				new_cur_x_new   <= cur_x_new;
				new_cur_y       <= cur_y;
				new_cur_y_new   <= cur_y_new;
				new_cur_rot     <= cur_rot;
				new_cur_rot_new <= cur_rot_new;

				-- Keep outputs
				new_lut_x            <= cur_lut_x;
				new_lut_y            <= cur_lut_y;
				new_lut_rot          <= cur_lut_rot;
				new_lut_piece_type   <= cur_lut_piece_type;
				new_lut_start        <= cur_lut_start;
				new_new_piece        <= cur_new_piece;
				new_check_start      <= cur_check_start;
				new_draw_erase_draw  <= cur_draw_erase_draw;
				new_draw_erase_start <= cur_draw_erase_start;
				new_draw_score_draw  <= cur_draw_score_draw;
				new_timer_1_time     <= cur_timer_1_time;
				new_timer_1_start    <= cur_timer_1_start;
				new_timer_1_reset    <= cur_timer_1_reset;
				new_timer_2_time     <= cur_timer_2_time;
				new_timer_2_start    <= cur_timer_2_start;
				new_timer_2_reset    <= cur_timer_2_reset;

				next_state <= clear_shift_2;

			when clear_shift_2 =>
				if (clear_shift_ready = '1') then
					next_state <= gen_piece_1;
				else
					next_state <= clear_shift_2;
				end if;

				-- Keep signals
				new_cur_piece   <= cur_piece;
				new_cur_x       <= cur_x;
				new_cur_x_new   <= cur_x_new;
				new_cur_y       <= cur_y;
				new_cur_y_new   <= cur_y_new;
				new_cur_rot     <= cur_rot;
				new_cur_rot_new <= cur_rot_new;

				-- Keep outputs
				new_lut_x             <= cur_lut_x;
				new_lut_y             <= cur_lut_y;
				new_lut_rot           <= cur_lut_rot;
				new_lut_piece_type    <= cur_lut_piece_type;
				new_lut_start         <= cur_lut_start;
				new_new_piece         <= cur_new_piece;
				new_check_start       <= cur_check_start;
				new_draw_erase_draw   <= cur_draw_erase_draw;
				new_draw_erase_start  <= cur_draw_erase_start;
				new_clear_shift_start <= cur_clear_shift_start;
				new_draw_score_draw   <= cur_draw_score_draw;
				new_timer_1_time      <= cur_timer_1_time;
				new_timer_1_start     <= cur_timer_1_start;
				new_timer_1_reset     <= cur_timer_1_reset;
				new_timer_2_time      <= cur_timer_2_time;
				new_timer_2_start     <= cur_timer_2_start;
				new_timer_2_reset     <= cur_timer_2_reset;

			when drop_overflow =>
				if (timer_1_done = '1') then
					next_state <= space_1;
				else
					next_state <= key;
				end if;

				-- Keep signals
				new_cur_piece   <= cur_piece;
				new_cur_x       <= cur_x;
				new_cur_x_new   <= cur_x_new;
				new_cur_y       <= cur_y;
				new_cur_y_new   <= cur_y_new;
				new_cur_rot     <= cur_rot;
				new_cur_rot_new <= cur_rot_new;

				-- Keep outputs
				new_lut_x             <= cur_lut_x;
				new_lut_y             <= cur_lut_y;
				new_lut_rot           <= cur_lut_rot;
				new_lut_piece_type    <= cur_lut_piece_type;
				new_lut_start         <= cur_lut_start;
				new_new_piece         <= cur_new_piece;
				new_check_start       <= cur_check_start;
				new_draw_erase_draw   <= cur_draw_erase_draw;
				new_draw_erase_start  <= cur_draw_erase_start;
				new_clear_shift_start <= cur_clear_shift_start;
				new_draw_score_draw   <= cur_draw_score_draw;
				new_timer_1_time      <= cur_timer_1_time;
				new_timer_1_start     <= cur_timer_1_start;
				new_timer_1_reset     <= cur_timer_1_reset;
				new_timer_2_time      <= cur_timer_2_time;
				new_timer_2_start     <= cur_timer_2_start;
				new_timer_2_reset     <= cur_timer_2_reset;

			when space_1 =>
				-- First remove current piece
				new_draw_erase_draw  <= '0'; -- erase
				new_draw_erase_start <= '1';

				-- Keep signals
				new_cur_piece   <= cur_piece;
				new_cur_x       <= cur_x;
				new_cur_x_new   <= cur_x_new;
				new_cur_y       <= cur_y;
				new_cur_y_new   <= cur_y_new;
				new_cur_rot     <= cur_rot;
				new_cur_rot_new <= cur_rot_new;

				-- Keep outputs
				new_lut_x             <= cur_lut_x;
				new_lut_y             <= cur_lut_y;
				new_lut_rot           <= cur_lut_rot;
				new_lut_piece_type    <= cur_lut_piece_type;
				new_lut_start         <= cur_lut_start;
				new_new_piece         <= cur_new_piece;
				new_check_start       <= cur_check_start;
				new_clear_shift_start <= cur_clear_shift_start;
				new_draw_score_draw   <= cur_draw_score_draw;
				new_timer_1_time      <= cur_timer_1_time;
				new_timer_1_start     <= cur_timer_1_start;
				new_timer_1_reset     <= cur_timer_1_reset;
				new_timer_2_time      <= cur_timer_2_time;
				new_timer_2_start     <= cur_timer_2_start;
				new_timer_2_reset     <= cur_timer_2_reset;

				next_state <= space_2;

			when space_2 =>
				if (draw_erase_ready = '1') then
					new_draw_erase_start <= '0';
					next_state           <= space_3;
				else
					new_draw_erase_start <= '1';
					next_state           <= space_2;
				end if;

				-- Keep signals
				new_cur_piece   <= cur_piece;
				new_cur_x       <= cur_x;
				new_cur_x_new   <= cur_x_new;
				new_cur_y       <= cur_y;
				new_cur_y_new   <= cur_y_new;
				new_cur_rot     <= cur_rot;
				new_cur_rot_new <= cur_rot_new;

				-- Keep outputs
				new_lut_x             <= cur_lut_x;
				new_lut_y             <= cur_lut_y;
				new_lut_rot           <= cur_lut_rot;
				new_lut_piece_type    <= cur_lut_piece_type;
				new_lut_start         <= cur_lut_start;
				new_new_piece         <= cur_new_piece;
				new_draw_erase_draw   <= cur_draw_erase_draw;
				new_check_start       <= cur_check_start;
				new_clear_shift_start <= cur_clear_shift_start;
				new_draw_score_draw   <= cur_draw_score_draw;
				new_timer_1_time      <= cur_timer_1_time;
				new_timer_1_start     <= cur_timer_1_start;
				new_timer_1_reset     <= cur_timer_1_reset;
				new_timer_2_time      <= cur_timer_2_time;
				new_timer_2_start     <= cur_timer_2_start;
				new_timer_2_reset     <= cur_timer_2_reset;

			when space_3 =>
				new_cur_y_new <= std_logic_vector(unsigned(new_cur_y) + 1);

				-- Keep signals
				new_cur_piece   <= cur_piece;
				new_cur_x       <= cur_x;
				new_cur_x_new   <= cur_x_new;
				new_cur_y       <= cur_y;
				new_cur_rot     <= cur_rot;
				new_cur_rot_new <= cur_rot_new;

				-- Keep outputs
				new_lut_x             <= cur_lut_x;
				new_lut_y             <= cur_lut_y;
				new_lut_rot           <= cur_lut_rot;
				new_lut_piece_type    <= cur_lut_piece_type;
				new_lut_start         <= cur_lut_start;
				new_new_piece         <= cur_new_piece;
				new_check_start       <= cur_check_start;
				new_draw_erase_draw   <= cur_draw_erase_draw;
				new_draw_erase_start  <= cur_draw_erase_start;
				new_clear_shift_start <= cur_clear_shift_start;
				new_draw_score_draw   <= cur_draw_score_draw;
				new_timer_1_time      <= cur_timer_1_time;
				new_timer_1_start     <= cur_timer_1_start;
				new_timer_1_reset     <= cur_timer_1_reset;
				new_timer_2_time      <= cur_timer_2_time;
				new_timer_2_start     <= cur_timer_2_start;
				new_timer_2_reset     <= cur_timer_2_reset;

				next_state <= space_4;

			when space_4 =>
				new_lut_rot        <= new_cur_rot;
				new_lut_x          <= new_cur_x;
				new_lut_y          <= new_cur_y_new;
				new_lut_piece_type <= new_cur_piece;
				new_lut_start      <= '1';

				-- Keep signals
				new_cur_piece   <= cur_piece;
				new_cur_x       <= cur_x;
				new_cur_x_new   <= cur_x_new;
				new_cur_y       <= cur_y;
				new_cur_y_new   <= cur_y_new;
				new_cur_rot     <= cur_rot;
				new_cur_rot_new <= cur_rot_new;

				-- Keep outputs
				new_new_piece         <= cur_new_piece;
				new_check_start       <= cur_check_start;
				new_draw_erase_draw   <= cur_draw_erase_draw;
				new_draw_erase_start  <= cur_draw_erase_start;
				new_clear_shift_start <= cur_clear_shift_start;
				new_draw_score_draw   <= cur_draw_score_draw;
				new_timer_1_time      <= cur_timer_1_time;
				new_timer_1_start     <= cur_timer_1_start;
				new_timer_1_reset     <= cur_timer_1_reset;
				new_timer_2_time      <= cur_timer_2_time;
				new_timer_2_start     <= cur_timer_2_start;
				new_timer_2_reset     <= cur_timer_2_reset;

				next_state <= space_5;

			when space_5 =>
				if (lut_ready = '1') then
					new_lut_start <= '0';
					next_state    <= space_6;
				else
					new_lut_start <= '1';
					next_state    <= space_5;
				end if;

				-- Keep signals
				new_cur_piece   <= cur_piece;
				new_cur_x       <= cur_x;
				new_cur_x_new   <= cur_x_new;
				new_cur_y       <= cur_y;
				new_cur_y_new   <= cur_y_new;
				new_cur_rot     <= cur_rot;
				new_cur_rot_new <= cur_rot_new;

				-- Keep outputs
				new_lut_x             <= cur_lut_x;
				new_lut_y             <= cur_lut_y;
				new_lut_rot           <= cur_lut_rot;
				new_lut_piece_type    <= cur_lut_piece_type;
				new_new_piece         <= cur_new_piece;
				new_check_start       <= cur_check_start;
				new_draw_erase_draw   <= cur_draw_erase_draw;
				new_draw_erase_start  <= cur_draw_erase_start;
				new_clear_shift_start <= cur_clear_shift_start;
				new_draw_score_draw   <= cur_draw_score_draw;
				new_timer_1_time      <= cur_timer_1_time;
				new_timer_1_start     <= cur_timer_1_start;
				new_timer_1_reset     <= cur_timer_1_reset;
				new_timer_2_time      <= cur_timer_2_time;
				new_timer_2_start     <= cur_timer_2_start;
				new_timer_2_reset     <= cur_timer_2_reset;

			when space_6 =>
				if (lut_error = '0') then
					new_cur_y  <= cur_y_new;
					next_state <= move_down_1;
				else
					new_cur_y  <= cur_y;
					next_state <= put_back_1;
				end if;

				-- Keep signals
				new_cur_piece   <= cur_piece;
				new_cur_x       <= cur_x;
				new_cur_x_new   <= cur_x_new;
				new_cur_y_new   <= cur_y_new;
				new_cur_rot     <= cur_rot;
				new_cur_rot_new <= cur_rot_new;

				-- Keep outputs
				new_lut_x             <= cur_lut_x;
				new_lut_y             <= cur_lut_y;
				new_lut_rot           <= cur_lut_rot;
				new_lut_piece_type    <= cur_lut_piece_type;
				new_lut_start         <= cur_lut_start;
				new_new_piece         <= cur_new_piece;
				new_check_start       <= cur_check_start;
				new_draw_erase_draw   <= cur_draw_erase_draw;
				new_draw_erase_start  <= cur_draw_erase_start;
				new_clear_shift_start <= cur_clear_shift_start;
				new_draw_score_draw   <= cur_draw_score_draw;
				new_timer_1_time      <= cur_timer_1_time;
				new_timer_1_start     <= cur_timer_1_start;
				new_timer_1_reset     <= cur_timer_1_reset;
				new_timer_2_time      <= cur_timer_2_time;
				new_timer_2_start     <= cur_timer_2_start;
				new_timer_2_reset     <= cur_timer_2_reset;

			when put_back_1 =>
				new_lut_rot        <= new_cur_rot;
				new_lut_x          <= new_cur_x;
				new_lut_y          <= new_cur_y;
				new_lut_piece_type <= new_cur_piece;
				new_lut_start      <= '1';

				-- Keep signals
				new_cur_piece   <= cur_piece;
				new_cur_x       <= cur_x;
				new_cur_x_new   <= cur_x_new;
				new_cur_y       <= cur_y;
				new_cur_y_new   <= cur_y_new;
				new_cur_rot     <= cur_rot;
				new_cur_rot_new <= cur_rot_new;

				-- Keep outputs
				new_new_piece         <= cur_new_piece;
				new_check_start       <= cur_check_start;
				new_draw_erase_draw   <= cur_draw_erase_draw;
				new_draw_erase_start  <= cur_draw_erase_start;
				new_clear_shift_start <= cur_clear_shift_start;
				new_draw_score_draw   <= cur_draw_score_draw;
				new_timer_1_time      <= cur_timer_1_time;
				new_timer_1_start     <= cur_timer_1_start;
				new_timer_1_reset     <= cur_timer_1_reset;
				new_timer_2_time      <= cur_timer_2_time;
				new_timer_2_start     <= cur_timer_2_start;
				new_timer_2_reset     <= cur_timer_2_reset;

				next_state <= put_back_2;

			when put_back_2 =>
				if (lut_ready = '1') then
					new_lut_start <= '0';
					next_state    <= put_back_3;
				else
					new_lut_start <= '1';
					next_state    <= put_back_2;
				end if;

				-- Keep signals
				new_cur_piece   <= cur_piece;
				new_cur_x       <= cur_x;
				new_cur_x_new   <= cur_x_new;
				new_cur_y       <= cur_y;
				new_cur_y_new   <= cur_y_new;
				new_cur_rot     <= cur_rot;
				new_cur_rot_new <= cur_rot_new;

				-- Keep outputs
				new_lut_x             <= cur_lut_x;
				new_lut_y             <= cur_lut_y;
				new_lut_rot           <= cur_lut_rot;
				new_lut_piece_type    <= cur_lut_piece_type;
				new_new_piece         <= cur_new_piece;
				new_check_start       <= cur_check_start;
				new_draw_erase_draw   <= cur_draw_erase_draw;
				new_draw_erase_start  <= cur_draw_erase_start;
				new_clear_shift_start <= cur_clear_shift_start;
				new_draw_score_draw   <= cur_draw_score_draw;
				new_timer_1_time      <= cur_timer_1_time;
				new_timer_1_start     <= cur_timer_1_start;
				new_timer_1_reset     <= cur_timer_1_reset;
				new_timer_2_time      <= cur_timer_2_time;
				new_timer_2_start     <= cur_timer_2_start;
				new_timer_2_reset     <= cur_timer_2_reset;

			when put_back_3 =>
				new_draw_erase_draw  <= '1'; --draw
				new_draw_erase_start <= '1';

				-- Keep signals
				new_cur_piece   <= cur_piece;
				new_cur_x       <= cur_x;
				new_cur_x_new   <= cur_x_new;
				new_cur_y       <= cur_y;
				new_cur_y_new   <= cur_y_new;
				new_cur_rot     <= cur_rot;
				new_cur_rot_new <= cur_rot_new;

				-- Keep outputs
				new_lut_x             <= cur_lut_x;
				new_lut_y             <= cur_lut_y;
				new_lut_rot           <= cur_lut_rot;
				new_lut_piece_type    <= cur_lut_piece_type;
				new_lut_start         <= cur_lut_start;
				new_new_piece         <= cur_new_piece;
				new_check_start       <= cur_check_start;
				new_clear_shift_start <= cur_clear_shift_start;
				new_draw_score_draw   <= cur_draw_score_draw;
				new_timer_1_time      <= cur_timer_1_time;
				new_timer_1_start     <= cur_timer_1_start;
				new_timer_1_reset     <= cur_timer_1_reset;
				new_timer_2_time      <= cur_timer_2_time;
				new_timer_2_start     <= cur_timer_2_start;
				new_timer_2_reset     <= cur_timer_2_reset;

				next_state <= put_back_4;

			when put_back_4 =>
				if (draw_erase_ready = '1') then
					new_draw_erase_start <= '0';
					next_state           <= lock_timer_start;
				else
					new_draw_erase_start <= '1';
					next_state           <= put_back_4;
				end if;

				-- Keep signals
				new_cur_piece   <= cur_piece;
				new_cur_x       <= cur_x;
				new_cur_x_new   <= cur_x_new;
				new_cur_y       <= cur_y;
				new_cur_y_new   <= cur_y_new;
				new_cur_rot     <= cur_rot;
				new_cur_rot_new <= cur_rot_new;

				-- Keep outputs
				new_lut_x             <= cur_lut_x;
				new_lut_y             <= cur_lut_y;
				new_lut_rot           <= cur_lut_rot;
				new_lut_piece_type    <= cur_lut_piece_type;
				new_lut_start         <= cur_lut_start;
				new_new_piece         <= cur_new_piece;
				new_check_start       <= cur_check_start;
				new_draw_erase_draw   <= cur_draw_erase_draw;
				new_clear_shift_start <= cur_clear_shift_start;
				new_draw_score_draw   <= cur_draw_score_draw;
				new_timer_1_time      <= cur_timer_1_time;
				new_timer_1_start     <= cur_timer_1_start;
				new_timer_1_reset     <= cur_timer_1_reset;
				new_timer_2_time      <= cur_timer_2_time;
				new_timer_2_start     <= cur_timer_2_start;
				new_timer_2_reset     <= cur_timer_2_reset;

			when lock_timer_start =>
				new_timer_2_start <= '1';

				-- Keep signals
				new_cur_piece   <= cur_piece;
				new_cur_x       <= cur_x;
				new_cur_x_new   <= cur_x_new;
				new_cur_y       <= cur_y;
				new_cur_y_new   <= cur_y_new;
				new_cur_rot     <= cur_rot;
				new_cur_rot_new <= cur_rot_new;

				-- Keep outputs
				new_lut_x             <= cur_lut_x;
				new_lut_y             <= cur_lut_y;
				new_lut_rot           <= cur_lut_rot;
				new_lut_piece_type    <= cur_lut_piece_type;
				new_lut_start         <= cur_lut_start;
				new_new_piece         <= cur_new_piece;
				new_check_start       <= cur_check_start;
				new_draw_erase_draw   <= cur_draw_erase_draw;
				new_draw_erase_start  <= cur_draw_erase_start;
				new_clear_shift_start <= cur_clear_shift_start;
				new_draw_score_draw   <= cur_draw_score_draw;
				new_timer_1_time      <= cur_timer_1_time;
				new_timer_1_start     <= cur_timer_1_start;
				new_timer_1_reset     <= cur_timer_1_reset;
				new_timer_2_time      <= cur_timer_2_time;
				new_timer_2_reset     <= cur_timer_2_reset;

				next_state <= draw;

			when move_down_1 =>
				new_lut_rot        <= new_cur_rot;
				new_lut_x          <= new_cur_x;
				new_lut_y          <= new_cur_y;
				new_lut_piece_type <= new_cur_piece;
				new_lut_start      <= '1';

				-- Keep signals
				new_cur_piece   <= cur_piece;
				new_cur_x       <= cur_x;
				new_cur_x_new   <= cur_x_new;
				new_cur_y       <= cur_y;
				new_cur_y_new   <= cur_y_new;
				new_cur_rot     <= cur_rot;
				new_cur_rot_new <= cur_rot_new;

				-- Keep outputs
				new_new_piece         <= cur_new_piece;
				new_check_start       <= cur_check_start;
				new_draw_erase_draw   <= cur_draw_erase_draw;
				new_draw_erase_start  <= cur_draw_erase_start;
				new_clear_shift_start <= cur_clear_shift_start;
				new_draw_score_draw   <= cur_draw_score_draw;
				new_timer_1_time      <= cur_timer_1_time;
				new_timer_1_start     <= cur_timer_1_start;
				new_timer_1_reset     <= cur_timer_1_reset;
				new_timer_2_time      <= cur_timer_2_time;
				new_timer_2_start     <= cur_timer_2_start;
				new_timer_2_reset     <= cur_timer_2_reset;

				next_state <= move_down_2;

			when move_down_2 =>
				if (lut_ready = '1') then
					new_lut_start <= '0';
					next_state    <= move_down_3;
				else
					new_lut_start <= '1';
					next_state    <= move_down_2;
				end if;

				-- Keep signals
				new_cur_piece   <= cur_piece;
				new_cur_x       <= cur_x;
				new_cur_x_new   <= cur_x_new;
				new_cur_y       <= cur_y;
				new_cur_y_new   <= cur_y_new;
				new_cur_rot     <= cur_rot;
				new_cur_rot_new <= cur_rot_new;

				-- Keep outputs
				new_lut_x             <= cur_lut_x;
				new_lut_y             <= cur_lut_y;
				new_lut_rot           <= cur_lut_rot;
				new_lut_piece_type    <= cur_lut_piece_type;
				new_new_piece         <= cur_new_piece;
				new_check_start       <= cur_check_start;
				new_draw_erase_draw   <= cur_draw_erase_draw;
				new_draw_erase_start  <= cur_draw_erase_start;
				new_clear_shift_start <= cur_clear_shift_start;
				new_draw_score_draw   <= cur_draw_score_draw;
				new_timer_1_time      <= cur_timer_1_time;
				new_timer_1_start     <= cur_timer_1_start;
				new_timer_1_reset     <= cur_timer_1_reset;
				new_timer_2_time      <= cur_timer_2_time;
				new_timer_2_start     <= cur_timer_2_start;
				new_timer_2_reset     <= cur_timer_2_reset;

			when move_down_3 =>
				new_draw_erase_draw  <= '1'; --draw
				new_draw_erase_start <= '1';

				-- Keep signals
				new_cur_piece   <= cur_piece;
				new_cur_x       <= cur_x;
				new_cur_x_new   <= cur_x_new;
				new_cur_y       <= cur_y;
				new_cur_y_new   <= cur_y_new;
				new_cur_rot     <= cur_rot;
				new_cur_rot_new <= cur_rot_new;

				-- Keep outputs
				new_lut_x             <= cur_lut_x;
				new_lut_y             <= cur_lut_y;
				new_lut_rot           <= cur_lut_rot;
				new_lut_piece_type    <= cur_lut_piece_type;
				new_lut_start         <= cur_lut_start;
				new_new_piece         <= cur_new_piece;
				new_check_start       <= cur_check_start;
				new_clear_shift_start <= cur_clear_shift_start;
				new_draw_score_draw   <= cur_draw_score_draw;
				new_timer_1_time      <= cur_timer_1_time;
				new_timer_1_start     <= cur_timer_1_start;
				new_timer_1_reset     <= cur_timer_1_reset;
				new_timer_2_time      <= cur_timer_2_time;
				new_timer_2_start     <= cur_timer_2_start;
				new_timer_2_reset     <= cur_timer_2_reset;

				next_state <= move_down_4;

			when move_down_4 =>
				if (draw_erase_ready = '1') then
					new_draw_erase_start <= '0';
					next_state           <= reset_timers_b_1;
				else
					new_draw_erase_start <= '1';
					next_state           <= move_down_4;
				end if;

				-- Keep signals
				new_cur_piece   <= cur_piece;
				new_cur_x       <= cur_x;
				new_cur_x_new   <= cur_x_new;
				new_cur_y       <= cur_y;
				new_cur_y_new   <= cur_y_new;
				new_cur_rot     <= cur_rot;
				new_cur_rot_new <= cur_rot_new;

				-- Keep outputs
				new_lut_x             <= cur_lut_x;
				new_lut_y             <= cur_lut_y;
				new_lut_rot           <= cur_lut_rot;
				new_lut_piece_type    <= cur_lut_piece_type;
				new_lut_start         <= cur_lut_start;
				new_new_piece         <= cur_new_piece;
				new_check_start       <= cur_check_start;
				new_draw_erase_draw   <= cur_draw_erase_draw;
				new_clear_shift_start <= cur_clear_shift_start;
				new_draw_score_draw   <= cur_draw_score_draw;
				new_timer_1_time      <= cur_timer_1_time;
				new_timer_1_start     <= cur_timer_1_start;
				new_timer_1_reset     <= cur_timer_1_reset;
				new_timer_2_time      <= cur_timer_2_time;
				new_timer_2_start     <= cur_timer_2_start;
				new_timer_2_reset     <= cur_timer_2_reset;

			when reset_timers_b_1 =>
				new_timer_1_start <= '0';
				new_timer_1_reset <= '0';
				new_timer_1_time  <= "00111100"; -- 60, 1 second

				-- Keep signals
				new_cur_piece   <= cur_piece;
				new_cur_x       <= cur_x;
				new_cur_x_new   <= cur_x_new;
				new_cur_y       <= cur_y;
				new_cur_y_new   <= cur_y_new;
				new_cur_rot     <= cur_rot;
				new_cur_rot_new <= cur_rot_new;

				-- Keep outputs
				new_lut_x             <= cur_lut_x;
				new_lut_y             <= cur_lut_y;
				new_lut_rot           <= cur_lut_rot;
				new_lut_piece_type    <= cur_lut_piece_type;
				new_lut_start         <= cur_lut_start;
				new_new_piece         <= cur_new_piece;
				new_check_start       <= cur_check_start;
				new_draw_erase_draw   <= cur_draw_erase_draw;
				new_draw_erase_start  <= cur_draw_erase_start;
				new_clear_shift_start <= cur_clear_shift_start;
				new_draw_score_draw   <= cur_draw_score_draw;
				new_timer_2_time      <= cur_timer_2_time;
				new_timer_2_start     <= cur_timer_2_start;
				new_timer_2_reset     <= cur_timer_2_reset;

				next_state <= reset_timers_b_2;

			when reset_timers_b_2 =>
				new_timer_1_reset <= '0';

				-- Keep signals
				new_cur_piece   <= cur_piece;
				new_cur_x       <= cur_x;
				new_cur_x_new   <= cur_x_new;
				new_cur_y       <= cur_y;
				new_cur_y_new   <= cur_y_new;
				new_cur_rot     <= cur_rot;
				new_cur_rot_new <= cur_rot_new;

				-- Keep outputs
				new_lut_x             <= cur_lut_x;
				new_lut_y             <= cur_lut_y;
				new_lut_rot           <= cur_lut_rot;
				new_lut_piece_type    <= cur_lut_piece_type;
				new_lut_start         <= cur_lut_start;
				new_new_piece         <= cur_new_piece;
				new_check_start       <= cur_check_start;
				new_draw_erase_draw   <= cur_draw_erase_draw;
				new_draw_erase_start  <= cur_draw_erase_start;
				new_clear_shift_start <= cur_clear_shift_start;
				new_draw_score_draw   <= cur_draw_score_draw;
				new_timer_1_time      <= cur_timer_1_time;
				new_timer_1_start     <= cur_timer_1_start;
				new_timer_2_time      <= cur_timer_2_time;
				new_timer_2_start     <= cur_timer_2_start;
				new_timer_2_reset     <= cur_timer_2_reset;

				next_state <= draw;

			when key =>
				if (inputs = "00000000") then
					-- no input
					next_state <= drop_timer_reset;
				else
					next_state <= rotate;
				end if;

				-- Keep signals
				new_cur_piece   <= cur_piece;
				new_cur_x       <= cur_x;
				new_cur_x_new   <= cur_x_new;
				new_cur_y       <= cur_y;
				new_cur_y_new   <= cur_y_new;
				new_cur_rot     <= cur_rot;
				new_cur_rot_new <= cur_rot_new;

				-- Keep outputs
				new_lut_x             <= cur_lut_x;
				new_lut_y             <= cur_lut_y;
				new_lut_rot           <= cur_lut_rot;
				new_lut_piece_type    <= cur_lut_piece_type;
				new_lut_start         <= cur_lut_start;
				new_new_piece         <= cur_new_piece;
				new_check_start       <= cur_check_start;
				new_draw_erase_draw   <= cur_draw_erase_draw;
				new_draw_erase_start  <= cur_draw_erase_start;
				new_clear_shift_start <= cur_clear_shift_start;
				new_draw_score_draw   <= cur_draw_score_draw;
				new_timer_1_time      <= cur_timer_1_time;
				new_timer_1_start     <= cur_timer_1_start;
				new_timer_1_reset     <= cur_timer_1_reset;
				new_timer_2_time      <= cur_timer_2_time;
				new_timer_2_start     <= cur_timer_2_start;
				new_timer_2_reset     <= cur_timer_2_reset;

			when drop_timer_reset =>
				new_timer_1_time <= "00111100"; -- 60, 1 second

				-- Keep signals
				new_cur_piece   <= cur_piece;
				new_cur_x       <= cur_x;
				new_cur_x_new   <= cur_x_new;
				new_cur_y       <= cur_y;
				new_cur_y_new   <= cur_y_new;
				new_cur_rot     <= cur_rot;
				new_cur_rot_new <= cur_rot_new;

				-- Keep outputs
				new_lut_x             <= cur_lut_x;
				new_lut_y             <= cur_lut_y;
				new_lut_rot           <= cur_lut_rot;
				new_lut_piece_type    <= cur_lut_piece_type;
				new_lut_start         <= cur_lut_start;
				new_new_piece         <= cur_new_piece;
				new_check_start       <= cur_check_start;
				new_draw_erase_draw   <= cur_draw_erase_draw;
				new_draw_erase_start  <= cur_draw_erase_start;
				new_clear_shift_start <= cur_clear_shift_start;
				new_draw_score_draw   <= cur_draw_score_draw;
				new_timer_1_start     <= cur_timer_1_start;
				new_timer_1_reset     <= cur_timer_1_reset;
				new_timer_2_time      <= cur_timer_2_time;
				new_timer_2_start     <= cur_timer_2_start;
				new_timer_2_reset     <= cur_timer_2_reset;

				next_state <= draw;

			when rotate =>
				next_state <= draw;

				-- Keep signals
				new_cur_piece   <= cur_piece;
				new_cur_x       <= cur_x;
				new_cur_x_new   <= cur_x_new;
				new_cur_y       <= cur_y;
				new_cur_y_new   <= cur_y_new;
				new_cur_rot     <= cur_rot;
				new_cur_rot_new <= cur_rot_new;

				-- Keep outputs
				new_lut_x             <= cur_lut_x;
				new_lut_y             <= cur_lut_y;
				new_lut_rot           <= cur_lut_rot;
				new_lut_piece_type    <= cur_lut_piece_type;
				new_lut_start         <= cur_lut_start;
				new_new_piece         <= cur_new_piece;
				new_check_start       <= cur_check_start;
				new_draw_erase_draw   <= cur_draw_erase_draw;
				new_draw_erase_start  <= cur_draw_erase_start;
				new_clear_shift_start <= cur_clear_shift_start;
				new_draw_score_draw   <= cur_draw_score_draw;
				new_timer_1_time      <= cur_timer_1_time;
				new_timer_1_start     <= cur_timer_1_start;
				new_timer_1_reset     <= cur_timer_1_reset;
				new_timer_2_time      <= cur_timer_2_time;
				new_timer_2_start     <= cur_timer_2_start;
				new_timer_2_reset     <= cur_timer_2_reset;

			when kernel_panic =>
				-- Kill it!
				next_state <= game_over;

				-- Keep signals
				new_cur_piece   <= cur_piece;
				new_cur_x       <= cur_x;
				new_cur_x_new   <= cur_x_new;
				new_cur_y       <= cur_y;
				new_cur_y_new   <= cur_y_new;
				new_cur_rot     <= cur_rot;
				new_cur_rot_new <= cur_rot_new;

				-- Keep outputs
				new_lut_x             <= cur_lut_x;
				new_lut_y             <= cur_lut_y;
				new_lut_rot           <= cur_lut_rot;
				new_lut_piece_type    <= cur_lut_piece_type;
				new_lut_start         <= cur_lut_start;
				new_new_piece         <= cur_new_piece;
				new_check_start       <= cur_check_start;
				new_draw_erase_draw   <= cur_draw_erase_draw;
				new_draw_erase_start  <= cur_draw_erase_start;
				new_clear_shift_start <= cur_clear_shift_start;
				new_draw_score_draw   <= cur_draw_score_draw;
				new_timer_1_time      <= cur_timer_1_time;
				new_timer_1_start     <= cur_timer_1_start;
				new_timer_1_reset     <= cur_timer_1_reset;
				new_timer_2_time      <= cur_timer_2_time;
				new_timer_2_start     <= cur_timer_2_start;
				new_timer_2_reset     <= cur_timer_2_reset;

			when game_over =>
				-- Kill it!
				next_state <= game_over;

				-- Keep signals
				new_cur_piece   <= cur_piece;
				new_cur_x       <= cur_x;
				new_cur_x_new   <= cur_x_new;
				new_cur_y       <= cur_y;
				new_cur_y_new   <= cur_y_new;
				new_cur_rot     <= cur_rot;
				new_cur_rot_new <= cur_rot_new;

				-- Keep outputs
				new_lut_x             <= cur_lut_x;
				new_lut_y             <= cur_lut_y;
				new_lut_rot           <= cur_lut_rot;
				new_lut_piece_type    <= cur_lut_piece_type;
				new_lut_start         <= cur_lut_start;
				new_new_piece         <= cur_new_piece;
				new_check_start       <= cur_check_start;
				new_draw_erase_draw   <= cur_draw_erase_draw;
				new_draw_erase_start  <= cur_draw_erase_start;
				new_clear_shift_start <= cur_clear_shift_start;
				new_draw_score_draw   <= cur_draw_score_draw;
				new_timer_1_time      <= cur_timer_1_time;
				new_timer_1_start     <= cur_timer_1_start;
				new_timer_1_reset     <= cur_timer_1_reset;
				new_timer_2_time      <= cur_timer_2_time;
				new_timer_2_start     <= cur_timer_2_start;
				new_timer_2_reset     <= cur_timer_2_reset;

		end case;
	end process;
end;

















