library IEEE;
use IEEE.std_logic_1164.ALL;

architecture checkmask_tb_behaviour of checkmask_tb is
	signal clk, reset, data, start, write, ready, empty : std_logic;
	signal ram_in, ram_out : std_logic_vector(7 downto 0);

	component checkmask is
   	port(clk				 :IN		 std_logic;
		  reset		  :IN		 std_logic;
		  data     :IN   std_logic;
		  start    :IN   std_logic;
        ram_in   :IN   std_logic_vector(7 downto 0);
        write    :OUT  std_logic;
        ready    :OUT  std_logic;
        empty    :OUT  std_logic;
        ram_out  :OUT  std_logic_vector(7 downto 0));
	end component;
begin
	checkmask_port : checkmask port map(clk, reset, data, start, ram_in, write, ready, empty, ram_out);
	
	clk <= '1' after 0 ns,
		   '0' after 10 ns when clk /= '0' else '1' after 10 ns;
	reset <= '1' after 0 ns, '0' after 30 ns;
	start <= '0' after 0 ns,
	         '1' after 50 ns,
	         '0' after 70 ns,
	         '1' after 250 ns,
	         '0' after 270 ns,
	         '1' after 450 ns,
	         '0' after 470 ns;
	ram_in <= "01101100" after 50 ns,
	          "00001111" after 250 ns,
	          "01100110" after 450 ns;
	data <= '0' after 70 ns,
	        '1' after 270 ns,
	        '1' after 470 ns;
	
end checkmask_tb_behaviour;