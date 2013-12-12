library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of timer_tb is
component timer is
        port(
                clk : in std_logic;
                vga_clk : in std_logic;

                rst : in std_logic;
                ctr_rst : in std_logic;

                time : in std_logic;
                start : in std_logic;
                ready : out std_logic);
end component;
signal clk,vga_clk,rst,ctr_rst,start,ready,time : std_logic;
begin
lbl1: timer port map (clk => clk, vga_clk => vga_clk, rst => rst, ctr_rst => ctr_rst, time => time, start => start, ready => ready);

clk <=         '1' after 0 ns,
        '0' after 50 ns when clk /= '0' else '1' after 50 ns;
vga_clk <= '1' after 0 ns,
         '0' after 166 ns when vga_clk /= '0' else '1' after 166 ns;
rst <= 	'1' after 0 ns,
	'0' after 200 ns;
ctr_rst <= '0' after 0 ns,
	   '1' after 14000 ns;
time <= '0' after 0 ns,
	'1' after 2300 ns;
start <= '0' after 0 ns,
	'1' after 400 ns,
	'0' after 2200 ns,
	'1' after 2400 ns;
end behaviour;

















