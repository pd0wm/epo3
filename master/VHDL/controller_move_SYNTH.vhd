
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
   
   component no310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component na310
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
   
   signal draw_erase_draw_port, ready_port, cur_state_3_port, cur_state_2_port,
      cur_state_1_port, cur_state_0_port, next_state_3_port, next_state_2_port,
      next_state_1_port, next_state_0_port, check_start_port, n56, n57, n58, 
      n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73
      , n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, 
      n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, 
      n102, n103, n104, n105, n106, n107, n108, n109, n110, n111 : std_logic;

begin
   draw_erase_draw <= draw_erase_draw_port;
   ready <= ready_port;
   check_start <= check_start_port;
   
   cur_state_reg_0_inst : dfr11 port map( D => next_state_0_port, R => rst, CK 
                           => clk, Q => cur_state_0_port);
   cur_state_reg_3_inst : dfr11 port map( D => next_state_3_port, R => rst, CK 
                           => clk, Q => cur_state_3_port);
   cur_state_reg_1_inst : dfr11 port map( D => next_state_1_port, R => rst, CK 
                           => clk, Q => cur_state_1_port);
   cur_state_reg_2_inst : dfr11 port map( D => next_state_2_port, R => rst, CK 
                           => clk, Q => cur_state_2_port);
   U69 : no210 port map( A => n56, B => n57, Y => y);
   U70 : iv110 port map( A => drop, Y => n57);
   U71 : no210 port map( A => n56, B => n58, Y => x);
   U72 : no210 port map( A => inputs(0), B => inputs(1), Y => n58);
   U73 : no210 port map( A => n56, B => n59, Y => rot);
   U74 : no210 port map( A => inputs(2), B => inputs(3), Y => n59);
   U75 : na210 port map( A => n60, B => n61, Y => next_state_3_port);
   U76 : iv110 port map( A => n62, Y => n61);
   U77 : no210 port map( A => n63, B => n64, Y => n62);
   U78 : na210 port map( A => cur_state_3_port, B => n65, Y => n60);
   U79 : na310 port map( A => n66, B => n67, C => n68, Y => next_state_2_port);
   U80 : na210 port map( A => check_empty, B => n69, Y => n68);
   U81 : na210 port map( A => cur_state_2_port, B => n70, Y => n66);
   U82 : na310 port map( A => n71, B => n72, C => n73, Y => next_state_1_port);
   U83 : no310 port map( A => n74, B => n75, C => n76, Y => n73);
   U84 : no210 port map( A => n77, B => n78, Y => n76);
   U85 : no210 port map( A => n79, B => n70, Y => n77);
   U86 : na310 port map( A => n80, B => n81, C => n82, Y => n70);
   U87 : no210 port map( A => n83, B => check_start_port, Y => n82);
   U88 : no210 port map( A => draw_erase_ready, B => n84, Y => n79);
   U89 : iv110 port map( A => n85, Y => n75);
   U90 : iv110 port map( A => n86, Y => n74);
   U91 : na210 port map( A => check_start_port, B => check_ready, Y => n86);
   U92 : na210 port map( A => n83, B => draw_erase_ready, Y => n72);
   U93 : na310 port map( A => n71, B => n67, C => n87, Y => next_state_0_port);
   U94 : mu111 port map( A => n88, B => n89, S => cur_state_0_port, Y => n87);
   U95 : no210 port map( A => n90, B => n65, Y => n89);
   U96 : na210 port map( A => n80, B => n91, Y => n65);
   U97 : na210 port map( A => check_start_port, B => n92, Y => n91);
   U98 : iv110 port map( A => check_ready, Y => n92);
   U99 : na210 port map( A => start, B => ready_port, Y => n80);
   U100 : na210 port map( A => n93, B => n94, Y => ready_port);
   U101 : na310 port map( A => cur_state_3_port, B => n95, C => n96, Y => n94);
   U102 : no210 port map( A => cur_state_2_port, B => cur_state_1_port, Y => 
                           n96);
   U103 : iv110 port map( A => n81, Y => n90);
   U104 : na210 port map( A => n97, B => n63, Y => n81);
   U105 : na310 port map( A => draw_erase_ready, B => n98, C => n99, Y => n63);
   U106 : no310 port map( A => inputs(1), B => inputs(3), C => inputs(2), Y => 
                           n99);
   U107 : iv110 port map( A => inputs(0), Y => n98);
   U108 : iv110 port map( A => n64, Y => n97);
   U109 : na210 port map( A => n100, B => start, Y => n88);
   U110 : na210 port map( A => draw_erase_ready, B => n101, Y => n67);
   U111 : na210 port map( A => n102, B => n84, Y => n101);
   U112 : na210 port map( A => n69, B => n103, Y => n71);
   U113 : iv110 port map( A => check_empty, Y => n103);
   U114 : na310 port map( A => n85, B => n104, C => n84, Y => draw_erase_start)
                           ;
   U115 : na210 port map( A => n105, B => n95, Y => n84);
   U116 : iv110 port map( A => draw_erase_draw_port, Y => n104);
   U117 : na210 port map( A => n100, B => cur_state_0_port, Y => n85);
   U118 : no310 port map( A => cur_state_2_port, B => cur_state_3_port, C => 
                           cur_state_1_port, Y => n100);
   U119 : na210 port map( A => n102, B => n64, Y => draw_erase_draw_port);
   U120 : na210 port map( A => n105, B => cur_state_0_port, Y => n64);
   U121 : no310 port map( A => cur_state_2_port, B => cur_state_3_port, C => 
                           n78, Y => n105);
   U122 : no210 port map( A => n56, B => n106, Y => add_sub);
   U123 : no210 port map( A => inputs(1), B => inputs(2), Y => n106);
   U124 : no310 port map( A => check_start_port, B => n83, C => n107, Y => n56)
                           ;
   U125 : na210 port map( A => n93, B => n108, Y => n107);
   U126 : iv110 port map( A => n69, Y => n108);
   U127 : no310 port map( A => n109, B => cur_state_0_port, C => n78, Y => n69)
                           ;
   U128 : na310 port map( A => cur_state_0_port, B => n110, C => 
                           cur_state_1_port, Y => n93);
   U129 : iv110 port map( A => n102, Y => n83);
   U130 : na310 port map( A => n95, B => n78, C => n110, Y => n102);
   U131 : iv110 port map( A => cur_state_1_port, Y => n78);
   U132 : no310 port map( A => n109, B => cur_state_1_port, C => n95, Y => 
                           check_start_port);
   U133 : iv110 port map( A => cur_state_0_port, Y => n95);
   U134 : iv110 port map( A => n110, Y => n109);
   U135 : no210 port map( A => n111, B => cur_state_3_port, Y => n110);
   U136 : iv110 port map( A => cur_state_2_port, Y => n111);

end synthesised;



