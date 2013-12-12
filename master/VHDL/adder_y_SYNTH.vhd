
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of adder_y is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component na310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component ex210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component no310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   signal n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33,
      n34, n35, n36, n37, n38, n39, n40, n41 : std_logic;

begin
   
   U22 : no310 port map( A => n20, B => n21, C => n22, Y => y_out(4));
   U23 : ex210 port map( A => n21, B => n23, Y => y_out(3));
   U24 : ex210 port map( A => n20, B => n22, Y => n23);
   U25 : na210 port map( A => y(2), B => n24, Y => n22);
   U26 : iv110 port map( A => y(3), Y => n20);
   U27 : na210 port map( A => n25, B => n26, Y => y_out(2));
   U28 : na210 port map( A => n27, B => n28, Y => n26);
   U29 : na210 port map( A => n29, B => n30, Y => n28);
   U30 : iv110 port map( A => n21, Y => n25);
   U31 : no310 port map( A => n31, B => n27, C => n32, Y => n21);
   U32 : na210 port map( A => n33, B => n30, Y => n32);
   U33 : iv110 port map( A => n34, Y => n33);
   U34 : ex210 port map( A => n24, B => y(2), Y => n27);
   U35 : na210 port map( A => n35, B => n36, Y => n24);
   U36 : na310 port map( A => rom_data(2), B => n37, C => y(0), Y => n36);
   U37 : na210 port map( A => rom_data(3), B => y(1), Y => n35);
   U38 : ex210 port map( A => n38, B => n30, Y => y_out(1));
   U39 : ex210 port map( A => n39, B => n37, Y => n30);
   U40 : ex210 port map( A => rom_data(3), B => y(1), Y => n37);
   U41 : na210 port map( A => y(0), B => rom_data(2), Y => n39);
   U42 : na210 port map( A => n38, B => n40, Y => y_out(0));
   U43 : na210 port map( A => n31, B => n34, Y => n40);
   U44 : iv110 port map( A => n29, Y => n38);
   U45 : no210 port map( A => n34, B => n31, Y => n29);
   U46 : ex210 port map( A => y(0), B => rom_data(2), Y => n31);
   U47 : na310 port map( A => rom_data(2), B => n41, C => next_piece, Y => n34)
                           ;
   U48 : iv110 port map( A => rom_data(3), Y => n41);

end synthesised;



