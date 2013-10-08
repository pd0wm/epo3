library ieee;
use ieee.std_logic_1164.all;
entity piece_lut is
	port(
		clk        : in  std_logic;
		rst        : in  std_logic;

		mask       : out std_logic_vector(31 downto 0);

		x, y       : in  std_logic_vector(7 downto 0);
		rot        : in  std_logic_vector(1 downto 0);
		piece_type : in  std_logic_vector(2 downto 0);
		ready      : out std_logic;
		error      : out std_logic;

		rom_addr   : out std_logic_vector(7 downto 0);
		rom_data   : in  std_logic_vector(15 downto 0)
	);
end piece_lut;


