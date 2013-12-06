library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity vga_counter_8bitset is
	port(
		clk     : in  std_logic;
		rst     : in  std_logic;
		rst_ext : in  std_logic;

		en      : in  std_logic;
		set		: in std_logic;

		di		: in std_logic_vector(7 downto 0);
		val     : out std_logic_vector(7 downto 0)
	);
end entity;





