library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of log is
begin
process(log_in)
begin
if(log_in(7) = '1') then
 log_out (7 downto 0) <= (others => '1');

elsif(log_in(6) = '1') then
 log_out(7) <= '0';
 log_out(6 downto 0) <= (others => '1');
 
elsif(log_in(5) = '1') then
 log_out(7 downto 6) <= (others => '0'); 
 log_out(5 downto 0) <= (others => '1'); 

elsif(log_in(4) = '1') then
 log_out(7 downto 5) <= (others => '0'); 
 log_out(4 downto 0) <= (others => '1');
 
elsif(log_in(3) = '1') then
 log_out(7 downto 4) <= (others => '0'); 
 log_out(3 downto 0) <= (others => '1'); 

elsif(log_in(2) = '1') then
 log_out(7 downto 3) <= (others => '0'); 
 log_out(2 downto 0) <= (others => '1'); 

elsif(log_in(1) = '1') then
 log_out(7 downto 2) <= (others => '0'); 
 log_out(1 downto 0) <= (others => '1'); 

elsif(log_in(0) = '1') then
 log_out(7 downto 1) <= (others => '0'); 
 log_out(0) <= '1';
 
else 
 log_out(7 downto 0) <= (others => '0');

end if;
end process;

end behaviour;

















