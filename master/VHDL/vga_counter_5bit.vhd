library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity vga_counter_5bit is
	port(
		clk     : in  std_logic;
		rst     : in  std_logic;
		rst_ext : in  std_logic;

		en      : in  std_logic;

		val     : out std_logic_vector(4 downto 0)
	);
end entity;





