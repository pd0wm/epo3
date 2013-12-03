
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of log is

   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   signal log_out_5_port, log_out_3_port, log_out_0_port, log_out_1_port, 
      log_out_2_port, log_out_4_port, log_out_6_port, n13, n14, n15, n16, n17, 
      n18, n19 : std_logic;

begin
   log_out <= ( log_in(7), log_out_6_port, log_out_5_port, log_out_4_port, 
      log_out_3_port, log_out_2_port, log_out_1_port, log_out_0_port );
   
   U16 : iv110 port map( A => n13, Y => log_out_6_port);
   U17 : iv110 port map( A => n14, Y => log_out_4_port);
   U18 : iv110 port map( A => n15, Y => log_out_0_port);
   U19 : no210 port map( A => log_in(0), B => log_out_1_port, Y => n15);
   U20 : iv110 port map( A => n16, Y => log_out_1_port);
   U21 : no210 port map( A => log_out_2_port, B => log_in(1), Y => n16);
   U22 : iv110 port map( A => n17, Y => log_out_2_port);
   U23 : no210 port map( A => log_in(2), B => log_out_3_port, Y => n17);
   U24 : na210 port map( A => n14, B => n18, Y => log_out_3_port);
   U25 : iv110 port map( A => log_in(3), Y => n18);
   U26 : no210 port map( A => log_in(4), B => log_out_5_port, Y => n14);
   U27 : na210 port map( A => n13, B => n19, Y => log_out_5_port);
   U28 : iv110 port map( A => log_in(5), Y => n19);
   U29 : no210 port map( A => log_in(6), B => log_in(7), Y => n13);

end synthesised;



