library ieee;
use ieee.std_logic_1164.all;

entity cs_7bc is
	port(
		clk, rst : in  std_logic;
		en       : in  std_logic;
		value    : out std_logic_vector(6 downto 0)
	);
end entity;