library IEEE;
use IEEE.std_logic_1164.ALL;

entity rom_mux4 is
port(input_1					:IN	   std_logic;
		input_2			:IN	   std_logic;
		input_3			:IN	   std_logic;
		input_4			:IN	   std_logic;
		selector			:IN    std_logic_vector(1 downto 0);
		output			:OUT   std_logic);
end rom_mux4;


