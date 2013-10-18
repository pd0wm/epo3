library ieee;
use ieee.std_logic_1164.all;
entity ram is
    port(
        clk                      : in  std_logic;
        rst                      : in  std_logic;

        addr : in std_logic_vector(7 downto 0);
        data : inout std_logic;
        
        vga_addr : in std_logic_vector(7 downto 0);
        vga_out : out std_logic_vector(2 downto 0);
        
        write_enable : in std_logic
    );
end ram;


