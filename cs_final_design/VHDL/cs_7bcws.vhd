library ieee;
use ieee.std_logic_1164.all;

entity cs_7bcws is
	port(
		clk, rst : in  std_logic;
		en, set  : in  std_logic;
		value    : out std_logic_vector(6 downto 0);
		data     : in  std_logic_vector(6 downto 0)
	);
end entity;