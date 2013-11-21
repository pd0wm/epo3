library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.mem_params.all;

entity sramdp_mod_regs is
	port(
		clk : in std_logic;
		rst : in std_logic;
		
		mem_in : in std_logic_vector(mem_len-1 downto 0);
		mem_out : out std_logic_vector(mem_len-1 downto 0)
	);
end sramdp_mod_regs;