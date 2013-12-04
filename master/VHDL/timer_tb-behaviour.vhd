library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of timer_tb is


component timer 
   port(timer_clk      :in    std_logic;
	timer_vga_clk	 :in	std_logic;
        timer_rst    	 :in    std_logic;
	timer_time	 :in    std_logic_vector(7 downto 0);
	timer_start	 	:in 	std_logic;
        timer_done 	   :out   std_logic);
end component timer;
signal timer_clk,timer_vga_clk,timer_rst,timer_start,timer_done : std_logic;
signal timer_time : std_logic_vector(7 downto 0);
begin 
lbl1: timer port map (timer_clk=>timer_clk, timer_vga_clk => timer_vga_clk, timer_rst=>timer_rst,timer_time => timer_time, timer_start=>timer_start, timer_done=>timer_done);
timer_clk <= 	'1' after 0 ns,
	'0' after 50 ns when timer_clk /= '0' else '1' after 50 ns;
timer_vga_clk <= '1' after 0 ns,
	   '0' after 80 ns when timer_vga_clk /= '0' else '1' after 80 ns;
timer_rst <= 	'1' after 0 ns,
	'0' after 120 ns;
timer_time <=  "00000100" after 0 ns;
timer_start <= '0' after 0 ns,
	 '1' after 220 ns,
	'0' after 1522 ns,
	'1' after 2030 ns;
	
end behaviour;




