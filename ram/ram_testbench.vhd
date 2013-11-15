library ieee;
use ieee.std_logic_1164.all;
use work.typedef.all;

entity ram_tb is
	constant clk_period     : time := 20 ns;
	constant initial_offset : time := 2 ns;
end entity;

architecture ram_tb_behav of ram_tb is
	component ram
		port(clk          : in    std_logic;
			 rst          : in    std_logic;
			 addr         : in    std_logic_vector(7 downto 0);
			 data         : inout std_logic;
			 ro1_addr     : in    std_logic_vector(7 downto 0);
			 ro1_out      : out   std_logic;
			 ro2_addr     : in    std_logic_vector(7 downto 0);
			 ro2_out      : out   std_logic;
			 ro3_addr     : in    std_logic_vector(7 downto 0);
			 ro3_out      : out   std_logic;
			 write_enable : in    std_logic);
	end component ram;

	signal clk, rst, we                            : std_logic;
	signal ro1_addr, ro2_addr, ro3_addr, main_addr : std_logic_vector(7 downto 0);
	signal data, ro1_out, ro2_out, ro3_out         : std_logic;
begin
	uut : ram port map(
			clk          => clk,
			rst          => rst,
			addr         => main_addr,
			data         => data,
			ro1_addr     => ro1_addr,
			ro1_out      => ro1_out,
			ro2_addr     => ro2_addr,
			ro2_out      => ro2_out,
			ro3_addr     => ro3_addr,
			ro3_out      => ro3_out,
			write_enable => we
		);

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

		-- First write some stuff
		we <= '1';

		ro1_addr  <= "00000001";
		ro2_addr  <= "00000000";
		ro3_addr  <= "00000000";
		main_addr <= "00000000";
		data      <= '1';
		wait for clk_period;

		ro1_addr  <= "00000001";
		ro2_addr  <= "00000001";
		ro3_addr  <= "00000001";
		main_addr <= "00000001";
		data      <= '0';
		wait for clk_period;

		ro1_addr  <= "00000001";
		ro2_addr  <= "00000010";
		ro3_addr  <= "00000010";
		main_addr <= "00000010";
		data      <= '1';
		wait for clk_period;

		ro1_addr  <= "00000001";
		ro2_addr  <= "00000011";
		ro3_addr  <= "00000011";
		main_addr <= "00000011";
		data      <= '0';
		wait for clk_period;

		-- Now read the written data
		we   <= '0';
		data <= 'Z';

		ro1_addr  <= "00000000";
		ro2_addr  <= "00000000";
		ro3_addr  <= "00000001";
		main_addr <= "00000000";
		wait for clk_period;

		ro1_addr  <= "00000001";
		ro2_addr  <= "00000001";
		ro3_addr  <= "00000001";
		main_addr <= "00000001";
		wait for clk_period;

		ro1_addr  <= "00000010";
		ro2_addr  <= "00000010";
		ro3_addr  <= "00000001";
		main_addr <= "00000010";
		wait for clk_period;

		ro1_addr  <= "00000011";
		ro2_addr  <= "00000011";
		ro3_addr  <= "00000001";
		main_addr <= "00000011";
		wait for clk_period;
	end process;
end ram_tb_behav;