library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture demux8_behav of demux8 is
begin
	process(di, s)
	begin
		do      <= (others => '0');
		
		case s is
			when "000" => do(0) <= di;
			when "001" => do(1) <= di;
			when "010" => do(2) <= di;
			when "011" => do(3) <= di;
			when "100" => do(4) <= di;
			when "101" => do(5) <= di;
			when "110" => do(6) <= di;
			when others => do(7) <= di;
		end case;
	end process;
end architecture;