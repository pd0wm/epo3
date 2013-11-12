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
			 vga_addr     : in    std_logic_vector(7 downto 0);
			 vga_out      : out   std_logic;
			 write_enable : in    std_logic;
			 ramdata      : out   mem
		);
	end component ram;

	signal clk, rst, data1, data2, we : std_logic;
	signal addr1, addr2               : std_logic_vector(7 downto 0);

	signal ramdata : mem;
begin
	uut : ram port map(
			clk          => clk,
			rst          => rst,
			addr         => addr1,
			data         => data1,
			vga_addr     => addr2,
			vga_out      => data2,
			write_enable => we,
			ramdata      => ramdata
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
	
		addr2 <= "00000000"; -- Reading for addr2
		addr1 <= "00000000";
		data1 <= '1';
		wait for clk_period;

		addr1 <= "00000001";
		data1 <= '0';
		wait for clk_period;

		addr1 <= "00000010";
		data1 <= '1';
		wait for clk_period;

		addr2 <= "00000011"; -- Reading for add2
		addr1 <= "00000011";
		data1 <= '0';
		wait for clk_period;

		-- Now read the written data
		we <= '0';
		data1 <= 'Z';

		addr2 <= "00000000";
		addr1 <= "00000000";
		wait for clk_period;

		addr2 <= "00000001";
		addr1 <= "00000001";
		wait for clk_period;

		addr2 <= "00000010";
		addr1 <= "00000010";
		wait for clk_period;

		addr2 <= "00000011";
		addr1 <= "00000011";
		wait for clk_period;
	end process;
end ram_tb_behav;