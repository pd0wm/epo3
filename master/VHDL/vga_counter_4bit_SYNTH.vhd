
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of vga_counter_4bit is

   component ex210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component na310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component dfr11
      port( D, R, CK : in std_logic;  Q : out std_logic);
   end component;
   
   signal val_3_port, val_2_port, val_1_port, val_0_port, n7, n8, n9, n10, n11,
      n12, n13, n14, n15, n16, n17 : std_logic;

begin
   val <= ( val_3_port, val_2_port, val_1_port, val_0_port );
   
   state_reg_0_inst : dfr11 port map( D => n10, R => n11, CK => clk, Q => 
                           val_0_port);
   state_reg_1_inst : dfr11 port map( D => n9, R => n11, CK => clk, Q => 
                           val_1_port);
   state_reg_2_inst : dfr11 port map( D => n8, R => n11, CK => clk, Q => 
                           val_2_port);
   state_reg_3_inst : dfr11 port map( D => n7, R => n11, CK => clk, Q => 
                           val_3_port);
   U14 : ex210 port map( A => n12, B => n13, Y => n9);
   U15 : na210 port map( A => val_0_port, B => en, Y => n13);
   U16 : iv110 port map( A => val_1_port, Y => n12);
   U17 : ex210 port map( A => n14, B => n15, Y => n8);
   U18 : ex210 port map( A => val_3_port, B => n16, Y => n7);
   U19 : no210 port map( A => n14, B => n15, Y => n16);
   U20 : na310 port map( A => val_0_port, B => en, C => val_1_port, Y => n15);
   U21 : iv110 port map( A => val_2_port, Y => n14);
   U22 : iv110 port map( A => n17, Y => n11);
   U23 : no210 port map( A => rst, B => rst_ext, Y => n17);
   U24 : ex210 port map( A => val_0_port, B => en, Y => n10);

end synthesised;



