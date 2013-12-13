LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY top_level IS 
	PORT
	(
		rst :  IN  STD_LOGIC;
		clk :  IN  STD_LOGIC;
		dbg_inputs :  IN  STD_LOGIC_VECTOR(5 DOWNTO 0);
		vga_hsync :  OUT  STD_LOGIC;
		vga_vsync :  OUT  STD_LOGIC;
		vga_clk :  OUT  STD_LOGIC;
		vga_r :  OUT  STD_LOGIC;
		vga_g :  OUT  STD_LOGIC;
		vga_b :  OUT  STD_LOGIC
	);
END top_level;


