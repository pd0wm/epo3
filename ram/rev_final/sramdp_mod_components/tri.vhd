library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.mem_params.all;

entity sramdp_mod_tri is
	port(
		clk      : in  std_logic;
		rst      : in  std_logic;

		enable   : in  std_logic;
		data_in  : in  std_logic;
		data_out : out std_logic
	);
end sramdp_mod_tri;