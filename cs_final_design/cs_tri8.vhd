library ieee;
use ieee.std_logic_1164.all;

entity cs_tri8 is
	port(
		i : in std_logic_vector(7 downto 0);
		o : out std_logic_vector(7 downto 0);
		e : in std_logic
	);
end entity;