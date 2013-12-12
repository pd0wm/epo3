library ieee;
use ieee.std_logic_1164.all;
entity controller_drop is
	port(
		clk              : in  std_logic;
		rst              : in  std_logic;

		start            : in  std_logic;
		ready            : out std_logic;

		y                : out std_logic;

		draw_erase_draw  : out std_logic;
		draw_erase_start : out std_logic;
		draw_erase_ready : in  std_logic;

		check_ready      : in  std_logic;

		check_start      : out std_logic;
		check_empty      : in  std_logic;

		game_over        : out std_logic
	);
end controller_drop;
