library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity vga is
	port(
		clk      : in  std_logic;
		rst      : in  std_logic;

		v_sync   : out std_logic;
		h_sync   : out std_logic;

		red      : out std_logic;
		green    : out std_logic;
		blue     : out std_logic;

		data     : in  std_logic;

		ram_addr : out std_logic_vector(7 downto 0)
	);
end entity;

architecture vga_behav of vga is
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

	signal ready, draw                  : std_logic;
	signal eof, eol                     : std_logic;
	signal h_sync_buffer, v_sync_buffer : std_logic;

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

	uut_buffer : vga_buffer port map(
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
end vga_behav;