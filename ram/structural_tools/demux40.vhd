library ieee;
use ieee.std_logic_1164.all;

entity demux40 is
	port(
		di : in  std_logic;
		do : out std_logic_vector(39 downto 0);
		s  : in  std_logic_vector(7 downto 0)
	);

	signal o1 : std_logic_vector(1 downto 0);
end;

architecture demux40_arch of demux40 is
begin
	process
		variable sel : integer 0 to 39;
	begin
		do      <= '0';
		sel     := to_integer(unsigned(s));
		do(sel) <= di;
	end process;
end architecture;