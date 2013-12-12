
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of vga_counter_10bit is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component na310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component no310
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
   
   signal val_9_port, val_8_port, val_7_port, val_6_port, val_5_port, 
      val_4_port, val_3_port, val_2_port, val_1_port, val_0_port, n23, n24, n25
      , n26, n27, n28, n29, n30, n31, n32, n34, n35, n36, n37, n38, n39, n40, 
      n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53 : 
      std_logic;

begin
   val <= ( val_9_port, val_8_port, val_7_port, val_6_port, val_5_port, 
      val_4_port, val_3_port, val_2_port, val_1_port, val_0_port );
   
   state_reg_0_inst : dfr11 port map( D => n32, R => n53, CK => clk, Q => 
                           val_0_port);
   state_reg_1_inst : dfr11 port map( D => n31, R => n53, CK => clk, Q => 
                           val_1_port);
   state_reg_2_inst : dfr11 port map( D => n30, R => n53, CK => clk, Q => 
                           val_2_port);
   state_reg_3_inst : dfr11 port map( D => n29, R => n53, CK => clk, Q => 
                           val_3_port);
   state_reg_4_inst : dfr11 port map( D => n28, R => n53, CK => clk, Q => 
                           val_4_port);
   state_reg_5_inst : dfr11 port map( D => n27, R => n53, CK => clk, Q => 
                           val_5_port);
   state_reg_6_inst : dfr11 port map( D => n26, R => n53, CK => clk, Q => 
                           val_6_port);
   state_reg_7_inst : dfr11 port map( D => n25, R => n53, CK => clk, Q => 
                           val_7_port);
   state_reg_8_inst : dfr11 port map( D => n24, R => n53, CK => clk, Q => 
                           val_8_port);
   state_reg_9_inst : dfr11 port map( D => n23, R => n53, CK => clk, Q => 
                           val_9_port);
   U36 : iv110 port map( A => n34, Y => n53);
   U37 : no210 port map( A => rst, B => rst_ext, Y => n34);
   U38 : ex210 port map( A => val_0_port, B => en, Y => n32);
   U39 : ex210 port map( A => n35, B => n36, Y => n31);
   U40 : ex210 port map( A => val_2_port, B => n37, Y => n30);
   U41 : no210 port map( A => n35, B => n36, Y => n37);
   U42 : na210 port map( A => en, B => val_0_port, Y => n36);
   U43 : iv110 port map( A => val_1_port, Y => n35);
   U44 : ex210 port map( A => val_3_port, B => n38, Y => n29);
   U45 : ex210 port map( A => n39, B => n40, Y => n28);
   U46 : na210 port map( A => n38, B => val_3_port, Y => n40);
   U47 : no210 port map( A => n41, B => n42, Y => n38);
   U48 : iv110 port map( A => val_4_port, Y => n39);
   U49 : ex210 port map( A => val_5_port, B => n43, Y => n27);
   U50 : iv110 port map( A => n44, Y => n26);
   U51 : ex210 port map( A => val_6_port, B => n45, Y => n44);
   U52 : na210 port map( A => val_5_port, B => n43, Y => n45);
   U53 : no210 port map( A => n46, B => n42, Y => n43);
   U54 : ex210 port map( A => val_7_port, B => n47, Y => n25);
   U55 : ex210 port map( A => n48, B => n49, Y => n24);
   U56 : ex210 port map( A => val_9_port, B => n50, Y => n23);
   U57 : no210 port map( A => n48, B => n49, Y => n50);
   U58 : na210 port map( A => n47, B => val_7_port, Y => n49);
   U59 : no310 port map( A => n46, B => n42, C => n51, Y => n47);
   U60 : na210 port map( A => val_5_port, B => val_6_port, Y => n51);
   U61 : iv110 port map( A => en, Y => n42);
   U62 : na310 port map( A => val_3_port, B => n52, C => val_4_port, Y => n46);
   U63 : iv110 port map( A => n41, Y => n52);
   U64 : na310 port map( A => val_1_port, B => val_0_port, C => val_2_port, Y 
                           => n41);
   U65 : iv110 port map( A => val_8_port, Y => n48);

end synthesised;



