library IEEE;
use IEEE.std_logic_1164.ALL;

entity rom_mux24 is
   port(data_1					:IN	   std_logic_vector(3 downto 0);
		data_2			:IN	   std_logic_vector(3 downto 0);
		selector			:IN    std_logic;
		output			:OUT   std_logic_vector(3 downto 0));
end rom_mux24;


