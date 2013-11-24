library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture dec10_arch of dec10 is
begin
	process (di, s)
	begin
		do <= (others => '0');
		
		case s is
			when "0000" => do(0) <= di;
			when "0001" => do(1) <= di;
			when "0010" => do(2) <= di;
			when "0011" => do(3) <= di;
			when "0100" => do(4) <= di;
			when "0101" => do(5) <= di;
			when "0110" => do(6) <= di;
			when "0111" => do(7) <= di;
			when "1000" => do(8) <= di;
			when others => do(9) <= di;
		end case;
	end process;
end;