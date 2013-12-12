
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of vga is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component vga_demux
      port( def : in std_logic_vector (7 downto 0);  s1 : in std_logic;  di1 : 
            in std_logic_vector (7 downto 0);  s2 : in std_logic;  di2 : in 
            std_logic_vector (7 downto 0);  do : out std_logic_vector (7 downto
            0));
   end component;
   
   component vga_score_check
      port( clk, rst : in std_logic;  pos_x_in : in std_logic_vector (7 downto 
            0);  pos_y_in : in std_logic_vector (9 downto 0);  in_score_out, 
            end_score_line_out : out std_logic);
   end component;
   
   component vga_score_trans
      port( clk, rst : in std_logic;  mem_addr_out : out std_logic_vector (7 
            downto 0);  end_score_line_in, end_frame_in : in std_logic);
   end component;
   
   component vga_np_check
      port( clk, rst : in std_logic;  pos_x_in : in std_logic_vector (7 downto 
            0);  pos_y_in : in std_logic_vector (9 downto 0);  in_np_out, 
            end_np_line_out : out std_logic);
   end component;
   
   component vga_np_trans_reset
      port( clk, rst : in std_logic;  mem_addr_reset_out : out std_logic_vector
            (1 downto 0);  end_np_line_in, end_frame_in : in std_logic);
   end component;
   
   component vga_np_trans
      port( clk, rst : in std_logic;  mem_addr_reset_in : in std_logic_vector 
            (1 downto 0);  mem_addr_out : out std_logic_vector (7 downto 0);  
            in_np_in, new_line_in, new_frame_in : in std_logic);
   end component;
   
   component vga_field_check
      port( clk, rst : in std_logic;  pos_x_in : in std_logic_vector (7 downto 
            0);  pos_y_in : in std_logic_vector (9 downto 0);  in_field_out, 
            end_field_line_out : out std_logic);
   end component;
   
   component vga_field_trans_reset
      port( clk, rst : in std_logic;  mem_addr_reset_out : out std_logic_vector
            (3 downto 0);  end_field_line_in, end_frame_in : in std_logic);
   end component;
   
   component vga_field_trans
      port( clk, rst : in std_logic;  mem_addr_reset_in : in std_logic_vector 
            (3 downto 0);  mem_addr_out : out std_logic_vector (7 downto 0);  
            in_field_in, new_line_in, new_frame_in : in std_logic);
   end component;
   
   component vga_read
      port( clk, rst, in_field_in, in_np_in, in_score_in, data_in, h_sync_in, 
            v_sync_in : in std_logic;  h_sync_out, v_sync_out, red_out, 
            green_out, blue_out : out std_logic);
   end component;
   
   component vga_triggers
      port( clk, rst : in std_logic;  pos_x_in : in std_logic_vector (7 downto 
            0);  pos_y_in : in std_logic_vector (9 downto 0);  new_line_out, 
            new_frame_out, end_frame_out : out std_logic);
   end component;
   
   component vga_sync
      port( clk, rst : in std_logic;  pos_x_in : in std_logic_vector (7 downto 
            0);  pos_y_in : in std_logic_vector (9 downto 0);  h_sync_out, 
            v_sync_out : out std_logic);
   end component;
   
   component vga_counter
      port( clk, rst : in std_logic;  pos_x_out : out std_logic_vector (7 
            downto 0);  pos_y_out : out std_logic_vector (9 downto 0));
   end component;
   
   signal pos_x_7_port, pos_x_6_port, pos_x_5_port, pos_x_4_port, pos_x_3_port,
      pos_x_2_port, pos_x_1_port, pos_x_0_port, pos_y_9_port, pos_y_8_port, 
      pos_y_7_port, pos_y_6_port, pos_y_5_port, pos_y_4_port, pos_y_3_port, 
      pos_y_2_port, pos_y_1_port, pos_y_0_port, h_sync_buf, v_sync_buf, 
      new_line, new_frame, end_frame, in_field, in_np, in_score, 
      mem_addr_reset_field_3_port, mem_addr_reset_field_2_port, 
      mem_addr_reset_field_1_port, mem_addr_reset_field_0_port, 
      mem_addr_field_7_port, mem_addr_field_6_port, mem_addr_field_5_port, 
      mem_addr_field_4_port, mem_addr_field_3_port, mem_addr_field_2_port, 
      mem_addr_field_1_port, mem_addr_field_0_port, end_field_line, 
      mem_addr_reset_np_1_port, mem_addr_reset_np_0_port, mem_addr_np_7_port, 
      mem_addr_np_6_port, mem_addr_np_5_port, mem_addr_np_4_port, 
      mem_addr_np_3_port, mem_addr_np_2_port, mem_addr_np_1_port, 
      mem_addr_np_0_port, end_np_line, mem_addr_score_7_port, 
      mem_addr_score_6_port, mem_addr_score_5_port, mem_addr_score_4_port, 
      mem_addr_score_3_port, mem_addr_score_2_port, mem_addr_score_1_port, 
      mem_addr_score_0_port, end_score_line, n1, n2 : std_logic;

begin
   
   counter : vga_counter port map( clk => clk, rst => rst, pos_x_out(7) => 
                           pos_x_7_port, pos_x_out(6) => pos_x_6_port, 
                           pos_x_out(5) => pos_x_5_port, pos_x_out(4) => 
                           pos_x_4_port, pos_x_out(3) => pos_x_3_port, 
                           pos_x_out(2) => pos_x_2_port, pos_x_out(1) => 
                           pos_x_1_port, pos_x_out(0) => pos_x_0_port, 
                           pos_y_out(9) => pos_y_9_port, pos_y_out(8) => 
                           pos_y_8_port, pos_y_out(7) => pos_y_7_port, 
                           pos_y_out(6) => pos_y_6_port, pos_y_out(5) => 
                           pos_y_5_port, pos_y_out(4) => pos_y_4_port, 
                           pos_y_out(3) => pos_y_3_port, pos_y_out(2) => 
                           pos_y_2_port, pos_y_out(1) => pos_y_1_port, 
                           pos_y_out(0) => pos_y_0_port);
   sync : vga_sync port map( clk => clk, rst => rst, pos_x_in(7) => 
                           pos_x_7_port, pos_x_in(6) => pos_x_6_port, 
                           pos_x_in(5) => pos_x_5_port, pos_x_in(4) => 
                           pos_x_4_port, pos_x_in(3) => pos_x_3_port, 
                           pos_x_in(2) => pos_x_2_port, pos_x_in(1) => 
                           pos_x_1_port, pos_x_in(0) => pos_x_0_port, 
                           pos_y_in(9) => pos_y_9_port, pos_y_in(8) => 
                           pos_y_8_port, pos_y_in(7) => pos_y_7_port, 
                           pos_y_in(6) => pos_y_6_port, pos_y_in(5) => 
                           pos_y_5_port, pos_y_in(4) => pos_y_4_port, 
                           pos_y_in(3) => pos_y_3_port, pos_y_in(2) => 
                           pos_y_2_port, pos_y_in(1) => pos_y_1_port, 
                           pos_y_in(0) => pos_y_0_port, h_sync_out => 
                           h_sync_buf, v_sync_out => v_sync_buf);
   triggers : vga_triggers port map( clk => clk, rst => rst, pos_x_in(7) => 
                           pos_x_7_port, pos_x_in(6) => pos_x_6_port, 
                           pos_x_in(5) => pos_x_5_port, pos_x_in(4) => 
                           pos_x_4_port, pos_x_in(3) => pos_x_3_port, 
                           pos_x_in(2) => pos_x_2_port, pos_x_in(1) => 
                           pos_x_1_port, pos_x_in(0) => pos_x_0_port, 
                           pos_y_in(9) => pos_y_9_port, pos_y_in(8) => 
                           pos_y_8_port, pos_y_in(7) => pos_y_7_port, 
                           pos_y_in(6) => pos_y_6_port, pos_y_in(5) => 
                           pos_y_5_port, pos_y_in(4) => pos_y_4_port, 
                           pos_y_in(3) => pos_y_3_port, pos_y_in(2) => 
                           pos_y_2_port, pos_y_in(1) => pos_y_1_port, 
                           pos_y_in(0) => pos_y_0_port, new_line_out => 
                           new_line, new_frame_out => new_frame, end_frame_out 
                           => end_frame);
   read_and_output : vga_read port map( clk => clk, rst => rst, in_field_in => 
                           in_field, in_np_in => in_np, in_score_in => in_score
                           , data_in => data, h_sync_in => h_sync_buf, 
                           v_sync_in => v_sync_buf, h_sync_out => h_sync, 
                           v_sync_out => v_sync, red_out => red, green_out => 
                           green, blue_out => blue);
   field_translation : vga_field_trans port map( clk => clk, rst => rst, 
                           mem_addr_reset_in(3) => mem_addr_reset_field_3_port,
                           mem_addr_reset_in(2) => mem_addr_reset_field_2_port,
                           mem_addr_reset_in(1) => mem_addr_reset_field_1_port,
                           mem_addr_reset_in(0) => mem_addr_reset_field_0_port,
                           mem_addr_out(7) => mem_addr_field_7_port, 
                           mem_addr_out(6) => mem_addr_field_6_port, 
                           mem_addr_out(5) => mem_addr_field_5_port, 
                           mem_addr_out(4) => mem_addr_field_4_port, 
                           mem_addr_out(3) => mem_addr_field_3_port, 
                           mem_addr_out(2) => mem_addr_field_2_port, 
                           mem_addr_out(1) => mem_addr_field_1_port, 
                           mem_addr_out(0) => mem_addr_field_0_port, 
                           in_field_in => in_field, new_line_in => new_line, 
                           new_frame_in => new_frame);
   field_translation_reset : vga_field_trans_reset port map( clk => clk, rst =>
                           rst, mem_addr_reset_out(3) => 
                           mem_addr_reset_field_3_port, mem_addr_reset_out(2) 
                           => mem_addr_reset_field_2_port, 
                           mem_addr_reset_out(1) => mem_addr_reset_field_1_port
                           , mem_addr_reset_out(0) => 
                           mem_addr_reset_field_0_port, end_field_line_in => 
                           end_field_line, end_frame_in => n2);
   field_check : vga_field_check port map( clk => clk, rst => rst, pos_x_in(7) 
                           => pos_x_7_port, pos_x_in(6) => pos_x_6_port, 
                           pos_x_in(5) => pos_x_5_port, pos_x_in(4) => 
                           pos_x_4_port, pos_x_in(3) => pos_x_3_port, 
                           pos_x_in(2) => pos_x_2_port, pos_x_in(1) => 
                           pos_x_1_port, pos_x_in(0) => pos_x_0_port, 
                           pos_y_in(9) => pos_y_9_port, pos_y_in(8) => 
                           pos_y_8_port, pos_y_in(7) => pos_y_7_port, 
                           pos_y_in(6) => pos_y_6_port, pos_y_in(5) => 
                           pos_y_5_port, pos_y_in(4) => pos_y_4_port, 
                           pos_y_in(3) => pos_y_3_port, pos_y_in(2) => 
                           pos_y_2_port, pos_y_in(1) => pos_y_1_port, 
                           pos_y_in(0) => pos_y_0_port, in_field_out => 
                           in_field, end_field_line_out => end_field_line);
   np_translation : vga_np_trans port map( clk => clk, rst => rst, 
                           mem_addr_reset_in(1) => mem_addr_reset_np_1_port, 
                           mem_addr_reset_in(0) => mem_addr_reset_np_0_port, 
                           mem_addr_out(7) => mem_addr_np_7_port, 
                           mem_addr_out(6) => mem_addr_np_6_port, 
                           mem_addr_out(5) => mem_addr_np_5_port, 
                           mem_addr_out(4) => mem_addr_np_4_port, 
                           mem_addr_out(3) => mem_addr_np_3_port, 
                           mem_addr_out(2) => mem_addr_np_2_port, 
                           mem_addr_out(1) => mem_addr_np_1_port, 
                           mem_addr_out(0) => mem_addr_np_0_port, in_np_in => 
                           in_np, new_line_in => new_line, new_frame_in => 
                           new_frame);
   np_translation_reset : vga_np_trans_reset port map( clk => clk, rst => rst, 
                           mem_addr_reset_out(1) => mem_addr_reset_np_1_port, 
                           mem_addr_reset_out(0) => mem_addr_reset_np_0_port, 
                           end_np_line_in => end_np_line, end_frame_in => 
                           end_frame);
   np_check : vga_np_check port map( clk => clk, rst => rst, pos_x_in(7) => 
                           pos_x_7_port, pos_x_in(6) => pos_x_6_port, 
                           pos_x_in(5) => pos_x_5_port, pos_x_in(4) => 
                           pos_x_4_port, pos_x_in(3) => pos_x_3_port, 
                           pos_x_in(2) => pos_x_2_port, pos_x_in(1) => 
                           pos_x_1_port, pos_x_in(0) => pos_x_0_port, 
                           pos_y_in(9) => pos_y_9_port, pos_y_in(8) => 
                           pos_y_8_port, pos_y_in(7) => pos_y_7_port, 
                           pos_y_in(6) => pos_y_6_port, pos_y_in(5) => 
                           pos_y_5_port, pos_y_in(4) => pos_y_4_port, 
                           pos_y_in(3) => pos_y_3_port, pos_y_in(2) => 
                           pos_y_2_port, pos_y_in(1) => pos_y_1_port, 
                           pos_y_in(0) => pos_y_0_port, in_np_out => in_np, 
                           end_np_line_out => end_np_line);
   score_translation : vga_score_trans port map( clk => clk, rst => rst, 
                           mem_addr_out(7) => mem_addr_score_7_port, 
                           mem_addr_out(6) => mem_addr_score_6_port, 
                           mem_addr_out(5) => mem_addr_score_5_port, 
                           mem_addr_out(4) => mem_addr_score_4_port, 
                           mem_addr_out(3) => mem_addr_score_3_port, 
                           mem_addr_out(2) => mem_addr_score_2_port, 
                           mem_addr_out(1) => mem_addr_score_1_port, 
                           mem_addr_out(0) => mem_addr_score_0_port, 
                           end_score_line_in => end_score_line, end_frame_in =>
                           end_frame);
   score_check : vga_score_check port map( clk => clk, rst => rst, pos_x_in(7) 
                           => pos_x_7_port, pos_x_in(6) => pos_x_6_port, 
                           pos_x_in(5) => pos_x_5_port, pos_x_in(4) => 
                           pos_x_4_port, pos_x_in(3) => pos_x_3_port, 
                           pos_x_in(2) => pos_x_2_port, pos_x_in(1) => 
                           pos_x_1_port, pos_x_in(0) => pos_x_0_port, 
                           pos_y_in(9) => pos_y_9_port, pos_y_in(8) => 
                           pos_y_8_port, pos_y_in(7) => pos_y_7_port, 
                           pos_y_in(6) => pos_y_6_port, pos_y_in(5) => 
                           pos_y_5_port, pos_y_in(4) => pos_y_4_port, 
                           pos_y_in(3) => pos_y_3_port, pos_y_in(2) => 
                           pos_y_2_port, pos_y_in(1) => pos_y_1_port, 
                           pos_y_in(0) => pos_y_0_port, in_score_out => 
                           in_score, end_score_line_out => end_score_line);
   mem_addr_demux : vga_demux port map( def(7) => mem_addr_field_7_port, def(6)
                           => mem_addr_field_6_port, def(5) => 
                           mem_addr_field_5_port, def(4) => 
                           mem_addr_field_4_port, def(3) => 
                           mem_addr_field_3_port, def(2) => 
                           mem_addr_field_2_port, def(1) => 
                           mem_addr_field_1_port, def(0) => 
                           mem_addr_field_0_port, s1 => in_np, di1(7) => 
                           mem_addr_np_7_port, di1(6) => mem_addr_np_6_port, 
                           di1(5) => mem_addr_np_5_port, di1(4) => 
                           mem_addr_np_4_port, di1(3) => mem_addr_np_3_port, 
                           di1(2) => mem_addr_np_2_port, di1(1) => 
                           mem_addr_np_1_port, di1(0) => mem_addr_np_0_port, s2
                           => in_score, di2(7) => mem_addr_score_7_port, di2(6)
                           => mem_addr_score_6_port, di2(5) => 
                           mem_addr_score_5_port, di2(4) => 
                           mem_addr_score_4_port, di2(3) => 
                           mem_addr_score_3_port, di2(2) => 
                           mem_addr_score_2_port, di2(1) => 
                           mem_addr_score_1_port, di2(0) => 
                           mem_addr_score_0_port, do(7) => mem_addr(7), do(6) 
                           => mem_addr(6), do(5) => mem_addr(5), do(4) => 
                           mem_addr(4), do(3) => mem_addr(3), do(2) => 
                           mem_addr(2), do(1) => mem_addr(1), do(0) => 
                           mem_addr(0));
   U1 : iv110 port map( A => end_frame, Y => n1);
   U2 : iv110 port map( A => n1, Y => n2);

end synthesised;



