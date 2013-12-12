
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of timer is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component na310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component no310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component mu111
      port( A, B, S : in std_logic;  Y : out std_logic);
   end component;
   
   component dfn10
      port( D, CK : in std_logic;  Q : out std_logic);
   end component;
   
   component dfr11
      port( D, R, CK : in std_logic;  Q : out std_logic);
   end component;
   
   signal ready_port, state_2_port, state_1_port, state_0_port, 
      cur_count_7_port, cur_count_6_port, cur_count_5_port, cur_count_4_port, 
      cur_count_3_port, cur_count_2_port, cur_count_1_port, cur_count_0_port, 
      next_state_2_port, next_state_1_port, next_state_0_port, n56, n57, n58, 
      n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73
      , n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, 
      n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, 
      n102, n103, n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, 
      n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125, 
      n126, n127, n128, n129, n130, n131, n132, n133, n134, n135 : std_logic;

begin
   ready <= ready_port;
   
   state_reg_0_inst : dfr11 port map( D => next_state_0_port, R => n135, CK => 
                           clk, Q => state_0_port);
   state_reg_2_inst : dfr11 port map( D => next_state_2_port, R => n135, CK => 
                           clk, Q => state_2_port);
   state_reg_1_inst : dfr11 port map( D => next_state_1_port, R => n135, CK => 
                           clk, Q => state_1_port);
   cur_count_reg_7_inst : dfn10 port map( D => n64, CK => clk, Q => 
                           cur_count_7_port);
   cur_count_reg_0_inst : dfn10 port map( D => n57, CK => clk, Q => 
                           cur_count_0_port);
   cur_count_reg_1_inst : dfn10 port map( D => n58, CK => clk, Q => 
                           cur_count_1_port);
   cur_count_reg_2_inst : dfn10 port map( D => n59, CK => clk, Q => 
                           cur_count_2_port);
   cur_count_reg_3_inst : dfn10 port map( D => n60, CK => clk, Q => 
                           cur_count_3_port);
   cur_count_reg_4_inst : dfn10 port map( D => n61, CK => clk, Q => 
                           cur_count_4_port);
   cur_count_reg_5_inst : dfn10 port map( D => n62, CK => clk, Q => 
                           cur_count_5_port);
   cur_count_reg_6_inst : dfn10 port map( D => n63, CK => clk, Q => 
                           cur_count_6_port);
   cur_ready_reg : dfn10 port map( D => n56, CK => clk, Q => ready_port);
   U70 : na210 port map( A => n65, B => n66, Y => next_state_2_port);
   U71 : na210 port map( A => start, B => n67, Y => n66);
   U72 : na210 port map( A => n68, B => n69, Y => n65);
   U73 : iv110 port map( A => n70, Y => n69);
   U74 : na210 port map( A => n71, B => n72, Y => next_state_1_port);
   U75 : na210 port map( A => vga_clk, B => n73, Y => n72);
   U76 : na310 port map( A => n74, B => n75, C => n76, Y => next_state_0_port);
   U77 : na210 port map( A => n68, B => n70, Y => n76);
   U78 : na210 port map( A => n77, B => n78, Y => n70);
   U79 : no310 port map( A => n79, B => cur_count_5_port, C => n80, Y => n78);
   U80 : no210 port map( A => cur_count_2_port, B => n81, Y => n80);
   U81 : iv110 port map( A => n82, Y => n79);
   U82 : no210 port map( A => cur_count_6_port, B => cur_count_7_port, Y => n82
                           );
   U83 : no310 port map( A => n83, B => n84, C => n85, Y => n77);
   U84 : mu111 port map( A => n86, B => cur_count_2_port, S => cur_count_0_port
                           , Y => n85);
   U85 : iv110 port map( A => time, Y => n86);
   U86 : mu111 port map( A => time, B => n81, S => cur_count_3_port, Y => n83);
   U87 : na310 port map( A => start, B => n87, C => n88, Y => n75);
   U88 : no210 port map( A => state_2_port, B => state_1_port, Y => n88);
   U89 : na210 port map( A => n89, B => n90, Y => n74);
   U90 : iv110 port map( A => n91, Y => n89);
   U91 : no210 port map( A => n73, B => n92, Y => n91);
   U92 : iv110 port map( A => n93, Y => n64);
   U93 : mu111 port map( A => n94, B => n95, S => cur_count_7_port, Y => n93);
   U94 : no210 port map( A => n96, B => n97, Y => n95);
   U95 : no210 port map( A => n98, B => cur_count_6_port, Y => n97);
   U96 : na210 port map( A => n99, B => cur_count_6_port, Y => n94);
   U97 : mu111 port map( A => n99, B => n96, S => cur_count_6_port, Y => n63);
   U98 : iv110 port map( A => n100, Y => n96);
   U99 : no210 port map( A => n101, B => n102, Y => n100);
   U100 : no210 port map( A => n98, B => cur_count_5_port, Y => n102);
   U101 : no310 port map( A => n98, B => n103, C => n104, Y => n99);
   U102 : mu111 port map( A => n101, B => n105, S => n104, Y => n62);
   U103 : iv110 port map( A => cur_count_5_port, Y => n104);
   U104 : no210 port map( A => n103, B => n98, Y => n105);
   U105 : na210 port map( A => n106, B => n107, Y => n101);
   U106 : na210 port map( A => n108, B => n103, Y => n107);
   U107 : iv110 port map( A => n109, Y => n103);
   U108 : no310 port map( A => n110, B => n81, C => n111, Y => n109);
   U109 : iv110 port map( A => cur_count_4_port, Y => n81);
   U110 : mu111 port map( A => n112, B => n113, S => cur_count_4_port, Y => n61
                           );
   U111 : na210 port map( A => n114, B => n115, Y => n113);
   U112 : na210 port map( A => n108, B => n110, Y => n115);
   U113 : iv110 port map( A => n116, Y => n114);
   U114 : no310 port map( A => n98, B => n110, C => n111, Y => n112);
   U115 : iv110 port map( A => cur_count_3_port, Y => n110);
   U116 : mu111 port map( A => n117, B => n116, S => cur_count_3_port, Y => n60
                           );
   U117 : na210 port map( A => n106, B => n118, Y => n116);
   U118 : na210 port map( A => n108, B => n111, Y => n118);
   U119 : no210 port map( A => n111, B => n98, Y => n117);
   U120 : na310 port map( A => cur_count_2_port, B => cur_count_0_port, C => 
                           cur_count_1_port, Y => n111);
   U121 : mu111 port map( A => n119, B => n120, S => cur_count_2_port, Y => n59
                           );
   U122 : na210 port map( A => n121, B => n122, Y => n120);
   U123 : na210 port map( A => n108, B => n84, Y => n122);
   U124 : iv110 port map( A => n123, Y => n121);
   U125 : no310 port map( A => n98, B => n124, C => n84, Y => n119);
   U126 : iv110 port map( A => cur_count_1_port, Y => n84);
   U127 : mu111 port map( A => n125, B => n123, S => cur_count_1_port, Y => n58
                           );
   U128 : na210 port map( A => n106, B => n126, Y => n123);
   U129 : na210 port map( A => n108, B => n124, Y => n126);
   U130 : iv110 port map( A => n127, Y => n106);
   U131 : no210 port map( A => n124, B => n98, Y => n125);
   U132 : iv110 port map( A => n108, Y => n98);
   U133 : iv110 port map( A => cur_count_0_port, Y => n124);
   U134 : mu111 port map( A => n108, B => n127, S => cur_count_0_port, Y => n57
                           );
   U135 : no210 port map( A => n71, B => n127, Y => n108);
   U136 : na210 port map( A => n128, B => n129, Y => n127);
   U137 : na210 port map( A => n130, B => n131, Y => n129);
   U138 : na210 port map( A => n132, B => n90, Y => n130);
   U139 : iv110 port map( A => vga_clk, Y => n90);
   U140 : mu111 port map( A => n67, B => ready_port, S => n131, Y => n56);
   U141 : na210 port map( A => n132, B => n71, Y => n131);
   U142 : iv110 port map( A => n92, Y => n71);
   U143 : no310 port map( A => state_0_port, B => state_2_port, C => n133, Y =>
                           n92);
   U144 : no310 port map( A => n68, B => n135, C => n73, Y => n132);
   U145 : no310 port map( A => state_1_port, B => state_2_port, C => n87, Y => 
                           n73);
   U146 : iv110 port map( A => n134, Y => n135);
   U147 : no210 port map( A => ctr_rst, B => rst, Y => n134);
   U148 : no310 port map( A => n87, B => state_2_port, C => n133, Y => n68);
   U149 : iv110 port map( A => n128, Y => n67);
   U150 : na310 port map( A => n87, B => n133, C => state_2_port, Y => n128);
   U151 : iv110 port map( A => state_1_port, Y => n133);
   U152 : iv110 port map( A => state_0_port, Y => n87);

end synthesised;



