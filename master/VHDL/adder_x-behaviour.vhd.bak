library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.all;

architecture behaviour of adder_x is
begin

process(next_piece, rom_data, x)
begin

	if (next_piece = '1' and rom_data = "01" ) then
      		x_out <= std_logic_vector(to_unsigned(to_integer(unsigned(rom_data)) + to_integer(unsigned(x)), 4) + 4);                                    
	else
      		x_out <= std_logic_vector(to_unsigned(to_integer(unsigned(rom_data)) + to_integer(unsigned(x)), 4));
	end if;

end process;

end behaviour;








