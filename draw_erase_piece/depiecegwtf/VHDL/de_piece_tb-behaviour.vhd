LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
entity de_piece_testbench is
end entity de_piece_testbench;

architecture behaviour of de_piece_testbench is
component de_piece is
PORT
(
        clk        : in    std_logic;
        rst        : in    std_logic;

        mask       : in    std_logic_vector(7 downto 0);

        draw_erase : in    std_logic;   --draw = 1, erase = 0
        ready      : out   std_logic;
        start      : in    std_logic;
	mask_select: out std_logic_vector(1 downto 0);
	lut_start : out std_logic;
	lut_ready : in std_logic;

        write      : out   std_logic;
        addr       : out   std_logic_vector(7 downto 0);
        data       : inout std_logic
);
END component de_piece;
	
	signal clk,rst, draw_erase, start, data, ready, write, lut_ready, lut_start: std_logic;
	signal mask, addr: std_logic_vector(7 downto 0);
	signal mask_select: std_logic_vector (1 downto 0);
	begin
	  clk <= '1' after 00 ns,
	  '0' after 50 ns when clk /= '0' else '1' after 50 ns;
	  rst <= '1' after 00 ns, '0' after 2000 ns;
	  start <= '0' after 00 ns, '1' after 3000 ns, '0' after 5500 ns, '1' after 8000 ns, '0' after 9000 ns, '1' after 14000 ns, '0' after 14600 ns;
	  draw_erase <= '0' after 00 ns, '1' after 3000 ns, '0' after 8000 ns, '1' after 9000 ns;
	  mask <= "11101111" after 00 ns, "10110001" after 5000 ns, "11110000" after 11000 ns;
	lut_ready <= '0' after 0 ns, '1' after 4000 ns, '0' after 4950 ns, '1' after 8200 ns, '0' after 8950 ns, '1' after 15000 ns, '0' after 16000 ns;
	  data <= '1' after 00 ns, 'Z' after 1000 ns, '0' after 5000 ns, 'Z' after 7800 ns, '1' after 10000 ns, 'Z' after 13800 ns;
	  
fghjk: de_piece port map(
  clk=>clk,
  rst =>rst,
  mask => mask,
  draw_erase=>draw_erase,
  ready => ready,
  start => start,
	mask_select => mask_select,
	lut_start => lut_start,
	lut_ready => lut_ready,
  write => write,
  addr => addr,
  data => data
  );
end behaviour;



















