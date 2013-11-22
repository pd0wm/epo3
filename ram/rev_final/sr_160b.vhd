library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sr_160b is
	port(
		clk         : in  std_logic;
		rst         : in  std_logic;

		rw_addr     : in  std_logic_vector(7 downto 0);
		rw_data_in  : in  std_logic;
		rw_data_out : out std_logic;
		rw_we		: in std_logic;

		ro_addr     : in  std_logic_vector(7 downto 0);
		ro_data_out : out std_logic
	);

end;