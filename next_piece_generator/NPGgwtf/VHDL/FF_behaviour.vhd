library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of npg_ff is
	
begin
process (clk) is
begin
if (rising_edge(clk)) then
if rst= '1' then
q <= '0';
else
q  <= d;
end if;
end if;


end process;
end architecture behaviour;
