library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.vga_params.all;

entity vga_comp_tb is
	constant clk_period : time := 20 ns;
end entity;

architecture vga_comp_tb_arch of vga_comp_tb is
	component vga_comp
		port(clk      : in  std_logic;
			 rst      : in  std_logic;
			 mem_addr : out std_logic_vector(mem_addr_len - 1 downto 0);
			 h_sync   : out std_logic;
			 v_sync   : out std_logic);
	end component vga_comp;

	signal clk, rst, data : std_logic;
	signal h_sync, v_sync : std_logic;
	signal ram_addr       : std_logic_vector(6 downto 0);

begin
	uut: vga_comp
		port map(clk      => clk,
			     rst      => rst,
			     mem_addr => ram_addr,
			     h_sync   => h_sync,
			     v_sync   => v_sync);

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