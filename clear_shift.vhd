library ieee;
use ieee.std_logic_1164.all;
entity draw_erase_piece is
	port(
		clk            : in  std_logic;
		rst            : in  std_logic;

		ready          : out std_logic;
		start          : in  std_logic;

		piece_type     : in  std_logic_vector(2 downto 0);

		vga_data_read  : in  std_logic_vector(2 downto 0);
		vga_data_write : out std_logic_vector(2 downto 0);

		vga_addr       : out std_logic_vector(7 downto 0)
	);
end draw_erase_piece;


