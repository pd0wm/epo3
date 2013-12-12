
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of vga_np_check is

   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component no310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component na310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component mu111
      port( A, B, S : in std_logic;  Y : out std_logic);
   end component;
   
   component dfa11
      port( D, CK, R : in std_logic;  Q : out std_logic);
   end component;
   
   signal N15, N18, n14, n15_port, n16, n17, n18_port, n19, n20, n21, n22, n23,
      n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36 : 
      std_logic;

begin
   
   end_np_line_state_reg : dfa11 port map( D => N15, CK => clk, R => rst, Q => 
                           end_np_line_out);
   in_np_state_reg : dfa11 port map( D => N18, CK => clk, R => rst, Q => 
                           in_np_out);
   U18 : no310 port map( A => n14, B => n15_port, C => n16, Y => N18);
   U19 : mu111 port map( A => n17, B => n18_port, S => pos_x_in(6), Y => n14);
   U20 : na310 port map( A => n19, B => n20, C => pos_x_in(5), Y => n18_port);
   U21 : iv110 port map( A => pos_x_in(7), Y => n20);
   U22 : na210 port map( A => n21, B => n22, Y => n19);
   U23 : na210 port map( A => pos_x_in(3), B => pos_x_in(2), Y => n22);
   U24 : iv110 port map( A => pos_x_in(4), Y => n21);
   U25 : iv110 port map( A => n23, Y => n17);
   U26 : no210 port map( A => n24, B => pos_x_in(2), Y => n23);
   U27 : no210 port map( A => n25, B => n26, Y => N15);
   U28 : na310 port map( A => pos_x_in(0), B => n27, C => pos_x_in(1), Y => n26
                           );
   U29 : iv110 port map( A => n16, Y => n27);
   U30 : na210 port map( A => n28, B => n29, Y => n16);
   U31 : na210 port map( A => pos_y_in(7), B => n30, Y => n29);
   U32 : iv110 port map( A => n31, Y => n30);
   U33 : no310 port map( A => pos_y_in(5), B => pos_y_in(6), C => pos_y_in(4), 
                           Y => n31);
   U34 : no210 port map( A => pos_y_in(9), B => pos_y_in(8), Y => n28);
   U35 : na310 port map( A => pos_x_in(6), B => pos_x_in(2), C => n32, Y => n25
                           );
   U36 : no210 port map( A => n15_port, B => n24, Y => n32);
   U37 : na310 port map( A => pos_x_in(7), B => n33, C => n34, Y => n24);
   U38 : no210 port map( A => pos_x_in(5), B => pos_x_in(4), Y => n34);
   U39 : iv110 port map( A => pos_x_in(3), Y => n33);
   U40 : no310 port map( A => pos_y_in(6), B => pos_y_in(7), C => n35, Y => 
                           n15_port);
   U41 : iv110 port map( A => n36, Y => n35);
   U42 : na210 port map( A => pos_y_in(5), B => pos_y_in(4), Y => n36);

end synthesised;



