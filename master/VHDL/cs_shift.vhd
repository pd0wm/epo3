library ieee;
use ieee.std_logic_1164.all;

entity cs_shift is
	port(
		clk, rst     : in  std_logic;
		start_in     : in  std_logic;
		ready_out    : out std_logic;

		ram_addr_in  : in  std_logic_vector(6 downto 0);
		ram_addr_out : out std_logic_vector(7 downto 0);
		ram_we       : out std_logic;
		ram_data_in  : in  std_logic;
		ram_data_out : out std_logic
	);
end entity;