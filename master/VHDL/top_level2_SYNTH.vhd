
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of top_level2 is

   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component buf40
      port( A : in std_logic;  Y : out std_logic);
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
   
   component vga
      port( clk, rst : in std_logic;  mem_addr : out std_logic_vector (7 downto
            0);  data : in std_logic;  h_sync, v_sync, red, green, blue : out 
            std_logic);
   end component;
   
   component ram_fix
      port( draw_erase_start, draw_score_draw, clear_shift_start, check_start :
            in std_logic;  we : out std_logic);
   end component;
   
   component sr_if
      port( clk, rst, di : in std_logic;  do1, do2 : out std_logic;  we : in 
            std_logic;  addr1, addr2 : in std_logic_vector (7 downto 0));
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
   
   component timer
      port( clk, vga_clk, rst, cnt_rst, time, start : in std_logic;  ready : 
            out std_logic);
   end component;
   
   component npg
      port( clk, rst, button_seed, new_number : in std_logic;  output : out 
            std_logic_vector (2 downto 0));
   end component;
   
   component debounce
      port( clk, rst : in std_logic;  inv_inputs : in std_logic_vector (5 
            downto 0);  output : out std_logic_vector (5 downto 0);  
            random_seed : out std_logic);
   end component;
   
   signal vga_v_sync_port, dbg_check_start_port, dbg_check_ready_port, 
      dbg_draw_erase_start_port, dbg_draw_erase_ready_port, 
      dbg_clear_shift_start_port, dbg_clear_shift_ready_port, 
      dbg_draw_score_start_port, dbg_draw_score_ready_port, dbg_lut_ready_port,
      dbg_timer_start_port, dbg_timer_ready_port, dbg_ram_we_port, 
      dbg_ram_data_in_port, dbg_ram_data_out_port, dbg_ram_data_vga_port, 
      dbg_ram_addr_part_1_port, dbg_ram_addr_part_0_port, lut_start_de, 
      lut_start_check, ram_addr_7_port, ram_addr_6_port, ram_addr_5_port, 
      ram_addr_4_port, ram_addr_3_port, ram_addr_2_port, 
      inputs_debounced_5_port, inputs_debounced_4_port, inputs_debounced_3_port
      , inputs_debounced_2_port, inputs_debounced_1_port, 
      inputs_debounced_0_port, button_seed, new_piece, next_piece_2_port, 
      next_piece_1_port, next_piece_0_port, timer_1_reset, timer_1_time, 
      lut_piece_type_2_port, lut_piece_type_1_port, lut_piece_type_0_port, 
      lut_next_piece, lut_x_2_port, lut_x_1_port, lut_x_0_port, lut_y_3_port, 
      lut_y_2_port, lut_y_1_port, lut_y_0_port, lut_rot_1_port, lut_rot_0_port,
      check_empty, draw_erase_draw, vga_addr_7_port, vga_addr_6_port, 
      vga_addr_5_port, vga_addr_4_port, vga_addr_3_port, vga_addr_2_port, 
      vga_addr_1_port, vga_addr_0_port, mask_7_port, mask_6_port, mask_5_port, 
      mask_4_port, mask_3_port, mask_2_port, mask_1_port, mask_0_port, 
      mask_select_1_port, mask_select_0_port, lut_error, rom_addr_6_port, 
      rom_addr_5_port, rom_addr_4_port, rom_addr_3_port, rom_addr_2_port, 
      rom_addr_1_port, rom_addr_0_port, rom_data_3_port, rom_data_2_port, 
      rom_data_1_port, rom_data_0_port, score, score_data_7_port, 
      score_data_6_port, score_data_5_port, score_data_4_port, 
      score_data_3_port, score_data_2_port, score_data_1_port, 
      score_data_0_port, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, 
      n15, n16, n17, n18, n19, n20, n21 : std_logic;

begin
   vga_v_sync <= vga_v_sync_port;
   dbg_check_start <= dbg_check_start_port;
   dbg_check_ready <= dbg_check_ready_port;
   dbg_draw_erase_start <= dbg_draw_erase_start_port;
   dbg_draw_erase_ready <= dbg_draw_erase_ready_port;
   dbg_clear_shift_start <= dbg_clear_shift_start_port;
   dbg_clear_shift_ready <= dbg_clear_shift_ready_port;
   dbg_draw_score_start <= dbg_draw_score_start_port;
   dbg_draw_score_ready <= dbg_draw_score_ready_port;
   dbg_lut_ready <= dbg_lut_ready_port;
   dbg_timer_start <= dbg_timer_start_port;
   dbg_timer_ready <= dbg_timer_ready_port;
   dbg_ram_we <= dbg_ram_we_port;
   dbg_ram_data_in <= dbg_ram_data_in_port;
   dbg_ram_data_out <= dbg_ram_data_out_port;
   dbg_ram_data_vga <= dbg_ram_data_vga_port;
   dbg_ram_addr_part <= ( dbg_ram_addr_part_1_port, dbg_ram_addr_part_0_port );
   
   switch_debounce : debounce port map( clk => clk, rst => rst, inv_inputs(5) 
                           => inputs(5), inv_inputs(4) => inputs(4), 
                           inv_inputs(3) => inputs(3), inv_inputs(2) => 
                           inputs(2), inv_inputs(1) => inputs(1), inv_inputs(0)
                           => inputs(0), output(5) => inputs_debounced_5_port, 
                           output(4) => inputs_debounced_4_port, output(3) => 
                           inputs_debounced_3_port, output(2) => 
                           inputs_debounced_2_port, output(1) => 
                           inputs_debounced_1_port, output(0) => 
                           inputs_debounced_0_port, random_seed => button_seed)
                           ;
   next_piece_generator : npg port map( clk => clk, rst => rst, button_seed => 
                           button_seed, new_number => new_piece, output(2) => 
                           next_piece_2_port, output(1) => next_piece_1_port, 
                           output(0) => next_piece_0_port);
   fall_timer : timer port map( clk => clk, vga_clk => vga_v_sync_port, rst => 
                           rst, cnt_rst => timer_1_reset, time => timer_1_time,
                           start => dbg_timer_start_port, ready => 
                           dbg_timer_ready_port);
   game_controller : controller port map( clk => clk, rst => rst, 
                           lut_piece_type(2) => lut_piece_type_2_port, 
                           lut_piece_type(1) => lut_piece_type_1_port, 
                           lut_piece_type(0) => lut_piece_type_0_port, 
                           lut_next_piece => lut_next_piece, lut_x(2) => 
                           lut_x_2_port, lut_x(1) => lut_x_1_port, lut_x(0) => 
                           lut_x_0_port, lut_y(3) => lut_y_3_port, lut_y(2) => 
                           lut_y_2_port, lut_y(1) => lut_y_1_port, lut_y(0) => 
                           lut_y_0_port, lut_rot(1) => lut_rot_1_port, 
                           lut_rot(0) => lut_rot_0_port, new_piece => new_piece
                           , next_piece(2) => next_piece_2_port, next_piece(1) 
                           => next_piece_1_port, next_piece(0) => 
                           next_piece_0_port, check_empty => check_empty, 
                           check_start => dbg_check_start_port, check_ready => 
                           dbg_check_ready_port, draw_erase_draw => 
                           draw_erase_draw, draw_erase_start => 
                           dbg_draw_erase_start_port, draw_erase_ready => 
                           dbg_draw_erase_ready_port, clear_shift_start => 
                           dbg_clear_shift_start_port, clear_shift_ready => 
                           dbg_clear_shift_ready_port, draw_score_draw => 
                           dbg_draw_score_start_port, draw_score_ready => 
                           dbg_draw_score_ready_port, timer_1_time => 
                           timer_1_time, timer_1_start => dbg_timer_start_port,
                           timer_1_done => dbg_timer_ready_port, timer_1_reset 
                           => timer_1_reset, inputs(5) => 
                           inputs_debounced_5_port, inputs(4) => 
                           inputs_debounced_4_port, inputs(3) => 
                           inputs_debounced_3_port, inputs(2) => 
                           inputs_debounced_2_port, inputs(1) => 
                           inputs_debounced_1_port, inputs(0) => 
                           inputs_debounced_0_port);
   video_ram : sr_if port map( clk => clk, rst => rst, di => n15, do1 => 
                           dbg_ram_data_out_port, do2 => dbg_ram_data_vga_port,
                           we => dbg_ram_we_port, addr1(7) => ram_addr_7_port, 
                           addr1(6) => ram_addr_6_port, addr1(5) => 
                           ram_addr_5_port, addr1(4) => n18, addr1(3) => n19, 
                           addr1(2) => n20, addr1(1) => n16, addr1(0) => n17, 
                           addr2(7) => vga_addr_7_port, addr2(6) => 
                           vga_addr_6_port, addr2(5) => vga_addr_5_port, 
                           addr2(4) => n10, addr2(3) => n9, addr2(2) => n12, 
                           addr2(1) => n8, addr2(0) => n11);
   video_ram_fix : ram_fix port map( draw_erase_start => 
                           dbg_draw_erase_start_port, draw_score_draw => 
                           dbg_draw_score_start_port, clear_shift_start => 
                           dbg_clear_shift_start_port, check_start => 
                           dbg_check_start_port, we => dbg_ram_we_port);
   vga_controller : vga port map( clk => clk, rst => rst, mem_addr(7) => 
                           vga_addr_7_port, mem_addr(6) => vga_addr_6_port, 
                           mem_addr(5) => vga_addr_5_port, mem_addr(4) => 
                           vga_addr_4_port, mem_addr(3) => vga_addr_3_port, 
                           mem_addr(2) => vga_addr_2_port, mem_addr(1) => 
                           vga_addr_1_port, mem_addr(0) => vga_addr_0_port, 
                           data => dbg_ram_data_vga_port, h_sync => vga_h_sync,
                           v_sync => vga_v_sync_port, red => vga_red, green => 
                           vga_green, blue => vga_blue);
   check_piece_mask : check_mask port map( clk => clk, rst => rst, mask(7) => 
                           mask_7_port, mask(6) => mask_6_port, mask(5) => 
                           mask_5_port, mask(4) => mask_4_port, mask(3) => 
                           mask_3_port, mask(2) => mask_2_port, mask(1) => 
                           mask_1_port, mask(0) => mask_0_port, mask_select(1) 
                           => mask_select_1_port, mask_select(0) => 
                           mask_select_0_port, ready => dbg_check_ready_port, 
                           empty => check_empty, start => dbg_check_start_port,
                           lut_start => lut_start_check, lut_ready => 
                           dbg_lut_ready_port, lut_error => lut_error, write =>
                           dbg_ram_we_port, addr(7) => ram_addr_7_port, addr(6)
                           => ram_addr_6_port, addr(5) => ram_addr_5_port, 
                           addr(4) => ram_addr_4_port, addr(3) => 
                           ram_addr_3_port, addr(2) => ram_addr_2_port, addr(1)
                           => dbg_ram_addr_part_1_port, addr(0) => 
                           dbg_ram_addr_part_0_port, data_in => 
                           dbg_ram_data_out_port);
   draw_erase_piece : de_piece port map( clk => clk, rst => rst, mask(7) => 
                           mask_7_port, mask(6) => mask_6_port, mask(5) => 
                           mask_5_port, mask(4) => mask_4_port, mask(3) => 
                           mask_3_port, mask(2) => mask_2_port, mask(1) => 
                           mask_1_port, mask(0) => mask_0_port, draw_erase => 
                           draw_erase_draw, ready => dbg_draw_erase_ready_port,
                           start => dbg_draw_erase_start_port, mask_select(1) 
                           => mask_select_1_port, mask_select(0) => 
                           mask_select_0_port, lut_start => lut_start_de, 
                           lut_ready => dbg_lut_ready_port, write => 
                           dbg_ram_we_port, addr(7) => ram_addr_7_port, addr(6)
                           => ram_addr_6_port, addr(5) => ram_addr_5_port, 
                           addr(4) => ram_addr_4_port, addr(3) => 
                           ram_addr_3_port, addr(2) => ram_addr_2_port, addr(1)
                           => dbg_ram_addr_part_1_port, addr(0) => 
                           dbg_ram_addr_part_0_port, data => 
                           dbg_ram_data_in_port);
   lookup_table : piece_lut port map( clk => clk, rst => rst, mask(7) => 
                           mask_7_port, mask(6) => mask_6_port, mask(5) => 
                           mask_5_port, mask(4) => mask_4_port, mask(3) => 
                           mask_3_port, mask(2) => mask_2_port, mask(1) => 
                           mask_1_port, mask(0) => mask_0_port, mask_select(1) 
                           => mask_select_1_port, mask_select(0) => 
                           mask_select_0_port, x(2) => lut_x_2_port, x(1) => 
                           lut_x_1_port, x(0) => lut_x_0_port, y(3) => 
                           lut_y_3_port, y(2) => lut_y_2_port, y(1) => 
                           lut_y_1_port, y(0) => lut_y_0_port, rot(1) => 
                           lut_rot_1_port, rot(0) => lut_rot_0_port, 
                           piece_type(2) => lut_piece_type_2_port, 
                           piece_type(1) => lut_piece_type_1_port, 
                           piece_type(0) => lut_piece_type_0_port, next_piece 
                           => lut_next_piece, ready => dbg_lut_ready_port, 
                           overflow => lut_error, check_start => 
                           lut_start_check, draw_start => lut_start_de, 
                           rom_addr(6) => rom_addr_6_port, rom_addr(5) => 
                           rom_addr_5_port, rom_addr(4) => rom_addr_4_port, 
                           rom_addr(3) => rom_addr_3_port, rom_addr(2) => 
                           rom_addr_2_port, rom_addr(1) => rom_addr_1_port, 
                           rom_addr(0) => rom_addr_0_port, rom_data(3) => 
                           rom_data_3_port, rom_data(2) => rom_data_2_port, 
                           rom_data(1) => rom_data_1_port, rom_data(0) => 
                           rom_data_0_port);
   read_only_memory : rom port map( addr(6) => rom_addr_6_port, addr(5) => n5, 
                           addr(4) => n4, addr(3) => n7, addr(2) => n6, addr(1)
                           => n14, addr(0) => n13, data(3) => rom_data_3_port, 
                           data(2) => rom_data_2_port, data(1) => 
                           rom_data_1_port, data(0) => rom_data_0_port);
   clear_shift : cs_compare port map( clk => clk, rst => rst, start_in => 
                           dbg_clear_shift_start_port, ready_out => 
                           dbg_clear_shift_ready_port, score_out => score, 
                           ram_addr_out(7) => ram_addr_7_port, ram_addr_out(6) 
                           => ram_addr_6_port, ram_addr_out(5) => 
                           ram_addr_5_port, ram_addr_out(4) => ram_addr_4_port,
                           ram_addr_out(3) => ram_addr_3_port, ram_addr_out(2) 
                           => ram_addr_2_port, ram_addr_out(1) => 
                           dbg_ram_addr_part_1_port, ram_addr_out(0) => 
                           dbg_ram_addr_part_0_port, ram_we => dbg_ram_we_port,
                           ram_data_in => dbg_ram_data_out_port, ram_data_out 
                           => dbg_ram_data_in_port);
   keep_score : log_score port map( clk => clk, rst => rst, increase => score, 
                           output(7) => score_data_7_port, output(6) => 
                           score_data_6_port, output(5) => score_data_5_port, 
                           output(4) => score_data_4_port, output(3) => 
                           score_data_3_port, output(2) => score_data_2_port, 
                           output(1) => score_data_1_port, output(0) => 
                           score_data_0_port);
   output_score : draw_score port map( ds_clk => clk, ds_rst => rst, ds_draw =>
                           dbg_draw_score_start_port, ds_ready => 
                           dbg_draw_score_ready_port, ds_input(7) => 
                           score_data_7_port, ds_input(6) => score_data_6_port,
                           ds_input(5) => score_data_5_port, ds_input(4) => 
                           score_data_4_port, ds_input(3) => score_data_3_port,
                           ds_input(2) => score_data_2_port, ds_input(1) => 
                           score_data_1_port, ds_input(0) => score_data_0_port,
                           ds_write => dbg_ram_we_port, ds_addr(7) => 
                           ram_addr_7_port, ds_addr(6) => ram_addr_6_port, 
                           ds_addr(5) => ram_addr_5_port, ds_addr(4) => 
                           ram_addr_4_port, ds_addr(3) => ram_addr_3_port, 
                           ds_addr(2) => ram_addr_2_port, ds_addr(1) => 
                           dbg_ram_addr_part_1_port, ds_addr(0) => 
                           dbg_ram_addr_part_0_port, ds_data_out => 
                           dbg_ram_data_in_port);
   U3 : iv110 port map( A => rom_addr_4_port, Y => n3);
   U4 : iv110 port map( A => n3, Y => n4);
   U5 : buf40 port map( A => rom_addr_5_port, Y => n5);
   U6 : buf40 port map( A => rom_addr_2_port, Y => n6);
   U7 : buf40 port map( A => rom_addr_3_port, Y => n7);
   U8 : buf40 port map( A => vga_addr_1_port, Y => n8);
   U9 : buf40 port map( A => vga_addr_3_port, Y => n9);
   U10 : buf40 port map( A => vga_addr_4_port, Y => n10);
   U11 : buf40 port map( A => vga_addr_0_port, Y => n11);
   U12 : buf40 port map( A => vga_addr_2_port, Y => n12);
   U13 : buf40 port map( A => rom_addr_0_port, Y => n13);
   U14 : buf40 port map( A => rom_addr_1_port, Y => n14);
   U15 : buf40 port map( A => dbg_ram_data_in_port, Y => n15);
   U16 : buf40 port map( A => dbg_ram_addr_part_1_port, Y => n16);
   U17 : buf40 port map( A => dbg_ram_addr_part_0_port, Y => n17);
   U18 : buf40 port map( A => ram_addr_4_port, Y => n18);
   U19 : buf40 port map( A => ram_addr_3_port, Y => n19);
   U20 : buf40 port map( A => ram_addr_2_port, Y => n20);
   U21 : iv110 port map( A => n21, Y => dbg_lut_start);
   U22 : no210 port map( A => lut_start_check, B => lut_start_de, Y => n21);

end synthesised;



