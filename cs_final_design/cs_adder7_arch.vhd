library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture cs_addr7_behav of cs_adder7 is
begin
	process(i)
	begin
		o <= std_logic_vector(unsigned(i)-8);
	end process;
end architecture;