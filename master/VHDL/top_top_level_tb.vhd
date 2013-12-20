library ieee;
use ieee.std_logic_1164.all;

entity top_top_level_tb is
end top_top_level_tb;

architecture behaviour of top_top_level_tb is
	component top_top_level
		port(rst                   : in    std_logic;
			 inputs                : in    std_logic_vector(5 downto 0);
			 vga_h_sync            : out   std_logic;
			 vga_v_sync            : out   std_logic;
			 vga_red               : out   std_logic;
			 vga_green             : out   std_logic;
			 vga_blue              : out   std_logic;
			 dbg_check_start       : out   std_logic;
			 dbg_check_ready       : out   std_logic;
			 dbg_draw_erase_start  : out   std_logic;
			 dbg_draw_erase_ready  : out   std_logic;
			 dbg_clear_shift_start : out   std_logic;
			 dbg_clear_shift_ready : out   std_logic;
			 dbg_draw_score_start  : out   std_logic;
			 dbg_draw_score_ready  : out   std_logic;
			 dbg_lut_start         : out   std_logic;
			 dbg_lut_ready         : out   std_logic;
			 dbg_timer_start       : out   std_logic;
			 dbg_timer_ready       : out   std_logic;
			 dbg_ram_we            : out   std_logic;
			 dbg_ram_data_in       : out   std_logic;
			 dbg_ram_data_out      : out   std_logic;
			 dbg_ram_data_vga      : out   std_logic;
			 dbg_ram_addr_part     : out   std_logic_vector(1 downto 0);
			 xi                    : in    std_logic;
			 xo                    : inout std_logic);
	end component top_top_level;

	signal rst                   : std_logic;
	signal clk                   : std_logic;
	signal inputs                : std_logic_vector(5 downto 0);
	signal vga_h_sync            : std_logic;
	signal vga_v_sync            : std_logic;
	signal vga_red               : std_logic;
	signal vga_green             : std_logic;
	signal vga_blue              : std_logic;
	signal dbg_check_start       : std_logic;
	signal dbg_check_ready       : std_logic;
	signal dbg_draw_erase_start  : std_logic;
	signal dbg_draw_erase_ready  : std_logic;
	signal dbg_clear_shift_start : std_logic;
	signal dbg_clear_shift_ready : std_logic;
	signal dbg_draw_score_start  : std_logic;
	signal dbg_draw_score_ready  : std_logic;
	signal dbg_lut_start         : std_logic;
	signal dbg_lut_ready         : std_logic;
	signal dbg_timer_start       : std_logic;
	signal dbg_timer_ready       : std_logic;
	signal dbg_ram_we            : std_logic;
	signal dbg_ram_data_in       : std_logic;
	signal dbg_ram_data_out         : std_logic;
	signal dbg_ram_data_vga      : std_logic;
	signal dbg_ram_addr_part     : std_logic_vector(1 downto 0);

	constant clk_period : time := 160 ns;

begin
	dut : top_top_level
		port map(rst                   => rst,
			     inputs                => inputs,
			     vga_h_sync            => vga_h_sync,
			     vga_v_sync            => vga_v_sync,
			     vga_red               => vga_red,
			     vga_green             => vga_green,
			     vga_blue              => vga_blue,
			     dbg_check_start       => dbg_check_start,
			     dbg_check_ready       => dbg_check_ready,
			     dbg_draw_erase_start  => dbg_draw_erase_start,
			     dbg_draw_erase_ready  => dbg_draw_erase_ready,
			     dbg_clear_shift_start => dbg_clear_shift_start,
			     dbg_clear_shift_ready => dbg_clear_shift_ready,
			     dbg_draw_score_start  => dbg_draw_score_start,
			     dbg_draw_score_ready  => dbg_draw_score_ready,
			     dbg_lut_start         => dbg_lut_start,
			     dbg_lut_ready         => dbg_lut_ready,
			     dbg_timer_start       => dbg_timer_start,
			     dbg_timer_ready       => dbg_timer_ready,
			     dbg_ram_we            => dbg_ram_we,
			     dbg_ram_data_in       => dbg_ram_data_in,
			     dbg_ram_data_out      => dbg_ram_data_out,
			     dbg_ram_data_vga      => dbg_ram_data_vga,
			     dbg_ram_addr_part     => dbg_ram_addr_part,
			     xi                    => clk,
			     xo                    => open);

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
		rst    <= '1';
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
		wait for 500 us;
		inputs <= "111111";
		wait for 500 us;
		inputs <= "011111";
		wait for 500 us;
		inputs <= "111111";
		wait for 500 us;
		inputs <= "011111";
		wait for 500 us;
		inputs <= "111111";
		wait for 500 us;
		inputs <= "011111";
		wait for 500 us;
		inputs <= "111111";
		wait for 500 us;
		inputs <= "011111";
		wait for 500 us;
		inputs <= "111111";
		wait;
	end process;

end;





































