library ieee;
use ieee.std_logic_1164.all;
entity piece_lut is
	port(
		clk        : in  std_logic;
		rst        : in  std_logic;

		mask : out std_logic_vector(31 downto 0);
		
		
	);
end piece_lut;


