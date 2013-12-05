library IEEE;
use IEEE.std_logic_1164.ALL;

architecture testbench_behaviour of testbench is
	signal clk, reset, start, ram_in, ram_out, ram_write, score, ready : std_logic;
	signal ram_addr : std_logic_vector(7 downto 0);
	signal score_value : std_logic_vector(2 downto 0);

	component clearandshift is
   	port(clk        :in    std_logic;
         reset      :in    std_logic;
         start      :in    std_logic;
         ram_in     :in	   std_logic;
		 ram_out		  :out   std_logic;
         ram_addr   :out   std_logic_vector(7 downto 0);
         ram_write  :out   std_logic;
         score      :out   std_logic;
         ready      :out   std_logic);
	end component;
begin
	clearshift_port : clearandshift port map(clk, reset, start, ram_in, ram_out, ram_addr, ram_write, score, ready);

	clk <= '1' after 0 ns,
		   '0' after 160 ns when clk /= '0' else '1' after 160 ns;
	reset <= '1' after 0 ns, '0' after 300 ns;
	start <= '0' after 0 ns, '1' after 1000 ns;
	ram_in <= '1' after 0 ns;
end testbench_behaviour;






















