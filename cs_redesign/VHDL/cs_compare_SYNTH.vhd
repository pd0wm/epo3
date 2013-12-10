
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of cs_compare is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
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
   
   component na310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component mu111
      port( A, B, S : in std_logic;  Y : out std_logic);
   end component;
   
   component dfr11
      port( D, R, CK : in std_logic;  Q : out std_logic);
   end component;
   
   component cs_tri7
      port( i : in std_logic_vector (6 downto 0);  o : out std_logic_vector (6 
            downto 0);  e : in std_logic);
   end component;
   
   component cs_7bc
      port( clk, rst, en : in std_logic;  value : out std_logic_vector (6 
            downto 0));
   end component;
   
   signal cnt_ram_addr_6_port, cnt_ram_addr_5_port, cnt_ram_addr_4_port, 
      cnt_ram_addr_3_port, cnt_ram_addr_2_port, cnt_ram_addr_1_port, 
      cnt_ram_addr_0_port, tri_en, state_next_2_port, state_next_1_port, 
      state_next_0_port, state_2_port, state_1_port, state_0_port, 
      row_full_next, row_full, ready_out_port, n32, n33, n34, n35, n36, n37, 
      n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52
      , n53, n54, n55, n56, n57, n58, n59, n60 : std_logic;

begin
   ready_out <= ready_out_port;
   
   counter_7_bit : cs_7bc port map( clk => clk, rst => rst, en => n32, value(6)
                           => cnt_ram_addr_6_port, value(5) => 
                           cnt_ram_addr_5_port, value(4) => cnt_ram_addr_4_port
                           , value(3) => cnt_ram_addr_3_port, value(2) => 
                           cnt_ram_addr_2_port, value(1) => cnt_ram_addr_1_port
                           , value(0) => cnt_ram_addr_0_port);
   tristate_7_bit : cs_tri7 port map( i(6) => cnt_ram_addr_6_port, i(5) => 
                           cnt_ram_addr_5_port, i(4) => cnt_ram_addr_4_port, 
                           i(3) => cnt_ram_addr_3_port, i(2) => 
                           cnt_ram_addr_2_port, i(1) => cnt_ram_addr_1_port, 
                           i(0) => cnt_ram_addr_0_port, o(6) => ram_addr_out(6)
                           , o(5) => ram_addr_out(5), o(4) => ram_addr_out(4), 
                           o(3) => ram_addr_out(3), o(2) => ram_addr_out(2), 
                           o(1) => ram_addr_out(1), o(0) => ram_addr_out(0), e 
                           => tri_en);
   state_reg_0_inst : dfr11 port map( D => state_next_0_port, R => rst, CK => 
                           clk, Q => state_0_port);
   state_reg_1_inst : dfr11 port map( D => state_next_1_port, R => rst, CK => 
                           clk, Q => state_1_port);
   state_reg_2_inst : dfr11 port map( D => state_next_2_port, R => rst, CK => 
                           clk, Q => state_2_port);
   row_full_reg : dfr11 port map( D => row_full_next, R => rst, CK => clk, Q =>
                           row_full);
   U40 : na210 port map( A => n33, B => n34, Y => state_next_2_port);
   U41 : mu111 port map( A => n35, B => n36, S => n37, Y => n33);
   U42 : na210 port map( A => state_2_port, B => state_0_port, Y => n36);
   U43 : iv110 port map( A => n38, Y => n35);
   U44 : na210 port map( A => n34, B => n39, Y => state_next_1_port);
   U45 : iv110 port map( A => tri_en, Y => n39);
   U46 : na210 port map( A => n40, B => n41, Y => tri_en);
   U47 : iv110 port map( A => n32, Y => n40);
   U48 : na210 port map( A => n42, B => n43, Y => n34);
   U49 : iv110 port map( A => n44, Y => n43);
   U50 : na310 port map( A => n45, B => n46, C => n47, Y => state_next_0_port);
   U51 : mu111 port map( A => n48, B => n49, S => n37, Y => n47);
   U52 : na310 port map( A => n50, B => n51, C => start_in, Y => n49);
   U53 : na210 port map( A => row_full, B => n38, Y => n48);
   U54 : na310 port map( A => cnt_ram_addr_0_port, B => n32, C => n52, Y => n46
                           );
   U55 : iv110 port map( A => n53, Y => n52);
   U56 : na210 port map( A => cnt_ram_addr_1_port, B => cnt_ram_addr_2_port, Y 
                           => n53);
   U57 : na210 port map( A => n42, B => n44, Y => n45);
   U58 : na310 port map( A => n54, B => n55, C => n56, Y => n44);
   U59 : no310 port map( A => cnt_ram_addr_0_port, B => cnt_ram_addr_2_port, C 
                           => cnt_ram_addr_1_port, Y => n56);
   U60 : no210 port map( A => cnt_ram_addr_6_port, B => cnt_ram_addr_5_port, Y 
                           => n55);
   U61 : no210 port map( A => cnt_ram_addr_4_port, B => cnt_ram_addr_3_port, Y 
                           => n54);
   U62 : no310 port map( A => state_0_port, B => state_1_port, C => n51, Y => 
                           n42);
   U63 : na210 port map( A => n41, B => n57, Y => row_full_next);
   U64 : na210 port map( A => row_full, B => n58, Y => n57);
   U65 : na310 port map( A => n59, B => state_1_port, C => n60, Y => n58);
   U66 : no210 port map( A => ready_out_port, B => n38, Y => n60);
   U67 : na210 port map( A => data_in, B => n32, Y => n59);
   U68 : na210 port map( A => n38, B => n37, Y => n41);
   U69 : no210 port map( A => n50, B => state_2_port, Y => n38);
   U70 : iv110 port map( A => state_0_port, Y => n50);
   U71 : no310 port map( A => n37, B => state_0_port, C => n51, Y => 
                           ready_out_port);
   U72 : iv110 port map( A => state_2_port, Y => n51);
   U73 : no310 port map( A => state_0_port, B => state_2_port, C => n37, Y => 
                           n32);
   U74 : iv110 port map( A => state_1_port, Y => n37);

end synthesised;



