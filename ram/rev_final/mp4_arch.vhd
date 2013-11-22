library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture mp4_arch of mp4 is
begin
	process (s, di)
	begin
		case s is
			when "00" => do <= di(0);
			when "01" => do <= di(1);
			when "10" => do <= di(2);
			when others => do <= di(3);
		end case;
	end process;
end;