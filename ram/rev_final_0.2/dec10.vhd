library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dec10 is
	port(
		di : in  std_logic;
		do : out std_logic_vector(9 downto 0);
		s  : in  std_logic_vector(3 downto 0)
	);
end entity;