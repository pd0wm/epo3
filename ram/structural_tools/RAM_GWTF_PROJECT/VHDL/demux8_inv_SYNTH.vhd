
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of demux8_inv is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component ex210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component na310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component no310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   signal n22, n23, n24, n25, n26, n27, n28, n29, n30, n31 : std_logic;

begin
   
   U23 : na310 port map( A => di, B => s(2), C => n22, Y => do(7));
   U24 : no210 port map( A => n23, B => n24, Y => n22);
   U25 : na310 port map( A => s(1), B => n23, C => n25, Y => do(6));
   U26 : na310 port map( A => s(0), B => n26, C => n25, Y => do(5));
   U27 : na310 port map( A => n23, B => n26, C => n25, Y => do(4));
   U28 : no210 port map( A => n27, B => n28, Y => n25);
   U29 : na210 port map( A => n29, B => s(0), Y => do(3));
   U30 : na210 port map( A => n29, B => n23, Y => do(2));
   U31 : no310 port map( A => n26, B => s(2), C => n27, Y => n29);
   U32 : iv110 port map( A => s(1), Y => n26);
   U33 : na310 port map( A => di, B => s(0), C => n30, Y => do(1));
   U34 : no210 port map( A => s(2), B => s(1), Y => n30);
   U35 : na310 port map( A => n23, B => n28, C => n31, Y => do(0));
   U36 : no210 port map( A => n27, B => n24, Y => n31);
   U37 : ex210 port map( A => s(1), B => s(0), Y => n24);
   U38 : iv110 port map( A => di, Y => n27);
   U39 : iv110 port map( A => s(2), Y => n28);
   U40 : iv110 port map( A => s(0), Y => n23);

end synthesised;



