library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.mem.all;

entity sramdp32_regs is
	port(
		clk : in std_logic;
		rst : in std_logic;
		
		mem_in : in mem;
		mem_out : out mem
	);
end sramdp32_regs;