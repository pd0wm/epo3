library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.all;

architecture behaviour of adder_y is
begin

process(next_piece, rom_data, y)
begin

	if (next_piece = '1' and rom_data = "01" ) then
               y_out <= std_logic_vector(to_unsigned(to_integer(unsigned(rom_data)) + to_integer(unsigned(y)), 5) - 1);
        else
               y_out <= std_logic_vector(to_unsigned(to_integer(unsigned(rom_data)) + to_integer(unsigned(y)), 5));
        end if;
end process;

end behaviour;





