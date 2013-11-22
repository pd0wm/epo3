library ieee;
use ieee.std_logic_1164.all;

entity sr_4b_tb is
	constant clk_period     : time := 20 ns;
	constant initial_offset : time := 2 ns;
end entity;

architecture sr_4b_tb_arch of sr_4b_tb is
	component sr_4b
		port(clk, rst     : in  std_logic;
			 di           : in  std_logic;
			 we           : in  std_logic;
			 do1, do2     : out std_logic;
			 addr1, addr2 : in  std_logic_vector(1 downto 0));
	end component sr_4b;

	signal clk, rst, di, do1, do2, we : std_logic;
	signal addr1, addr2 : std_logic_vector(1 downto 0);
begin
	uut : sr_4b
		port map(clk   => clk,
			     rst   => rst,
			     di    => di,
			     we    => we,
			     do1   => do1,
			     do2   => do2,
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
		wait for clk_period - initial_offset;
		rst <= '0';
		
		
		-- Read
		addr1 <= "00";
		addr2 <= "00";
		we <= '0';
		di <= '0';
		wait for clk_period;		

		-- Write
		addr1 <= "10";
		addr2 <= "00";
		we <= '1';
		di <= '1';
		wait for clk_period;

		-- Read again
		addr1 <= "10";
		addr2 <= "00";
		we <= '0';
		di <= '0';
		wait for clk_period;
		
		-- Read
		addr1 <= "00";
		addr2 <= "00";
		we <= '0';
		di <= '0';
		wait for clk_period;


		-- Read again
		addr1 <= "00";
		addr2 <= "10";
		we <= '0';
		di <= '0';
		wait for clk_period;
	end process;
end;