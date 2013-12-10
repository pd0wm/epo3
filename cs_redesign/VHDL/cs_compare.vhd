library ieee;
use ieee.std_logic_1164.all;

entity cs_compare is
	port(
		clk, rst  : in  std_logic;
		start_in     : in  std_logic;
		ready_out     : out std_logic;

		ram_addr_out  : out std_logic_vector(6 downto 0);
		data_in : in std_logic
	);
end entity;