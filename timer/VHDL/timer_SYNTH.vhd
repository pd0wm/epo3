
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of timer is

   component mu111
      port( A, B, S : in std_logic;  Y : out std_logic);
   end component;
   
   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component ex210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
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
   
   component dfr11
      port( D, R, CK : in std_logic;  Q : out std_logic);
   end component;
   
   signal timer_done_port, clk_sig, state_0_port, count_7_port, count_6_port, 
      count_5_port, count_4_port, count_3_port, count_2_port, count_1_port, 
      count_0_port, new_count_7_port, new_count_6_port, new_count_5_port, 
      new_count_4_port, new_count_3_port, new_count_2_port, new_count_1_port, 
      new_count_0_port, new_state_1_port, new_state_0_port, n30, n31, n32, n33,
      n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48
      , n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, 
      n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77
      , n78, n79, n80, n81, n82, n83, n84, n85, n86 : std_logic;

begin
   timer_done <= timer_done_port;
   
   state_reg_0_inst : dfr11 port map( D => new_state_0_port, R => timer_rst, CK
                           => clk_sig, Q => state_0_port);
   count_reg_0_inst : dfr11 port map( D => new_count_0_port, R => timer_rst, CK
                           => clk_sig, Q => count_0_port);
   count_reg_7_inst : dfr11 port map( D => new_count_7_port, R => timer_rst, CK
                           => clk_sig, Q => count_7_port);
   state_reg_1_inst : dfr11 port map( D => new_state_1_port, R => timer_rst, CK
                           => clk_sig, Q => timer_done_port);
   count_reg_1_inst : dfr11 port map( D => new_count_1_port, R => timer_rst, CK
                           => clk_sig, Q => count_1_port);
   count_reg_2_inst : dfr11 port map( D => new_count_2_port, R => timer_rst, CK
                           => clk_sig, Q => count_2_port);
   count_reg_3_inst : dfr11 port map( D => new_count_3_port, R => timer_rst, CK
                           => clk_sig, Q => count_3_port);
   count_reg_4_inst : dfr11 port map( D => new_count_4_port, R => timer_rst, CK
                           => clk_sig, Q => count_4_port);
   count_reg_5_inst : dfr11 port map( D => new_count_5_port, R => timer_rst, CK
                           => clk_sig, Q => count_5_port);
   count_reg_6_inst : dfr11 port map( D => new_count_6_port, R => timer_rst, CK
                           => clk_sig, Q => count_6_port);
   U42 : na210 port map( A => n30, B => n31, Y => new_state_1_port);
   U43 : na210 port map( A => timer_done_port, B => n32, Y => n31);
   U44 : na210 port map( A => timer_start, B => state_0_port, Y => n32);
   U45 : na210 port map( A => n33, B => n34, Y => new_state_0_port);
   U46 : ex210 port map( A => timer_done_port, B => n35, Y => n33);
   U47 : na210 port map( A => n36, B => timer_start, Y => n35);
   U48 : iv110 port map( A => n37, Y => new_count_7_port);
   U49 : mu111 port map( A => n38, B => n39, S => count_7_port, Y => n37);
   U50 : no210 port map( A => n40, B => n41, Y => n39);
   U51 : no210 port map( A => n34, B => count_6_port, Y => n41);
   U52 : na210 port map( A => count_6_port, B => n42, Y => n38);
   U53 : mu111 port map( A => n42, B => n40, S => count_6_port, Y => 
                           new_count_6_port);
   U54 : iv110 port map( A => n43, Y => n40);
   U55 : no210 port map( A => n44, B => n45, Y => n43);
   U56 : no210 port map( A => n34, B => count_5_port, Y => n45);
   U57 : no310 port map( A => n46, B => n47, C => n34, Y => n42);
   U58 : mu111 port map( A => n48, B => n44, S => count_5_port, Y => 
                           new_count_5_port);
   U59 : na210 port map( A => n30, B => n49, Y => n44);
   U60 : na210 port map( A => n50, B => n46, Y => n49);
   U61 : no210 port map( A => n46, B => n34, Y => n48);
   U62 : iv110 port map( A => n51, Y => n46);
   U63 : no310 port map( A => n52, B => n53, C => n54, Y => n51);
   U64 : mu111 port map( A => n55, B => n56, S => n52, Y => new_count_4_port);
   U65 : no310 port map( A => n34, B => n53, C => n54, Y => n56);
   U66 : na210 port map( A => n57, B => n58, Y => n55);
   U67 : na210 port map( A => n50, B => n53, Y => n58);
   U68 : iv110 port map( A => n59, Y => n57);
   U69 : mu111 port map( A => n60, B => n59, S => count_3_port, Y => 
                           new_count_3_port);
   U70 : na210 port map( A => n30, B => n61, Y => n59);
   U71 : na210 port map( A => n50, B => n54, Y => n61);
   U72 : no210 port map( A => n54, B => n34, Y => n60);
   U73 : na310 port map( A => count_1_port, B => count_0_port, C => 
                           count_2_port, Y => n54);
   U74 : mu111 port map( A => n62, B => n63, S => n64, Y => new_count_2_port);
   U75 : no310 port map( A => n34, B => n65, C => n66, Y => n63);
   U76 : na210 port map( A => n67, B => n68, Y => n62);
   U77 : na210 port map( A => n50, B => n66, Y => n68);
   U78 : iv110 port map( A => count_1_port, Y => n66);
   U79 : iv110 port map( A => n69, Y => n67);
   U80 : mu111 port map( A => n70, B => n69, S => count_1_port, Y => 
                           new_count_1_port);
   U81 : na210 port map( A => n30, B => n71, Y => n69);
   U82 : na210 port map( A => n50, B => n65, Y => n71);
   U83 : iv110 port map( A => n72, Y => n30);
   U84 : no210 port map( A => n65, B => n34, Y => n70);
   U85 : iv110 port map( A => count_0_port, Y => n65);
   U86 : mu111 port map( A => n50, B => n72, S => count_0_port, Y => 
                           new_count_0_port);
   U87 : no310 port map( A => n36, B => timer_done_port, C => n73, Y => n72);
   U88 : iv110 port map( A => state_0_port, Y => n36);
   U89 : iv110 port map( A => n34, Y => n50);
   U90 : na310 port map( A => n73, B => n74, C => state_0_port, Y => n34);
   U91 : iv110 port map( A => timer_done_port, Y => n74);
   U92 : na210 port map( A => n75, B => n76, Y => n73);
   U93 : no310 port map( A => n77, B => n78, C => n79, Y => n76);
   U94 : ex210 port map( A => timer_time(1), B => count_1_port, Y => n79);
   U95 : ex210 port map( A => timer_time(0), B => count_0_port, Y => n78);
   U96 : na210 port map( A => n80, B => n81, Y => n77);
   U97 : ex210 port map( A => n64, B => timer_time(2), Y => n81);
   U98 : iv110 port map( A => count_2_port, Y => n64);
   U99 : ex210 port map( A => n53, B => timer_time(3), Y => n80);
   U100 : iv110 port map( A => count_3_port, Y => n53);
   U101 : no310 port map( A => n82, B => n83, C => n84, Y => n75);
   U102 : ex210 port map( A => timer_time(7), B => count_7_port, Y => n84);
   U103 : ex210 port map( A => timer_time(6), B => count_6_port, Y => n83);
   U104 : na210 port map( A => n85, B => n86, Y => n82);
   U105 : ex210 port map( A => n52, B => timer_time(4), Y => n86);
   U106 : iv110 port map( A => count_4_port, Y => n52);
   U107 : ex210 port map( A => n47, B => timer_time(5), Y => n85);
   U108 : iv110 port map( A => count_5_port, Y => n47);
   U109 : mu111 port map( A => timer_vga_clk, B => timer_clk, S => timer_rst, Y
                           => clk_sig);

end synthesised;



