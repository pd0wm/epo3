library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dec20 is
	port(
		di : in std_logic;
		do : out std_logic_vector(19 downto 0);
		s : in std_logic_vector(4 downto 0)
	);
end entity;