library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sramdp_comb is
	port(
		mem_in : in std_logic_vector(7 downto 0);
		mem_out : out std_logic_vector(7 downto 0);
		
		rw_addr     : in  std_logic_vector(2 downto 0);
		rw_data_in  : in  std_logic;
		rw_data_out : out std_logic;
		rw_we       : in  std_logic;

		ro_addr     : in  std_logic_vector(2 downto 0);
		ro_data_out : out std_logic
	);
end sramdp_comb;