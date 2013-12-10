
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of vga_triggers is

   component na310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component no310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component dfa11
      port( D, CK, R : in std_logic;  Q : out std_logic);
   end component;
   
   signal new_line_new, new_frame_new, end_frame_new, n18, n19, n20, n21, n22, 
      n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37
      , n38, n39, n40, n41 : std_logic;

begin
   
   end_frame_state_reg : dfa11 port map( D => end_frame_new, CK => clk, R => 
                           rst, Q => end_frame_out);
   new_line_state_reg : dfa11 port map( D => new_line_new, CK => clk, R => rst,
                           Q => new_line_out);
   new_frame_state_reg : dfa11 port map( D => new_frame_new, CK => clk, R => 
                           rst, Q => new_frame_out);
   U23 : no210 port map( A => n18, B => n19, Y => new_line_new);
   U24 : iv110 port map( A => n20, Y => n18);
   U25 : no210 port map( A => n19, B => n20, Y => new_frame_new);
   U26 : na310 port map( A => n21, B => n22, C => n23, Y => n20);
   U27 : no310 port map( A => pos_y_in(2), B => pos_y_in(9), C => pos_y_in(4), 
                           Y => n23);
   U28 : na210 port map( A => n24, B => n25, Y => n19);
   U29 : no310 port map( A => n26, B => pos_x_in(5), C => pos_x_in(4), Y => n25
                           );
   U30 : na210 port map( A => n27, B => n28, Y => n26);
   U31 : no310 port map( A => n29, B => pos_x_in(1), C => pos_x_in(0), Y => n24
                           );
   U32 : iv110 port map( A => n30, Y => n29);
   U33 : no210 port map( A => pos_x_in(2), B => pos_x_in(3), Y => n30);
   U34 : no310 port map( A => n31, B => n32, C => n33, Y => end_frame_new);
   U35 : na310 port map( A => pos_x_in(1), B => pos_x_in(0), C => pos_x_in(2), 
                           Y => n33);
   U36 : na310 port map( A => n21, B => n34, C => n35, Y => n32);
   U37 : no210 port map( A => pos_x_in(5), B => pos_x_in(4), Y => n35);
   U38 : iv110 port map( A => pos_x_in(3), Y => n34);
   U39 : iv110 port map( A => n36, Y => n21);
   U40 : na210 port map( A => n37, B => n38, Y => n36);
   U41 : no310 port map( A => pos_y_in(6), B => pos_y_in(8), C => pos_y_in(7), 
                           Y => n38);
   U42 : no310 port map( A => pos_y_in(0), B => pos_y_in(5), C => pos_y_in(3), 
                           Y => n37);
   U43 : na210 port map( A => n39, B => n40, Y => n31);
   U44 : no310 port map( A => n22, B => n27, C => n28, Y => n40);
   U45 : iv110 port map( A => pos_x_in(7), Y => n28);
   U46 : iv110 port map( A => pos_x_in(6), Y => n27);
   U47 : iv110 port map( A => pos_y_in(1), Y => n22);
   U48 : iv110 port map( A => n41, Y => n39);
   U49 : na310 port map( A => pos_y_in(9), B => pos_y_in(2), C => pos_y_in(4), 
                           Y => n41);

end synthesised;



