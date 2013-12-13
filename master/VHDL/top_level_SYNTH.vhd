
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of top_level is

   component buf40
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component controller
      port( clk, rst : in std_logic;  lut_piece_type : out std_logic_vector (2 
            downto 0);  lut_next_piece : out std_logic;  lut_x : out 
            std_logic_vector (2 downto 0);  lut_y : out std_logic_vector (3 
            downto 0);  lut_rot : out std_logic_vector (1 downto 0);  new_piece
            : out std_logic;  next_piece : in std_logic_vector (2 downto 0);  
            check_empty : in std_logic;  check_start : out std_logic;  
            check_ready : in std_logic;  draw_erase_draw, draw_erase_start : 
            out std_logic;  draw_erase_ready : in std_logic;  clear_shift_start
            : out std_logic;  clear_shift_ready : in std_logic;  
            draw_score_draw : out std_logic;  draw_score_ready : in std_logic; 
            timer_1_time, timer_1_start : out std_logic;  timer_1_done : in 
            std_logic;  timer_1_reset : out std_logic;  inputs : in 
            std_logic_vector (5 downto 0));
   end component;
   
   component rom
      port( addr : in std_logic_vector (6 downto 0);  data : out 
            std_logic_vector (3 downto 0));
   end component;
   
   component piece_lut
      port( clk, rst : in std_logic;  mask : out std_logic_vector (7 downto 0);
            mask_select : in std_logic_vector (1 downto 0);  x : in 
            std_logic_vector (2 downto 0);  y : in std_logic_vector (3 downto 
            0);  rot : in std_logic_vector (1 downto 0);  piece_type : in 
            std_logic_vector (2 downto 0);  next_piece : in std_logic;  ready, 
            overflow : out std_logic;  check_start, draw_start : in std_logic; 
            rom_addr : out std_logic_vector (6 downto 0);  rom_data : in 
            std_logic_vector (3 downto 0));
   end component;
   
   component de_piece
      port( clk, rst : in std_logic;  mask : in std_logic_vector (7 downto 0); 
            draw_erase : in std_logic;  ready : out std_logic;  start : in 
            std_logic;  mask_select : out std_logic_vector (1 downto 0);  
            lut_start : out std_logic;  lut_ready : in std_logic;  write : out 
            std_logic;  addr : out std_logic_vector (7 downto 0);  data : out 
            std_logic);
   end component;
   
   component check_mask
      port( clk, rst : in std_logic;  mask : in std_logic_vector (7 downto 0); 
            mask_select : out std_logic_vector (1 downto 0);  ready, empty : 
            out std_logic;  start : in std_logic;  lut_start : out std_logic;  
            lut_ready, lut_error : in std_logic;  write : out std_logic;  addr 
            : out std_logic_vector (7 downto 0);  data_in : in std_logic);
   end component;
   
   component timer
      port( clk, vga_clk, rst, cnt_rst, time, start : in std_logic;  ready : 
            out std_logic);
   end component;
   
   component vga
      port( clk, rst : in std_logic;  mem_addr : out std_logic_vector (7 downto
            0);  data : in std_logic;  h_sync, v_sync, red, green, blue : out 
            std_logic);
   end component;
   
   component sr_if
      port( clk, rst, di : in std_logic;  do1, do2 : out std_logic;  we : in 
            std_logic;  addr1, addr2 : in std_logic_vector (7 downto 0));
   end component;
   
   component debounce
      port( clk, rst : in std_logic;  inv_inputs : in std_logic_vector (5 
            downto 0);  output : out std_logic_vector (5 downto 0);  
            random_seed : out std_logic);
   end component;
   
   component draw_score
      port( ds_clk, ds_rst, ds_draw : in std_logic;  ds_ready : out std_logic; 
            ds_input : in std_logic_vector (7 downto 0);  ds_write : out 
            std_logic;  ds_addr : out std_logic_vector (7 downto 0);  
            ds_data_out : out std_logic);
   end component;
   
   component log_score
      port( clk, rst, increase : in std_logic;  output : out std_logic_vector 
            (7 downto 0));
   end component;
   
   component cs_compare
      port( clk, rst, start_in : in std_logic;  ready_out, score_out : out 
            std_logic;  ram_addr_out : out std_logic_vector (7 downto 0);  
            ram_we : out std_logic;  ram_data_in : in std_logic;  ram_data_out 
            : out std_logic);
   end component;
   
   component npg
      port( clk, rst, button_seed, new_number : in std_logic;  output : out 
            std_logic_vector (2 downto 0));
   end component;
   
   signal n20, vga_vsync_port, SYNTHESIZED_WIRE_0, SYNTHESIZED_WIRE_1, 
      SYNTHESIZED_WIRE_49_2_port, SYNTHESIZED_WIRE_49_1_port, 
      SYNTHESIZED_WIRE_49_0_port, SYNTHESIZED_WIRE_2, SYNTHESIZED_WIRE_50, 
      SYNTHESIZED_WIRE_45, SYNTHESIZED_WIRE_4, SYNTHESIZED_WIRE_51, gdfx_temp0,
      SYNTHESIZED_WIRE_52_7_port, SYNTHESIZED_WIRE_52_6_port, 
      SYNTHESIZED_WIRE_52_5_port, SYNTHESIZED_WIRE_52_4_port, 
      SYNTHESIZED_WIRE_52_3_port, SYNTHESIZED_WIRE_52_2_port, 
      SYNTHESIZED_WIRE_52_1_port, SYNTHESIZED_WIRE_52_0_port, 
      SYNTHESIZED_WIRE_6_7_port, SYNTHESIZED_WIRE_6_6_port, 
      SYNTHESIZED_WIRE_6_5_port, SYNTHESIZED_WIRE_6_4_port, 
      SYNTHESIZED_WIRE_6_3_port, SYNTHESIZED_WIRE_6_2_port, 
      SYNTHESIZED_WIRE_6_1_port, SYNTHESIZED_WIRE_6_0_port, SYNTHESIZED_WIRE_5,
      SYNTHESIZED_WIRE_46, SYNTHESIZED_WIRE_48_5_port, 
      SYNTHESIZED_WIRE_48_4_port, SYNTHESIZED_WIRE_48_3_port, 
      SYNTHESIZED_WIRE_48_2_port, SYNTHESIZED_WIRE_48_1_port, 
      SYNTHESIZED_WIRE_48_0_port, SYNTHESIZED_WIRE_16_7_port, 
      SYNTHESIZED_WIRE_16_6_port, SYNTHESIZED_WIRE_16_5_port, 
      SYNTHESIZED_WIRE_16_4_port, SYNTHESIZED_WIRE_16_3_port, 
      SYNTHESIZED_WIRE_16_2_port, SYNTHESIZED_WIRE_16_1_port, 
      SYNTHESIZED_WIRE_16_0_port, SYNTHESIZED_WIRE_17, SYNTHESIZED_WIRE_19, 
      SYNTHESIZED_WIRE_20, SYNTHESIZED_WIRE_21, SYNTHESIZED_WIRE_47, 
      SYNTHESIZED_WIRE_22, SYNTHESIZED_WIRE_53, SYNTHESIZED_WIRE_24, 
      SYNTHESIZED_WIRE_54_7_port, SYNTHESIZED_WIRE_54_6_port, 
      SYNTHESIZED_WIRE_54_5_port, SYNTHESIZED_WIRE_54_4_port, 
      SYNTHESIZED_WIRE_54_3_port, SYNTHESIZED_WIRE_54_2_port, 
      SYNTHESIZED_WIRE_54_1_port, SYNTHESIZED_WIRE_54_0_port, 
      SYNTHESIZED_WIRE_43, SYNTHESIZED_WIRE_42, SYNTHESIZED_WIRE_32, 
      SYNTHESIZED_WIRE_55_1_port, SYNTHESIZED_WIRE_55_0_port, 
      SYNTHESIZED_WIRE_27, SYNTHESIZED_WIRE_28, SYNTHESIZED_WIRE_44, 
      SYNTHESIZED_WIRE_33, SYNTHESIZED_WIRE_31, SYNTHESIZED_WIRE_36_2_port, 
      SYNTHESIZED_WIRE_36_1_port, SYNTHESIZED_WIRE_36_0_port, 
      SYNTHESIZED_WIRE_37_3_port, SYNTHESIZED_WIRE_37_2_port, 
      SYNTHESIZED_WIRE_37_1_port, SYNTHESIZED_WIRE_37_0_port, 
      SYNTHESIZED_WIRE_38_1_port, SYNTHESIZED_WIRE_38_0_port, 
      SYNTHESIZED_WIRE_39_2_port, SYNTHESIZED_WIRE_39_1_port, 
      SYNTHESIZED_WIRE_39_0_port, SYNTHESIZED_WIRE_40_3_port, 
      SYNTHESIZED_WIRE_40_2_port, SYNTHESIZED_WIRE_40_1_port, 
      SYNTHESIZED_WIRE_40_0_port, SYNTHESIZED_WIRE_41_6_port, 
      SYNTHESIZED_WIRE_41_5_port, SYNTHESIZED_WIRE_41_4_port, 
      SYNTHESIZED_WIRE_41_3_port, SYNTHESIZED_WIRE_41_2_port, 
      SYNTHESIZED_WIRE_41_1_port, SYNTHESIZED_WIRE_41_0_port, n1, n2, 
      vga_hsync_port, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16
      , n17, n18, n19 : std_logic;

begin
   vga_hsync <= vga_hsync_port;
   vga_vsync <= vga_vsync_port;
   vga_clk <= clk;
   
   b2v_inst10 : npg port map( clk => clk, rst => rst, button_seed => 
                           SYNTHESIZED_WIRE_0, new_number => SYNTHESIZED_WIRE_1
                           , output(2) => SYNTHESIZED_WIRE_49_2_port, output(1)
                           => SYNTHESIZED_WIRE_49_1_port, output(0) => 
                           SYNTHESIZED_WIRE_49_0_port);
   b2v_inst11 : cs_compare port map( clk => clk, rst => rst, start_in => 
                           SYNTHESIZED_WIRE_2, ready_out => SYNTHESIZED_WIRE_45
                           , score_out => SYNTHESIZED_WIRE_4, ram_addr_out(7) 
                           => SYNTHESIZED_WIRE_52_7_port, ram_addr_out(6) => 
                           SYNTHESIZED_WIRE_52_6_port, ram_addr_out(5) => 
                           SYNTHESIZED_WIRE_52_5_port, ram_addr_out(4) => 
                           SYNTHESIZED_WIRE_52_4_port, ram_addr_out(3) => 
                           SYNTHESIZED_WIRE_52_3_port, ram_addr_out(2) => 
                           SYNTHESIZED_WIRE_52_2_port, ram_addr_out(1) => 
                           SYNTHESIZED_WIRE_52_1_port, ram_addr_out(0) => 
                           SYNTHESIZED_WIRE_52_0_port, ram_we => 
                           SYNTHESIZED_WIRE_51, ram_data_in => 
                           SYNTHESIZED_WIRE_50, ram_data_out => gdfx_temp0);
   b2v_inst12 : log_score port map( clk => clk, rst => rst, increase => 
                           SYNTHESIZED_WIRE_4, output(7) => 
                           SYNTHESIZED_WIRE_6_7_port, output(6) => 
                           SYNTHESIZED_WIRE_6_6_port, output(5) => 
                           SYNTHESIZED_WIRE_6_5_port, output(4) => 
                           SYNTHESIZED_WIRE_6_4_port, output(3) => 
                           SYNTHESIZED_WIRE_6_3_port, output(2) => 
                           SYNTHESIZED_WIRE_6_2_port, output(1) => 
                           SYNTHESIZED_WIRE_6_1_port, output(0) => 
                           SYNTHESIZED_WIRE_6_0_port);
   b2v_inst13 : draw_score port map( ds_clk => clk, ds_rst => rst, ds_draw => 
                           SYNTHESIZED_WIRE_5, ds_ready => SYNTHESIZED_WIRE_46,
                           ds_input(7) => SYNTHESIZED_WIRE_6_7_port, 
                           ds_input(6) => SYNTHESIZED_WIRE_6_6_port, 
                           ds_input(5) => SYNTHESIZED_WIRE_6_5_port, 
                           ds_input(4) => SYNTHESIZED_WIRE_6_4_port, 
                           ds_input(3) => SYNTHESIZED_WIRE_6_3_port, 
                           ds_input(2) => SYNTHESIZED_WIRE_6_2_port, 
                           ds_input(1) => SYNTHESIZED_WIRE_6_1_port, 
                           ds_input(0) => SYNTHESIZED_WIRE_6_0_port, ds_write 
                           => SYNTHESIZED_WIRE_51, ds_addr(7) => 
                           SYNTHESIZED_WIRE_52_7_port, ds_addr(6) => 
                           SYNTHESIZED_WIRE_52_6_port, ds_addr(5) => 
                           SYNTHESIZED_WIRE_52_5_port, ds_addr(4) => 
                           SYNTHESIZED_WIRE_52_4_port, ds_addr(3) => 
                           SYNTHESIZED_WIRE_52_3_port, ds_addr(2) => 
                           SYNTHESIZED_WIRE_52_2_port, ds_addr(1) => 
                           SYNTHESIZED_WIRE_52_1_port, ds_addr(0) => 
                           SYNTHESIZED_WIRE_52_0_port, ds_data_out => 
                           gdfx_temp0);
   b2v_inst19 : debounce port map( clk => vga_hsync_port, rst => rst, 
                           inv_inputs(5) => dbg_inputs(5), inv_inputs(4) => 
                           dbg_inputs(4), inv_inputs(3) => dbg_inputs(3), 
                           inv_inputs(2) => dbg_inputs(2), inv_inputs(1) => 
                           dbg_inputs(1), inv_inputs(0) => dbg_inputs(0), 
                           output(5) => SYNTHESIZED_WIRE_48_5_port, output(4) 
                           => SYNTHESIZED_WIRE_48_4_port, output(3) => 
                           SYNTHESIZED_WIRE_48_3_port, output(2) => 
                           SYNTHESIZED_WIRE_48_2_port, output(1) => 
                           SYNTHESIZED_WIRE_48_1_port, output(0) => 
                           SYNTHESIZED_WIRE_48_0_port, random_seed => 
                           SYNTHESIZED_WIRE_0);
   b2v_inst2 : sr_if port map( clk => clk, rst => rst, di => n14, do1 => 
                           SYNTHESIZED_WIRE_50, do2 => SYNTHESIZED_WIRE_17, we 
                           => SYNTHESIZED_WIRE_51, addr1(7) => 
                           SYNTHESIZED_WIRE_52_7_port, addr1(6) => 
                           SYNTHESIZED_WIRE_52_6_port, addr1(5) => 
                           SYNTHESIZED_WIRE_52_5_port, addr1(4) => n17, 
                           addr1(3) => n18, addr1(2) => n19, addr1(1) => n15, 
                           addr1(0) => n16, addr2(7) => 
                           SYNTHESIZED_WIRE_16_7_port, addr2(6) => 
                           SYNTHESIZED_WIRE_16_6_port, addr2(5) => 
                           SYNTHESIZED_WIRE_16_5_port, addr2(4) => n9, addr2(3)
                           => n8, addr2(2) => n11, addr2(1) => n7, addr2(0) => 
                           n10);
   b2v_inst3 : vga port map( clk => clk, rst => rst, mem_addr(7) => 
                           SYNTHESIZED_WIRE_16_7_port, mem_addr(6) => 
                           SYNTHESIZED_WIRE_16_6_port, mem_addr(5) => 
                           SYNTHESIZED_WIRE_16_5_port, mem_addr(4) => 
                           SYNTHESIZED_WIRE_16_4_port, mem_addr(3) => 
                           SYNTHESIZED_WIRE_16_3_port, mem_addr(2) => 
                           SYNTHESIZED_WIRE_16_2_port, mem_addr(1) => 
                           SYNTHESIZED_WIRE_16_1_port, mem_addr(0) => 
                           SYNTHESIZED_WIRE_16_0_port, data => 
                           SYNTHESIZED_WIRE_17, h_sync => n20, v_sync => 
                           vga_vsync_port, red => vga_r, green => vga_g, blue 
                           => vga_b);
   b2v_inst4 : timer port map( clk => clk, vga_clk => vga_vsync_port, rst => 
                           rst, cnt_rst => SYNTHESIZED_WIRE_19, time => 
                           SYNTHESIZED_WIRE_20, start => SYNTHESIZED_WIRE_21, 
                           ready => SYNTHESIZED_WIRE_47);
   b2v_inst5 : check_mask port map( clk => clk, rst => rst, mask(7) => 
                           SYNTHESIZED_WIRE_54_7_port, mask(6) => 
                           SYNTHESIZED_WIRE_54_6_port, mask(5) => 
                           SYNTHESIZED_WIRE_54_5_port, mask(4) => 
                           SYNTHESIZED_WIRE_54_4_port, mask(3) => 
                           SYNTHESIZED_WIRE_54_3_port, mask(2) => 
                           SYNTHESIZED_WIRE_54_2_port, mask(1) => 
                           SYNTHESIZED_WIRE_54_1_port, mask(0) => 
                           SYNTHESIZED_WIRE_54_0_port, mask_select(1) => 
                           SYNTHESIZED_WIRE_55_1_port, mask_select(0) => 
                           SYNTHESIZED_WIRE_55_0_port, ready => 
                           SYNTHESIZED_WIRE_43, empty => SYNTHESIZED_WIRE_42, 
                           start => SYNTHESIZED_WIRE_22, lut_start => 
                           SYNTHESIZED_WIRE_32, lut_ready => 
                           SYNTHESIZED_WIRE_53, lut_error => 
                           SYNTHESIZED_WIRE_24, write => SYNTHESIZED_WIRE_51, 
                           addr(7) => SYNTHESIZED_WIRE_52_7_port, addr(6) => 
                           SYNTHESIZED_WIRE_52_6_port, addr(5) => 
                           SYNTHESIZED_WIRE_52_5_port, addr(4) => 
                           SYNTHESIZED_WIRE_52_4_port, addr(3) => 
                           SYNTHESIZED_WIRE_52_3_port, addr(2) => 
                           SYNTHESIZED_WIRE_52_2_port, addr(1) => 
                           SYNTHESIZED_WIRE_52_1_port, addr(0) => 
                           SYNTHESIZED_WIRE_52_0_port, data_in => 
                           SYNTHESIZED_WIRE_50);
   b2v_inst6 : de_piece port map( clk => clk, rst => rst, mask(7) => 
                           SYNTHESIZED_WIRE_54_7_port, mask(6) => 
                           SYNTHESIZED_WIRE_54_6_port, mask(5) => 
                           SYNTHESIZED_WIRE_54_5_port, mask(4) => 
                           SYNTHESIZED_WIRE_54_4_port, mask(3) => 
                           SYNTHESIZED_WIRE_54_3_port, mask(2) => 
                           SYNTHESIZED_WIRE_54_2_port, mask(1) => 
                           SYNTHESIZED_WIRE_54_1_port, mask(0) => 
                           SYNTHESIZED_WIRE_54_0_port, draw_erase => 
                           SYNTHESIZED_WIRE_27, ready => SYNTHESIZED_WIRE_44, 
                           start => SYNTHESIZED_WIRE_28, mask_select(1) => 
                           SYNTHESIZED_WIRE_55_1_port, mask_select(0) => 
                           SYNTHESIZED_WIRE_55_0_port, lut_start => 
                           SYNTHESIZED_WIRE_33, lut_ready => 
                           SYNTHESIZED_WIRE_53, write => SYNTHESIZED_WIRE_51, 
                           addr(7) => SYNTHESIZED_WIRE_52_7_port, addr(6) => 
                           SYNTHESIZED_WIRE_52_6_port, addr(5) => 
                           SYNTHESIZED_WIRE_52_5_port, addr(4) => 
                           SYNTHESIZED_WIRE_52_4_port, addr(3) => 
                           SYNTHESIZED_WIRE_52_3_port, addr(2) => 
                           SYNTHESIZED_WIRE_52_2_port, addr(1) => 
                           SYNTHESIZED_WIRE_52_1_port, addr(0) => 
                           SYNTHESIZED_WIRE_52_0_port, data => gdfx_temp0);
   b2v_inst7 : piece_lut port map( clk => clk, rst => rst, mask(7) => 
                           SYNTHESIZED_WIRE_54_7_port, mask(6) => 
                           SYNTHESIZED_WIRE_54_6_port, mask(5) => 
                           SYNTHESIZED_WIRE_54_5_port, mask(4) => 
                           SYNTHESIZED_WIRE_54_4_port, mask(3) => 
                           SYNTHESIZED_WIRE_54_3_port, mask(2) => 
                           SYNTHESIZED_WIRE_54_2_port, mask(1) => 
                           SYNTHESIZED_WIRE_54_1_port, mask(0) => 
                           SYNTHESIZED_WIRE_54_0_port, mask_select(1) => 
                           SYNTHESIZED_WIRE_55_1_port, mask_select(0) => 
                           SYNTHESIZED_WIRE_55_0_port, x(2) => 
                           SYNTHESIZED_WIRE_39_2_port, x(1) => 
                           SYNTHESIZED_WIRE_39_1_port, x(0) => 
                           SYNTHESIZED_WIRE_39_0_port, y(3) => 
                           SYNTHESIZED_WIRE_40_3_port, y(2) => 
                           SYNTHESIZED_WIRE_40_2_port, y(1) => 
                           SYNTHESIZED_WIRE_40_1_port, y(0) => 
                           SYNTHESIZED_WIRE_40_0_port, rot(1) => 
                           SYNTHESIZED_WIRE_38_1_port, rot(0) => 
                           SYNTHESIZED_WIRE_38_0_port, piece_type(2) => 
                           SYNTHESIZED_WIRE_36_2_port, piece_type(1) => 
                           SYNTHESIZED_WIRE_36_1_port, piece_type(0) => 
                           SYNTHESIZED_WIRE_36_0_port, next_piece => 
                           SYNTHESIZED_WIRE_31, ready => SYNTHESIZED_WIRE_53, 
                           overflow => SYNTHESIZED_WIRE_24, check_start => 
                           SYNTHESIZED_WIRE_32, draw_start => 
                           SYNTHESIZED_WIRE_33, rom_addr(6) => 
                           SYNTHESIZED_WIRE_41_6_port, rom_addr(5) => 
                           SYNTHESIZED_WIRE_41_5_port, rom_addr(4) => 
                           SYNTHESIZED_WIRE_41_4_port, rom_addr(3) => 
                           SYNTHESIZED_WIRE_41_3_port, rom_addr(2) => 
                           SYNTHESIZED_WIRE_41_2_port, rom_addr(1) => 
                           SYNTHESIZED_WIRE_41_1_port, rom_addr(0) => 
                           SYNTHESIZED_WIRE_41_0_port, rom_data(3) => 
                           SYNTHESIZED_WIRE_37_3_port, rom_data(2) => 
                           SYNTHESIZED_WIRE_37_2_port, rom_data(1) => 
                           SYNTHESIZED_WIRE_37_1_port, rom_data(0) => 
                           SYNTHESIZED_WIRE_37_0_port);
   b2v_inst8 : rom port map( addr(6) => SYNTHESIZED_WIRE_41_6_port, addr(5) => 
                           n4, addr(4) => n2, addr(3) => n6, addr(2) => n5, 
                           addr(1) => n13, addr(0) => n12, data(3) => 
                           SYNTHESIZED_WIRE_37_3_port, data(2) => 
                           SYNTHESIZED_WIRE_37_2_port, data(1) => 
                           SYNTHESIZED_WIRE_37_1_port, data(0) => 
                           SYNTHESIZED_WIRE_37_0_port);
   b2v_inst9 : controller port map( clk => clk, rst => rst, lut_piece_type(2) 
                           => SYNTHESIZED_WIRE_36_2_port, lut_piece_type(1) => 
                           SYNTHESIZED_WIRE_36_1_port, lut_piece_type(0) => 
                           SYNTHESIZED_WIRE_36_0_port, lut_next_piece => 
                           SYNTHESIZED_WIRE_31, lut_x(2) => 
                           SYNTHESIZED_WIRE_39_2_port, lut_x(1) => 
                           SYNTHESIZED_WIRE_39_1_port, lut_x(0) => 
                           SYNTHESIZED_WIRE_39_0_port, lut_y(3) => 
                           SYNTHESIZED_WIRE_40_3_port, lut_y(2) => 
                           SYNTHESIZED_WIRE_40_2_port, lut_y(1) => 
                           SYNTHESIZED_WIRE_40_1_port, lut_y(0) => 
                           SYNTHESIZED_WIRE_40_0_port, lut_rot(1) => 
                           SYNTHESIZED_WIRE_38_1_port, lut_rot(0) => 
                           SYNTHESIZED_WIRE_38_0_port, new_piece => 
                           SYNTHESIZED_WIRE_1, next_piece(2) => 
                           SYNTHESIZED_WIRE_49_2_port, next_piece(1) => 
                           SYNTHESIZED_WIRE_49_1_port, next_piece(0) => 
                           SYNTHESIZED_WIRE_49_0_port, check_empty => 
                           SYNTHESIZED_WIRE_42, check_start => 
                           SYNTHESIZED_WIRE_22, check_ready => 
                           SYNTHESIZED_WIRE_43, draw_erase_draw => 
                           SYNTHESIZED_WIRE_27, draw_erase_start => 
                           SYNTHESIZED_WIRE_28, draw_erase_ready => 
                           SYNTHESIZED_WIRE_44, clear_shift_start => 
                           SYNTHESIZED_WIRE_2, clear_shift_ready => 
                           SYNTHESIZED_WIRE_45, draw_score_draw => 
                           SYNTHESIZED_WIRE_5, draw_score_ready => 
                           SYNTHESIZED_WIRE_46, timer_1_time => 
                           SYNTHESIZED_WIRE_20, timer_1_start => 
                           SYNTHESIZED_WIRE_21, timer_1_done => 
                           SYNTHESIZED_WIRE_47, timer_1_reset => 
                           SYNTHESIZED_WIRE_19, inputs(5) => 
                           SYNTHESIZED_WIRE_48_5_port, inputs(4) => 
                           SYNTHESIZED_WIRE_48_4_port, inputs(3) => 
                           SYNTHESIZED_WIRE_48_3_port, inputs(2) => 
                           SYNTHESIZED_WIRE_48_2_port, inputs(1) => 
                           SYNTHESIZED_WIRE_48_1_port, inputs(0) => 
                           SYNTHESIZED_WIRE_48_0_port);
   U1 : iv110 port map( A => SYNTHESIZED_WIRE_41_4_port, Y => n1);
   U2 : iv110 port map( A => n1, Y => n2);
   U3 : buf40 port map( A => n20, Y => vga_hsync_port);
   U4 : buf40 port map( A => SYNTHESIZED_WIRE_41_5_port, Y => n4);
   U5 : buf40 port map( A => SYNTHESIZED_WIRE_41_2_port, Y => n5);
   U6 : buf40 port map( A => SYNTHESIZED_WIRE_41_3_port, Y => n6);
   U7 : buf40 port map( A => SYNTHESIZED_WIRE_16_1_port, Y => n7);
   U8 : buf40 port map( A => SYNTHESIZED_WIRE_16_3_port, Y => n8);
   U9 : buf40 port map( A => SYNTHESIZED_WIRE_16_4_port, Y => n9);
   U10 : buf40 port map( A => SYNTHESIZED_WIRE_16_0_port, Y => n10);
   U11 : buf40 port map( A => SYNTHESIZED_WIRE_16_2_port, Y => n11);
   U12 : buf40 port map( A => SYNTHESIZED_WIRE_41_0_port, Y => n12);
   U13 : buf40 port map( A => SYNTHESIZED_WIRE_41_1_port, Y => n13);
   U14 : buf40 port map( A => gdfx_temp0, Y => n14);
   U15 : buf40 port map( A => SYNTHESIZED_WIRE_52_1_port, Y => n15);
   U16 : buf40 port map( A => SYNTHESIZED_WIRE_52_0_port, Y => n16);
   U17 : buf40 port map( A => SYNTHESIZED_WIRE_52_4_port, Y => n17);
   U18 : buf40 port map( A => SYNTHESIZED_WIRE_52_3_port, Y => n18);
   U19 : buf40 port map( A => SYNTHESIZED_WIRE_52_2_port, Y => n19);

end synthesised;



