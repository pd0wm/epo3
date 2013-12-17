library ieee;
use ieee.std_logic_1164.all;

entity top_level2 is
	port(
		rst                   : in  std_logic;
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
		dbg_ram_addr_part     : out std_logic_vector(1 downto 0)
	);
end top_level2;