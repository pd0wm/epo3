library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mp4 is
	port(
		di : in std_logic_vector(3 downto 0);
		do : out std_logic;
		s : in std_logic_vector(1 downto 0)
	);
end entity;