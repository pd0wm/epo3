
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of vga_triggers is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component na310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component no310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component dfa11
      port( D, CK, R : in std_logic;  Q : out std_logic);
   end component;
   
   signal new_line_new, new_frame_new, n14, n15, n16, n17, n18, n19, n20, n21, 
      n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33 : std_logic;

begin
   
   new_line_state_reg : dfa11 port map( D => new_line_new, CK => clk, R => rst,
                           Q => new_line_out);
   new_frame_state_reg : dfa11 port map( D => new_frame_new, CK => clk, R => 
                           rst, Q => new_frame_out);
   end_line_state_reg : dfa11 port map( D => n14, CK => clk, R => rst, Q => 
                           end_line_out);
   end_frame_out <= '0';
   U20 : no210 port map( A => n15, B => n16, Y => new_line_new);
   U21 : iv110 port map( A => n17, Y => n15);
   U22 : no210 port map( A => n16, B => n17, Y => new_frame_new);
   U23 : na310 port map( A => n18, B => n19, C => n20, Y => n17);
   U24 : no310 port map( A => n21, B => pos_y_in(1), C => pos_y_in(0), Y => n20
                           );
   U25 : iv110 port map( A => n22, Y => n21);
   U26 : no210 port map( A => pos_y_in(3), B => pos_y_in(2), Y => n22);
   U27 : no310 port map( A => pos_y_in(6), B => pos_y_in(8), C => pos_y_in(7), 
                           Y => n19);
   U28 : no210 port map( A => pos_y_in(5), B => pos_y_in(4), Y => n18);
   U29 : na210 port map( A => n23, B => n24, Y => n16);
   U30 : no310 port map( A => n25, B => pos_x_in(5), C => pos_x_in(4), Y => n24
                           );
   U31 : iv110 port map( A => n26, Y => n25);
   U32 : no210 port map( A => pos_x_in(6), B => pos_x_in(7), Y => n26);
   U33 : no310 port map( A => n27, B => pos_x_in(1), C => pos_x_in(0), Y => n23
                           );
   U34 : iv110 port map( A => n28, Y => n27);
   U35 : no210 port map( A => pos_x_in(2), B => pos_x_in(3), Y => n28);
   U36 : no310 port map( A => n29, B => n30, C => n31, Y => n14);
   U37 : na210 port map( A => pos_x_in(7), B => pos_x_in(6), Y => n31);
   U38 : na210 port map( A => pos_x_in(2), B => pos_x_in(1), Y => n30);
   U39 : na310 port map( A => pos_x_in(0), B => n32, C => n33, Y => n29);
   U40 : no210 port map( A => pos_x_in(5), B => pos_x_in(4), Y => n33);
   U41 : iv110 port map( A => pos_x_in(3), Y => n32);

end synthesised;



