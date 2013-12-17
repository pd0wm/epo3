library ieee;
use ieee.std_logic_1164.all;

architecture top_level2_struc of top_level2 is
	component debounce
		port(clk         : in  std_logic;
			 rst         : in  std_logic;
			 inv_inputs  : in  std_logic_vector(5 downto 0);
			 output      : out std_logic_vector(5 downto 0);
			 random_seed : out std_logic);
	end component debounce;

	component controller
		port(clk               : in  std_logic;
			 rst               : in  std_logic;
			 lut_piece_type    : out std_logic_vector(2 downto 0);
			 lut_next_piece    : out std_logic;
			 lut_x             : out std_logic_vector(2 downto 0);
			 lut_y             : out std_logic_vector(3 downto 0);
			 lut_rot           : out std_logic_vector(1 downto 0);
			 new_piece         : out std_logic;
			 next_piece        : in  std_logic_vector(2 downto 0);
			 check_empty       : in  std_logic;
			 check_start       : out std_logic;
			 check_ready       : in  std_logic;
			 draw_erase_draw   : out std_logic;
			 draw_erase_start  : out std_logic;
			 draw_erase_ready  : in  std_logic;
			 clear_shift_start : out std_logic;
			 clear_shift_ready : in  std_logic;
			 draw_score_draw   : out std_logic;
			 draw_score_ready  : in  std_logic;
			 timer_1_time      : out std_logic;
			 timer_1_start     : out std_logic;
			 timer_1_done      : in  std_logic;
			 timer_1_reset     : out std_logic;
			 inputs            : in  std_logic_vector(5 downto 0));
	end component controller;

	component timer
		port(clk     : in  std_logic;
			 vga_clk : in  std_logic;
			 rst     : in  std_logic;
			 cnt_rst : in  std_logic;
			 time    : in  std_logic;
			 start   : in  std_logic;
			 ready   : out std_logic);
	end component timer;

	component npg
		port(clk         : in  std_logic;
			 rst         : in  std_logic;
			 new_number  : in  std_logic;
			 output      : out std_logic_vector(2 downto 0);
			 button_seed : in  std_logic);
	end component npg;

	component ram_fix
		port(draw_erase_start  : in  std_logic;
			 draw_score_draw   : in  std_logic;
			 clear_shift_start : in  std_logic;
			 check_start       : in  std_logic;
			 we                : out std_logic);
	end component ram_fix;

	component vga
		port(clk      : in  std_logic;
			 rst      : in  std_logic;
			 mem_addr : out std_logic_vector(7 downto 0);
			 data     : in  std_logic;
			 h_sync   : out std_logic;
			 v_sync   : out std_logic;
			 red      : out std_logic;
			 green    : out std_logic;
			 blue     : out std_logic);
	end component vga;

	component sr_if
		port(clk, rst     : in  std_logic;
			 di           : in  std_logic;
			 do1, do2     : out std_logic;
			 we           : in  std_logic;
			 addr1, addr2 : in  std_logic_vector(7 downto 0));
	end component sr_if;

	component check_mask
		port(clk         : in  std_logic;
			 rst         : in  std_logic;
			 mask        : in  std_logic_vector(7 downto 0);
			 mask_select : out std_logic_vector(1 downto 0);
			 ready       : out std_logic;
			 empty       : out std_logic;
			 start       : in  std_logic;
			 lut_start   : out std_logic;
			 lut_ready   : in  std_logic;
			 lut_error   : in  std_logic;
			 write       : out std_logic;
			 addr        : out std_logic_vector(7 downto 0);
			 data_in     : in  std_logic);
	end component check_mask;

	component de_piece
		port(clk         : in  std_logic;
			 rst         : in  std_logic;
			 mask        : in  std_logic_vector(7 downto 0);
			 mask_select : out std_logic_vector(1 downto 0);
			 draw_erase  : in  std_logic;
			 ready       : out std_logic;
			 start       : in  std_logic;
			 lut_start   : out std_logic;
			 lut_ready   : in  std_logic;
			 write       : out std_logic;
			 addr        : out std_logic_vector(7 downto 0);
			 data        : out std_logic);
	end component de_piece;

	component piece_lut
		port(clk         : in  std_logic;
			 rst         : in  std_logic;
			 mask        : out std_logic_vector(7 downto 0);
			 mask_select : in  std_logic_vector(1 downto 0);
			 x           : in  std_logic_vector(2 downto 0);
			 y           : in  std_logic_vector(3 downto 0);
			 rot         : in  std_logic_vector(1 downto 0);
			 piece_type  : in  std_logic_vector(2 downto 0);
			 next_piece  : in  std_logic;
			 ready       : out std_logic;
			 overflow    : out std_logic;
			 check_start : in  std_logic;
			 draw_start  : in  std_logic;
			 rom_addr    : out std_logic_vector(6 downto 0);
			 rom_data    : in  std_logic_vector(3 downto 0));
	end component piece_lut;

	component rom
		port(addr : IN  std_logic_vector(6 downto 0);
			 data : OUT std_logic_vector(3 downto 0));
	end component rom;

	component cs_compare
		port(clk, rst     : in  std_logic;
			 start_in     : in  std_logic;
			 ready_out    : out std_logic;
			 score_out    : out std_logic;
			 ram_addr_out : out std_logic_vector(7 downto 0);
			 ram_we       : out std_logic;
			 ram_data_in  : in  std_logic;
			 ram_data_out : out std_logic);
	end component cs_compare;

	component log_score
		port(clk      : in  std_logic;
			 rst      : in  std_logic;
			 increase : in  std_logic;
			 output   : out std_logic_vector(7 downto 0));
	end component log_score;

	component draw_score
		port(ds_clk      : in  std_logic;
			 ds_rst      : in  std_logic;
			 ds_draw     : in  std_logic;
			 ds_ready    : out std_logic;
			 ds_input    : in  std_logic_vector(7 downto 0);
			 ds_write    : out std_logic;
			 ds_addr     : out std_logic_vector(7 downto 0);
			 ds_data_out : out std_logic);
	end component draw_score;

	signal inputs_debounced                                                                                               : std_logic_vector(5 downto 0);
	signal button_seed, new_piece, timer_1_reset, timer_1_start, timer_1_done, timer_1_time                               : std_logic;
	signal next_piece                                                                                                     : std_logic_vector(2 downto 0);
	signal ram_data_in, ram_data_out, ram_we, vga_data                                                                    : std_logic;
	signal ram_addr, vga_addr                                                                                             : std_logic_vector(7 downto 0);
	signal vga_clk, score                                                                                                 : std_logic;
	signal clear_shift_start, clear_shift_ready, check_empty, check_start, check_ready, draw_erase_draw, draw_erase_start : std_logic;
	signal draw_erase_ready, draw_score_draw, draw_score_ready                                                            : std_logic;
	signal lut_start_de, lut_start_check, lut_ready, lut_error, lut_next_piece                                            : std_logic;
	signal lut_x, lut_piece_type                                                                                          : std_logic_vector(2 downto 0);
	signal lut_y                                                                                                          : std_logic_vector(3 downto 0);
	signal lut_rot                                                                                                        : std_logic_vector(1 downto 0);
	signal mask, score_data                                                                                               : std_logic_vector(7 downto 0);
	signal mask_select                                                                                                    : std_logic_vector(1 downto 0);
	signal rom_addr                                                                                                       : std_logic_vector(6 downto 0);
	signal rom_data                                                                                                       : std_logic_vector(3 downto 0);
begin
	-- Debug signals
	dbg_check_start       <= check_start;
	dbg_check_ready       <= check_ready;
	dbg_draw_erase_start  <= draw_erase_start;
	dbg_draw_erase_ready  <= draw_erase_ready;
	dbg_clear_shift_start <= clear_shift_start;
	dbg_clear_shift_ready <= clear_shift_ready;
	dbg_draw_score_start  <= draw_score_draw;
	dbg_draw_score_ready  <= draw_score_ready;
	dbg_lut_start         <= lut_start_de or lut_start_check;
	dbg_lut_ready         <= lut_ready;
	dbg_timer_start       <= timer_1_start;
	dbg_timer_ready       <= timer_1_done;
	dbg_ram_we            <= ram_we;
	dbg_ram_data_in       <= ram_data_in;
	dbg_ram_data_out      <= ram_data_out;
	dbg_ram_data_vga      <= vga_data;
	dbg_ram_addr_part     <= ram_addr(1 downto 0);

	switch_debounce : debounce port map(
			clk         => clk,
			rst         => rst,
			inv_inputs  => inputs,
			output      => inputs_debounced,
			random_seed => button_seed
		);
	next_piece_generator : npg port map(
			clk         => clk,
			rst         => rst,
			new_number  => new_piece,
			output      => next_piece,
			button_seed => button_seed
		);
	fall_timer : timer port map(
			clk     => clk,
			vga_clk => vga_clk,
			rst     => rst,
			cnt_rst => timer_1_reset,
			time    => timer_1_time,
			start   => timer_1_start,
			ready   => timer_1_done
		);

	game_controller : controller port map(
			clk               => clk,
			rst               => rst,
			lut_piece_type    => lut_piece_type,
			lut_next_piece    => lut_next_piece,
			lut_x             => lut_x,
			lut_y             => lut_y,
			lut_rot           => lut_rot,
			new_piece         => new_piece,
			next_piece        => next_piece,
			check_empty       => check_empty,
			check_start       => check_start,
			check_ready       => check_ready,
			draw_erase_draw   => draw_erase_draw,
			draw_erase_start  => draw_erase_start,
			draw_erase_ready  => draw_erase_ready,
			clear_shift_start => clear_shift_start,
			clear_shift_ready => clear_shift_ready,
			draw_score_draw   => draw_score_draw,
			draw_score_ready  => draw_score_ready,
			timer_1_time      => timer_1_time,
			timer_1_start     => timer_1_start,
			timer_1_done      => timer_1_done,
			timer_1_reset     => timer_1_reset,
			inputs            => inputs_debounced);
	video_ram : sr_if port map(
			clk   => clk,
			rst   => rst,
			di    => ram_data_in,
			do1   => ram_data_out,
			do2   => vga_data,
			we    => ram_we,
			addr1 => ram_addr,
			addr2 => vga_addr
		);

	video_ram_fix : ram_fix
		port map(
			draw_erase_start  => draw_erase_start,
			draw_score_draw   => draw_score_draw,
			clear_shift_start => clear_shift_start,
			check_start       => check_start,
			we                => ram_we
		);

	vga_controller : vga
		port map(
			clk      => clk,
			rst      => rst,
			mem_addr => vga_addr,
			data     => vga_data,
			h_sync   => vga_h_sync,
			v_sync   => vga_clk,
			red      => vga_red,
			green    => vga_green,
			blue     => vga_blue
		);
	vga_v_sync <= vga_clk;

	check_piece_mask : check_mask
		port map(
			clk         => clk,
			rst         => rst,
			mask        => mask,
			mask_select => mask_select,
			ready       => check_ready,
			empty       => check_empty,
			start       => check_start,
			lut_start   => lut_start_check,
			lut_ready   => lut_ready,
			lut_error   => lut_error,
			write       => ram_we,
			addr        => ram_addr,
			data_in     => ram_data_out
		);

	draw_erase_piece : de_piece
		port map(
			clk         => clk,
			rst         => rst,
			mask        => mask,
			mask_select => mask_select,
			draw_erase  => draw_erase_draw,
			ready       => draw_erase_ready,
			start       => draw_erase_start,
			lut_start   => lut_start_de,
			lut_ready   => lut_ready,
			write       => ram_we,
			addr        => ram_addr,
			data        => ram_data_in
		);

	lookup_table : piece_lut
		port map(
			clk         => clk,
			rst         => rst,
			mask        => mask,
			mask_select => mask_select,
			x           => lut_x,
			y           => Lut_y,
			rot         => lut_rot,
			piece_type  => lut_piece_type,
			next_piece  => lut_next_piece,
			ready       => lut_ready,
			overflow    => lut_error,
			check_start => lut_start_check,
			draw_start  => lut_start_de,
			rom_addr    => rom_addr,
			rom_data    => rom_data
		);

	read_only_memory : rom
		port map(
			addr => rom_addr,
			data => rom_data
		);

	clear_shift : cs_compare
		port map(
			clk          => clk,
			rst          => rst,
			start_in     => clear_shift_start,
			ready_out    => clear_shift_ready,
			score_out    => score,
			ram_addr_out => ram_addr,
			ram_we       => ram_we,
			ram_data_in  => ram_data_out,
			ram_data_out => ram_data_in
		);

	keep_score : log_score
		port map(
			clk      => clk,
			rst      => rst,
			increase => score,
			output   => score_data
		);

	output_score : draw_score
		port map(
			ds_clk      => clk,
			ds_rst      => rst,
			ds_draw     => draw_score_draw,
			ds_ready    => draw_score_ready,
			ds_input    => score_data,
			ds_write    => ram_we,
			ds_addr     => ram_addr,
			ds_data_out => ram_data_in
		);

end top_level2_struc;