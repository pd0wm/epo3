
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of vga_counter_2bit is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component ex210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component dfr11
      port( D, R, CK : in std_logic;  Q : out std_logic);
   end component;
   
   signal val_1_port, val_0_port, n4, n5, n6, n7, n8, n9 : std_logic;

begin
   val <= ( val_1_port, val_0_port );
   
   state_reg_0_inst : dfr11 port map( D => n5, R => n6, CK => clk, Q => 
                           val_0_port);
   state_reg_1_inst : dfr11 port map( D => n4, R => n6, CK => clk, Q => 
                           val_1_port);
   U9 : iv110 port map( A => n7, Y => n6);
   U10 : no210 port map( A => rst, B => rst_ext, Y => n7);
   U11 : ex210 port map( A => val_0_port, B => en, Y => n5);
   U12 : ex210 port map( A => n8, B => n9, Y => n4);
   U13 : na210 port map( A => val_0_port, B => en, Y => n9);
   U14 : iv110 port map( A => val_1_port, Y => n8);

end synthesised;



