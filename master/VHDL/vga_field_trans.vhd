library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.vga_params.all;

entity vga_field_trans is
	port(
		clk               : in  std_logic;
		rst               : in  std_logic;

		mem_addr_reset_in : in  std_logic_vector(3 downto 0);
		mem_addr_out      : out std_logic_vector(mem_addr_len - 1 downto 0);
		
		in_field_in       : in  std_logic;
		
		new_line_in       : in std_logic;
		new_frame_in      : in std_logic);
end entity;