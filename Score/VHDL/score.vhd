library IEEE;
use IEEE.std_logic_1164.ALL;

entity score is
   port(
		clk            : in  std_logic;
		rst            : in  std_logic;

		increase       : in  std_logic;

		output         : out std_logic_vector(7 downto 0)
		);
end score;





