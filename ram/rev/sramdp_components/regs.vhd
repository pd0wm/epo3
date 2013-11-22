library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sramdp_regs is
	port(
		clk : in std_logic;
		rst : in std_logic;
		
		mem_out : out std_logic_vector(7 downto 0);
		mem_in : in std_logic_vector(7 downto 0)
	);
end sramdp_regs;