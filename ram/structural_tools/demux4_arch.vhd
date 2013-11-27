library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture demux4_behav of demux4 is
begin
	process(di, s)
	begin
		do <= (others => '0');

		case s is
			when "00"   => do(0) <= di;
			when "01"   => do(1) <= di;
			when "10"   => do(2) <= di;
			when others => do(3) <= di;
		end case;
	end process;
end architecture;