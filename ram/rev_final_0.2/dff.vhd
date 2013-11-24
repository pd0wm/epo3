library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dff is
	port(
		clk, rst : in  std_logic;

		di       : in  std_logic;
		do       : out std_logic
	);
end entity;