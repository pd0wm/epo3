library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity timer_tb is
end entity;

architecture timer_tb_behav of timer_tb is
	component timer
		port(clk     : in  std_logic;
			 vga_clk : in  std_logic;
			 rst     : in  std_logic;
			 cnt_rst : in  std_logic;
			 time    : in  std_logic;
			 start   : in  std_logic;
			 ready   : out std_logic);
	end component timer;

	signal clk, rst, start, ready, time, cnt_rst, vga_clk : std_logic;
begin
	clock : process
	begin
		clk <= '1';
		wait for 82 ns;
		clk <= '0';
		wait for 82 ns;
	end process;
	
	vga_clock : process
	begin
		vga_clk <= '1';
		wait for 800 ns;
		vga_clk <= '0';
		wait for 800 ns;
	end process;

	uut : timer
		port map(clk     => clk,
			     vga_clk => vga_clk,
			     rst     => rst,
			     cnt_rst => cnt_rst,
			     time    => time,
			     start   => start,
			     ready   => ready);

	stimulus : process
	begin
		cnt_rst <= '0';
		rst <= '1';
		wait for 287 ns;
		rst <= '0';

		start <= '0';
		time <= '1';
		wait for 164 ns;

		start <= '1';
		wait for 164 ns;

		start <= '0';
		wait;
	end process;
end architecture;





