library ieee;
use ieee.std_logic_1164.all;

entity timer is
	port(
		clk   : in  std_logic;
		rst   : in  std_logic;

		time  : in  std_logic_vector(31 downto 0);
		start : in  std_logic;
		done  : out std_logic
	);
end timer;
