library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.vga_params.all;

architecture controller_arch of controller is
	type state_type
	is (reset, init, move_2, move_3, move_4, clear_shift_3, draw_next_piece_1, draw_next_piece_2, draw_next_piece_3, draw_next_piece_4, draw_next_piece_5, hard_drop_1, soft_drop_1, soft_drop_2, soft_drop_3, first_draw_1, first_draw_2, first_draw_4, drop_timer_reset, gen_piece_1, collision_1, collision_4, collision_5, draw, kernel_panic, reset_timers_a_1, reset_timers_a_2, clear_shift_1, clear_shift_2, space_1, space_2, space_4, space_5, space_6, put_back_4, move_down_3, move_down_4, reset_timers_b_1, reset_timers_b_2, drop_overflow, key, game_over);
	signal cur_state, next_state : state_type;

	signal cur_piece, new_cur_piece           : std_logic_vector(2 downto 0);
	signal cur_x, new_cur_x                   : std_logic_vector(2 downto 0);
	signal cur_y, new_cur_y                   : std_logic_vector(3 downto 0);
	signal cur_rot, new_cur_rot               : std_logic_vector(1 downto 0);
	signal cur_future_piece, new_future_piece : std_logic_vector(2 downto 0);

	-- Output buffers
	signal new_timer_1_time  : std_logic;
	signal new_timer_1_start : std_logic;
	signal new_timer_1_reset : std_logic;

	signal cur_timer_1_time  : std_logic;
	signal cur_timer_1_start : std_logic;
	signal cur_timer_1_reset : std_logic;

	signal move_x                : std_logic;
	signal move_rot              : std_logic;
	signal move_add_sub          : std_logic;
	signal move_draw_erase_draw  : std_logic;
	signal move_draw_erase_start : std_logic;
	signal move_draw_erase_ready : std_logic;
	signal move_start            : std_logic;
	signal move_ready            : std_logic;
	signal move_check_ready      : std_logic;
	signal move_check_start      : std_logic;

	component controller_move
		port(clk              : in  std_logic;
			 rst              : in  std_logic;
			 x                : out std_logic;
			 rot              : out std_logic;
			 add_sub          : out std_logic;
			 draw_erase_draw  : out std_logic;
			 draw_erase_start : out std_logic;
			 draw_erase_ready : in  std_logic;
			 start            : in  std_logic;
			 ready            : out std_logic;
			 inputs           : in  std_logic_vector(3 downto 0);
			 check_ready      : in  std_logic;
			 check_start      : out std_logic;
			 check_empty      : in  std_logic);
	end component controller_move;

begin
	move_pm : controller_move
		port map(clk              => clk,
			     rst              => rst,
			     x                => move_x,
			     rot              => move_rot,
			     add_sub          => move_add_sub,
			     draw_erase_draw  => move_draw_erase_draw,
			     draw_erase_start => move_draw_erase_start,
			     draw_erase_ready => move_draw_erase_ready,
			     start            => move_start,
			     ready            => move_ready,
			     inputs           => inputs(3 downto 0),
			     check_ready      => move_check_ready,
			     check_start      => move_check_start,
			     check_empty      => check_empty);

	process(clk, rst, cur_x, cur_y, cur_rot, cur_piece, new_timer_1_time, new_timer_1_start, new_timer_1_reset, new_cur_piece, new_cur_x, new_cur_y, new_cur_rot, next_state)
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

	process(cur_state, cur_piece, cur_x, cur_y, cur_rot, cur_future_piece, cur_timer_1_time, cur_timer_1_start, cur_timer_1_reset, next_piece, draw_erase_ready, check_ready, check_empty, clear_shift_ready, draw_score_ready, timer_1_done, calc_y, inputs, calc_x, calc_rot, inputs)
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

				if (inputs = "000000") then
					next_state <= reset;
				else
					next_state <= init;
				end if;

			when init =>
				new_timer_1_time <= '1'; -- 30, .5 second
				new_future_piece <= next_piece;
				new_piece        <= '1';

				if (inputs = "000000") then
					next_state <= gen_piece_1;
				else
					next_state <= init;
				end if;

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
				end if;

			when collision_1 =>
				new_cur_piece    <= cur_future_piece;
				new_future_piece <= cur_piece;

				new_cur_x <= "011";

				next_state <= collision_4;

			when collision_4 =>
				check_start <= '1';
				-- Wait for check mask ready, about ?
				if (check_ready = '1') then
					next_state <= collision_5;
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
				end if;

			when first_draw_4 =>
				draw_erase_draw  <= '1';
				draw_erase_start <= '1';

				if (draw_erase_ready = '1') then
					next_state <= draw;
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
				if (inputs = "000000" or inputs = "010000") then
					next_state <= clear_shift_1;
				end if;

				new_timer_1_reset <= '0';

			when clear_shift_1 =>
				clear_shift_start <= '1';

				next_state <= clear_shift_2;

			when clear_shift_2 =>
				clear_shift_start <= '1';

				if (clear_shift_ready = '1') then
					next_state <= clear_shift_3;
				end if;

			when clear_shift_3 =>
				draw_score_draw <= '1';

				if (draw_score_ready = '1') then
					next_state <= gen_piece_1;
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
				if (inputs = "000000") then
					next_state <= drop_timer_reset;
				else
					next_state <= soft_drop_1;
				end if;

			when drop_timer_reset =>
				new_timer_1_time <= '1'; -- 30, .5 second

				next_state <= draw;

			when soft_drop_1 =>
				if (inputs(4) = '1') then
					if (cur_timer_1_time = '1') then
						next_state <= soft_drop_2;
					else
						next_state <= draw;
					end if;
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
				if (inputs(5) = '1' and cur_timer_1_time = '1') then
					next_state <= space_1;
				else
					next_state <= move_2;
				end if;

			when move_2 =>
				move_start       <= '1';
				x                <= move_x;
				rot              <= move_rot;
				add_sub          <= move_add_sub;
				draw_erase_draw  <= move_draw_erase_draw;
				draw_erase_start <= move_draw_erase_start;
				check_start      <= move_check_start;

				next_state <= move_3;

			when move_3       =>			
				move_start       <= '1';
				x                <= move_x;
				rot              <= move_rot;
				add_sub          <= move_add_sub;
				draw_erase_draw  <= move_draw_erase_draw;
				draw_erase_start <= move_draw_erase_start;
				check_start      <= move_check_start;
				
				if (move_ready = '1') then
					next_state <= move_4;
				end if;
				
			when move_4 =>
				move_start       <= '1';
				x                <= move_x;
				rot              <= move_rot;
				add_sub          <= move_add_sub;
				draw_erase_draw  <= move_draw_erase_draw;
				draw_erase_start <= move_draw_erase_start;
				check_start      <= move_check_start;
			
				new_cur_x <= calc_x;
				new_cur_rot <= calc_rot;
			
				next_state <= draw;
				
				
			when kernel_panic =>
				-- Kill it!
				next_state <= game_over;

			when game_over =>
				-- Kill it!
				next_state <= game_over;

		end case;
	end process;
end;
