library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sr_160b is
	port(
		clk  : in  std_logic;
		rst  : in  std_logic;

		addr : in  std_logic_vector(7 downto 0);
		di   : in  std_logic;
		do   : out std_logic;
		we   : in  std_logic
	);

end;