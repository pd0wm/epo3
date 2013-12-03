library ieee;
use ieee.std_logic_1164.all;
entity draw_score is
    port(
        clk   : in    std_logic;
        rst   : in    std_logic;

        draw  : in    std_logic;
        ready : out   std_logic;
        input : in    std_logic_vector(15 downto 0);

        write : out   std_logic;
        addr  : out   std_logic_vector(7 downto 0);
        data_out  : out std_logic
    );
end draw_score;


