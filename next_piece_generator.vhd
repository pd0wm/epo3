library ieee;
use ieee.std_logic_1164.all;
entity next_piece_generator is
    port(
        clk        : in  std_logic;
        rst        : in  std_logic;

        new_number : in  std_logic;
        output     : out std_logic_vector(2 downto 0);
        
		button_seed : in std_logic;
    );
end next_piece_generator;


