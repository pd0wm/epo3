library ieee;
use ieee.std_logic_1164.all;
entity draw_erase_piece is
	port(
		clk        : in    std_logic;
		rst        : in    std_logic;

		mask       : in    std_logic_vector(31 downto 0);

		draw_erase : in    std_logic;   --draw = 1, erase = 0
		ready      : out   std_logic;
		start      : in    std_logic;

		piece_type : in    std_logic_vector(2 downto 0);

		addr       : out   std_logic_vector(7 downto 0);
		data       : inout std_logic
	);
end draw_erase_piece;


