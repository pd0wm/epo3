library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tri is
	port(
		di : in  std_logic;
		do : out std_logic;
		e  : in  std_logic
	);
end entity;