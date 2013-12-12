library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity timer_counter is
	port(
		clk, rst, rst2 : in  std_logic;
		value    : out std_logic_vector(4 downto 0);
		en       : in  std_logic
	);
end timer_counter;









































