library ieee;
use ieee.std_logic_1164.all;
LIBRARY CellsLib;
USE CellsLib.CellsLib_DECL_PACK.all;

architecture top_top_level_struc of top_top_level is
	component top_level2
		port(rst                   : in  std_logic;
			 clk                   : in  std_logic;
			 inputs                : in  std_logic_vector(5 downto 0);
			 vga_h_sync            : out std_logic;
			 vga_v_sync            : out std_logic;
			 vga_red               : out std_logic;
			 vga_green             : out std_logic;
			 vga_blue              : out std_logic;
			 dbg_check_start       : out std_logic;
			 dbg_check_ready       : out std_logic;
			 dbg_draw_erase_start  : out std_logic;
			 dbg_draw_erase_ready  : out std_logic;
			 dbg_clear_shift_start : out std_logic;
			 dbg_clear_shift_ready : out std_logic;
			 dbg_draw_score_start  : out std_logic;
			 dbg_draw_score_ready  : out std_logic;
			 dbg_lut_start         : out std_logic;
			 dbg_lut_ready         : out std_logic;
			 dbg_timer_start       : out std_logic;
			 dbg_timer_ready       : out std_logic;
			 dbg_ram_we            : out std_logic;
			 dbg_ram_data_in       : out std_logic;
			 dbg_ram_data_out      : out std_logic;
			 dbg_ram_data_vga      : out std_logic;
			 dbg_ram_addr_part     : out std_logic_vector(1 downto 0));
	end component top_level2;

	component osc10 IS
		PORT(E  : IN    STD_LOGIC;
			 F  : OUT   STD_LOGIC;
			 XI : IN    STD_LOGIC;
			 XO : INOUT STD_LOGIC := 'Z');
	end component osc10;
	
	signal clk, XI_buf, XI_inv : std_logic;
begin
	XI_inv <= not XI;
	XI_buf <= not XI_inv;

	clock : osc10
		port map(E  => '1',
			     F  => clk,
			     XI => XI_buf,
			     XO => XO);

	chip : top_level2
		port map(rst                   => rst,
			     clk                   => clk,
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
			     dbg_ram_addr_part     => dbg_ram_addr_part);

end architecture;