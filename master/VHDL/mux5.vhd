library ieee;
use ieee.std_logic_1164.all;

entity mux5 is
	port(
		di : in  std_logic_vector(4 downto 0);
		do : out std_logic;
		s  : in  std_logic_vector(2 downto 0)
	);
end;
