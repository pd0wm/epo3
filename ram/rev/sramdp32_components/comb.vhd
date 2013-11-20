library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.mem.all;

entity sramdp32_comb is
	port(
		mem_in : in mem;
		mem_out : out mem;
		
--		ro_in : in std_logic;
--		ro_out : out std_logic;
--		
--		rw_in : in std_logic;
--		rw_out : out std_logic;
		
		rw_addr     : in  std_logic_vector(4 downto 0);
		rw_data_in  : in  std_logic;
		rw_data_out : out std_logic;
		rw_we       : in  std_logic;

		ro_addr     : in  std_logic_vector(4 downto 0);
		ro_data_out : out std_logic
	);
end sramdp32_comb;