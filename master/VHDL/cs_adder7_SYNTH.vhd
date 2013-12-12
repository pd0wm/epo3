
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of cs_adder7 is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component ex210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   signal o_6_port, o_5_port, o_4_port, o_3_port, n5, n6, n7, n8 : std_logic;

begin
   o <= ( o_6_port, o_5_port, o_4_port, o_3_port, i(2), i(1), i(0) );
   
   U7 : ex210 port map( A => i(6), B => n5, Y => o_6_port);
   U8 : no210 port map( A => i(5), B => n6, Y => n5);
   U9 : ex210 port map( A => i(5), B => n7, Y => o_5_port);
   U10 : na210 port map( A => n6, B => n8, Y => o_4_port);
   U11 : na210 port map( A => i(4), B => i(3), Y => n8);
   U12 : iv110 port map( A => n7, Y => n6);
   U13 : no210 port map( A => i(4), B => i(3), Y => n7);
   U14 : iv110 port map( A => i(3), Y => o_3_port);

end synthesised;



