library IEEE;
use IEEE.std_logic_1164.ALL;

entity ff is
	port (
		clk : in std_logic;
		rst : in std_logic;
		d : in std_logic;
		q : out std_logic
	);
end entity ff;

