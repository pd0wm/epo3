library ieee;
use ieee.std_logic_1164.all;

architecture vga_demux_behav of vga_demux is
begin
	comb_out : process(def, s1, di1, s2, di2)
	begin
		do <= def;

		if (s1 = '1') then
			do <= di1;
		elsif (s2 = '1') then
			do <= di2;
		end if;
	end process;
end;