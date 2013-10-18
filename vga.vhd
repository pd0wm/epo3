library ieee;
use ieee.std_logic_1164.all;
entity vga is
	port(
		clk      : in  std_logic;
		rst      : in  std_logic;

		red      : out std_logic;
		green    : out std_logic;
		blue     : out std_logic;
		h_sync   : out std_logic;
		v_sync   : out std_logic;

		vga_clk  : out std_logic;

		ram_addr : out std_logic_vector(7 downto 0);
		data_in  : in  std_logic_vector(2 downto 0)
	);
end vga;


