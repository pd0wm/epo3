library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sramdp_whole_mp is
	port(
		rw_we_i, ro_re_i, rw_re_i : out std_logic_vector(5 downto 0);
		
		rw_subaddr     : in  std_logic_vector(4 downto 0);
		rw_we		: in std_logic;

		ro_subaddr     : in  std_logic_vector(4 downto 0)
	);

end sramdp_whole_mp;