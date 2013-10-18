library IEEE;
use IEEE.std_logic_1164.ALL;

entity ff is
	port (
		clk : in std_logic;
		rst : in std_logic;
		D : in std_logic;
		Q : out std_logic
	);
end entity ff;

