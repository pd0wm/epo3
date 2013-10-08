library ieee;
use ieee.std_logic_1164.all;
entity ram is
    port(
        clk                      : in  std_logic;
        rst                      : in  std_logic;

        game_addr : in std_logic_vector(7 downto 0);
        game_data_write : in std_logic_vector(2 downto 0);
        game_data_read : out std_logic_vector(2 downto 0);
        
        vga_addr : in std_logic_vector(7 downto 0);
        vga_data_read : out std_logic_vector(3 downto 0);
        
        write_enable : in std_logic
    );
end ram;


