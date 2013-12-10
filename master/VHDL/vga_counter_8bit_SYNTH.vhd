
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of vga_counter_8bit is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component na310
      port( A, B, C : in std_logic;  Y : out std_logic);
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
   
   component dfr11
      port( D, R, CK : in std_logic;  Q : out std_logic);
   end component;
   
   signal val_7_port, val_6_port, val_5_port, val_4_port, val_3_port, 
      val_2_port, val_1_port, val_0_port, n19, n20, n21, n22, n23, n24, n25, 
      n26, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41
      , n42 : std_logic;

begin
   val <= ( val_7_port, val_6_port, val_5_port, val_4_port, val_3_port, 
      val_2_port, val_1_port, val_0_port );
   
   state_reg_0_inst : dfr11 port map( D => n26, R => n42, CK => clk, Q => 
                           val_0_port);
   state_reg_1_inst : dfr11 port map( D => n25, R => n42, CK => clk, Q => 
                           val_1_port);
   state_reg_2_inst : dfr11 port map( D => n24, R => n42, CK => clk, Q => 
                           val_2_port);
   state_reg_3_inst : dfr11 port map( D => n23, R => n42, CK => clk, Q => 
                           val_3_port);
   state_reg_4_inst : dfr11 port map( D => n22, R => n42, CK => clk, Q => 
                           val_4_port);
   state_reg_5_inst : dfr11 port map( D => n21, R => n42, CK => clk, Q => 
                           val_5_port);
   state_reg_6_inst : dfr11 port map( D => n20, R => n42, CK => clk, Q => 
                           val_6_port);
   state_reg_7_inst : dfr11 port map( D => n19, R => n42, CK => clk, Q => 
                           val_7_port);
   U30 : iv110 port map( A => n28, Y => n42);
   U31 : no210 port map( A => rst, B => rst_ext, Y => n28);
   U32 : ex210 port map( A => val_0_port, B => en, Y => n26);
   U33 : ex210 port map( A => n29, B => n30, Y => n25);
   U34 : ex210 port map( A => val_2_port, B => n31, Y => n24);
   U35 : no210 port map( A => n29, B => n30, Y => n31);
   U36 : na210 port map( A => en, B => val_0_port, Y => n30);
   U37 : iv110 port map( A => val_1_port, Y => n29);
   U38 : ex210 port map( A => val_3_port, B => n32, Y => n23);
   U39 : iv110 port map( A => n33, Y => n22);
   U40 : ex210 port map( A => val_4_port, B => n34, Y => n33);
   U41 : na210 port map( A => n32, B => val_3_port, Y => n34);
   U42 : ex210 port map( A => val_5_port, B => n35, Y => n21);
   U43 : ex210 port map( A => n36, B => n37, Y => n20);
   U44 : ex210 port map( A => val_7_port, B => n38, Y => n19);
   U45 : no210 port map( A => n36, B => n37, Y => n38);
   U46 : na210 port map( A => n35, B => val_5_port, Y => n37);
   U47 : iv110 port map( A => n39, Y => n35);
   U48 : na310 port map( A => val_4_port, B => val_3_port, C => n32, Y => n39);
   U49 : no210 port map( A => n40, B => n41, Y => n32);
   U50 : na310 port map( A => val_1_port, B => val_0_port, C => val_2_port, Y 
                           => n41);
   U51 : iv110 port map( A => en, Y => n40);
   U52 : iv110 port map( A => val_6_port, Y => n36);

end synthesised;



