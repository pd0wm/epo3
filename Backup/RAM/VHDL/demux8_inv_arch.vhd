library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture demux8_inv_behav of demux8_inv is
	signal do_i : std_logic_vector(7 downto 0);
begin
	do(0) <= not do_i(0);
	do(1) <= not do_i(1);
	do(2) <= not do_i(2);
	do(3) <= not do_i(3);
	do(4) <= not do_i(4);
	do(5) <= not do_i(5);
	do(6) <= not do_i(6);
	do(7) <= not do_i(7);
	

	process(di, s)
	begin
		do_i      <= (others => '0');
		
		case s is
			when "000" => do_i(0) <= di;
			when "001" => do_i(1) <= di;
			when "010" => do_i(2) <= di;
			when "011" => do_i(3) <= di;
			when "100" => do_i(4) <= di;
			when "101" => do_i(5) <= di;
			when "110" => do_i(6) <= di;
			when others => do_i(7) <= di;
		end case;
	end process;
end architecture;





