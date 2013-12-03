library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.vga_params.all;

entity vga is
    port(
        clk      : in  std_logic;
        rst      : in  std_logic;

        mem_addr : out std_logic_vector(mem_addr_len - 1 downto 0);
        data     : in  std_logic;

        h_sync   : out std_logic;
        v_sync   : out std_logic;

        red      : out std_logic;
        green    : out std_logic;
        blue     : out std_logic
    );
end entity;

