LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
entity draw_erase_piece_testbench is
end entity draw_erase_piece_testbench;

architecture test of draw_erase_piece_testbench is
component draw_erase_piece is
PORT
(
	clk        : in    std_logic;
  rst        : in    std_logic;
  mask       : in    std_logic_vector(7 downto 0);
  draw_erase : in    std_logic;   --draw = 1, erase = 0
  ready      : out   std_logic;
  start      : in    std_logic;
  write      : out   std_logic;
  addr       : out   std_logic_vector(7 downto 0);
  data       : inout std_logic
);
END component draw_erase_piece;
	
	signal clk,rst, draw_erase, start, data, ready, write: std_logic;
	signal mask, addr: std_logic_vector(7 downto 0);
	begin
	  clk <= '1' after 0 ns,
	  '0' after 20 ns when clk /= '0' else '1' after 20 ns;
	  rst <= '1' after 0 ns, '0' after 200 ns;
	  start <= '1' after 300 ns, '0' after 340 ns, '1' after 800 ns, '0' after 900 ns, '1' after 1400 ns, '0' after 1460 ns;
	  draw_erase <= '1' after 300 ns, '0' after 800 ns, '1' after 900 ns;
	  mask <= "11101111" after 0 ns, "10110001" after 500 ns, "11110000" after 1100 ns;
	  data <= '1' after 0 ns, 'Z' after 100 ns, '0' after 500 ns, 'Z' after 780 ns, '1' after 1000 ns, 'Z' after 1380 ns;
	  
fghjk: draw_erase_piece port map(
  clk=>clk,
  rst =>rst,
  mask => mask,
  draw_erase=>draw_erase,
  ready => ready,
  start => start,
  write => write,
  addr => addr,
  data => data
  );
end architecture test;
