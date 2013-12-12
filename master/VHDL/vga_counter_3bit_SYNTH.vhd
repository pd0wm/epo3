
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of vga_counter_3bit is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component ex210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component dfr11
      port( D, R, CK : in std_logic;  Q : out std_logic);
   end component;
   
   signal val_2_port, val_1_port, val_0_port, n5, n6, n7, n8, n9, n10, n11, n12
      : std_logic;

begin
   val <= ( val_2_port, val_1_port, val_0_port );
   
   state_reg_0_inst : dfr11 port map( D => n7, R => n8, CK => clk, Q => 
                           val_0_port);
   state_reg_1_inst : dfr11 port map( D => n6, R => n8, CK => clk, Q => 
                           val_1_port);
   state_reg_2_inst : dfr11 port map( D => n5, R => n8, CK => clk, Q => 
                           val_2_port);
   U11 : iv110 port map( A => n9, Y => n8);
   U12 : no210 port map( A => rst, B => rst_ext, Y => n9);
   U13 : ex210 port map( A => val_0_port, B => en, Y => n7);
   U14 : ex210 port map( A => n10, B => n11, Y => n6);
   U15 : ex210 port map( A => val_2_port, B => n12, Y => n5);
   U16 : no210 port map( A => n10, B => n11, Y => n12);
   U17 : na210 port map( A => en, B => val_0_port, Y => n11);
   U18 : iv110 port map( A => val_1_port, Y => n10);

end synthesised;



