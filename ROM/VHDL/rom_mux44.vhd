library IEEE;
use IEEE.std_logic_1164.ALL;

entity rom_mux44 is
	port(data_1					:IN	   std_logic_vector(3 downto 0);
		data_2			:IN	   std_logic_vector(3 downto 0);
		data_3			:IN	   std_logic_vector(3 downto 0);
		data_4			:IN	   std_logic_vector(3 downto 0);
		selector			:IN    std_logic_vector(1 downto 0);
		output			:OUT   std_logic_vector(3 downto 0));
end rom_mux44;


