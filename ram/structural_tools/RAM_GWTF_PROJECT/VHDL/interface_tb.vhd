library ieee;
use ieee.std_logic_1164.all;

entity sr_if_tb is
	constant clk_period     : time := 160 ns;
	constant initial_offset : time := 100 ns;
end entity;

architecture sr_if_tb_behav of sr_if_tb is
	component sr_if
		port(clk, rst     : in  std_logic;
			 di           : in  std_logic;
			 do1, do2     : out std_logic;
			 we           : in  std_logic;
			 addr1, addr2 : in  std_logic_vector(7 downto 0));
	end component sr_if;
	
	signal clk, rst   : std_logic;
	signal addr1, addr2       : std_logic_vector(7 downto 0);
	signal do1, do2, we, di : std_logic;
begin
	uut : sr_if
		port map(clk   => clk,
			     rst   => rst,
			     di    => di,
			     do1   => do1,
			     do2   => do2,
			     we    => we,
			     addr1 => addr1,
			     addr2 => addr2);

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
		wait for clk_period*2 - initial_offset;
		rst <= '0';

		-- First read some stuff
		we   <= '0';
		addr1 <= "00000010";
		di   <= '0';
		
		addr2 <= "00000010";
		wait for clk_period * 4;

		-- Write
		we   <= '1';
		addr1 <= "00000010";
		di   <= '1';
		
		addr2 <= "00000010";
		wait for clk_period * 4;

		-- Read again
		we   <= '0';
		addr1 <= "00000010";
		di   <= '0';
		
		addr2 <= "00000010";
		wait for clk_period * 4;
-- Cycle 2
		-- First read some stuff
		we   <= '0';
		addr1 <= "10000000";
		di   <= '0';
		
		addr2 <= "00000010";
		wait for clk_period * 4;

		-- Write
		we   <= '1';
		addr1 <= "10000000";
		di   <= '1';
		
		addr2 <= "00000010";
		wait for clk_period * 4;

		-- Read again
		we   <= '0';
		addr1 <= "10000000";
		di   <= '0';
		
		addr2 <= "00000010";
		wait for clk_period * 4;
-- Tempo writing
		-- First read some stuff
		we   <= '0';
		addr1 <= "10010101";
		di   <= '0';
		
		addr2 <= "10010101";
		wait for clk_period;

		-- Write
		we   <= '1';
		addr1 <= "10010101";
		di   <= '1';
		
		addr2 <= "10010101";
		wait for clk_period;

		-- Read again
		we   <= '0';
		addr1 <= "10010101";
		di   <= '0';
		
		addr2 <= "10011111";
		wait for clk_period;
	end process;
end;

























