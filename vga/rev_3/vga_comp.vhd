library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.vga_params.all;

entity vga_comp is
	port(
		clk        : in  std_logic;
		rst        : in  std_logic;

		mem_addr : out std_logic_vector(mem_addr_len-1 downto 0);
		h_sync : out std_logic;
		v_sync : out std_logic
	);
end entity;