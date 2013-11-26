library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fake_ram is
	port(
		clk         : in  std_logic;
		rst         : in  std_logic;

		ro_addr     : in  std_logic_vector(6 downto 0);
		ro_data_out : out std_logic
	);

end fake_ram;