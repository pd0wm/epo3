library IEEE;
use IEEE.std_logic_1164.ALL;

entity npg is
	port (
		clk : in std_logic;
		rst : in std_logic;
		button_seed : in std_logic;
		new_number : in std_logic;
		output : out std_logic_vector(2 downto 0)
			);
end npg;

