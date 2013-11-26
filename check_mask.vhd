library ieee;
use ieee.std_logic_1164.all;
entity check_mask is
	port(
		clk         : in    std_logic;
		rst         : in    std_logic;

		mask        : in    std_logic_vector(7 downto 0);
		mask_select : out   std_logic_vector(2 downto 0);

		ready       : out   std_logic;
		emtpy       : out   std_logic;

		start       : in    std_logic;

		write       : out   std_logic;
		addr        : out   std_logic_vector(7 downto 0);
		data        : inout std_logic
	);
end check_mask;


