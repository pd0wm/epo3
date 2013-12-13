library ieee;
use ieee.std_logic_1164.all;

entity top_level2 is
	port(
		rst        : in  std_logic;
		clk        : in  std_logic;
		inputs     : in  std_logic_vector(5 downto 0);
		vga_h_sync : out std_logic;
		vga_v_sync : out std_logic;
		vga_red    : out std_logic;
		vga_green  : out std_logic;
		vga_blue   : out std_logic
	);
end top_level2;