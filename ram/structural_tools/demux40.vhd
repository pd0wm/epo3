library ieee;
use ieee.std_logic_1164.all;

entity demux40 is
	port(
		di : in  std_logic;
		do : out std_logic_vector(39 downto 0);
		s  : in  std_logic_vector(7 downto 0)
	);
end;

