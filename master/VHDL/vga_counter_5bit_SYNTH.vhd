
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of vga_counter_5bit is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component na310
      port( A, B, C : in std_logic;  Y : out std_logic);
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
   
   signal val_4_port, val_3_port, val_2_port, val_1_port, val_0_port, n13, n14,
      n15, n16, n17, n19, n20, n21, n22, n23, n24, n25, n26, n27 : std_logic;

begin
   val <= ( val_4_port, val_3_port, val_2_port, val_1_port, val_0_port );
   
   state_reg_0_inst : dfr11 port map( D => n17, R => n27, CK => clk, Q => 
                           val_0_port);
   state_reg_1_inst : dfr11 port map( D => n16, R => n27, CK => clk, Q => 
                           val_1_port);
   state_reg_2_inst : dfr11 port map( D => n15, R => n27, CK => clk, Q => 
                           val_2_port);
   state_reg_3_inst : dfr11 port map( D => n14, R => n27, CK => clk, Q => 
                           val_3_port);
   state_reg_4_inst : dfr11 port map( D => n13, R => n27, CK => clk, Q => 
                           val_4_port);
   U21 : iv110 port map( A => n19, Y => n27);
   U22 : no210 port map( A => rst, B => rst_ext, Y => n19);
   U23 : ex210 port map( A => val_0_port, B => en, Y => n17);
   U24 : ex210 port map( A => n20, B => n21, Y => n16);
   U25 : ex210 port map( A => val_2_port, B => n22, Y => n15);
   U26 : no210 port map( A => n20, B => n21, Y => n22);
   U27 : iv110 port map( A => val_1_port, Y => n20);
   U28 : ex210 port map( A => n23, B => n24, Y => n14);
   U29 : ex210 port map( A => val_4_port, B => n25, Y => n13);
   U30 : no210 port map( A => n23, B => n24, Y => n25);
   U31 : na310 port map( A => val_2_port, B => val_1_port, C => n26, Y => n24);
   U32 : iv110 port map( A => n21, Y => n26);
   U33 : na210 port map( A => val_0_port, B => en, Y => n21);
   U34 : iv110 port map( A => val_3_port, Y => n23);

end synthesised;



