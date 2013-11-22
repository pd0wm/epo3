library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sramdp_tri is
	port(
		clk      : in  std_logic;
		rst      : in  std_logic;

		enable   : in  std_logic;
		data_in  : in  std_logic;
		data_out : out std_logic
	);
end sramdp_tri;