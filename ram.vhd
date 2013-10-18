library ieee;
use ieee.std_logic_1164.all;
use work.typedef.all;

entity ram is
	port(
		clk          : in    std_logic;
		rst          : in    std_logic;

		addr         : in    std_logic_vector(7 downto 0);
		data         : inout std_logic;

		vga_addr     : in    std_logic_vector(7 downto 0);
		vga_out      : out   std_logic;

		write_enable : in    std_logic;

		-- For debugging!
		ramdata      : out   mem
	);

end ram;


