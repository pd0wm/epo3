library ieee;
use ieee.std_logic_1164.all;

entity bit4_tb is
	constant clk_period     : time := 20 ns;
	constant initial_offset : time := 2 ns;
end entity;

architecture bit4_tb_behav of bit4_tb is
	component bit4
		port(clk, rst                           : in  std_logic;
			 we_com, we1, we2, we3, we4         : in  std_logic;
			 re1, re2                           : in  std_logic;
			 di                                 : in  std_logic;
			 do1, do2                           : out std_logic;
			 addr1_1, addr1_2, addr2_1, addr2_2 : in  std_logic);
	end component bit4;

	signal clk, rst, we_com, we1, we2, we3, we4, re1, re2, di, do1, do2 : std_logic;
	signal addr1_1, addr1_2, addr2_1, addr2_2                           : std_logic;
	signal addr, we : std_logic_vector(0 to 3);
begin
	uut : bit4
		port map(clk     => clk,
			     rst     => rst,
			     we_com  => we_com,
			     we1     => we1,
			     we2     => we2,
			     we3     => we3,
			     we4     => we4,
			     re1     => re1,
			     re2     => re2,
			     di      => di,
			     do1     => do1,
			     do2     => do2,
			     addr1_1 => addr1_1,
			     addr1_2 => addr1_2,
			     addr2_1 => addr2_1,
			     addr2_2 => addr2_2);
			     
	clock : process
	begin
		clk <= '1';
		wait for clk_period / 2;
		clk <= '0';
		wait for clk_period / 2;
	end process;
	
	addr1_1 <= addr(0);
	addr1_2 <= addr(1);
	addr2_1 <= addr(2);
	addr2_2 <= addr(3);
	
	we1 <= not we(0);
	we2 <= not we(1);
	we3 <= not we(2);
	we4 <= not we(3);

	stimulus : process
	begin
		rst <= '1';
		we  <= '0';
		wait for clk_period - initial_offset;
		rst <= '0';
		
		re1  <= '1';
		re2 <= '1';

		-- Read
		we <= "0000";
		addr <= "0000";
		d <= '0';
		wait for clk_period;

		-- Write
		we <= "1000";
		addr <= "0000";
		d <= '1';
		wait for clk_period;

		-- Read again
		we <= "0000";
		addr <= "0000";
		d <= '0';
		wait for clk_period;
	end process;
end;