library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture dec8_behav of dec8 is
begin
	process(s)
	begin
		do      <= (others => '0');
		
		case s is
			when "000" => do(0) <= '1';
			when "001" => do(1) <= '1';
			when "010" => do(2) <= '1';
			when "011" => do(3) <= '1';
			when "100" => do(4) <= '1';
			when "101" => do(5) <= '1';
			when "110" => do(6) <= '1';
			when others => do(7) <= '1';
		end case;
	end process;
end architecture;