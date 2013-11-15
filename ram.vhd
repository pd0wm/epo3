library ieee;
use ieee.std_logic_1164.all;
use work.typedef.all;

entity ram is
	port(
		clk          : in    std_logic;
		rst          : in    std_logic;

		addr         : in    std_logic_vector(7 downto 0);
		data         : inout std_logic;

		ro1_addr     : in    std_logic_vector(7 downto 0);
		ro1_out      : out   std_logic;
		
		ro2_addr     : in    std_logic_vector(7 downto 0);
		ro2_out      : out   std_logic;
		
		ro3_addr     : in    std_logic_vector(7 downto 0);
		ro3_out      : out   std_logic;

		write_enable : in    std_logic
	);

end ram;


