
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of cs_compare_comb is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component na310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component no310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   signal defset_en_port, score_out_port, shift_start_port, cnt_en_port, n51, 
      n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66
      , n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, 
      n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95
      : std_logic;

begin
   tri_en <= defset_en_port;
   cnt_en <= cnt_en_port;
   shift_start <= shift_start_port;
   score_out <= score_out_port;
   defset_en <= defset_en_port;
   
   U60 : na310 port map( A => n51, B => n52, C => n53, Y => state_next(3));
   U61 : na210 port map( A => n54, B => n55, Y => n53);
   U62 : iv110 port map( A => score_out_port, Y => n52);
   U63 : na310 port map( A => n56, B => n57, C => n58, Y => n51);
   U64 : iv110 port map( A => n59, Y => n58);
   U65 : na310 port map( A => n60, B => n61, C => n62, Y => n59);
   U66 : no210 port map( A => cnt_ram_addr(1), B => cnt_ram_addr(2), Y => n60);
   U67 : no210 port map( A => cnt_ram_addr(6), B => cnt_ram_addr(5), Y => n57);
   U68 : no210 port map( A => cnt_ram_addr(4), B => cnt_ram_addr(3), Y => n56);
   U69 : na310 port map( A => n63, B => n64, C => n65, Y => state_next(2));
   U70 : no210 port map( A => n66, B => n67, Y => n65);
   U71 : no210 port map( A => n68, B => n55, Y => n67);
   U72 : iv110 port map( A => row_full, Y => n55);
   U73 : iv110 port map( A => n69, Y => n66);
   U74 : na310 port map( A => n63, B => n70, C => n71, Y => state_next(1));
   U75 : no210 port map( A => shift_start_port, B => cnt_en_port, Y => n71);
   U76 : iv110 port map( A => n72, Y => n63);
   U77 : na310 port map( A => n73, B => n74, C => n75, Y => state_next(0));
   U78 : no310 port map( A => n76, B => n62, C => n77, Y => n75);
   U79 : no310 port map( A => n78, B => n79, C => n61, Y => n77);
   U80 : iv110 port map( A => cnt_ram_addr(0), Y => n61);
   U81 : na210 port map( A => cnt_ram_addr(2), B => cnt_ram_addr(1), Y => n78);
   U82 : no210 port map( A => n80, B => n81, Y => n76);
   U83 : iv110 port map( A => start_in, Y => n80);
   U84 : na210 port map( A => shift_ready, B => n72, Y => n74);
   U85 : na210 port map( A => row_full, B => n54, Y => n73);
   U86 : na210 port map( A => n70, B => n82, Y => row_full_next);
   U87 : na210 port map( A => row_full, B => n83, Y => n82);
   U88 : na310 port map( A => n84, B => n81, C => n85, Y => n83);
   U89 : no210 port map( A => ram_data_in, B => n72, Y => n85);
   U90 : no310 port map( A => n86, B => state(0), C => n87, Y => n72);
   U91 : na310 port map( A => n84, B => n69, C => n88, Y => defset_en_port);
   U92 : no210 port map( A => cnt_en_port, B => n89, Y => n88);
   U93 : iv110 port map( A => n70, Y => n89);
   U94 : na310 port map( A => state(0), B => n87, C => n90, Y => n70);
   U95 : na310 port map( A => state(1), B => state(0), C => n90, Y => n69);
   U96 : no310 port map( A => score_out_port, B => n62, C => n91, Y => n84);
   U97 : na310 port map( A => n68, B => n64, C => n92, Y => n91);
   U98 : iv110 port map( A => shift_start_port, Y => n64);
   U99 : no310 port map( A => n86, B => state(1), C => n93, Y => 
                           shift_start_port);
   U100 : iv110 port map( A => n54, Y => n68);
   U101 : no310 port map( A => state(0), B => state(1), C => n86, Y => n54);
   U102 : no210 port map( A => n94, B => n81, Y => n62);
   U103 : no310 port map( A => n93, B => n86, C => n87, Y => score_out_port);
   U104 : na210 port map( A => state(2), B => n94, Y => n86);
   U105 : iv110 port map( A => state(3), Y => n94);
   U106 : iv110 port map( A => n79, Y => cnt_en_port);
   U107 : na310 port map( A => state(1), B => n93, C => n90, Y => n79);
   U108 : no210 port map( A => state(2), B => state(3), Y => n90);
   U109 : iv110 port map( A => n92, Y => ready_out);
   U110 : na210 port map( A => state(3), B => n81, Y => n92);
   U111 : na310 port map( A => n87, B => n95, C => n93, Y => n81);
   U112 : iv110 port map( A => state(0), Y => n93);
   U113 : iv110 port map( A => state(2), Y => n95);
   U114 : iv110 port map( A => state(1), Y => n87);

end synthesised;



