library ieee;
use ieee.std_logic_1164.all;

entity sr_160b_tb is
	constant clk_period     : time := 20 ns;
	constant initial_offset : time := 5 ns;
end entity;

architecture sr_160b_tb_behav of sr_160b_tb is
	component sr_160b
		port(clk  : in  std_logic;
			 rst  : in  std_logic;
			 addr : in  std_logic_vector(7 downto 0);
			 di   : in  std_logic;
			 do   : out std_logic;
			 we   : in  std_logic);
	end component sr_160b;

	signal clk, rst   : std_logic;
	signal addr       : std_logic_vector(7 downto 0);
	signal do, we, di : std_logic;
begin
	uut : sr_160b
		port map(clk  => clk,
			     rst  => rst,
			     addr => addr,
			     di   => di,
			     do   => do,
			     we   => we);

	clock : process
	begin
		clk <= '1';
		wait for clk_period / 2;
		clk <= '0';
		wait for clk_period / 2;
	end process;

	stimulus : process
	begin
		rst <= '1';
		we  <= '0';
		wait for clk_period - initial_offset;
		rst <= '0';

		-- First read some stuff
		we   <= '0';
		addr <= "00000010";
		di   <= '0';
		wait for clk_period * 4;

		-- Write
		we   <= '1';
		addr <= "00000010";
		di   <= '1';
		wait for clk_period * 4;

		-- Read again
		we   <= '0';
		addr <= "00000010";
		di   <= '0';
		wait for clk_period * 4;

		-- First read some stuff
		we   <= '0';
		addr <= "00100000";
		di   <= '0';
		wait for clk_period * 4;

		-- Write
		we   <= '1';
		addr <= "00100000";
		di   <= '1';
		wait for clk_period * 4;

		-- Read again
		we   <= '0';
		addr <= "00100000";
		di   <= '0';
		wait for clk_period * 4;

		-- First read some stuff
		we   <= '0';
		addr <= "00010010";
		di   <= '0';
		wait for clk_period * 4;

		-- Write
		we   <= '1';
		addr <= "00010010";
		di   <= '1';
		wait for clk_period * 4;

		-- Read again
		we   <= '0';
		addr <= "00010010";
		di   <= '0';
		wait for clk_period * 4;
	end process;
end;

