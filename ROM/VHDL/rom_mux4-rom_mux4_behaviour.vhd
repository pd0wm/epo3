library IEEE;
use IEEE.std_logic_1164.ALL;

architecture rom_mux4_behaviour of rom_mux4 is
begin
	process (selector, input_1, input_2, input_3, input_4)
	begin
		case selector is
			when "00" => output <= input_1;
			when "01" => output <= input_2;
			when "10" => output <= input_3;
			when others => output <= input_4;
		end case;
	end process;
end rom_mux4_behaviour;





