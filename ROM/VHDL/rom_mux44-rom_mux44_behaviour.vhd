library IEEE;
use IEEE.std_logic_1164.ALL;

architecture rom_mux44_behaviour of rom_mux44 is
	component rom_mux4 is
   	port(input_1				:IN	   std_logic;
		 input_2			:IN	   std_logic;
		 input_3			:IN	   std_logic;
		 input_4			:IN	   std_logic;
		 selector			:IN    std_logic_vector(1 downto 0);
		 output			:OUT   std_logic);
	end component;
begin
	bit1: rom_mux4 port map(data_1(0), data_2(0), data_3(0), data_4(0), selector, output(0));
	bit2: rom_mux4 port map(data_1(1), data_2(1), data_3(1), data_4(1), selector, output(1));
	bit3: rom_mux4 port map(data_1(2), data_2(2), data_3(2), data_4(2), selector, output(2));
	bit4: rom_mux4 port map(data_1(3), data_2(3), data_3(3), data_4(3), selector, output(3));
end rom_mux44_behaviour;


