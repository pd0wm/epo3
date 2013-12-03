library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.vga_params.all;

entity vga_counter_resets is
	port(
		pos_x_reset  : out std_logic;
		pos_y_reset  : out std_logic;
		pos_y_enable : out std_logic;

		pos_x        : in  std_logic_vector(pos_x_len - 1 downto 0);
		pos_y        : in  std_logic_vector(pos_y_len - 1 downto 0)
	);
end entity;