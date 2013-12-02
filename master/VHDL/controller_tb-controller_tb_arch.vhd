library IEEE;
use IEEE.std_logic_1164.ALL;

architecture controller_tb_arch of controller_tb is
	constant clk_period : time := 20 ns;

	component controller
		port(clk               : in  std_logic;
			 rst               : in  std_logic;
			 lut_x             : out std_logic_vector(2 downto 0);
			 lut_y             : out std_logic_vector(3 downto 0);
			 lut_rot           : out std_logic_vector(1 downto 0);
			 lut_piece_type    : out std_logic_vector(2 downto 0);
			 lut_ready         : in  std_logic;
			 lut_error         : in  std_logic;
			 lut_start         : out std_logic;
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
			 timer_1_time      : out std_logic_vector(7 downto 0);
			 timer_1_start     : out std_logic;
			 timer_1_reset     : out std_logic;
			 timer_1_done      : in  std_logic;
			 timer_2_time      : out std_logic_vector(7 downto 0);
			 timer_2_start     : out std_logic;
			 timer_2_reset     : out std_logic;
			 timer_2_done      : in  std_logic;
			 inputs            : in  std_logic_vector(7 downto 0));
	end component controller;

	signal clk, rst          : std_logic;
	signal lut_x             : std_logic_vector(2 downto 0);
	signal lut_y             : std_logic_vector(3 downto 0);
	signal lut_rot           : std_logic_vector(1 downto 0);
	signal lut_piece_type    : std_logic_vector(2 downto 0);
	signal lut_ready         : std_logic;
	signal lut_error         : std_logic;
	signal lut_start         : std_logic;
	signal new_piece         : std_logic;
	signal next_piece        : std_logic_vector(2 downto 0);
	signal check_empty       : std_logic;
	signal check_start       : std_logic;
	signal check_ready       : std_logic;
	signal draw_erase_draw   : std_logic;
	signal draw_erase_start  : std_logic;
	signal draw_erase_ready  : std_logic;
	signal clear_shift_start : std_logic;
	signal clear_shift_ready : std_logic;
	signal draw_score_draw   : std_logic;
	signal draw_score_ready  : std_logic;
	signal timer_1_time      : std_logic_vector(7 downto 0);
	signal timer_1_start     : std_logic;
	signal timer_1_reset     : std_logic;
	signal timer_1_done      : std_logic;
	signal timer_2_time      : std_logic_vector(7 downto 0);
	signal timer_2_start     : std_logic;
	signal timer_2_reset     : std_logic;
	signal timer_2_done      : std_logic;
	signal inputs            : std_logic_vector(7 downto 0);

begin
	dut : controller port map(
		clk               => clk,
		rst               => rst,
		lut_x             => lut_x,
		lut_y             => lut_y,
		lut_rot           => lut_rot,
		lut_piece_type    => lut_piece_type,
		lut_ready         => lut_ready,
		lut_error         => lut_error,
		lut_start         => lut_start,
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
		timer_1_reset     => timer_1_reset,
		timer_1_done      => timer_1_done,
		timer_2_time      => timer_2_time,
		timer_2_start     => timer_2_start,
		timer_2_reset     => timer_2_reset,
		timer_2_done      => timer_2_done,
		inputs            => inputs
	);
	
	clock : process
	begin
		clk <= '1';
		wait for clk_period / 2;
		clk <= '0';
		wait for clk_period / 2;
	end process;

	stimulus : process
	begin
		wait for 40 ns;

		wait;
	end process;

	rst <= '1', '0' after clk_period;
end;


