library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity vga2_tb is
	constant clk_period : time := 20 ns;
end entity;

architecture vga2_arch of vga2_tb is
	component vga2
		port(clk      : in  std_logic;
			 rst      : in  std_logic;
			 v_sync   : out std_logic;
			 h_sync   : out std_logic;
			 ram_addr : out std_logic_vector(6 downto 0));
	end component vga2;

	signal clk, rst, data : std_logic;
	signal h_sync, v_sync : std_logic;
	signal ram_addr       : std_logic_vector(6 downto 0);

begin
	uut_logic : vga2 port map(
			clk      => clk,
			rst      => rst,
			v_sync   => v_sync,
			h_sync   => h_sync,
			ram_addr => ram_addr
		);

	clock : process
	begin
		clk <= '1';
		wait for clk_period / 2;
		clk <= '0';
		wait for clk_period / 2;
	end process;

	data_lut : process(ram_addr)
		variable addr : integer;
	begin
		addr := to_integer(unsigned(ram_addr));
		data <= '0';

		if (
			(addr >= 0 and addr < 10) or (addr >= 10 and addr < 15) or (addr >= 20 and addr < 30) or (addr >= 35 and addr < 40)
		) then
			data <= '1';
		end if;
	end process;

	rst <= '1', '0' after clk_period;
end;