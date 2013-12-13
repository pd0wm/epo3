
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of ram_fix is

   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component no310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component tinv10
      port( A, E : in std_logic;  Y : out std_logic);
   end component;
   
   signal n1, n4, n5, n6 : std_logic;

begin
   
   we_tri : tinv10 port map( A => n1, E => n4, Y => we);
   n1 <= '1';
   U6 : no310 port map( A => n5, B => clear_shift_start, C => check_start, Y =>
                           n4);
   U7 : iv110 port map( A => n6, Y => n5);
   U8 : no210 port map( A => draw_score_draw, B => draw_erase_start, Y => n6);

end synthesised;



