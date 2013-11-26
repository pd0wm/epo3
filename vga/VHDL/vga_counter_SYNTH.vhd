
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of vga_counter is

   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component iv110
      port( A : in std_logic;  Y : out std_logic);
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
   
   component ex210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component no310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component dfa11
      port( D, CK, R : in std_logic;  Q : out std_logic);
   end component;
   
   signal pos_x_out_7_port, pos_x_out_6_port, pos_x_out_5_port, 
      pos_x_out_4_port, pos_x_out_3_port, pos_x_out_2_port, pos_x_out_1_port, 
      pos_x_out_0_port, pos_y_out_8_port, pos_y_out_7_port, pos_y_out_6_port, 
      pos_y_out_5_port, pos_y_out_4_port, pos_y_out_3_port, pos_y_out_2_port, 
      pos_y_out_1_port, pos_y_out_0_port, pos_x_next_7_port, pos_x_next_6_port,
      pos_x_next_5_port, pos_x_next_4_port, pos_x_next_3_port, 
      pos_x_next_2_port, pos_x_next_1_port, pos_x_next_0_port, 
      pos_y_next_8_port, pos_y_next_7_port, pos_y_next_6_port, 
      pos_y_next_5_port, pos_y_next_4_port, pos_y_next_3_port, 
      pos_y_next_2_port, pos_y_next_1_port, pos_y_next_0_port, n61, n62, n63, 
      n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78
      , n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, 
      n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, 
      n106, n107, n108, n109, n110, n111, n112 : std_logic;

begin
   pos_x_out <= ( pos_x_out_7_port, pos_x_out_6_port, pos_x_out_5_port, 
      pos_x_out_4_port, pos_x_out_3_port, pos_x_out_2_port, pos_x_out_1_port, 
      pos_x_out_0_port );
   pos_y_out <= ( pos_y_out_8_port, pos_y_out_7_port, pos_y_out_6_port, 
      pos_y_out_5_port, pos_y_out_4_port, pos_y_out_3_port, pos_y_out_2_port, 
      pos_y_out_1_port, pos_y_out_0_port );
   
   pos_x_reg_0_inst : dfa11 port map( D => pos_x_next_0_port, CK => clk, R => 
                           rst, Q => pos_x_out_0_port);
   pos_x_reg_7_inst : dfa11 port map( D => pos_x_next_7_port, CK => clk, R => 
                           rst, Q => pos_x_out_7_port);
   pos_x_reg_6_inst : dfa11 port map( D => pos_x_next_6_port, CK => clk, R => 
                           rst, Q => pos_x_out_6_port);
   pos_x_reg_5_inst : dfa11 port map( D => pos_x_next_5_port, CK => clk, R => 
                           rst, Q => pos_x_out_5_port);
   pos_x_reg_4_inst : dfa11 port map( D => pos_x_next_4_port, CK => clk, R => 
                           rst, Q => pos_x_out_4_port);
   pos_x_reg_3_inst : dfa11 port map( D => pos_x_next_3_port, CK => clk, R => 
                           rst, Q => pos_x_out_3_port);
   pos_x_reg_2_inst : dfa11 port map( D => pos_x_next_2_port, CK => clk, R => 
                           rst, Q => pos_x_out_2_port);
   pos_x_reg_1_inst : dfa11 port map( D => pos_x_next_1_port, CK => clk, R => 
                           rst, Q => pos_x_out_1_port);
   pos_y_reg_0_inst : dfa11 port map( D => pos_y_next_0_port, CK => clk, R => 
                           rst, Q => pos_y_out_0_port);
   pos_y_reg_1_inst : dfa11 port map( D => pos_y_next_1_port, CK => clk, R => 
                           rst, Q => pos_y_out_1_port);
   pos_y_reg_2_inst : dfa11 port map( D => pos_y_next_2_port, CK => clk, R => 
                           rst, Q => pos_y_out_2_port);
   pos_y_reg_3_inst : dfa11 port map( D => pos_y_next_3_port, CK => clk, R => 
                           rst, Q => pos_y_out_3_port);
   pos_y_reg_4_inst : dfa11 port map( D => pos_y_next_4_port, CK => clk, R => 
                           rst, Q => pos_y_out_4_port);
   pos_y_reg_5_inst : dfa11 port map( D => pos_y_next_5_port, CK => clk, R => 
                           rst, Q => pos_y_out_5_port);
   pos_y_reg_6_inst : dfa11 port map( D => pos_y_next_6_port, CK => clk, R => 
                           rst, Q => pos_y_out_6_port);
   pos_y_reg_7_inst : dfa11 port map( D => pos_y_next_7_port, CK => clk, R => 
                           rst, Q => pos_y_out_7_port);
   pos_y_reg_8_inst : dfa11 port map( D => pos_y_next_8_port, CK => clk, R => 
                           rst, Q => pos_y_out_8_port);
   U79 : iv110 port map( A => n66, Y => n61);
   U80 : iv110 port map( A => n62, Y => pos_y_next_8_port);
   U81 : ex210 port map( A => pos_y_out_8_port, B => n63, Y => n62);
   U82 : na310 port map( A => n64, B => n65, C => n66, Y => n63);
   U83 : mu111 port map( A => n67, B => pos_y_out_7_port, S => n61, Y => 
                           pos_y_next_7_port);
   U84 : mu111 port map( A => n69, B => pos_y_out_6_port, S => n61, Y => 
                           pos_y_next_6_port);
   U85 : iv110 port map( A => n70, Y => n69);
   U86 : mu111 port map( A => n71, B => pos_y_out_5_port, S => n61, Y => 
                           pos_y_next_5_port);
   U87 : iv110 port map( A => n72, Y => pos_y_next_4_port);
   U88 : mu111 port map( A => n73, B => n74, S => n61, Y => n72);
   U89 : mu111 port map( A => n75, B => pos_y_out_3_port, S => n68, Y => 
                           pos_y_next_3_port);
   U90 : mu111 port map( A => n76, B => pos_y_out_2_port, S => n68, Y => 
                           pos_y_next_2_port);
   U91 : iv110 port map( A => n77, Y => n76);
   U92 : mu111 port map( A => n78, B => pos_y_out_1_port, S => n68, Y => 
                           pos_y_next_1_port);
   U93 : ex210 port map( A => n79, B => n80, Y => n78);
   U94 : mu111 port map( A => n81, B => pos_y_out_0_port, S => n68, Y => 
                           pos_y_next_0_port);
   U95 : no210 port map( A => n66, B => n82, Y => pos_x_next_7_port);
   U96 : iv110 port map( A => n67, Y => n82);
   U97 : ex210 port map( A => n64, B => n65, Y => n67);
   U98 : mu111 port map( A => pos_y_out_7_port, B => pos_x_out_7_port, S => n68
                           , Y => n65);
   U99 : no210 port map( A => n66, B => n70, Y => pos_x_next_6_port);
   U100 : na210 port map( A => n83, B => n84, Y => n70);
   U101 : na210 port map( A => n85, B => n86, Y => n84);
   U102 : iv110 port map( A => n64, Y => n83);
   U103 : no210 port map( A => n86, B => n85, Y => n64);
   U104 : iv110 port map( A => n87, Y => n85);
   U105 : mu111 port map( A => pos_y_out_6_port, B => pos_x_out_6_port, S => 
                           n68, Y => n87);
   U106 : na210 port map( A => n88, B => n89, Y => n86);
   U107 : no210 port map( A => n66, B => n90, Y => pos_x_next_5_port);
   U108 : iv110 port map( A => n71, Y => n90);
   U109 : ex210 port map( A => n88, B => n89, Y => n71);
   U110 : na210 port map( A => n91, B => n92, Y => n89);
   U111 : na210 port map( A => pos_y_out_5_port, B => n66, Y => n92);
   U112 : iv110 port map( A => pos_x_out_5_port, Y => n91);
   U113 : no310 port map( A => n93, B => n94, C => n95, Y => n88);
   U114 : no210 port map( A => n66, B => n73, Y => pos_x_next_4_port);
   U115 : ex210 port map( A => n96, B => n93, Y => n73);
   U116 : no210 port map( A => pos_x_out_4_port, B => n97, Y => n93);
   U117 : no210 port map( A => n74, B => n61, Y => n97);
   U118 : iv110 port map( A => pos_y_out_4_port, Y => n74);
   U119 : no210 port map( A => n95, B => n94, Y => n96);
   U120 : iv110 port map( A => n98, Y => pos_x_next_3_port);
   U121 : na210 port map( A => n61, B => n75, Y => n98);
   U122 : ex210 port map( A => n95, B => n94, Y => n75);
   U123 : no210 port map( A => pos_x_out_3_port, B => n99, Y => n94);
   U124 : no210 port map( A => n100, B => n61, Y => n99);
   U125 : iv110 port map( A => pos_y_out_3_port, Y => n100);
   U126 : no210 port map( A => n66, B => n77, Y => pos_x_next_2_port);
   U127 : na210 port map( A => n95, B => n101, Y => n77);
   U128 : iv110 port map( A => n102, Y => n101);
   U129 : no210 port map( A => n103, B => n104, Y => n102);
   U130 : na210 port map( A => n104, B => n103, Y => n95);
   U131 : mu111 port map( A => pos_y_out_2_port, B => pos_x_out_2_port, S => 
                           n68, Y => n103);
   U132 : no210 port map( A => n81, B => n105, Y => n104);
   U133 : iv110 port map( A => n79, Y => n105);
   U134 : mu111 port map( A => n106, B => pos_x_next_0_port, S => n79, Y => 
                           pos_x_next_1_port);
   U135 : mu111 port map( A => pos_x_out_1_port, B => pos_y_out_1_port, S => 
                           n66, Y => n79);
   U136 : no210 port map( A => n66, B => n81, Y => n106);
   U137 : iv110 port map( A => n80, Y => n81);
   U138 : no210 port map( A => n80, B => n66, Y => pos_x_next_0_port);
   U139 : mu111 port map( A => pos_y_out_0_port, B => pos_x_out_0_port, S => 
                           n68, Y => n80);
   U140 : iv110 port map( A => n66, Y => n68);
   U141 : no210 port map( A => n107, B => n108, Y => n66);
   U142 : na310 port map( A => n109, B => n110, C => pos_x_out_0_port, Y => 
                           n108);
   U143 : iv110 port map( A => pos_x_out_3_port, Y => n110);
   U144 : no210 port map( A => pos_x_out_4_port, B => pos_x_out_5_port, Y => 
                           n109);
   U145 : na310 port map( A => n111, B => pos_x_out_6_port, C => 
                           pos_x_out_7_port, Y => n107);
   U146 : iv110 port map( A => n112, Y => n111);
   U147 : na210 port map( A => pos_x_out_2_port, B => pos_x_out_1_port, Y => 
                           n112);

end synthesised;



