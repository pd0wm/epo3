library ieee;
use ieee.std_logic_1164.all;
entity clear_shift is
    port(
        clk   : in    std_logic;
        rst   : in    std_logic;

        ready : out   std_logic;
        start : in    std_logic;

        write : out   std_logic;
        addr  : out   std_logic_vector(7 downto 0);
        data_out  : out std_logic;
        data_in : in std_logic;


        --score
        score_increase    : out std_logic
    );
end clear_shift;


