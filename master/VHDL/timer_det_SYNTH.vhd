
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of timer_det is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
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
   
   signal n11, n12, n13, n14, n15, n16, n17 : std_logic;

begin
   
   U12 : no210 port map( A => n11, B => n12, Y => done);
   U13 : mu111 port map( A => n13, B => n14, S => time, Y => n12);
   U14 : na310 port map( A => cnt_val(4), B => cnt_val(3), C => n15, Y => n14);
   U15 : no210 port map( A => cnt_val(0), B => n16, Y => n15);
   U16 : na310 port map( A => cnt_val(0), B => n16, C => n17, Y => n13);
   U17 : no210 port map( A => cnt_val(4), B => cnt_val(3), Y => n17);
   U18 : iv110 port map( A => cnt_val(2), Y => n16);
   U19 : iv110 port map( A => cnt_val(1), Y => n11);

end synthesised;



