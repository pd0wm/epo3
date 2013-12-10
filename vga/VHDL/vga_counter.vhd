library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.vga_params.all;

entity vga_counter is
	port(
		clk      : in  std_logic;
		rst      : in  std_logic;

		pos_x_out : out std_logic_vector(pos_x_len-1 downto 0);
		pos_y_out : out std_logic_vector(pos_y_len-1 downto 0)
	);
end entity;