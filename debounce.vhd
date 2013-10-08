library ieee;
use ieee.std_logic_1164.all;
entity debounce is
	port(
		clk    : in  std_logic;
		rst    : in  std_logic;

		inputs : in  std_logic_vector(7 downto 0);
		output : out std_logic_vector(7 downto 0);

		time   : out std_logic_vector(31 downto 0);
		start  : out std_logic;
		done   : in  std_logic
	);
end debounce;


