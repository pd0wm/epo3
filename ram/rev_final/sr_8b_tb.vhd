library ieee;
use ieee.std_logic_1164.all;

entity sr_8b_tb is
	constant clk_period     : time := 20 ns;
	constant initial_offset : time := 2 ns;
end entity;

architecture sr_8b_tb_arch of sr_8b_tb is
	component sr_8b
		port(clk, rst     : in  std_logic;
			 di           : in  std_logic;
			 we           : in  std_logic;
			 do1, do2     : out std_logic;
			 addr1, addr2 : in  std_logic_vector(2 downto 0);
			 e1, e2       : in  std_logic);
	end component sr_8b;

	signal clk, rst, rw_re, ro_re                            : std_logic;
	signal ro_addr , rw_addr : std_logic_vector(2 downto 0);
	signal ro_data_out, rw_we, rw_data_in, rw_data_out         : std_logic;
begin
	uut : sr_8b
		port map(clk   => clk,
			     rst   => rst,
			     di    => rw_data_in,
			     we    => rw_we,
			     do1   => rw_data_out,
			     do2   => ro_data_out,
			     addr1 => rw_addr,
			     addr2 => ro_addr,
			     e1    => rw_re,
			     e2    => ro_re);

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
		ro_addr <= "100";
		wait for clk_period;		

		-- Write
		rw_we <= '1';
		
		ro_addr <= "100";
		rw_addr <= "000";
		rw_data_in      <= '1';
		wait for clk_period;


		-- Read again
		rw_we   <= '0';

		rw_addr <= "000";
		ro_addr <= "100";
		rw_data_in      <= '0';
		wait for clk_period;
		
		-- Read
		rw_we   <= '0';
		rw_re <= '1';
		ro_re <= '1';

		rw_addr <= "001";
		ro_addr <= "100";
		wait for clk_period;		

		-- Write
		rw_we <= '1';
		
		ro_addr <= "100";
		rw_addr <= "001";
		rw_data_in      <= '1';
		wait for clk_period;


		-- Read again
		rw_we   <= '0';

		rw_addr <= "001";
		ro_addr <= "100";
		rw_data_in      <= '0';
		wait for clk_period;
		
		-- Read
		rw_we   <= '0';
		rw_re <= '1';
		ro_re <= '1';

		rw_addr <= "010";
		ro_addr <= "010";
		wait for clk_period;		

		-- Write
		rw_we <= '1';
		
		ro_addr <= "010";
		rw_addr <= "010";
		rw_data_in      <= '1';
		wait for clk_period;


		-- Read again
		rw_we   <= '0';

		rw_addr <= "010";
		ro_addr <= "010";
		rw_data_in      <= '0';
		wait for clk_period;
		
		-- Read
		rw_we   <= '0';
		rw_re <= '1';
		ro_re <= '1';

		rw_addr <= "100";
		ro_addr <= "100";
		wait for clk_period;		

		-- Write
		rw_we <= '1';
		
		ro_addr <= "100";
		rw_addr <= "100";
		rw_data_in      <= '1';
		wait for clk_period;


		-- Read again
		rw_we   <= '0';

		rw_addr <= "100";
		ro_addr <= "100";
		rw_data_in      <= '0';
		wait for clk_period;
		
		-- Read
		rw_we   <= '0';
		rw_re <= '1';
		ro_re <= '1';

		rw_addr <= "100";
		ro_addr <= "100";
		wait for clk_period;		

		-- Write
		rw_we <= '1';
		
		ro_addr <= "100";
		rw_addr <= "100";
		rw_data_in      <= '0';
		wait for clk_period;


		-- Read again
		rw_we   <= '0';

		rw_addr <= "100";
		ro_addr <= "100";
		rw_data_in      <= '0';
		wait for clk_period;
	end process;
end;