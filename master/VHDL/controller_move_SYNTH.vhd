
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of controller_move is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component na310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component no310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component dfr11
      port( D, R, CK : in std_logic;  Q : out std_logic);
   end component;
   
   signal ready_port, cur_state_3_port, cur_state_2_port, cur_state_1_port, 
      cur_state_0_port, next_state_3_port, next_state_2_port, next_state_1_port
      , next_state_0_port, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, 
      n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84
      , n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, 
      n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, 
      n111, n112, n113, n114, n115, n116, n117, n118, n119 : std_logic;

begin
   ready <= ready_port;
   
   cur_state_reg_0_inst : dfr11 port map( D => next_state_0_port, R => rst, CK 
                           => clk, Q => cur_state_0_port);
   cur_state_reg_1_inst : dfr11 port map( D => next_state_1_port, R => rst, CK 
                           => clk, Q => cur_state_1_port);
   cur_state_reg_2_inst : dfr11 port map( D => next_state_2_port, R => rst, CK 
                           => clk, Q => cur_state_2_port);
   cur_state_reg_3_inst : dfr11 port map( D => next_state_3_port, R => rst, CK 
                           => clk, Q => cur_state_3_port);
   U72 : no210 port map( A => n60, B => n61, Y => x);
   U73 : no210 port map( A => n60, B => n62, Y => rot);
   U74 : na310 port map( A => n63, B => n64, C => n65, Y => next_state_3_port);
   U75 : iv110 port map( A => n66, Y => n65);
   U76 : no210 port map( A => n67, B => n68, Y => n66);
   U77 : na210 port map( A => draw_erase_ready, B => n69, Y => n63);
   U78 : na310 port map( A => n70, B => n71, C => n72, Y => next_state_2_port);
   U79 : iv110 port map( A => n73, Y => n71);
   U80 : no310 port map( A => n74, B => n75, C => n76, Y => n73);
   U81 : na210 port map( A => cur_state_2_port, B => n77, Y => n70);
   U82 : na210 port map( A => n78, B => n79, Y => next_state_1_port);
   U83 : na210 port map( A => n80, B => n81, Y => n79);
   U84 : na210 port map( A => n82, B => n83, Y => n80);
   U85 : na210 port map( A => n84, B => n85, Y => n83);
   U86 : na210 port map( A => cur_state_0_port, B => n86, Y => n82);
   U87 : na210 port map( A => cur_state_1_port, B => n87, Y => n86);
   U88 : iv110 port map( A => n88, Y => n87);
   U89 : no210 port map( A => n89, B => check_empty, Y => n88);
   U90 : na210 port map( A => cur_state_1_port, B => n77, Y => n78);
   U91 : na310 port map( A => n90, B => n91, C => n92, Y => n77);
   U92 : na210 port map( A => n93, B => n68, Y => n92);
   U93 : na310 port map( A => n62, B => draw_erase_ready, C => n61, Y => n68);
   U94 : no210 port map( A => inputs(1), B => inputs(0), Y => n61);
   U95 : no210 port map( A => inputs(3), B => inputs(2), Y => n62);
   U96 : na210 port map( A => n69, B => n85, Y => n90);
   U97 : iv110 port map( A => draw_erase_ready, Y => n85);
   U98 : no210 port map( A => n94, B => n76, Y => n69);
   U99 : na310 port map( A => n95, B => n96, C => n72, Y => next_state_0_port);
   U100 : iv110 port map( A => n97, Y => n72);
   U101 : na210 port map( A => n98, B => n99, Y => n97);
   U102 : na310 port map( A => n100, B => draw_erase_ready, C => n84, Y => n99)
                           ;
   U103 : na210 port map( A => check_ready, B => n101, Y => n98);
   U104 : iv110 port map( A => n91, Y => n101);
   U105 : na210 port map( A => n84, B => n102, Y => n91);
   U106 : no210 port map( A => n103, B => cur_state_0_port, Y => n84);
   U107 : na310 port map( A => n104, B => start, C => n100, Y => n96);
   U108 : iv110 port map( A => n105, Y => n100);
   U109 : na210 port map( A => cur_state_0_port, B => n106, Y => n95);
   U110 : na310 port map( A => n64, B => n67, C => n107, Y => n106);
   U111 : na210 port map( A => n75, B => n102, Y => n107);
   U112 : no210 port map( A => n103, B => check_empty, Y => n75);
   U113 : iv110 port map( A => cur_state_1_port, Y => n103);
   U114 : na210 port map( A => start, B => ready_port, Y => n64);
   U115 : no310 port map( A => cur_state_1_port, B => cur_state_2_port, C => 
                           n81, Y => ready_port);
   U116 : na210 port map( A => n108, B => n109, Y => draw_erase_start);
   U117 : iv110 port map( A => n110, Y => n109);
   U118 : no210 port map( A => n111, B => n105, Y => n110);
   U119 : iv110 port map( A => n108, Y => draw_erase_draw);
   U120 : na210 port map( A => n112, B => n111, Y => n108);
   U121 : na210 port map( A => n113, B => n67, Y => n112);
   U122 : iv110 port map( A => n93, Y => n67);
   U123 : no210 port map( A => n105, B => n114, Y => n93);
   U124 : na210 port map( A => n89, B => n81, Y => n105);
   U125 : iv110 port map( A => cur_state_3_port, Y => n81);
   U126 : no210 port map( A => n111, B => n113, Y => check_start);
   U127 : no210 port map( A => n60, B => n115, Y => add_sub);
   U128 : no210 port map( A => inputs(1), B => inputs(2), Y => n115);
   U129 : iv110 port map( A => n116, Y => n60);
   U130 : na210 port map( A => n113, B => n117, Y => n116);
   U131 : na210 port map( A => n118, B => n111, Y => n117);
   U132 : na210 port map( A => n114, B => n94, Y => n111);
   U133 : iv110 port map( A => n104, Y => n94);
   U134 : no210 port map( A => cur_state_0_port, B => cur_state_1_port, Y => 
                           n104);
   U135 : na210 port map( A => n119, B => n76, Y => n118);
   U136 : iv110 port map( A => n102, Y => n76);
   U137 : na310 port map( A => n74, B => n89, C => cur_state_3_port, Y => n119)
                           ;
   U138 : iv110 port map( A => cur_state_0_port, Y => n74);
   U139 : na210 port map( A => n102, B => n114, Y => n113);
   U140 : na210 port map( A => cur_state_1_port, B => cur_state_0_port, Y => 
                           n114);
   U141 : no210 port map( A => n89, B => cur_state_3_port, Y => n102);
   U142 : iv110 port map( A => cur_state_2_port, Y => n89);

end synthesised;



