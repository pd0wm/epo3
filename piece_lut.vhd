library IEEE;
use IEEE.std_logic_1164.ALL;

entity lut is
   port(clk	  :IN	 std_logic;
	reset	  :IN	 std_logic;
	start     :IN    std_logic;
        rot       :IN    std_logic_vector(1 downto 0);
        y         :IN    std_logic_vector(3 downto 0);
        x         :IN    std_logic_vector(2 downto 0);
        p_type    :IN    std_logic_vector(2 downto 0);
        rom_in    :IN    std_logic_vector(3 downto 0);
        pixel     :IN    std_logic_vector(1 downto 0);
	rom_out	  :OUT	 std_logic_vector(6 downto 0);
        ready     :OUT   std_logic;
        error_side:OUT   std_logic;
        error_bot :OUT   std_logic;
        ram	  :OUT   std_logic_vector(7 downto 0));
end lut;






