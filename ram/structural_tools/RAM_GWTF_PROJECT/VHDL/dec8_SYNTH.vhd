
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of dec8 is

   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component no310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   signal n15, n16, n17, n18, n19, n20, n21, n22 : std_logic;

begin
   
   U17 : no210 port map( A => s(0), B => n15, Y => do(6));
   U18 : no210 port map( A => n16, B => n17, Y => do(5));
   U19 : no210 port map( A => s(0), B => n16, Y => do(4));
   U20 : no210 port map( A => n17, B => n18, Y => do(3));
   U21 : no210 port map( A => s(0), B => n18, Y => do(2));
   U22 : no310 port map( A => n19, B => n20, C => n17, Y => do(1));
   U23 : no310 port map( A => n19, B => s(0), C => n20, Y => do(0));
   U24 : iv110 port map( A => n15, Y => n20);
   U25 : na210 port map( A => n16, B => n18, Y => n19);
   U26 : na210 port map( A => s(1), B => n21, Y => n18);
   U27 : iv110 port map( A => n22, Y => n16);
   U28 : no210 port map( A => n21, B => s(1), Y => n22);
   U29 : iv110 port map( A => s(2), Y => n21);
   U30 : no210 port map( A => n15, B => n17, Y => do(7));
   U31 : iv110 port map( A => s(0), Y => n17);
   U32 : na210 port map( A => s(2), B => s(1), Y => n15);

end synthesised;



