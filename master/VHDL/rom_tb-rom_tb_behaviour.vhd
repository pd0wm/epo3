library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.std_logic_unsigned.ALL;

architecture rom_tb_behaviour of rom_tb is
	signal addr : std_logic_vector(6 downto 0);
	signal data : std_logic_vector(3 downto 0);

	component rom is
	port(addr :IN    std_logic_vector(6 downto 0);
        	data :OUT   std_logic_vector(3 downto 0));
	end component;
begin
	rom_port : rom port map(addr, data);
	
	process
	begin
		for i in 0 to 111 loop -- Until 1101111
			addr <= conv_std_logic_vector(i, 7);
			wait for 100 ns;
		end loop;
		wait for 1000000 ns;
	end process;

	--addr <= "0000000" after 0 ns, -- 0000 SIM KLOPT
	--		"0000001" after 100 ns, -- 0001 SIM KLOPT
	--		"1101001" after 200 ns, -- 0001 SIM KLOPT
	--		"1000111" after 300 ns, -- 1001 SIM: 0101
	--		"0101101" after 400 ns, -- 0101 SIM KLOPT
	--		"0010011" after 500 ns, -- 0111 SIM KLOPT
	--		"1000111" after 600 ns, -- 1001 SIM: 0101
	--		"0010111" after 700 ns, -- 1100 SIM KLOPT
	--		"1000000" after 800 ns, -- 0000 SIM KLOPT
	--		"1001111" after 900 ns; -- 0000 SIM: 0101
end rom_tb_behaviour;










