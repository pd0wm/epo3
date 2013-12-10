library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.all;

architecture behaviour of adder_y is
begin

y_out <= std_logic_vector(to_unsigned(to_integer(unsigned(rom_in(1 downto 0))) + to_integer(unsigned(y_in)), 5));

end behaviour;

