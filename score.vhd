library ieee;
use ieee.std_logic_1164.all;
entity score is
	port(
		clk            : in  std_logic;
		rst            : in  std_logic;

		increase_value : in  std_logic_vector(31 downto 0);
		increase       : in  std_logic;

		output         : out std_logic_vector(31 downto 0)
	);
end score;


