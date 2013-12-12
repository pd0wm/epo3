
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of cs_tri8 is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component tinv10
      port( A, E : in std_logic;  Y : out std_logic);
   end component;
   
   signal n1, n2, n3, n4, n5, n6, n7, n8 : std_logic;

begin
   
   o_tri_0_inst : tinv10 port map( A => n8, E => e, Y => o(0));
   o_tri_1_inst : tinv10 port map( A => n7, E => e, Y => o(1));
   o_tri_2_inst : tinv10 port map( A => n6, E => e, Y => o(2));
   o_tri_3_inst : tinv10 port map( A => n5, E => e, Y => o(3));
   o_tri_4_inst : tinv10 port map( A => n4, E => e, Y => o(4));
   o_tri_5_inst : tinv10 port map( A => n3, E => e, Y => o(5));
   o_tri_6_inst : tinv10 port map( A => n2, E => e, Y => o(6));
   o_tri_7_inst : tinv10 port map( A => n1, E => e, Y => o(7));
   U9 : iv110 port map( A => i(0), Y => n8);
   U10 : iv110 port map( A => i(1), Y => n7);
   U11 : iv110 port map( A => i(2), Y => n6);
   U12 : iv110 port map( A => i(3), Y => n5);
   U13 : iv110 port map( A => i(4), Y => n4);
   U14 : iv110 port map( A => i(5), Y => n3);
   U15 : iv110 port map( A => i(6), Y => n2);
   U16 : iv110 port map( A => i(7), Y => n1);

end synthesised;



