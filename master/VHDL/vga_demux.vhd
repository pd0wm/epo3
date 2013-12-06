library ieee;
use ieee.std_logic_1164.all;
use work.vga_params.all;

entity vga_demux is
	port(
		def : in  std_logic_vector(mem_addr_len - 1 downto 0);
		s1  : in  std_logic;
		di1 : in  std_logic_vector(mem_addr_len - 1 downto 0);
		s2  : in  std_logic;
		di2 : in  std_logic_vector(mem_addr_len - 1 downto 0);
		do  : out std_logic_vector(mem_addr_len - 1 downto 0)
	);
end;









