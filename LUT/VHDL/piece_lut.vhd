library ieee;
use ieee.std_logic_1164.all;
entity piece_lut is
	port(
		lut_clk         : in  std_logic;
		lut_rst         : in  std_logic;

		lut_mask        : out std_logic_vector(7 downto 0);
		lut_mask_select : in  std_logic_vector(1 downto 0);

		lut_x           : in  std_logic_vector(2 downto 0);
		lut_y           : in  std_logic_vector(3 downto 0);
		lut_rot         : in  std_logic_vector(1 downto 0);
		lut_piece_type  : in  std_logic_vector(2 downto 0);
		lut_next_piece  : in  std_logic;
		lut_ready       : out std_logic;
		lut_error_side  : out std_logic;
		lut_error_bot   : out std_logic;
		lut_start       : in  std_logic;

		lut_rom_addr    : out std_logic_vector(6 downto 0);
		lut_rom_data    : in  std_logic_vector(3 downto 0)
	);
end piece_lut;












