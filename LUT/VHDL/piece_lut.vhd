library ieee;
use ieee.std_logic_1164.all;
entity piece_lut is
	port(
		clk         : in  std_logic;
		rst         : in  std_logic;

		mask        : out std_logic_vector(7 downto 0);
		mask_select : in  std_logic_vector(1 downto 0);

		x           : in  std_logic_vector(2 downto 0);
		y           : in  std_logic_vector(3 downto 0);
		rot         : in  std_logic_vector(1 downto 0);
		piece_type  : in  std_logic_vector(2 downto 0);
		next_piece  : in  std_logic;
		ready       : out std_logic;
		error_side  : out std_logic;
		error_bot   : out std_logic;
		start       : in  std_logic;

		rom_addr    : out std_logic_vector(6 downto 0);
		rom_data    : in  std_logic_vector(3 downto 0)
	);
end piece_lut;









