library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.vga_params.all;

entity vga_score_check is
	port(
		clk        : in  std_logic;
		rst        : in  std_logic;

		pos_x_in   : in  std_logic_vector(pos_x_len - 1 downto 0);
		pos_y_in   : in  std_logic_vector(pos_y_len - 1 downto 0);

		in_score_out : out std_logic;
		end_score_line_out : out std_logic
	);
end entity;