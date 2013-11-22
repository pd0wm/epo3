library ieee;
use ieee.std_logic_1164.all;

entity sramdp_tb is
	constant clk_period     : time := 20 ns;
	constant initial_offset : time := 2 ns;
end entity;

architecture sramdp_tb_behav of sramdp_tb is
	component sramdp
		port(clk         : in  std_logic;
			 rst         : in  std_logic;
			 rw_addr     : in  std_logic_vector(2 downto 0);
			 rw_data_in  : in  std_logic;
			 rw_data_out : out std_logic;
			 rw_we       : in  std_logic;
			 rw_re       : in  std_logic;
			 ro_addr     : in  std_logic_vector(2 downto 0);
			 ro_data_out : out std_logic;
			 ro_re       : in  std_logic);
	end component sramdp;

	signal clk, rst, rw_re, ro_re                            : std_logic;
	signal ro_addr , rw_addr : std_logic_vector(2 downto 0);
	signal ro_data_out, rw_we, rw_data_in, rw_data_out         : std_logic;
begin
	uut : sramdp
		port map(clk         => clk,
			     rst         => rst,
			     rw_addr     => rw_addr,
			     rw_data_in  => rw_data_in,
			     rw_data_out => rw_data_out,
			     rw_we       => rw_we,
			     rw_re       => rw_re,
			     ro_addr     => ro_addr,
			     ro_data_out => ro_data_out,
			     ro_re       => ro_re);

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
		rw_we  <= '0';
		wait for clk_period - initial_offset;
		rst <= '0';
		
		rw_data_in <= '0';
		
		
		-- Read
		rw_we   <= '0';
		rw_re <= '1';
		ro_re <= '1';

		rw_addr <= "000";
		ro_addr <= "000";
		wait for clk_period;

		rw_addr <= "001";
		ro_addr <= "001";
		wait for clk_period;

		rw_addr <= "010";
		ro_addr <= "010";
		wait for clk_period;

		rw_addr <= "011";
		ro_addr <= "011";
		wait for clk_period;		

		-- First write some stuff
		rw_we <= '1';
		rw_re <= '1';
	
		ro_re <= '1';
		
		ro_addr <= "000";
		rw_addr <= "000";
		rw_data_in      <= '1';
		wait for clk_period;

		ro_addr <= "001";
		rw_addr <= "001";
		rw_data_in      <= '0';
		wait for clk_period;


		ro_addr <= "010";
		rw_addr <= "010";
		rw_data_in      <= '1';
		wait for clk_period;


		ro_addr <= "011";
		rw_addr <= "011";
		rw_data_in      <= '0';
		wait for clk_period;

		-- Now read the written data
		rw_we   <= '0';
		rw_re <= '1';
		ro_re <= '1';

		rw_addr <= "000";
		ro_addr <= "000";
		wait for clk_period;

		rw_addr <= "001";
		ro_addr <= "001";
		wait for clk_period;

		rw_addr <= "010";
		ro_addr <= "010";
		wait for clk_period;

		rw_addr <= "011";
		ro_addr <= "011";
		wait for clk_period;
	end process;
end sramdp_tb_behav;