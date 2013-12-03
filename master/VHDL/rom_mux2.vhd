library IEEE;
use IEEE.std_logic_1164.ALL;

entity rom_mux2 is
   port(data_1					:IN	   std_logic;
		data_2			:IN	   std_logic;
		selector			:IN    std_logic;
		output			:OUT   std_logic);
end rom_mux2;

