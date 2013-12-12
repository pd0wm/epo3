library ieee;
use ieee.std_logic_1164.all;
entity controller_move is
	port(
		clk              : in  std_logic;
		rst              : in  std_logic;

		x                : out std_logic;
		y                : out std_logic;
		rot              : out std_logic;
		add_sub          : out std_logic;

		draw_erase_draw  : out std_logic;
		draw_erase_start : out std_logic;
		draw_erase_ready : in  std_logic;

		start            : in  std_logic;
		ready            : out std_logic;

		inputs           : in  std_logic_vector(3 downto 0);
		drop             : in  std_logic;
		check_ready      : in  std_logic;

		check_start      : out std_logic;
		check_empty      : in  std_logic
	);
end controller_move;



