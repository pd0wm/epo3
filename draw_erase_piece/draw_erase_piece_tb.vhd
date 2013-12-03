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
	  clk <= '1' after 00 ns,
	  '0' after 200 ns when clk /= '0' else '1' after 200 ns;
	  rst <= '1' after 00 ns, '0' after 2000 ns;
	  start <= '0' after 00 ns, '1' after 3000 ns, '0' after 3400 ns, '1' after 8000 ns, '0' after 9000 ns, '1' after 14000 ns, '0' after 14600 ns;
	  draw_erase <= '0' after 00 ns, '1' after 3000 ns, '0' after 8000 ns, '1' after 9000 ns;
	  mask <= "11101111" after 00 ns, "10110001" after 5000 ns, "11110000" after 11000 ns;
	  data <= '1' after 00 ns, 'Z' after 1000 ns, '0' after 5000 ns, 'Z' after 7800 ns, '1' after 10000 ns, 'Z' after 13800 ns;
	  
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
