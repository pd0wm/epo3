library IEEE;
use IEEE.std_logic_1164.ALL;

entity clearandshift is
   port(clk        :in    std_logic;
        reset      :in    std_logic;
        start      :in    std_logic;
        ram_in     :in				std_logic;
		ram_out		  :out	  std_logic;
        ram_addr   :out   std_logic_vector(7 downto 0);
        ram_write  :out   std_logic;
        score      :out   std_logic;
        ready      :out   std_logic);
end clearandshift;











