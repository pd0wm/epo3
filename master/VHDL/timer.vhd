library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity timer is
	port(
		clk     : in  std_logic;
		vga_clk : in  std_logic;

		rst     : in  std_logic;
		cnt_rst : in  std_logic;

		time    : in  std_logic;
		start   : in  std_logic;
		ready   : out std_logic);
end timer;









































