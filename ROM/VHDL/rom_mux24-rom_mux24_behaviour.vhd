library IEEE;
use IEEE.std_logic_1164.ALL;

architecture rom_mux24_behaviour of rom_mux24 is
	component rom_mux2 is
   	port(data_1				:IN	   std_logic;
		 data_2			:IN	   std_logic;
		 selector			:IN    std_logic;
		 output			:OUT   std_logic);
	end component;
begin
	bit1: rom_mux2 port map(data_1(0), data_2(0), selector, output(0));
	bit2: rom_mux2 port map(data_1(1), data_2(1), selector, output(1));
	bit3: rom_mux2 port map(data_1(2), data_2(2), selector, output(2));
	bit4: rom_mux2 port map(data_1(3), data_2(3), selector, output(3));
end rom_mux24_behaviour;


