library ieee;
use ieee.std_logic_1164.all;

entity sramdp_whole_tb is
	constant clk_period     : time := 20 ns;
	constant initial_offset : time := 5	 ns;
end entity;

architecture sramdp_whole_tb_behav of sramdp_whole_tb is
	component sramdp_whole
		port(clk         : in  std_logic;
			 rst         : in  std_logic;
			 rw_addr     : in  std_logic_vector(7 downto 0);
			 rw_data_in  : in  std_logic;
			 rw_data_out : out std_logic;
			 rw_we       : in  std_logic;
			 ro_addr     : in  std_logic_vector(7 downto 0);
			 ro_data_out : out std_logic);
	end component sramdp_whole;

	signal clk, rst                            : std_logic;
	signal ro_addr , rw_addr : std_logic_vector(7 downto 0);
	signal ro_data_out, rw_we, rw_data_in, rw_data_out         : std_logic;
begin
	uut : sramdp_whole
		port map(clk         => clk,
			     rst         => rst,
			     rw_addr     => rw_addr,
			     rw_data_in  => rw_data_in,
			     rw_data_out => rw_data_out,
			     rw_we       => rw_we,
			     ro_addr     => ro_addr,
			     ro_data_out => ro_data_out);

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

		-- First read some stuff
		rw_we <= '0';

		ro_addr <= "00000010";
		
		rw_addr <= "00000010";
		rw_data_in      <= '0';
		wait for clk_period*4;
		
		ro_addr <= "10000000";
		
		rw_addr <= "10000000";
		rw_data_in      <= '0';
		wait for clk_period*4;
		
		ro_addr <= "01000000";
		
		rw_addr <= "01000000";
		rw_data_in      <= '0';
		wait for clk_period*4;
		----
		ro_addr <= "00000011";
		
		rw_addr <= "00000011";
		rw_data_in      <= '0';
		wait for clk_period*4;
		
		ro_addr <= "10000001";
		
		rw_addr <= "10000001";
		rw_data_in      <= '0';
		wait for clk_period*4;
		
		ro_addr <= "01000011";
		
		rw_addr <= "01000011";
		rw_data_in      <= '0';
		wait for clk_period*4;
		
		-- Now write
		rw_we <= '1';

		ro_addr <= "00000000";
		
		rw_addr <= "00000000";
		rw_data_in      <= '1';
		wait for clk_period*4;
		
		ro_addr <= "10000010";
		
		rw_addr <= "10000010";
		rw_data_in      <= '0';
		wait for clk_period*4;
		
		ro_addr <= "01000000";
		
		rw_addr <= "01000000";
		rw_data_in      <= '1';
		wait for clk_period*4;
		----
		ro_addr <= "00000011";
		
		rw_addr <= "00000011";
		rw_data_in      <= '0';
		wait for clk_period*4;
		
		ro_addr <= "10000001";
		
		rw_addr <= "10000001";
		rw_data_in      <= '1';
		wait for clk_period*4;
		
		ro_addr <= "01000011";
		
		rw_addr <= "01000011";
		rw_data_in      <= '0';
		wait for clk_period*4;
		
		-- Read again
		rw_we <= '0';

		ro_addr <= "00000000";
		
		rw_addr <= "00000000";
		rw_data_in      <= '0';
		wait for clk_period*4;
		
		ro_addr <= "10000010";
		
		rw_addr <= "10000010";
		rw_data_in      <= '0';
		wait for clk_period*4;
		
		ro_addr <= "01000000";
		
		rw_addr <= "01000000";
		rw_data_in      <= '0';
		wait for clk_period*4;
		----
		ro_addr <= "00000011";
		
		rw_addr <= "00000011";
		rw_data_in      <= '0';
		wait for clk_period*4;
		
		ro_addr <= "10000001";
		
		rw_addr <= "10000001";
		rw_data_in      <= '0';
		wait for clk_period*4;
		
		ro_addr <= "01000011";
		
		rw_addr <= "01000011";
		rw_data_in      <= '0';
		wait for clk_period*4;
	end process;
end sramdp_whole_tb_behav;