library ieee;
use ieee.std_logic_1164.all;

entity vga_tb is
	constant clk_period     : time := 20 ns;
	constant initial_offset : time := 2 ns;
end entity;

architecture vga_tb_behav of vga_tb is
	component vga
		port(clk      : in  std_logic;
			 rst      : in  std_logic;
			 red      : out std_logic;
			 green    : out std_logic;
			 blue     : out std_logic;
			 h_sync   : out std_logic;
			 v_sync   : out std_logic;
			 vga_clk  : out std_logic;
			 ram_addr : out std_logic_vector(7 downto 0);
			 data_in  : in  std_logic);
	end component vga;
	
	signal clk, rst, data_in : std_logic;
	signal red, green, blue, h_sync, v_sync, vga_clk : std_logic;
	signal ram_addr : std_logic_vector(7 downto 0);
	
begin
	uut : vga port map(
		clk      => clk,
		rst      => rst,
		red      => red,
		green    => green,
		blue     => blue,
		h_sync   => h_sync,
		v_sync   => v_sync,
		vga_clk  => vga_clk,
		ram_addr => ram_addr,
		data_in  => data_in
	);
	
	clock : process
	begin
		clk <= '1';
		wait for clk_period / 2;
		clk <= '0';
		wait for clk_period / 2;
	end process;

	data_in <= '1';
	rst <= '1', '0' after clk_period;
end vga_tb_behav;