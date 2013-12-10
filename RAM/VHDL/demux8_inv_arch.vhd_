library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture demux8_inv_behav of demux8_inv is
begin
	process(di, s)
	begin
		do      <= (others => '1');
		
		case s is
			when "000" => do(0) <= not di;
			when "001" => do(1) <= not di;
			when "010" => do(2) <= not di;
			when "011" => do(3) <= not di;
			when "100" => do(4) <= not di;
			when "101" => do(5) <= not di;
			when "110" => do(6) <= not di;
			when others => do(7) <= not di;
		end case;
	end process;
end architecture;


