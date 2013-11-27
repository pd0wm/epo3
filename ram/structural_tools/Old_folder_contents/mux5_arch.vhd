library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture mux5_behav of mux5 is
begin
	process(di, s)
	begin
		case s is
			when "000"  => do <= di(0);
			when "001"  => do <= di(1);
			when "010"  => do <= di(2);
			when "011"  => do <= di(3);
			when others => do <= di(4);
		end case;
	end process;
end architecture;


