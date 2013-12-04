library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity timer is
   port(timer_clk      :in    std_logic;
	timer_vga_clk  :in		std_logic;
        timer_rst      :in    std_logic;
	timer_ctr_rst : in std_logic;
	timer_time	 :in 	std_logic_vector(7 downto 0);
	timer_start	 :in 	std_logic;
        timer_done		 :out   std_logic);
end timer;









































