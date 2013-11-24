library ieee;
use ieee.std_logic_1164.all;

entity sr_4b_tb is
	constant clk_period     : time := 20 ns;
	constant initial_offset : time := 2 ns;
end entity;

architecture sr_4b_tb_arch of sr_4b_tb is
	component sr_4b
		port(clk, rst : in  std_logic;
			 di       : in  std_logic;
			 do       : out std_logic;
			 we       : in  std_logic;
			 addr     : in  std_logic_vector(1 downto 0));
	end component sr_4b;

	signal clk, rst, di, do, we : std_logic;
	signal addr : std_logic_vector(1 downto 0);
begin
	uut : sr_4b
		port map(clk  => clk,
			     rst  => rst,
			     di   => di,
			     do   => do,
			     we   => we,
			     addr => addr);
			     
	process
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
		addr <= "00";
		we <= '0';
		di <= '0';
		wait for clk_period;		

		-- Write
		addr <= "10";
		we <= '1';
		di <= '1';
		wait for clk_period;

		-- Read again
		addr <= "00";
		we <= '0';
		di <= '0';
		wait for clk_period;
		
		-- Read
		addr <= "10";
		we <= '0';
		di <= '0';
		wait for clk_period;


		-- Read again
		addr <= "00";
		we <= '0';
		di <= '0';
		wait for clk_period;
	end process;
end;