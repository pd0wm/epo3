library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.all;

architecture behaviour of adder_x is
begin

x_out <= std_logic_vector(to_unsigned(to_integer(unsigned(rom_in(1 downto 0))) + to_integer(unsigned(x_in)), 4));

end behaviour;


