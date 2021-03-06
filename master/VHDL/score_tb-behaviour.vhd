library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of score_tb is
component score is
   port(
		clk            : in  std_logic;
		rst            : in  std_logic;

		increase       : in  std_logic;

		output         : out std_logic_vector(7 downto 0)
		);
end component;

 
 signal clk,rst,increase: std_logic;
 signal output: std_logic_vector ( 7 downto 0);
 
 begin
   
   L1: score port map  ( clk => clk, rst => rst, 
        increase => increase,output => output); 
 L2: process 
 begin
  clk <= '1';
  wait for 82 ns;
  clk <= '0';
  wait for 82 ns;
end process;
 
 L3: process 
 begin
 wait for 0 ns;
 increase <= '0';
 rst <= '1';
 wait for 200 ns;
 rst <= '0';
 wait for 90 ns;
 increase <= '1';
 wait for  900 ns;
 increase <= '0';
 wait for 100 ns;

 increase <= '1';
 wait for 100 ns;
 increase <= '0';
 wait;


 end process; 
 

end behaviour;














