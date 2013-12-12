
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of vga_demux is

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
   
   signal n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41,
      n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54 : 
      std_logic;

begin
   
   U36 : na310 port map( A => n28, B => n29, C => n30, Y => do(7));
   U37 : na210 port map( A => s1, B => di1(7), Y => n30);
   U38 : na210 port map( A => def(7), B => n31, Y => n29);
   U39 : na210 port map( A => di2(7), B => n32, Y => n28);
   U40 : na310 port map( A => n33, B => n34, C => n35, Y => do(6));
   U41 : na210 port map( A => di1(6), B => s1, Y => n35);
   U42 : na210 port map( A => def(6), B => n31, Y => n34);
   U43 : na210 port map( A => di2(6), B => n32, Y => n33);
   U44 : na310 port map( A => n36, B => n37, C => n38, Y => do(5));
   U45 : na210 port map( A => di1(5), B => s1, Y => n38);
   U46 : na210 port map( A => def(5), B => n31, Y => n37);
   U47 : na210 port map( A => di2(5), B => n32, Y => n36);
   U48 : na310 port map( A => n39, B => n40, C => n41, Y => do(4));
   U49 : na210 port map( A => di1(4), B => s1, Y => n41);
   U50 : na210 port map( A => def(4), B => n31, Y => n40);
   U51 : na210 port map( A => di2(4), B => n32, Y => n39);
   U52 : na310 port map( A => n42, B => n43, C => n44, Y => do(3));
   U53 : na210 port map( A => di1(3), B => s1, Y => n44);
   U54 : na210 port map( A => def(3), B => n31, Y => n43);
   U55 : na210 port map( A => di2(3), B => n32, Y => n42);
   U56 : na310 port map( A => n45, B => n46, C => n47, Y => do(2));
   U57 : na210 port map( A => di1(2), B => s1, Y => n47);
   U58 : na210 port map( A => def(2), B => n31, Y => n46);
   U59 : na210 port map( A => di2(2), B => n32, Y => n45);
   U60 : na310 port map( A => n48, B => n49, C => n50, Y => do(1));
   U61 : na210 port map( A => di1(1), B => s1, Y => n50);
   U62 : na210 port map( A => def(1), B => n31, Y => n49);
   U63 : na210 port map( A => di2(1), B => n32, Y => n48);
   U64 : na310 port map( A => n51, B => n52, C => n53, Y => do(0));
   U65 : na210 port map( A => di1(0), B => s1, Y => n53);
   U66 : na210 port map( A => def(0), B => n31, Y => n52);
   U67 : no210 port map( A => s1, B => s2, Y => n31);
   U68 : na210 port map( A => di2(0), B => n32, Y => n51);
   U69 : no210 port map( A => n54, B => s1, Y => n32);
   U70 : iv110 port map( A => s2, Y => n54);

end synthesised;



