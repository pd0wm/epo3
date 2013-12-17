
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of top_top_level is

   component buf40
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component top_level2
      port( rst, clk : in std_logic;  inputs : in std_logic_vector (5 downto 0)
            ;  vga_h_sync, vga_v_sync, vga_red, vga_green, vga_blue, 
            dbg_check_start, dbg_check_ready, dbg_draw_erase_start, 
            dbg_draw_erase_ready, dbg_clear_shift_start, dbg_clear_shift_ready,
            dbg_draw_score_start, dbg_draw_score_ready, dbg_lut_start, 
            dbg_lut_ready, dbg_timer_start, dbg_timer_ready, dbg_ram_we, 
            dbg_ram_data_in, dbg_ram_data_out, dbg_ram_data_vga : out std_logic
            ;  dbg_ram_addr_part : out std_logic_vector (1 downto 0));
   end component;
   
   component osc10
      port( E, XI : in std_logic;  XO : inout std_logic;  F : out std_logic);
   end component;
   
   signal X_Logic1_port, clk, n1 : std_logic;

begin
   
   clock : osc10 port map( E => X_Logic1_port, XI => XI, XO => XO, F => clk);
   chip : top_level2 port map( rst => rst, clk => n1, inputs(5) => inputs(5), 
                           inputs(4) => inputs(4), inputs(3) => inputs(3), 
                           inputs(2) => inputs(2), inputs(1) => inputs(1), 
                           inputs(0) => inputs(0), vga_h_sync => vga_h_sync, 
                           vga_v_sync => vga_v_sync, vga_red => vga_red, 
                           vga_green => vga_green, vga_blue => vga_blue, 
                           dbg_check_start => dbg_check_start, dbg_check_ready 
                           => dbg_check_ready, dbg_draw_erase_start => 
                           dbg_draw_erase_start, dbg_draw_erase_ready => 
                           dbg_draw_erase_ready, dbg_clear_shift_start => 
                           dbg_clear_shift_start, dbg_clear_shift_ready => 
                           dbg_clear_shift_ready, dbg_draw_score_start => 
                           dbg_draw_score_start, dbg_draw_score_ready => 
                           dbg_draw_score_ready, dbg_lut_start => dbg_lut_start
                           , dbg_lut_ready => dbg_lut_ready, dbg_timer_start =>
                           dbg_timer_start, dbg_timer_ready => dbg_timer_ready,
                           dbg_ram_we => dbg_ram_we, dbg_ram_data_in => 
                           dbg_ram_data_in, dbg_ram_data_out => 
                           dbg_ram_data_out, dbg_ram_data_vga => 
                           dbg_ram_data_vga, dbg_ram_addr_part(1) => 
                           dbg_ram_addr_part(1), dbg_ram_addr_part(0) => 
                           dbg_ram_addr_part(0));
   X_Logic1_port <= '1';
   U2 : buf40 port map( A => clk, Y => n1);

end synthesised;



