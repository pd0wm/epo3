library IEEE;
use IEEE.std_logic_1164.ALL;

entity tri_buff is
   port(sel :in    std_logic;
        inp :in    std_logic_vector(7 downto 0);
        outp:out   std_logic_vector(7 downto 0));
end tri_buff;





