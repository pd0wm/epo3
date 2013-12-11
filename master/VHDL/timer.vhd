library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity timer is
	port(
		clk     : in  std_logic;
		vga_clk : in  std_logic;

		rst     : in  std_logic;
		ctr_rst : in  std_logic;

		time    : in  std_logic;
		start   : in  std_logic;
		ready   : out std_logic);
end timer;









































