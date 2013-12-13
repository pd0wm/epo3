library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of npg_tb is
component npg IS
PORT
(
    clk : in std_logic;
		rst : in std_logic;
		button_seed : in std_logic;
		new_number : in std_logic;
		output : out std_logic_vector(2 downto 0)
);
END component npg;
	
	signal clk,rst,button_seed,new_number: std_logic;
	signal output: std_logic_vector(2 downto 0);
	begin
	clock : process
	begin
		clk <= '1';
		wait for 82 ns;
		clk <= '0';
		wait for 82 ns;
	end process;
	
	stimulus : process
	begin
	  rst <= '1';
	  new_number <= '0';
	  button_seed <= '0';
	  wait for 287 ns;
	  rst <= '0';
	  wait for 1640 ns;
	  button_seed <= '1';
	  wait for 1804 ns;
	  button_seed <= '0';
	  wait for 1640 ns;
	  new_number <= '1';
	  wait for 164 ns;
	  new_number <= '0';
	  wait;
	  end process;
	  
	  
next_piece_generatortje: npg port map(
  clk=>clk,
  rst =>rst,
  button_seed=>button_seed,
  new_number => new_number,
  output => output
  );
end behaviour;







