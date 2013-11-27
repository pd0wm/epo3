library ieee;
use ieee.std_logic_1164.all;

entity dec8 is
	port(
		do : out std_logic_vector(7 downto 0);
		s  : in  std_logic_vector(2 downto 0)
	);
end;

