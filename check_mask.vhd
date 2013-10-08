library ieee;
use ieee.std_logic_1164.all;
entity check_mask is
	port(
		clk           : in  std_logic;
		rst           : in  std_logic;

		mask          : in  std_logic_vector(31 downto 0);

		ready         : out std_logic;
		emtpy         : out std_logic;

		start         : in  std_logic;

		vga_data_read : in  std_logic_vector(2 downto 0);
		vga_addr      : out std_logic_vector(7 downto 0)
	);
end check_mask;


