
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of controller_calc is

   component ex210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
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
   
   component mu111
      port( A, B, S : in std_logic;  Y : out std_logic);
   end component;
   
   signal n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74,
      n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89
      , n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101 : 
      std_logic;

begin
   
   U62 : ex210 port map( A => old_y(3), B => n61, Y => new_y(3));
   U63 : no210 port map( A => n62, B => n63, Y => n61);
   U64 : ex210 port map( A => n64, B => n65, Y => n63);
   U65 : na210 port map( A => n66, B => n67, Y => n65);
   U66 : na210 port map( A => n68, B => n69, Y => n67);
   U67 : iv110 port map( A => old_y(2), Y => n69);
   U68 : na210 port map( A => n64, B => n70, Y => n68);
   U69 : na210 port map( A => n71, B => add_sub, Y => n66);
   U70 : iv110 port map( A => n70, Y => n71);
   U71 : ex210 port map( A => old_y(2), B => n72, Y => new_y(2));
   U72 : no210 port map( A => n73, B => n62, Y => n72);
   U73 : ex210 port map( A => n70, B => add_sub, Y => n73);
   U74 : na210 port map( A => n74, B => n75, Y => n70);
   U75 : na210 port map( A => old_y(1), B => n76, Y => n75);
   U76 : na210 port map( A => add_sub, B => n77, Y => n76);
   U77 : na210 port map( A => old_y(0), B => n64, Y => n74);
   U78 : ex210 port map( A => old_y(1), B => n78, Y => new_y(1));
   U79 : no210 port map( A => n62, B => n79, Y => n78);
   U80 : ex210 port map( A => n77, B => n64, Y => n79);
   U81 : ex210 port map( A => n77, B => n62, Y => new_y(0));
   U82 : na310 port map( A => n80, B => n81, C => y, Y => n62);
   U83 : iv110 port map( A => old_y(0), Y => n77);
   U84 : mu111 port map( A => n82, B => n83, S => old_x(2), Y => new_x(2));
   U85 : na210 port map( A => n84, B => n85, Y => n83);
   U86 : ex210 port map( A => n86, B => n87, Y => n85);
   U87 : no210 port map( A => n88, B => n89, Y => n82);
   U88 : iv110 port map( A => n84, Y => n89);
   U89 : mu111 port map( A => n64, B => n86, S => n87, Y => n88);
   U90 : na210 port map( A => n90, B => n91, Y => new_x(1));
   U91 : na210 port map( A => n84, B => n92, Y => n91);
   U92 : na210 port map( A => n86, B => n93, Y => n92);
   U93 : na310 port map( A => add_sub, B => n94, C => old_x(0), Y => n93);
   U94 : na210 port map( A => n95, B => n64, Y => n86);
   U95 : iv110 port map( A => add_sub, Y => n64);
   U96 : na210 port map( A => n87, B => n96, Y => n95);
   U97 : na210 port map( A => n97, B => n94, Y => n96);
   U98 : iv110 port map( A => old_x(1), Y => n94);
   U99 : na210 port map( A => old_x(1), B => old_x(0), Y => n87);
   U100 : na210 port map( A => old_x(1), B => n98, Y => n90);
   U101 : na210 port map( A => n84, B => n99, Y => n98);
   U102 : na210 port map( A => add_sub, B => n97, Y => n99);
   U103 : iv110 port map( A => old_x(0), Y => n97);
   U104 : ex210 port map( A => old_x(0), B => n84, Y => new_x(0));
   U105 : no210 port map( A => n81, B => rot, Y => n84);
   U106 : iv110 port map( A => x, Y => n81);
   U107 : ex210 port map( A => old_rot(1), B => n100, Y => new_rot(1));
   U108 : no210 port map( A => n80, B => n101, Y => n100);
   U109 : ex210 port map( A => old_rot(0), B => add_sub, Y => n101);
   U110 : iv110 port map( A => rot, Y => n80);
   U111 : ex210 port map( A => rot, B => old_rot(0), Y => new_rot(0));

end synthesised;



