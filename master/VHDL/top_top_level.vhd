library ieee;
use ieee.std_logic_1164.all;

entity top_top_level is
	port(
		rst                   : in    std_logic;
		inputs                : in    std_logic_vector(5 downto 0);
		vga_h_sync            : out   std_logic;
		vga_v_sync            : out   std_logic;
		vga_red               : out   std_logic;
		vga_green             : out   std_logic;
		vga_blue              : out   std_logic;

		dbg_check_start       : inout   std_logic;
		dbg_check_ready       : inout   std_logic;
		dbg_draw_erase_start  : inout   std_logic;
		dbg_draw_erase_ready  : inout   std_logic;
		dbg_clear_shift_start : inout   std_logic;
		dbg_clear_shift_ready : inout   std_logic;
		dbg_draw_score_start  : inout   std_logic;
		dbg_draw_score_ready  : inout   std_logic;
		dbg_lut_start         : inout   std_logic;
		dbg_lut_ready         : inout   std_logic;
		dbg_timer_start       : inout   std_logic;
		dbg_timer_ready       : inout   std_logic;
		dbg_ram_we            : inout   std_logic;
		dbg_ram_data_in       : inout   std_logic;
		dbg_ram_data_out      : inout   std_logic;
		dbg_ram_data_vga      : inout   std_logic;
		dbg_ram_addr_part     : inout   std_logic_vector(1 downto 0);

		xi                    : in    std_logic;
		xo                    : inout std_logic
	);
end top_top_level;


