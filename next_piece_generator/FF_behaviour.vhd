library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of ff is
	
begin
process (clk) is
begin
if (rising_edge(clk)) then
if rst= '1' then
Q <= '0';
else
Q  <= D;
end if;
end if;


end process;
end architecture behaviour;
