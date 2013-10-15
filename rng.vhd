library ieee;
use ieee.std_logic_1164.all;

entity rng is
    port(
        clk    : in  std_logic;
        rst    : in  std_logic;

        output : out std_logic_vector(7 downto 0)
    );
end rng;
