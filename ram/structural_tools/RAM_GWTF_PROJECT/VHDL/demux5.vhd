library ieee;
use ieee.std_logic_1164.all;

entity demux5 is
	port(
		di : in std_logic;
		do : out std_logic_vector(4 downto 0);
		s  : in  std_logic_vector(2 downto 0)
	);
end;
