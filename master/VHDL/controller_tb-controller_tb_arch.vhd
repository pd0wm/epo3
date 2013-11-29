library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.vga_params.all;

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

	signal clk, rst : std_logic;

begin
	uut : controller port map(
			clk => clk,
			rst => rst,) clock : process
	begin
		clk <= '1';
		wait for clk_period / 2;
		clk <= '0';
		wait for clk_period / 2;
	end process;

	data_lut : process(clk, rst)
	begin
		wait for 40 ns;

		wait;
	end process;

	rst <= '1', '0' after clk_period;
end;






