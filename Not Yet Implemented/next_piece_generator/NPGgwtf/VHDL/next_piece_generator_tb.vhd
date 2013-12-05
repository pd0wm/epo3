LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
entity npgentestbench is
end entity npgentestbench;

architecture test of npgentestbench is
component npgen IS
PORT
(
    clk : in std_logic;
		rst : in std_logic;
		button_seed : in std_logic;
		new_number : in std_logic;
		output : out std_logic_vector(2 downto 0)
);
END component npgen;
	
	signal clk,rst,button_seed,new_number: std_logic;
	signal output: std_logic_vector(2 downto 0);
	begin
	  clk <= '1' after 0 ns,
	  '0' after 1 us when clk /= '0' else '1' after 1 us;
	  rst <= '1' after 0 ns, '0' after 40 us;
	  new_number <= '0' after 0 ns, '1' after 5 us, '0' after 15 us, '1' after 30 us, '0' after 50 us;
	  button_seed <= '0' after 0 ns,'1' after 30 us, '0' after 35 us, '1' after 90 us, '0' after 160 us, '1' after 350 us, '0' after 480 us;
	  
npgentje: npgen port map(
  clk=>clk,
  rst =>rst,
  button_seed=>button_seed,
  new_number => new_number,
  output => output
  );
end architecture test;
