library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sr_4b is
	port(
		clk, rst : in  std_logic;

		di       : in  std_logic;
		do       : out std_logic;

		we       : in  std_logic;
		addr     : in  std_logic_vector(1 downto 0)
	);
end entity;