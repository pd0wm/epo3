library ieee;
use ieee.std_logic_1164.all;

entity sr_1b_tb is
	constant clk_period     : time := 20 ns;
	constant initial_offset : time := 2 ns;
end entity;

architecture sr_1b_tb_arch of sr_1b_tb is
	component sr_1b
		port(clk, rst : in  std_logic;
			 di       : in  std_logic;
			 do       : out std_logic;
			 we       : in  std_logic);
	end component sr_1b;

	signal clk, rst, di, do, we : std_logic;
begin
	uut : sr_1b
		port map(clk => clk,
			     rst => rst,
			     di  => di,
			     do  => do,
			     we  => we);
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
		
		-- Read
		we <= '0';
		di <= '0';
		wait for clk_period;		

		-- Write
		we <= '1';
		di <= '1';
		wait for clk_period;

		-- Read again
		we <= '0';
		di <= '0';
		wait for clk_period;
		-- Write
		we <= '1';
		di <= '0';
		wait for clk_period;

		-- Read again
		we <= '0';
		di <= '1';
		wait for clk_period;
	end process;
end;