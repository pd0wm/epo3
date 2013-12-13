library ieee;
use ieee.std_logic_1164.all;

entity ram_fix is
	port(
		draw_erase_start  : in  std_logic;
		draw_score_draw   : in  std_logic;
		clear_shift_start : in  std_logic;
		check_start       : in  std_logic;
		we                : out std_logic
	);
end ram_fix;