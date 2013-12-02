library IEEE;
use IEEE.std_logic_1164.ALL;

architecture rom_mux2_behaviour of rom_mux2 is
begin
	process (selector, data_1, data_2)
	begin
		case selector is
			when '0' => output <= data_1;
			when others => output <= data_2;
		end case;
	end process;
end rom_mux2_behaviour;




