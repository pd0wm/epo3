library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity vga2 is
	port(
		clk      : in  std_logic;
		rst      : in  std_logic;

		v_sync   : out std_logic;
		h_sync   : out std_logic;

		ram_addr : out std_logic_vector(6 downto 0)
	);
end entity;