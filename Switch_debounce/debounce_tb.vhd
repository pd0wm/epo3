LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
entity debounce_testbench is
end entity debounce_testbench;

architecture test of debounce_testbench is
component debounce is
PORT
(
		clk         : in  std_logic;
		rst         : in  std_logic;
		inputs      : in  std_logic_vector(2 downto 0);
		output      : out std_logic_vector(2 downto 0);
		random_seed : out std_logic
);
END component debounce;
	
	signal clk,rst, random_seed: std_logic;
	signal inputs, output: std_logic_vector(2 downto 0);
	begin
	  clk <= '1' after 0 ns,
	  '0' after 20 ns when clk /= '0' else '1' after 20 ns;
	  rst <= '1' after 0 ns, '0' after 200 ns;
	  inputs <= "000" after 0 ns, "100" after 100 ns, "010" after 700 ns, "100" after 8000 ns, "001" after 10000 ns, "110" after 11000 ns, "000" after 18000 ns;
	  
fghjk: debounce port map(
  clk=>clk,
  rst =>rst,
  inputs => inputs,
  random_seed=>random_seed,
  output => output
  );
end architecture test;