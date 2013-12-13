library ieee;
use ieee.std_logic_1164.all;

entity top_level2_tb is
end top_level2_tb;

architecture top_level2_tb_arch of top_level2_tb is
	component top_level2
		port(rst        : in  std_logic;
			 clk        : in  std_logic;
			 inputs     : in  std_logic_vector(5 downto 0);
			 vga_h_sync : out std_logic;
			 vga_v_sync : out std_logic;
			 vga_red    : out std_logic;
			 vga_green  : out std_logic;
			 vga_blue   : out std_logic);
	end component top_level2;

	signal rst        : std_logic;
	signal clk        : std_logic;
	signal inputs : std_logic_vector(5 downto 0);
	signal vga_h_sync  : std_logic;
	signal vga_v_sync  : std_logic;
	signal vga_red    : std_logic;
	signal vga_green  : std_logic;
	signal vga_blue   : std_logic;

	constant clk_period : time := 160 ns;

begin
	uut : top_level2
		port map(rst        => rst,
			     clk        => clk,
			     inputs     => inputs,
			     vga_h_sync => vga_h_sync,
			     vga_v_sync => vga_v_sync,
			     vga_red    => vga_red,
			     vga_green  => vga_green,
			     vga_blue   => vga_blue);

	clk_process : process
	begin
		clk <= '1';
		wait for clk_period / 2;
		clk <= '0';
		wait for clk_period / 2;
	end process;

	stim_proc : process
	begin
		inputs <= "111110";
		rst        <= '1';
		wait for 1740 ns;
		rst <= '0';
		wait for 500 us;
		inputs <= "101111";
		wait for 500 us;
		inputs <= "111111";
		wait for 500 us;
		inputs <= "101111";
		wait for 500 us;
		inputs <= "111111";	
		wait for 500 us;
		inputs <= "101111";	
		wait;
	end process;

end;


























