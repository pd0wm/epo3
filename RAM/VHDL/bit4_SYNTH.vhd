
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of bit4 is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component mu210
      port( A, B, C, D, S1, S2 : in std_logic;  Y : out std_logic);
   end component;
   
   component tbuf10
      port( A, E : in std_logic;  Y : out std_logic);
   end component;
   
   component dfr11
      port( D, R, CK : in std_logic;  Q : out std_logic);
   end component;
   
   signal net_8, net_2, net_11, net_5, net_10, net_4, net_9, net_3, net_6, 
      net_7, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, 
      n53, n54, n55, n56, n57, n58 : std_logic;

begin
   
   dfr11_0 : dfr11 port map( D => net_8, R => rst, CK => clk, Q => net_2);
   dfr11_6 : dfr11 port map( D => net_11, R => rst, CK => clk, Q => net_5);
   dfr11_7 : dfr11 port map( D => net_10, R => rst, CK => clk, Q => net_4);
   dfr11_8 : dfr11 port map( D => net_9, R => rst, CK => clk, Q => net_3);
   tbuf10_14 : tbuf10 port map( A => net_6, E => re_1, Y => do_1);
   tbuf10_15 : tbuf10 port map( A => net_7, E => re_2, Y => do_2);
   U46 : na210 port map( A => n40, B => n41, Y => net_9);
   U47 : na210 port map( A => net_3, B => n42, Y => n41);
   U48 : na210 port map( A => n43, B => n44, Y => n42);
   U49 : na210 port map( A => n45, B => n44, Y => n40);
   U50 : iv110 port map( A => we2, Y => n44);
   U51 : na210 port map( A => n46, B => n47, Y => net_8);
   U52 : na210 port map( A => net_2, B => n48, Y => n47);
   U53 : na210 port map( A => n43, B => n49, Y => n48);
   U54 : na210 port map( A => n45, B => n49, Y => n46);
   U55 : iv110 port map( A => we1, Y => n49);
   U56 : mu210 port map( A => net_2, B => net_4, C => net_3, D => net_5, S1 => 
                           addr2_2, S2 => addr2_1, Y => net_7);
   U57 : mu210 port map( A => net_2, B => net_4, C => net_3, D => net_5, S1 => 
                           addr1_2, S2 => addr1_1, Y => net_6);
   U58 : na210 port map( A => n50, B => n51, Y => net_11);
   U59 : na210 port map( A => net_5, B => n52, Y => n51);
   U60 : na210 port map( A => n43, B => n53, Y => n52);
   U61 : na210 port map( A => n45, B => n53, Y => n50);
   U62 : iv110 port map( A => we4, Y => n53);
   U63 : na210 port map( A => n54, B => n55, Y => net_10);
   U64 : na210 port map( A => net_4, B => n56, Y => n55);
   U65 : na210 port map( A => n43, B => n57, Y => n56);
   U66 : na210 port map( A => n45, B => n57, Y => n54);
   U67 : iv110 port map( A => we3, Y => n57);
   U68 : iv110 port map( A => n58, Y => n45);
   U69 : na210 port map( A => di, B => n43, Y => n58);
   U70 : iv110 port map( A => we_com, Y => n43);

end synthesised;



