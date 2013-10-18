library ieee;
use ieee.std_logic_1164.all;
entity debounce is
	port(
		clk         : in  std_logic;
		rst         : in  std_logic;

		inputs      : in  std_logic_vector(7 downto 0);
		output      : out std_logic_vector(7 downto 0);

		random_seed : out std_logic
	);
end debounce;


