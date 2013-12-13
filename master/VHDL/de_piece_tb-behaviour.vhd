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
        data       : out std_logic
);
END component de_piece;
	
	signal clk,rst, draw_erase, start, data, ready, write, lut_ready, lut_start: std_logic;
	signal mask, addr: std_logic_vector(7 downto 0);
	signal mask_select: std_logic_vector (1 downto 0);
	begin
	clock : process
	begin
		clk <= '1';
		wait for 82 ns;
		clk <= '0';
		wait for 82 ns;
	end process;
	stimulus : process
	begin
	  rst <= '1';
	  mask <= "11101111";
	  draw_erase <= '0';
	  start <= '0';
	  lut_ready <= '0';
	  wait for 287 ns;
	  rst <= '0';
	  wait for 164 ns;
	  start <= '1';
	  draw_erase <= '1';
	  wait for 492 ns;
	  lut_ready <= '1';
	  wait for 328 ns;
	  lut_ready <= '0';
	  wait for 492 ns;
	  lut_ready <= '1';
	  wait for 328 ns;
	  lut_ready <= '0';
	  wait for 492 ns;
	  lut_ready <= '1';
	  wait for 328 ns;
	  lut_ready <= '0';
	  wait for 492 ns;
	  lut_ready <= '1';
	  wait for 328 ns;
	  lut_ready <= '0';
	  wait for 492 ns;
	  start <= '0';
	  wait;
	  end process;
	  
dut: de_piece port map(
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























