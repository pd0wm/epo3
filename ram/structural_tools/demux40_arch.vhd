library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture demux40_behav of demux40 is
begin
	process(di, s)
		variable sel : integer range 0 to 39;
	begin
		do      <= (others => '0');
		sel     := to_integer(unsigned(s));
		do(sel) <= di;
	end process;
end architecture;