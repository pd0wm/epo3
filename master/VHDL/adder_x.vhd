library IEEE;
use IEEE.std_logic_1164.ALL;

entity adder_x is
   port(x  :in    std_logic_vector(2 downto 0);
        rom_data:in    std_logic_vector(3 downto 0);
	next_piece:in std_logic;
        x_out :out   std_logic_vector(3 downto 0));
end adder_x;











