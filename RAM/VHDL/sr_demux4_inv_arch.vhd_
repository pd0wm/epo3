library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture demux4_inv_behav of demux4_inv is
begin
	process(di, s)
	begin
		do <= (others => '1');

		case s is
			when "00"   => do(0) <= not di;
			when "01"   => do(1) <= not di;
			when "10"   => do(2) <= not di;
			when others => do(3) <= not di;
		end case;
	end process;
end architecture;


