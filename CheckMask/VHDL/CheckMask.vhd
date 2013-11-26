library IEEE;
use IEEE.std_logic_1164.ALL;

entity checkmask is
   port(clk				  :IN		 std_logic;
		  reset		  :IN		 std_logic;
		  data     :IN   std_logic;
		  start    :IN   std_logic;
        ram_in   :IN   std_logic_vector(7 downto 0);
        write    :OUT  std_logic;
        ready    :OUT  std_logic;
        empty    :OUT  std_logic;
        ram_out  :OUT  std_logic_vector(7 downto 0));
end checkmask;
