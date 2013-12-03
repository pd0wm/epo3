library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of score is


signal score, next_score : unsigned(7 downto 0);


begin
output <= std_logic_vector(score);

L1: process (clk)
    begin
     if rising_edge(clk) then
      if rst = '1' then
	score <= (others => '0');
      else
	score <= next_score;
      end if;
     end if;
    end process;

L2: process (clk,rst,increase,score)
    begin
	if increase = '1'  then
	 next_score <= score + 1;
	else 
	next_score <= score; 
	end if;
end process;
end behaviour;


















