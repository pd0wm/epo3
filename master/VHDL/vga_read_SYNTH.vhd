
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of vga_read is

   component no310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component dfa11
      port( D, CK, R : in std_logic;  Q : out std_logic);
   end component;
   
   signal h_sync_buf, v_sync_buf, in_field_buf, in_np_buf, in_score_buf, 
      red_next, n1, n3 : std_logic;

begin
   
   h_sync_buf_reg : dfa11 port map( D => h_sync_in, CK => clk, R => rst, Q => 
                           h_sync_buf);
   v_sync_buf_reg : dfa11 port map( D => v_sync_in, CK => clk, R => rst, Q => 
                           v_sync_buf);
   in_field_buf_reg : dfa11 port map( D => in_field_in, CK => clk, R => rst, Q 
                           => in_field_buf);
   in_np_buf_reg : dfa11 port map( D => in_np_in, CK => clk, R => rst, Q => 
                           in_np_buf);
   in_score_buf_reg : dfa11 port map( D => in_score_in, CK => clk, R => rst, Q 
                           => in_score_buf);
   v_sync_out_reg : dfa11 port map( D => v_sync_buf, CK => clk, R => rst, Q => 
                           v_sync_out);
   red_out_reg : dfa11 port map( D => red_next, CK => clk, R => rst, Q => 
                           red_out);
   green_out_reg : dfa11 port map( D => red_next, CK => clk, R => rst, Q => 
                           green_out);
   blue_out_reg : dfa11 port map( D => n1, CK => clk, R => rst, Q => blue_out);
   h_sync_out_reg : dfa11 port map( D => h_sync_buf, CK => clk, R => rst, Q => 
                           h_sync_out);
   U6 : no210 port map( A => data_in, B => n3, Y => red_next);
   U7 : iv110 port map( A => n3, Y => n1);
   U8 : no310 port map( A => in_field_buf, B => in_score_buf, C => in_np_buf, Y
                           => n3);

end synthesised;



