
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of controller_move is

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
   
   component dfr11
      port( D, R, CK : in std_logic;  Q : out std_logic);
   end component;
   
   signal X_Logic1_port, cur_state_3_port, cur_state_2_port, cur_state_1_port, 
      cur_state_0_port, next_state_3_port, next_state_2_port, next_state_1_port
      , next_state_0_port, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, 
      n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86
      , n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, 
      n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111, n112, 
      n113, n114, n115, n116, n117, n118, n119, n120, n121, n122 : std_logic;

begin
   ready <= X_Logic1_port;
   check_start <= X_Logic1_port;
   
   X_Logic1_port <= '1';
   cur_state_reg_0_inst : dfr11 port map( D => next_state_0_port, R => rst, CK 
                           => clk, Q => cur_state_0_port);
   cur_state_reg_1_inst : dfr11 port map( D => next_state_1_port, R => rst, CK 
                           => clk, Q => cur_state_1_port);
   cur_state_reg_2_inst : dfr11 port map( D => next_state_2_port, R => rst, CK 
                           => clk, Q => cur_state_2_port);
   cur_state_reg_3_inst : dfr11 port map( D => next_state_3_port, R => rst, CK 
                           => clk, Q => cur_state_3_port);
   U72 : no210 port map( A => n62, B => n63, Y => x);
   U73 : no210 port map( A => n62, B => n64, Y => rot);
   U74 : na210 port map( A => n65, B => n66, Y => next_state_3_port);
   U75 : na210 port map( A => n67, B => n68, Y => n66);
   U76 : na210 port map( A => n69, B => n70, Y => n68);
   U77 : na210 port map( A => n71, B => n72, Y => n70);
   U78 : na310 port map( A => n73, B => n74, C => n75, Y => next_state_2_port);
   U79 : na310 port map( A => cur_state_0_port, B => n76, C => n72, Y => n74);
   U80 : iv110 port map( A => n77, Y => n76);
   U81 : na210 port map( A => cur_state_2_port, B => n78, Y => n73);
   U82 : na210 port map( A => n79, B => n80, Y => next_state_1_port);
   U83 : na210 port map( A => cur_state_1_port, B => n78, Y => n80);
   U84 : iv110 port map( A => n81, Y => n78);
   U85 : no210 port map( A => n82, B => n83, Y => n81);
   U86 : no210 port map( A => n69, B => n67, Y => n83);
   U87 : iv110 port map( A => n84, Y => n67);
   U88 : na210 port map( A => n85, B => n86, Y => n79);
   U89 : na210 port map( A => n87, B => n88, Y => n85);
   U90 : na210 port map( A => n89, B => n90, Y => n88);
   U91 : iv110 port map( A => draw_erase_ready, Y => n90);
   U92 : na210 port map( A => cur_state_0_port, B => n91, Y => n87);
   U93 : na210 port map( A => cur_state_1_port, B => n92, Y => n91);
   U94 : na210 port map( A => cur_state_2_port, B => n93, Y => n92);
   U95 : iv110 port map( A => check_empty, Y => n93);
   U96 : na310 port map( A => n94, B => n95, C => n75, Y => next_state_0_port);
   U97 : iv110 port map( A => n96, Y => n75);
   U98 : na210 port map( A => n97, B => n98, Y => n96);
   U99 : na310 port map( A => n99, B => draw_erase_ready, C => n89, Y => n98);
   U100 : na210 port map( A => check_ready, B => n100, Y => n97);
   U101 : iv110 port map( A => n101, Y => n100);
   U102 : na310 port map( A => n99, B => n71, C => start, Y => n95);
   U103 : na210 port map( A => cur_state_0_port, B => n102, Y => n94);
   U104 : na310 port map( A => n103, B => n69, C => n104, Y => n102);
   U105 : iv110 port map( A => n82, Y => n104);
   U106 : na310 port map( A => n65, B => n101, C => n105, Y => n82);
   U107 : na310 port map( A => n72, B => n84, C => n71, Y => n105);
   U108 : na310 port map( A => n63, B => n64, C => draw_erase_ready, Y => n84);
   U109 : no210 port map( A => inputs(3), B => inputs(2), Y => n64);
   U110 : no210 port map( A => inputs(1), B => inputs(0), Y => n63);
   U111 : na210 port map( A => n89, B => n72, Y => n101);
   U112 : no210 port map( A => n106, B => cur_state_0_port, Y => n89);
   U113 : na310 port map( A => start, B => cur_state_3_port, C => n107, Y => 
                           n65);
   U114 : no210 port map( A => cur_state_2_port, B => cur_state_1_port, Y => 
                           n107);
   U115 : na210 port map( A => n77, B => n72, Y => n103);
   U116 : no210 port map( A => n106, B => check_empty, Y => n77);
   U117 : iv110 port map( A => cur_state_1_port, Y => n106);
   U118 : na210 port map( A => n108, B => n109, Y => draw_erase_start);
   U119 : na210 port map( A => n110, B => n99, Y => n109);
   U120 : iv110 port map( A => n108, Y => draw_erase_draw);
   U121 : na210 port map( A => n111, B => n112, Y => n108);
   U122 : na210 port map( A => n113, B => n69, Y => n111);
   U123 : na210 port map( A => n99, B => n114, Y => n69);
   U124 : no210 port map( A => cur_state_2_port, B => cur_state_3_port, Y => 
                           n99);
   U125 : no210 port map( A => n62, B => n115, Y => add_sub);
   U126 : no210 port map( A => inputs(1), B => inputs(2), Y => n115);
   U127 : iv110 port map( A => n116, Y => n62);
   U128 : na210 port map( A => n113, B => n117, Y => n116);
   U129 : na210 port map( A => n118, B => n112, Y => n117);
   U130 : iv110 port map( A => n110, Y => n112);
   U131 : no210 port map( A => n114, B => n71, Y => n110);
   U132 : no210 port map( A => cur_state_0_port, B => cur_state_1_port, Y => 
                           n71);
   U133 : iv110 port map( A => n119, Y => n114);
   U134 : na210 port map( A => n120, B => n121, Y => n118);
   U135 : na310 port map( A => n119, B => n122, C => cur_state_3_port, Y => 
                           n121);
   U136 : iv110 port map( A => cur_state_2_port, Y => n122);
   U137 : na210 port map( A => n72, B => n119, Y => n113);
   U138 : na210 port map( A => cur_state_1_port, B => cur_state_0_port, Y => 
                           n119);
   U139 : iv110 port map( A => n120, Y => n72);
   U140 : na210 port map( A => cur_state_2_port, B => n86, Y => n120);
   U141 : iv110 port map( A => cur_state_3_port, Y => n86);

end synthesised;



