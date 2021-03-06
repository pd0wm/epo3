library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sr_if is
    port(
        clk, rst     : in  std_logic;
        di           : in  std_logic;
        do1, do2     : out std_logic;
        we           : in  std_logic;
        addr1, addr2 : in  std_logic_vector(7 downto 0)
    );
end;             
             

    



