library ieee;
use ieee.std_logic_1164.all;

entity cs_tri7 is
	port(
		i : in std_logic_vector(6 downto 0);
		o : out std_logic_vector(6 downto 0);
		e : in std_logic
	);
end entity;