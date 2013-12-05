
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of demux5 is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component no310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   signal n6, n7, n8, n9, n10 : std_logic;

begin
   
   U12 : no210 port map( A => n6, B => n7, Y => do(4));
   U13 : iv110 port map( A => di, Y => n6);
   U14 : no310 port map( A => n8, B => n9, C => n10, Y => do(3));
   U15 : no310 port map( A => n8, B => s(0), C => n9, Y => do(2));
   U16 : iv110 port map( A => s(1), Y => n8);
   U17 : no310 port map( A => n10, B => s(1), C => n9, Y => do(1));
   U18 : iv110 port map( A => s(0), Y => n10);
   U19 : no310 port map( A => n9, B => s(1), C => s(0), Y => do(0));
   U20 : na210 port map( A => di, B => n7, Y => n9);
   U21 : iv110 port map( A => s(2), Y => n7);

end synthesised;



