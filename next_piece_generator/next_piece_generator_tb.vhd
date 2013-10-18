LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
entity next_piece_generatortestbench is
end entity next_piece_generatortestbench;

architecture test of next_piece_generatortestbench is
component next_piece_generator IS
PORT
(
    clk : in std_logic;
		rst : in std_logic;
		button_seed : in std_logic;
		new_number : in std_logic;
		output : out std_logic_vector(2 downto 0)
);
END component next_piece_generator;
	
	signal clk,rst,button_seed,new_number: std_logic;
	signal output: std_logic_vector(2 downto 0);
	begin
	  clk <= '1' after 0 ns,
	  '0' after 10 ns when clk /= '0' else '1' after 10 ns;
	  rst <= '1' after 0 ns, '0' after 60 ns;
	  new_number <= '0' after 0 ns, '1' after 500 ns, '0' after 1500 ns, '1' after 3000 ns, '0' after 5000 ns;
	  button_seed <= '1' after 300 ns, '0' after 350 ns, '1' after 900 ns, '0' after 1600 ns, '1' after 3500 ns, '0' after 4800 ns;
	  
next_piece_generatortje: next_piece_generator port map(
  clk=>clk,
  rst =>rst,
  button_seed=>button_seed,
  new_number => new_number,
  output => output
  );
end architecture test;
