
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of cs_7bcws is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component no310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component na310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component mu111
      port( A, B, S : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component dfr11
      port( D, R, CK : in std_logic;  Q : out std_logic);
   end component;
   
   signal value_6_port, value_5_port, value_4_port, value_3_port, value_2_port,
      value_1_port, value_0_port, n24, n25, n26, n27, n28, n29, n30, n31, n32, 
      n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47
      , n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, 
      n62, n63, n64, n65, n66, n67, n68, n69, n70 : std_logic;

begin
   value <= ( value_6_port, value_5_port, value_4_port, value_3_port, 
      value_2_port, value_1_port, value_0_port );
   
   state_reg_0_inst : dfr11 port map( D => n30, R => rst, CK => clk, Q => 
                           value_0_port);
   state_reg_1_inst : dfr11 port map( D => n29, R => rst, CK => clk, Q => 
                           value_1_port);
   state_reg_2_inst : dfr11 port map( D => n28, R => rst, CK => clk, Q => 
                           value_2_port);
   state_reg_3_inst : dfr11 port map( D => n27, R => rst, CK => clk, Q => 
                           value_3_port);
   state_reg_4_inst : dfr11 port map( D => n26, R => rst, CK => clk, Q => 
                           value_4_port);
   state_reg_5_inst : dfr11 port map( D => n25, R => rst, CK => clk, Q => 
                           value_5_port);
   state_reg_6_inst : dfr11 port map( D => n24, R => rst, CK => clk, Q => 
                           value_6_port);
   U33 : na210 port map( A => n31, B => n32, Y => n30);
   U34 : na210 port map( A => data(0), B => n33, Y => n32);
   U35 : iv110 port map( A => n34, Y => n31);
   U36 : mu111 port map( A => n35, B => en, S => n36, Y => n34);
   U37 : na210 port map( A => n37, B => n38, Y => n29);
   U38 : na210 port map( A => data(1), B => n33, Y => n38);
   U39 : mu111 port map( A => n39, B => n40, S => value_1_port, Y => n37);
   U40 : na210 port map( A => en, B => n36, Y => n39);
   U41 : na310 port map( A => n41, B => n42, C => n43, Y => n28);
   U42 : na210 port map( A => value_2_port, B => n44, Y => n42);
   U43 : na210 port map( A => n40, B => n45, Y => n44);
   U44 : na210 port map( A => value_1_port, B => en, Y => n45);
   U45 : no210 port map( A => n35, B => n46, Y => n40);
   U46 : no210 port map( A => n47, B => n36, Y => n46);
   U47 : iv110 port map( A => value_0_port, Y => n36);
   U48 : na210 port map( A => data(2), B => n33, Y => n41);
   U49 : na210 port map( A => n48, B => n49, Y => n27);
   U50 : na210 port map( A => data(3), B => n33, Y => n49);
   U51 : mu111 port map( A => n43, B => n50, S => value_3_port, Y => n48);
   U52 : na210 port map( A => n51, B => en, Y => n43);
   U53 : na310 port map( A => n52, B => n53, C => n54, Y => n26);
   U54 : na210 port map( A => n55, B => en, Y => n54);
   U55 : na210 port map( A => value_4_port, B => n56, Y => n53);
   U56 : na210 port map( A => n50, B => n57, Y => n56);
   U57 : na210 port map( A => value_3_port, B => en, Y => n57);
   U58 : no210 port map( A => n35, B => n58, Y => n50);
   U59 : no210 port map( A => n47, B => n51, Y => n58);
   U60 : na210 port map( A => data(4), B => n33, Y => n52);
   U61 : na310 port map( A => n59, B => n60, C => n61, Y => n25);
   U62 : na210 port map( A => data(5), B => n33, Y => n61);
   U63 : na210 port map( A => value_5_port, B => n62, Y => n59);
   U64 : na210 port map( A => n63, B => n64, Y => n24);
   U65 : na210 port map( A => data(6), B => n33, Y => n64);
   U66 : no210 port map( A => n35, B => en, Y => n33);
   U67 : mu111 port map( A => n60, B => n65, S => value_6_port, Y => n63);
   U68 : no210 port map( A => n66, B => n62, Y => n65);
   U69 : iv110 port map( A => n67, Y => n62);
   U70 : no210 port map( A => n35, B => n68, Y => n67);
   U71 : no210 port map( A => n47, B => n55, Y => n68);
   U72 : no210 port map( A => set, B => en, Y => n35);
   U73 : no210 port map( A => n47, B => n69, Y => n66);
   U74 : iv110 port map( A => en, Y => n47);
   U75 : na310 port map( A => en, B => n69, C => n55, Y => n60);
   U76 : no310 port map( A => value_3_port, B => value_4_port, C => n70, Y => 
                           n55);
   U77 : iv110 port map( A => n51, Y => n70);
   U78 : no310 port map( A => value_1_port, B => value_2_port, C => 
                           value_0_port, Y => n51);
   U79 : iv110 port map( A => value_5_port, Y => n69);

end synthesised;



