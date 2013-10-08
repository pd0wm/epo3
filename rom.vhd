library ieee;
use ieee.std_logic_1164.all;
entity rom is
	port(
		clk  : in  std_logic;
		rst  : in  std_logic;

		addr : in  std_logic_vector(7 downto 0);
		data : out std_logic_vector(15 downto 0)
	);
end rom;


