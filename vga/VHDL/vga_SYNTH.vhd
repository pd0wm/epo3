
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of vga is

   component vga_read
      port( clk, rst, in_field_in, data_in, h_sync_in, v_sync_in : in std_logic
            ;  h_sync_out, v_sync_out, red_out, green_out, blue_out : out 
            std_logic);
   end component;
   
   component vga_trans_reset
      port( clk, rst : in std_logic;  mem_addr_reset_out : out std_logic_vector
            (6 downto 0);  end_field_line_in, end_frame_in : in std_logic);
   end component;
   
   component vga_trans
      port( clk, rst : in std_logic;  mem_addr_reset_in : in std_logic_vector 
            (6 downto 0);  mem_addr_out : out std_logic_vector (6 downto 0);  
            in_field_in, new_line_in, new_frame_in : in std_logic);
   end component;
   
   component vga_triggers
      port( clk, rst : in std_logic;  pos_x_in : in std_logic_vector (7 downto 
            0);  pos_y_in : in std_logic_vector (8 downto 0);  new_line_out, 
            new_frame_out, end_line_out, end_frame_out : out std_logic);
   end component;
   
   component vga_field_check
      port( clk, rst : in std_logic;  pos_x_in : in std_logic_vector (7 downto 
            0);  pos_y_in : in std_logic_vector (8 downto 0);  in_field_out, 
            end_field_line_out : out std_logic);
   end component;
   
   component vga_sync
      port( clk, rst : in std_logic;  pos_x_in : in std_logic_vector (7 downto 
            0);  pos_y_in : in std_logic_vector (8 downto 0);  h_sync_out, 
            v_sync_out : out std_logic);
   end component;
   
   component vga_counter
      port( clk, rst : in std_logic;  pos_x_out : out std_logic_vector (7 
            downto 0);  pos_y_out : out std_logic_vector (8 downto 0));
   end component;
   
   signal pos_x_7_port, pos_x_6_port, pos_x_5_port, pos_x_4_port, pos_x_3_port,
      pos_x_2_port, pos_x_1_port, pos_x_0_port, pos_y_8_port, pos_y_7_port, 
      pos_y_6_port, pos_y_5_port, pos_y_4_port, pos_y_3_port, pos_y_2_port, 
      pos_y_1_port, pos_y_0_port, h_sync_buf, v_sync_buf, in_field, 
      end_field_line, new_line, new_frame, end_frame, mem_addr_reset_6_port, 
      mem_addr_reset_5_port, mem_addr_reset_4_port, mem_addr_reset_3_port, 
      mem_addr_reset_2_port, mem_addr_reset_1_port, mem_addr_reset_0_port, 
      n_1000 : std_logic;

begin
   
   counter : vga_counter port map( clk => clk, rst => rst, pos_x_out(7) => 
                           pos_x_7_port, pos_x_out(6) => pos_x_6_port, 
                           pos_x_out(5) => pos_x_5_port, pos_x_out(4) => 
                           pos_x_4_port, pos_x_out(3) => pos_x_3_port, 
                           pos_x_out(2) => pos_x_2_port, pos_x_out(1) => 
                           pos_x_1_port, pos_x_out(0) => pos_x_0_port, 
                           pos_y_out(8) => pos_y_8_port, pos_y_out(7) => 
                           pos_y_7_port, pos_y_out(6) => pos_y_6_port, 
                           pos_y_out(5) => pos_y_5_port, pos_y_out(4) => 
                           pos_y_4_port, pos_y_out(3) => pos_y_3_port, 
                           pos_y_out(2) => pos_y_2_port, pos_y_out(1) => 
                           pos_y_1_port, pos_y_out(0) => pos_y_0_port);
   sync : vga_sync port map( clk => clk, rst => rst, pos_x_in(7) => 
                           pos_x_7_port, pos_x_in(6) => pos_x_6_port, 
                           pos_x_in(5) => pos_x_5_port, pos_x_in(4) => 
                           pos_x_4_port, pos_x_in(3) => pos_x_3_port, 
                           pos_x_in(2) => pos_x_2_port, pos_x_in(1) => 
                           pos_x_1_port, pos_x_in(0) => pos_x_0_port, 
                           pos_y_in(8) => pos_y_8_port, pos_y_in(7) => 
                           pos_y_7_port, pos_y_in(6) => pos_y_6_port, 
                           pos_y_in(5) => pos_y_5_port, pos_y_in(4) => 
                           pos_y_4_port, pos_y_in(3) => pos_y_3_port, 
                           pos_y_in(2) => pos_y_2_port, pos_y_in(1) => 
                           pos_y_1_port, pos_y_in(0) => pos_y_0_port, 
                           h_sync_out => h_sync_buf, v_sync_out => v_sync_buf);
   field_check : vga_field_check port map( clk => clk, rst => rst, pos_x_in(7) 
                           => pos_x_7_port, pos_x_in(6) => pos_x_6_port, 
                           pos_x_in(5) => pos_x_5_port, pos_x_in(4) => 
                           pos_x_4_port, pos_x_in(3) => pos_x_3_port, 
                           pos_x_in(2) => pos_x_2_port, pos_x_in(1) => 
                           pos_x_1_port, pos_x_in(0) => pos_x_0_port, 
                           pos_y_in(8) => pos_y_8_port, pos_y_in(7) => 
                           pos_y_7_port, pos_y_in(6) => pos_y_6_port, 
                           pos_y_in(5) => pos_y_5_port, pos_y_in(4) => 
                           pos_y_4_port, pos_y_in(3) => pos_y_3_port, 
                           pos_y_in(2) => pos_y_2_port, pos_y_in(1) => 
                           pos_y_1_port, pos_y_in(0) => pos_y_0_port, 
                           in_field_out => in_field, end_field_line_out => 
                           end_field_line);
   triggers : vga_triggers port map( clk => clk, rst => rst, pos_x_in(7) => 
                           pos_x_7_port, pos_x_in(6) => pos_x_6_port, 
                           pos_x_in(5) => pos_x_5_port, pos_x_in(4) => 
                           pos_x_4_port, pos_x_in(3) => pos_x_3_port, 
                           pos_x_in(2) => pos_x_2_port, pos_x_in(1) => 
                           pos_x_1_port, pos_x_in(0) => pos_x_0_port, 
                           pos_y_in(8) => pos_y_8_port, pos_y_in(7) => 
                           pos_y_7_port, pos_y_in(6) => pos_y_6_port, 
                           pos_y_in(5) => pos_y_5_port, pos_y_in(4) => 
                           pos_y_4_port, pos_y_in(3) => pos_y_3_port, 
                           pos_y_in(2) => pos_y_2_port, pos_y_in(1) => 
                           pos_y_1_port, pos_y_in(0) => pos_y_0_port, 
                           new_line_out => new_line, new_frame_out => new_frame
                           , end_line_out => n_1000, end_frame_out => end_frame
                           );
   trans : vga_trans port map( clk => clk, rst => rst, mem_addr_reset_in(6) => 
                           mem_addr_reset_6_port, mem_addr_reset_in(5) => 
                           mem_addr_reset_5_port, mem_addr_reset_in(4) => 
                           mem_addr_reset_4_port, mem_addr_reset_in(3) => 
                           mem_addr_reset_3_port, mem_addr_reset_in(2) => 
                           mem_addr_reset_2_port, mem_addr_reset_in(1) => 
                           mem_addr_reset_1_port, mem_addr_reset_in(0) => 
                           mem_addr_reset_0_port, mem_addr_out(6) => 
                           mem_addr(6), mem_addr_out(5) => mem_addr(5), 
                           mem_addr_out(4) => mem_addr(4), mem_addr_out(3) => 
                           mem_addr(3), mem_addr_out(2) => mem_addr(2), 
                           mem_addr_out(1) => mem_addr(1), mem_addr_out(0) => 
                           mem_addr(0), in_field_in => in_field, new_line_in =>
                           new_line, new_frame_in => new_frame);
   trans_reset : vga_trans_reset port map( clk => clk, rst => rst, 
                           mem_addr_reset_out(6) => mem_addr_reset_6_port, 
                           mem_addr_reset_out(5) => mem_addr_reset_5_port, 
                           mem_addr_reset_out(4) => mem_addr_reset_4_port, 
                           mem_addr_reset_out(3) => mem_addr_reset_3_port, 
                           mem_addr_reset_out(2) => mem_addr_reset_2_port, 
                           mem_addr_reset_out(1) => mem_addr_reset_1_port, 
                           mem_addr_reset_out(0) => mem_addr_reset_0_port, 
                           end_field_line_in => end_field_line, end_frame_in =>
                           end_frame);
   read_and_output : vga_read port map( clk => clk, rst => rst, in_field_in => 
                           in_field, data_in => data, h_sync_in => h_sync_buf, 
                           v_sync_in => v_sync_buf, h_sync_out => h_sync, 
                           v_sync_out => v_sync, red_out => red, green_out => 
                           green, blue_out => blue);

end synthesised;



