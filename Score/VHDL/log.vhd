library IEEE;
use IEEE.std_logic_1164.ALL;

entity log is
   port(log_in :in    std_logic_vector(7 downto 0);
        log_out:out   std_logic_vector(7 downto 0));
end log;


