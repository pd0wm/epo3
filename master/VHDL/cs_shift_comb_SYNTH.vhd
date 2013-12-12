
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of cs_shift_comb is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component na310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component no310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component tinv10
      port( A, E : in std_logic;  Y : out std_logic);
   end component;
   
   signal n25, n26, n27, cnt_en_port, tri_en_substr_port, cnt_set_port, n33, 
      n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48
      , n49, n50, n51, n52, n53, n54, n55, n56, n57, n58 : std_logic;

begin
   cnt_set <= cnt_set_port;
   cnt_en <= cnt_en_port;
   tri_en_substr <= tri_en_substr_port;
   
   ram_data_out_tri : tinv10 port map( A => n27, E => n26, Y => ram_data_out);
   ram_we_tri : tinv10 port map( A => n25, E => n26, Y => ram_we);
   U38 : na310 port map( A => n33, B => n34, C => n35, Y => tri_en);
   U39 : na210 port map( A => state(0), B => n36, Y => n35);
   U40 : iv110 port map( A => n37, Y => state_next(2));
   U41 : no310 port map( A => n38, B => tri_en_substr_port, C => n39, Y => n37)
                           ;
   U42 : no210 port map( A => n34, B => n25, Y => n39);
   U43 : no310 port map( A => n40, B => state(2), C => n36, Y => 
                           tri_en_substr_port);
   U44 : no210 port map( A => n41, B => n42, Y => n38);
   U45 : na310 port map( A => n33, B => n43, C => n41, Y => state_next(1));
   U46 : iv110 port map( A => n44, Y => n41);
   U47 : iv110 port map( A => cnt_set_port, Y => n43);
   U48 : na310 port map( A => n45, B => n46, C => n47, Y => state_next(0));
   U49 : na210 port map( A => start_in, B => n48, Y => n47);
   U50 : iv110 port map( A => cnt_en_port, Y => n46);
   U51 : na210 port map( A => n44, B => n42, Y => n45);
   U52 : na310 port map( A => n49, B => cnt_ram_addr(6), C => n50, Y => n42);
   U53 : no210 port map( A => n51, B => n52, Y => n50);
   U54 : na210 port map( A => cnt_ram_addr(3), B => cnt_ram_addr(2), Y => n52);
   U55 : na210 port map( A => cnt_ram_addr(1), B => cnt_ram_addr(0), Y => n51);
   U56 : no210 port map( A => n53, B => n54, Y => n49);
   U57 : iv110 port map( A => cnt_ram_addr(5), Y => n54);
   U58 : no310 port map( A => n40, B => state(1), C => n34, Y => n44);
   U59 : na310 port map( A => n55, B => n48, C => ram_data_in, Y => n27);
   U60 : na310 port map( A => n56, B => n53, C => n57, Y => n55);
   U61 : no210 port map( A => cnt_ram_addr(6), B => cnt_ram_addr(5), Y => n57);
   U62 : iv110 port map( A => cnt_ram_addr(4), Y => n53);
   U63 : iv110 port map( A => cnt_ram_addr(3), Y => n56);
   U64 : na210 port map( A => n48, B => n34, Y => n26);
   U65 : iv110 port map( A => n48, Y => n25);
   U66 : no310 port map( A => state(1), B => state(2), C => n40, Y => 
                           cnt_set_port);
   U67 : na210 port map( A => n33, B => n58, Y => cnt_en_port);
   U68 : na210 port map( A => state(2), B => n48, Y => n58);
   U69 : no210 port map( A => state(1), B => state(0), Y => n48);
   U70 : na310 port map( A => n40, B => n34, C => state(1), Y => n33);
   U71 : iv110 port map( A => state(0), Y => n40);
   U72 : no210 port map( A => n36, B => n34, Y => ready_out);
   U73 : iv110 port map( A => state(2), Y => n34);
   U74 : iv110 port map( A => state(1), Y => n36);

end synthesised;



