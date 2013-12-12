
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of vga_counter_8bitset is

   component na310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component no310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component mu111
      port( A, B, S : in std_logic;  Y : out std_logic);
   end component;
   
   component dfr11
      port( D, R, CK : in std_logic;  Q : out std_logic);
   end component;
   
   signal val_7_port, val_6_port, val_5_port, val_4_port, val_3_port, 
      val_2_port, val_1_port, val_0_port, n29, n30, n31, n32, n33, n34, n35, 
      n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50
      , n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, 
      n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79
      , n80, n81, n82, n83, n84, n85, n86, n87 : std_logic;

begin
   val <= ( val_7_port, val_6_port, val_5_port, val_4_port, val_3_port, 
      val_2_port, val_1_port, val_0_port );
   
   state_reg_0_inst : dfr11 port map( D => n36, R => n87, CK => clk, Q => 
                           val_0_port);
   state_reg_1_inst : dfr11 port map( D => n35, R => n87, CK => clk, Q => 
                           val_1_port);
   state_reg_2_inst : dfr11 port map( D => n34, R => n87, CK => clk, Q => 
                           val_2_port);
   state_reg_3_inst : dfr11 port map( D => n33, R => n87, CK => clk, Q => 
                           val_3_port);
   state_reg_4_inst : dfr11 port map( D => n32, R => n87, CK => clk, Q => 
                           val_4_port);
   state_reg_5_inst : dfr11 port map( D => n31, R => n87, CK => clk, Q => 
                           val_5_port);
   state_reg_6_inst : dfr11 port map( D => n30, R => n87, CK => clk, Q => 
                           val_6_port);
   state_reg_7_inst : dfr11 port map( D => n29, R => n87, CK => clk, Q => 
                           val_7_port);
   U39 : iv110 port map( A => n37, Y => n87);
   U40 : no210 port map( A => rst, B => rst_ext, Y => n37);
   U41 : na210 port map( A => n38, B => n39, Y => n36);
   U42 : na210 port map( A => set, B => di(0), Y => n39);
   U43 : mu111 port map( A => n40, B => n41, S => val_0_port, Y => n38);
   U44 : na210 port map( A => n42, B => n43, Y => n35);
   U45 : na210 port map( A => di(1), B => set, Y => n43);
   U46 : mu111 port map( A => n44, B => n45, S => val_1_port, Y => n42);
   U47 : na210 port map( A => n46, B => val_0_port, Y => n44);
   U48 : na210 port map( A => n47, B => n48, Y => n34);
   U49 : na210 port map( A => di(2), B => set, Y => n48);
   U50 : mu111 port map( A => n49, B => n50, S => val_2_port, Y => n47);
   U51 : no210 port map( A => n51, B => n52, Y => n50);
   U52 : iv110 port map( A => n45, Y => n52);
   U53 : no210 port map( A => n53, B => n54, Y => n45);
   U54 : no210 port map( A => n40, B => val_0_port, Y => n54);
   U55 : no210 port map( A => val_1_port, B => n40, Y => n51);
   U56 : na310 port map( A => n46, B => val_0_port, C => val_1_port, Y => n49);
   U57 : na210 port map( A => n55, B => n56, Y => n33);
   U58 : na210 port map( A => di(3), B => set, Y => n56);
   U59 : mu111 port map( A => n57, B => n58, S => val_3_port, Y => n55);
   U60 : iv110 port map( A => n59, Y => n58);
   U61 : na210 port map( A => n60, B => n46, Y => n57);
   U62 : na210 port map( A => n61, B => n62, Y => n32);
   U63 : na210 port map( A => di(4), B => set, Y => n62);
   U64 : mu111 port map( A => n63, B => n64, S => val_4_port, Y => n61);
   U65 : no210 port map( A => n65, B => n59, Y => n64);
   U66 : na210 port map( A => n41, B => n66, Y => n59);
   U67 : na210 port map( A => n46, B => n67, Y => n66);
   U68 : iv110 port map( A => n53, Y => n41);
   U69 : no210 port map( A => val_3_port, B => n40, Y => n65);
   U70 : na310 port map( A => n60, B => n46, C => val_3_port, Y => n63);
   U71 : na210 port map( A => n68, B => n69, Y => n31);
   U72 : na210 port map( A => di(5), B => set, Y => n69);
   U73 : mu111 port map( A => n70, B => n71, S => n72, Y => n68);
   U74 : na210 port map( A => n73, B => n46, Y => n71);
   U75 : na210 port map( A => n74, B => n75, Y => n30);
   U76 : na210 port map( A => di(6), B => set, Y => n75);
   U77 : iv110 port map( A => n76, Y => n74);
   U78 : mu111 port map( A => n77, B => n78, S => val_6_port, Y => n76);
   U79 : na210 port map( A => n79, B => n80, Y => n29);
   U80 : na210 port map( A => di(7), B => set, Y => n80);
   U81 : mu111 port map( A => n81, B => n82, S => val_7_port, Y => n79);
   U82 : no210 port map( A => n83, B => n78, Y => n82);
   U83 : na210 port map( A => n70, B => n84, Y => n78);
   U84 : na210 port map( A => n46, B => n72, Y => n84);
   U85 : no210 port map( A => n53, B => n85, Y => n70);
   U86 : no210 port map( A => n40, B => n73, Y => n85);
   U87 : iv110 port map( A => n86, Y => n73);
   U88 : no210 port map( A => val_6_port, B => n40, Y => n83);
   U89 : na210 port map( A => n77, B => val_6_port, Y => n81);
   U90 : no310 port map( A => n86, B => n40, C => n72, Y => n77);
   U91 : iv110 port map( A => val_5_port, Y => n72);
   U92 : iv110 port map( A => n46, Y => n40);
   U93 : no210 port map( A => n53, B => set, Y => n46);
   U94 : no210 port map( A => set, B => en, Y => n53);
   U95 : na310 port map( A => val_3_port, B => n60, C => val_4_port, Y => n86);
   U96 : iv110 port map( A => n67, Y => n60);
   U97 : na310 port map( A => val_1_port, B => val_0_port, C => val_2_port, Y 
                           => n67);

end synthesised;



