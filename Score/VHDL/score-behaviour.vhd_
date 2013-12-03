library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of score is

signal uns_incval : unsigned(2 downto 0);
signal score, next_score : unsigned(7 downto 0);
--type state_type is ( s0, s1, s2);
--signal state,next_state : state_type;

begin
uns_incval <= unsigned (increase_value);
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

L2: process (clk,rst,increase_value,increase,score)
    begin
	if increase = '1' and uns_incval > 0 then
	 next_score <= score + uns_incval;
	else 
	next_score <= score; 
	end if;
end process;
end behaviour;















