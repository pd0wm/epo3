library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mp2 is
	port(
		di1 : in std_logic;
		di2 : in std_logic;
		do : out std_logic;
		s : in std_logic
	);
end entity;