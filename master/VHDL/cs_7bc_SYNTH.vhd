
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of cs_7bc is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
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
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component dfr11
      port( D, R, CK : in std_logic;  Q : out std_logic);
   end component;
   
   signal value_6_port, value_5_port, value_4_port, value_3_port, value_2_port,
      value_1_port, value_0_port, n16, n17, n18, n19, n20, n21, n22, n23, n24, 
      n25, n26, n27, n28, n29, n30, n31, n32, n33 : std_logic;

begin
   value <= ( value_6_port, value_5_port, value_4_port, value_3_port, 
      value_2_port, value_1_port, value_0_port );
   
   state_reg_0_inst : dfr11 port map( D => n22, R => rst, CK => clk, Q => 
                           value_0_port);
   state_reg_1_inst : dfr11 port map( D => n21, R => rst, CK => clk, Q => 
                           value_1_port);
   state_reg_2_inst : dfr11 port map( D => n20, R => rst, CK => clk, Q => 
                           value_2_port);
   state_reg_3_inst : dfr11 port map( D => n19, R => rst, CK => clk, Q => 
                           value_3_port);
   state_reg_4_inst : dfr11 port map( D => n18, R => rst, CK => clk, Q => 
                           value_4_port);
   state_reg_5_inst : dfr11 port map( D => n17, R => rst, CK => clk, Q => 
                           value_5_port);
   state_reg_6_inst : dfr11 port map( D => n16, R => rst, CK => clk, Q => 
                           value_6_port);
   U25 : ex210 port map( A => value_0_port, B => en, Y => n22);
   U26 : ex210 port map( A => n23, B => n24, Y => n21);
   U27 : ex210 port map( A => value_2_port, B => n25, Y => n20);
   U28 : no210 port map( A => n23, B => n24, Y => n25);
   U29 : na210 port map( A => en, B => value_0_port, Y => n24);
   U30 : iv110 port map( A => value_1_port, Y => n23);
   U31 : ex210 port map( A => value_3_port, B => n26, Y => n19);
   U32 : iv110 port map( A => n27, Y => n18);
   U33 : ex210 port map( A => value_4_port, B => n28, Y => n27);
   U34 : na210 port map( A => n26, B => value_3_port, Y => n28);
   U35 : ex210 port map( A => n29, B => n30, Y => n17);
   U36 : ex210 port map( A => value_6_port, B => n31, Y => n16);
   U37 : no210 port map( A => n29, B => n30, Y => n31);
   U38 : na310 port map( A => value_4_port, B => value_3_port, C => n26, Y => 
                           n30);
   U39 : no210 port map( A => n32, B => n33, Y => n26);
   U40 : na310 port map( A => value_1_port, B => value_0_port, C => 
                           value_2_port, Y => n33);
   U41 : iv110 port map( A => en, Y => n32);
   U42 : iv110 port map( A => value_5_port, Y => n29);

end synthesised;



