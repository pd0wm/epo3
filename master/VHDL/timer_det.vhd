library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity timer_det is
	port(
		cnt_val : in  std_logic_vector(4 downto 0);
		time    : in  std_logic;
		done    : out std_logic
	);
end timer_det;