library ieee;
use ieee.std_logic_1164.all;

architecture behaviour of top_level_tb is
	component top_level
		port(rst        : in  std_logic;
			 clk        : in  std_logic;
			 dbg_inputs : in  std_logic_vector(5 downto 0);
			 vga_hsync  : out std_logic;
			 vga_vsync  : out std_logic;
			 vga_clk    : out std_logic;
			 vga_r      : out std_logic;
			 vga_g      : out std_logic;
			 vga_b      : out std_logic);
	end component top_level;

	signal rst        : std_logic;
	signal clk        : std_logic;
	signal dbg_inputs : std_logic_vector(5 downto 0);
	signal vga_hsync  : std_logic;
	signal vga_vsync  : std_logic;
	signal vga_clk    : std_logic;
	signal vga_r      : std_logic;
	signal vga_g      : std_logic;
	signal vga_b      : std_logic;

	constant clk_period : time := 160 ns;

begin
	dut : top_level
		port map(rst        => rst,
			     clk        => clk,
			     dbg_inputs => dbg_inputs,
			     vga_hsync  => vga_hsync,
			     vga_vsync  => vga_vsync,
			     vga_clk    => vga_clk,
			     vga_r      => vga_r,
			     vga_g      => vga_g,
			     vga_b      => vga_b);

	clk_process : process
	begin
		clk <= '1';
		wait for clk_period / 2;
		clk <= '0';
		wait for clk_period / 2;
	end process;

	stim_proc : process
	begin
		dbg_inputs <= "000001";
		rst <= '1';
		wait for 150 ns;
		rst <= '0';
		wait for 1000 ns;
		dbg_inputs <= "000000";
		wait;
	end process;

end;














