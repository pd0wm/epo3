library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dec10_tb is
	constant clk_period     : time := 20 ns;
	constant initial_offset : time := 2 ns;
end entity;

architecture dec10_tb_arch of dec10_tb is
	component dec10
		port(di : in  std_logic;
			 do : out std_logic_vector(9 downto 0);
			 s  : in  std_logic_vector(3 downto 0));
	end component dec10;

	signal clk, rst : std_logic;
	signal do       : std_logic_vector(9 downto 0);
	signal s        : std_logic_vector(3 downto 0);
begin
	uut : dec10
		port map(di => '1',
			     do => do,
			     s  => s);
	clock : process
	begin
		clk <= '1';
		wait for clk_period / 2;
		clk <= '0';
		wait for clk_period / 2;
	end process;

	stimulus : process
		variable cnt : integer range 0 to 9 := 0;
	begin
		rst <= '1';
		wait for clk_period - initial_offset;
		rst <= '0';

		cnt:= 0;
		s <= std_logic_vector(to_unsigned(cnt, 4));
		wait for clk_period;

		cnt := cnt + 1;
		s   <= std_logic_vector(to_unsigned(cnt, 4));
		wait for clk_period;
		
		cnt := cnt + 1;
		s   <= std_logic_vector(to_unsigned(cnt, 4));
		wait for clk_period;
		
		cnt := cnt + 1;
		s   <= std_logic_vector(to_unsigned(cnt, 4));
		wait for clk_period;
		
		cnt := cnt + 1;
		s   <= std_logic_vector(to_unsigned(cnt, 4));
		wait for clk_period;
		
		cnt := cnt + 1;
		s   <= std_logic_vector(to_unsigned(cnt, 4));
		wait for clk_period;
		
		cnt := cnt + 1;
		s   <= std_logic_vector(to_unsigned(cnt, 4));
		wait for clk_period;
		
		cnt := cnt + 1;
		s   <= std_logic_vector(to_unsigned(cnt, 4));
		wait for clk_period;
		
		cnt := cnt + 1;
		s   <= std_logic_vector(to_unsigned(cnt, 4));
		wait for clk_period;
		
		cnt := cnt + 1;
		s   <= std_logic_vector(to_unsigned(cnt, 4));
		wait for clk_period;
		
		cnt := 0;
		s   <= std_logic_vector(to_unsigned(cnt, 4));
		wait for clk_period;

		cnt := cnt + 1;
		s   <= std_logic_vector(to_unsigned(cnt, 4));
		wait for clk_period;
		
		cnt := cnt + 1;
		s   <= std_logic_vector(to_unsigned(cnt, 4));
		wait for clk_period;
		
		cnt := cnt + 1;
		s   <= std_logic_vector(to_unsigned(cnt, 4));
		wait for clk_period;	
		
	end process;
end;