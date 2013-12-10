library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture cs_7bc_arch of cs_7bc is
	signal state : std_logic_vector(6 downto 0);
begin
	value <= state;

	process(clk)
	begin
		if (clk'event and clk = '1') then
			if (rst = '1') then
				state <= (others => '0');
			elsif (en = '1') then
				state <= std_logic_vector(unsigned(state) + 1);
			end if;
		end if;
	end process;

end architecture;