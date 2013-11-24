library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture dec4_arch of dec4 is
begin
	process (s, di)
	begin
		do <= (others => '0');
	
		case s is
			when "00" => do(0) <= di;
			when "01" => do(1) <= di;
			when "10" => do(2) <= di;
			when others => do(3) <= di;
		end case;
	end process;
end;