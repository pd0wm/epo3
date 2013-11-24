library ieee;
use ieee.std_logic_1164.all;

entity sr_16b_tb is
	constant clk_period     : time := 20 ns;
	constant initial_offset : time := 2 ns;
end entity;

architecture sr_16b_tb_arch of sr_16b_tb is
	component sr_16b
		port(clk, rst : in  std_logic;
			 we       : in  std_logic;
			 re       : in  std_logic;
			 di       : in  std_logic;
			 do       : out std_logic;
			 addr     : in  std_logic_vector(3 downto 0));
	end component sr_16b;

	signal clk, rst, re, we, do, di : std_logic;
	signal addr                     : std_logic_vector(3 downto 0);
begin
	uut : sr_16b
		port map(clk  => clk,
			     rst  => rst,
			     we   => we,
			     re   => re,
			     di   => di,
			     do   => do,
			     addr => addr);

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

		re <= '1';

		-- Read
		we <= '0';

		di   <= '0';
		addr <= "0000";
		wait for clk_period;
		
		-- Write
		we <= '1';

		di   <= '1';
		addr <= "0000";
		wait for clk_period;
		
		-- Read again
		we <= '0';

		di   <= '0';
		addr <= "0000";
		wait for clk_period;
		
		-- Read
		we <= '0';

		di   <= '0';
		addr <= "0100";
		wait for clk_period;
		
		-- Write
		we <= '1';

		di   <= '1';
		addr <= "0100";
		wait for clk_period;
		
		-- Read again
		we <= '0';

		di   <= '0';
		addr <= "0100";
		wait for clk_period;
		
		-- Read
		we <= '0';

		di   <= '0';
		addr <= "0010";
		wait for clk_period;
		
		-- Write
		we <= '1';

		di   <= '1';
		addr <= "0010";
		wait for clk_period;
		
		-- Read again
		we <= '0';

		di   <= '0';
		addr <= "0010";
		wait for clk_period;
	end process;
end;