library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of log_score_tb is
component log_score is
	port(
		clk            : in  std_logic;
		rst            : in  std_logic;

		increase_value : in  std_logic_vector(2 downto 0);
		increase       : in  std_logic;

		output         : out std_logic_vector(7 downto 0)
	);
end component;
 
 signal clk,rst,increase: std_logic;
 signal increase_value: std_logic_vector(2 downto 0);
 signal output: std_logic_vector ( 7 downto 0);
 
 begin
   
   L1: log_score port map  ( clk => clk, rst => rst, 
        increase_value => increase_value, increase => increase,output => output); 
 L2: process 
 begin
  clk <= '1';
  wait for 1 us;
  clk <= '0';
  wait for 1 us;
end process;
 
 L3: process 
 begin
 wait for 0 us;
 increase_value <= "000";
   wait for 4 us;
 rst <= '1';
 wait for 4 us;
 rst <= '0';
 wait for 2200 ns;

 increase <= '1';
 wait for 2 us;
 increase <= '0';
 wait for 40 us;
 increase_value <= "001" ;
 increase <= '1';
 wait for 2 us;
 increase <= '0';
wait for 20 us;
 increase <= '1' ;
 increase_value <= "111";

 wait;
 
 end process; 
end behaviour;





