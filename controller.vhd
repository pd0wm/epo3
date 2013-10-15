library ieee;
use ieee.std_logic_1164.all;
entity controller is
	port(
		clk               : in  std_logic;
		rst               : in  std_logic;

		-- piece lut
		lut_x, lut_y      : out std_logic_vector(7 downto 0);
		lut_rot           : out std_logic_vector(1 downto 0);
		lut_piece_type    : out std_logic_vector(2 downto 0);
		lut_ready         : in  std_logic;
		lut_error         : in  std_logic;
		lut_start         : out std_logic;

		--next piece		
		new_piece         : out std_logic;
		next_piece        : in  std_logic_vector(2 downto 0);

		--check mask
		check_empty       : in  std_logic;
		check_start       : out std_logic;
		check_ready       : in  std_logic;

		--draw next piece
		draw_next_type    : out std_logic_vector(2 downto 0);
		draw_next_start   : out std_logic;
		draw_next_ready   : in  std_logic;

		--draw erase piece
		draw_erase_type   : out std_logic_vector(2 downto 0);
		draw_erase_draw   : out std_logic;
		draw_erase_start  : out std_logic;
		draw_erase_ready  : in  std_logic;

		--clear shift
		clear_shift_start : out std_logic;
		clear_shift_ready : in  std_logic;

		--draw socre
		draw_score_draw   : out std_logic;
		draw_score_ready  : in  std_logic;

		--score
		score_increase    : out std_logic;
		score_value       : out std_logic_vector(31 downto 0);

		--demultiplexer
		demux_selector    : out std_logic_vector(2 downto 0);
		--RAM
		ram_write         : out std_logic
	);
end controller;

