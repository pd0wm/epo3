
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of vga_counter is

   component vga_counter_resets
      port( pos_x_reset, pos_y_reset, pos_y_enable : out std_logic;  pos_x : in
            std_logic_vector (7 downto 0);  pos_y : in std_logic_vector (9 
            downto 0));
   end component;
   
   component vga_counter_10bit
      port( clk, rst, rst_ext, en : in std_logic;  val : out std_logic_vector 
            (9 downto 0));
   end component;
   
   component vga_counter_8bit
      port( clk, rst, rst_ext, en : in std_logic;  val : out std_logic_vector 
            (7 downto 0));
   end component;
   
   signal X_Logic1_port, pos_x_out_7_port, pos_x_out_6_port, pos_x_out_5_port, 
      pos_x_out_4_port, pos_x_out_3_port, pos_x_out_2_port, pos_x_out_1_port, 
      pos_x_out_0_port, pos_y_out_9_port, pos_y_out_8_port, pos_y_out_7_port, 
      pos_y_out_6_port, pos_y_out_5_port, pos_y_out_4_port, pos_y_out_3_port, 
      pos_y_out_2_port, pos_y_out_1_port, pos_y_out_0_port, pos_x_reset, 
      pos_y_reset, pos_y_enable : std_logic;

begin
   pos_x_out <= ( pos_x_out_7_port, pos_x_out_6_port, pos_x_out_5_port, 
      pos_x_out_4_port, pos_x_out_3_port, pos_x_out_2_port, pos_x_out_1_port, 
      pos_x_out_0_port );
   pos_y_out <= ( pos_y_out_9_port, pos_y_out_8_port, pos_y_out_7_port, 
      pos_y_out_6_port, pos_y_out_5_port, pos_y_out_4_port, pos_y_out_3_port, 
      pos_y_out_2_port, pos_y_out_1_port, pos_y_out_0_port );
   
   pos_x_counter : vga_counter_8bit port map( clk => clk, rst => rst, rst_ext 
                           => pos_x_reset, en => X_Logic1_port, val(7) => 
                           pos_x_out_7_port, val(6) => pos_x_out_6_port, val(5)
                           => pos_x_out_5_port, val(4) => pos_x_out_4_port, 
                           val(3) => pos_x_out_3_port, val(2) => 
                           pos_x_out_2_port, val(1) => pos_x_out_1_port, val(0)
                           => pos_x_out_0_port);
   pos_y_counter : vga_counter_10bit port map( clk => clk, rst => rst, rst_ext 
                           => pos_y_reset, en => pos_y_enable, val(9) => 
                           pos_y_out_9_port, val(8) => pos_y_out_8_port, val(7)
                           => pos_y_out_7_port, val(6) => pos_y_out_6_port, 
                           val(5) => pos_y_out_5_port, val(4) => 
                           pos_y_out_4_port, val(3) => pos_y_out_3_port, val(2)
                           => pos_y_out_2_port, val(1) => pos_y_out_1_port, 
                           val(0) => pos_y_out_0_port);
   resets : vga_counter_resets port map( pos_x_reset => pos_x_reset, 
                           pos_y_reset => pos_y_reset, pos_y_enable => 
                           pos_y_enable, pos_x(7) => pos_x_out_7_port, pos_x(6)
                           => pos_x_out_6_port, pos_x(5) => pos_x_out_5_port, 
                           pos_x(4) => pos_x_out_4_port, pos_x(3) => 
                           pos_x_out_3_port, pos_x(2) => pos_x_out_2_port, 
                           pos_x(1) => pos_x_out_1_port, pos_x(0) => 
                           pos_x_out_0_port, pos_y(9) => pos_y_out_9_port, 
                           pos_y(8) => pos_y_out_8_port, pos_y(7) => 
                           pos_y_out_7_port, pos_y(6) => pos_y_out_6_port, 
                           pos_y(5) => pos_y_out_5_port, pos_y(4) => 
                           pos_y_out_4_port, pos_y(3) => pos_y_out_3_port, 
                           pos_y(2) => pos_y_out_2_port, pos_y(1) => 
                           pos_y_out_1_port, pos_y(0) => pos_y_out_0_port);
   X_Logic1_port <= '1';

end synthesised;



