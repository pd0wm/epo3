
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of tri_buff is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component tinv10
      port( A, E : in std_logic;  Y : out std_logic);
   end component;
   
   signal n1, n2, n3, n4, n5, n6, n7, n8 : std_logic;

begin
   
   outp_tri_0_inst : tinv10 port map( A => n8, E => sel, Y => outp(0));
   outp_tri_1_inst : tinv10 port map( A => n7, E => sel, Y => outp(1));
   outp_tri_2_inst : tinv10 port map( A => n6, E => sel, Y => outp(2));
   outp_tri_3_inst : tinv10 port map( A => n5, E => sel, Y => outp(3));
   outp_tri_4_inst : tinv10 port map( A => n4, E => sel, Y => outp(4));
   outp_tri_5_inst : tinv10 port map( A => n3, E => sel, Y => outp(5));
   outp_tri_6_inst : tinv10 port map( A => n2, E => sel, Y => outp(6));
   outp_tri_7_inst : tinv10 port map( A => n1, E => sel, Y => outp(7));
   U9 : iv110 port map( A => inp(0), Y => n8);
   U10 : iv110 port map( A => inp(1), Y => n7);
   U11 : iv110 port map( A => inp(2), Y => n6);
   U12 : iv110 port map( A => inp(3), Y => n5);
   U13 : iv110 port map( A => inp(4), Y => n4);
   U14 : iv110 port map( A => inp(5), Y => n3);
   U15 : iv110 port map( A => inp(6), Y => n2);
   U16 : iv110 port map( A => inp(7), Y => n1);

end synthesised;



