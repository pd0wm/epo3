library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity vga_tb_rev is
	constant clk_period : time := 20 ns;
end entity;

architecture vga_tb_behav of vga_tb_rev is
	component vga_logic
		port(clk      : in  std_logic;
			 rst      : in  std_logic;
			 draw     : out std_logic;
			 eol      : out std_logic;
			 eof      : out std_logic;
			 ready    : in  std_logic;
			 ram_addr : out std_logic_vector(7 downto 0));
	end component vga_logic;

	component vga_timer
		port(clk    : in  std_logic;
			 rst    : in  std_logic;
			 ready  : out std_logic;
			 eol    : in  std_logic;
			 h_sync : out std_logic;
			 eof    : in  std_logic;
			 v_sync : out std_logic);
	end component vga_timer;

	component vga_buffer
		port(clk       : in  std_logic;
			 rst       : in  std_logic;
			 red       : out std_logic;
			 green     : out std_logic;
			 blue      : out std_logic;
			 h_sync    : out std_logic;
			 h_sync_in : in  std_logic;
			 v_sync    : out std_logic;
			 v_sync_in : in  std_logic;
			 draw      : in  std_logic;
			 data      : in  std_logic);
	end component vga_buffer;

	signal clk, rst, data, ready, draw                  : std_logic;
	signal red, green, blue                             : std_logic;
	signal eof, eol                                     : std_logic;
	signal h_sync, v_sync, h_sync_buffer, v_sync_buffer : std_logic;
	signal ram_addr                                     : std_logic_vector(7 downto 0);

begin
	uut_logic : vga_logic port map(
			clk      => clk,
			rst      => rst,
			draw     => draw,
			eol      => eol,
			eof      => eof,
			ready    => ready,
			ram_addr => ram_addr
		);

	uut_timer : vga_timer port map(
			clk    => clk,
			rst    => rst,
			ready  => ready,
			eol    => eol,
			h_sync => h_sync_buffer,
			eof    => eof,
			v_sync => v_sync_buffer
		);
		
	uut_buffer: vga_buffer port map(
		clk       => clk,
		rst       => rst,
		red       => red,
		green     => green,
		blue      => blue,
		h_sync    => h_sync,
		h_sync_in => h_sync_buffer,
		v_sync    => v_sync,
		v_sync_in => v_sync_buffer,
		draw      => draw,
		data      => data
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
end vga_tb_behav;