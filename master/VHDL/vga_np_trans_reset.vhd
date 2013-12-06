library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.vga_params.all;

entity vga_np_trans_reset is
	port(
		clk                : in  std_logic;
		rst                : in  std_logic;

		mem_addr_reset_out : out std_logic_vector(1 downto 0);

		end_np_line_in        : in  std_logic;
		end_frame_in       : in  std_logic
	);
end entity;