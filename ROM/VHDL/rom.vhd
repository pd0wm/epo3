library IEEE;
use IEEE.std_logic_1164.ALL;

entity rom is
   port(addr :IN    std_logic_vector(6 downto 0);
        data :OUT   std_logic_vector(3 downto 0));
end rom;

