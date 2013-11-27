library ieee;
use ieee.std_logic_1164.all;

entity demux4 is
	port(
		di : in  std_logic;
		do : out std_logic_vector(3 downto 0);
		s  : in  std_logic_vector(1 downto 0)
	);
end;

