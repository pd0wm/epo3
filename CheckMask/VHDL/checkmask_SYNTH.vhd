
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of checkmask is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component ex210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component tinv10
      port( A, E : in std_logic;  Y : out std_logic);
   end component;
   
   component dfr11
      port( D, R, CK : in std_logic;  Q : out std_logic);
   end component;
   
   signal state_1_port, state_0_port, next_state_1_port, next_state_0_port, n3,
      n4, n5, n6, n7, n8, n9, n10, ready_port, n12, n13 : std_logic;

begin
   ready <= ready_port;
   
   write <= '0';
   state_reg_0_inst : dfr11 port map( D => next_state_0_port, R => reset, CK =>
                           clk, Q => state_0_port);
   state_reg_1_inst : dfr11 port map( D => next_state_1_port, R => reset, CK =>
                           clk, Q => state_1_port);
   ram_out_tri_0_inst : tinv10 port map( A => n10, E => state_1_port, Y => 
                           ram_out(0));
   ram_out_tri_1_inst : tinv10 port map( A => n9, E => state_1_port, Y => 
                           ram_out(1));
   ram_out_tri_2_inst : tinv10 port map( A => n8, E => state_1_port, Y => 
                           ram_out(2));
   ram_out_tri_3_inst : tinv10 port map( A => n7, E => state_1_port, Y => 
                           ram_out(3));
   ram_out_tri_4_inst : tinv10 port map( A => n6, E => state_1_port, Y => 
                           ram_out(4));
   ram_out_tri_5_inst : tinv10 port map( A => n5, E => state_1_port, Y => 
                           ram_out(5));
   ram_out_tri_6_inst : tinv10 port map( A => n4, E => state_1_port, Y => 
                           ram_out(6));
   ram_out_tri_7_inst : tinv10 port map( A => n3, E => state_1_port, Y => 
                           ram_out(7));
   empty_tri : tinv10 port map( A => data, E => ready_port, Y => empty);
   U16 : iv110 port map( A => n12, Y => ready_port);
   U17 : na210 port map( A => state_0_port, B => state_1_port, Y => n12);
   U18 : ex210 port map( A => state_1_port, B => state_0_port, Y => 
                           next_state_1_port);
   U19 : no210 port map( A => state_0_port, B => n13, Y => next_state_0_port);
   U20 : no210 port map( A => start, B => state_1_port, Y => n13);
   U21 : iv110 port map( A => ram_in(1), Y => n9);
   U22 : iv110 port map( A => ram_in(2), Y => n8);
   U23 : iv110 port map( A => ram_in(3), Y => n7);
   U24 : iv110 port map( A => ram_in(4), Y => n6);
   U25 : iv110 port map( A => ram_in(5), Y => n5);
   U26 : iv110 port map( A => ram_in(6), Y => n4);
   U27 : iv110 port map( A => ram_in(7), Y => n3);
   U28 : iv110 port map( A => ram_in(0), Y => n10);

end synthesised;



