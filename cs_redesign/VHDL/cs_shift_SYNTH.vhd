
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of cs_shift is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component no310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component na310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component dfr11
      port( D, R, CK : in std_logic;  Q : out std_logic);
   end component;
   
   component cs_tri7
      port( i : in std_logic_vector (6 downto 0);  o : out std_logic_vector (6 
            downto 0);  e : in std_logic);
   end component;
   
   component cs_adder7
      port( i : in std_logic_vector (6 downto 0);  o : out std_logic_vector (6 
            downto 0));
   end component;
   
   component cs_7bcws
      port( clk, rst, en, set : in std_logic;  value : out std_logic_vector (6 
            downto 0);  data : in std_logic_vector (6 downto 0));
   end component;
   
   signal cnt_ram_addr_6_port, cnt_ram_addr_5_port, cnt_ram_addr_4_port, 
      cnt_ram_addr_3_port, cnt_ram_addr_2_port, cnt_ram_addr_1_port, 
      cnt_ram_addr_0_port, cnt_ram_addr_substr_6_port, 
      cnt_ram_addr_substr_5_port, cnt_ram_addr_substr_4_port, 
      cnt_ram_addr_substr_3_port, cnt_ram_addr_substr_2_port, 
      cnt_ram_addr_substr_1_port, cnt_ram_addr_substr_0_port, state_next_2_port
      , state_next_0_port, state_2_port, state_1_port, state_0_port, n1, n7, n9
      , ram_we_port, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40
      , n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52 : std_logic;

begin
   ram_we <= ram_we_port;
   
   tristate_7_bit_normal : cs_tri7 port map( i(6) => cnt_ram_addr_6_port, i(5) 
                           => cnt_ram_addr_5_port, i(4) => cnt_ram_addr_4_port,
                           i(3) => cnt_ram_addr_3_port, i(2) => 
                           cnt_ram_addr_2_port, i(1) => cnt_ram_addr_1_port, 
                           i(0) => cnt_ram_addr_0_port, o(6) => ram_addr_out(6)
                           , o(5) => ram_addr_out(5), o(4) => ram_addr_out(4), 
                           o(3) => ram_addr_out(3), o(2) => ram_addr_out(2), 
                           o(1) => ram_addr_out(1), o(0) => ram_addr_out(0), e 
                           => ram_we_port);
   counter_7_bit : cs_7bcws port map( clk => clk, rst => rst, en => n7, set => 
                           n29, value(6) => cnt_ram_addr_6_port, value(5) => 
                           cnt_ram_addr_5_port, value(4) => cnt_ram_addr_4_port
                           , value(3) => cnt_ram_addr_3_port, value(2) => 
                           cnt_ram_addr_2_port, value(1) => cnt_ram_addr_1_port
                           , value(0) => cnt_ram_addr_0_port, data(6) => 
                           ram_addr_in(6), data(5) => ram_addr_in(5), data(4) 
                           => ram_addr_in(4), data(3) => ram_addr_in(3), 
                           data(2) => ram_addr_in(2), data(1) => ram_addr_in(1)
                           , data(0) => ram_addr_in(0));
   adder_7_bit : cs_adder7 port map( i(6) => cnt_ram_addr_6_port, i(5) => 
                           cnt_ram_addr_5_port, i(4) => cnt_ram_addr_4_port, 
                           i(3) => cnt_ram_addr_3_port, i(2) => 
                           cnt_ram_addr_2_port, i(1) => cnt_ram_addr_1_port, 
                           i(0) => cnt_ram_addr_0_port, o(6) => 
                           cnt_ram_addr_substr_6_port, o(5) => 
                           cnt_ram_addr_substr_5_port, o(4) => 
                           cnt_ram_addr_substr_4_port, o(3) => 
                           cnt_ram_addr_substr_3_port, o(2) => 
                           cnt_ram_addr_substr_2_port, o(1) => 
                           cnt_ram_addr_substr_1_port, o(0) => 
                           cnt_ram_addr_substr_0_port);
   tristate_7_bit_substr : cs_tri7 port map( i(6) => cnt_ram_addr_substr_6_port
                           , i(5) => cnt_ram_addr_substr_5_port, i(4) => 
                           cnt_ram_addr_substr_4_port, i(3) => 
                           cnt_ram_addr_substr_3_port, i(2) => 
                           cnt_ram_addr_substr_2_port, i(1) => 
                           cnt_ram_addr_substr_1_port, i(0) => 
                           cnt_ram_addr_substr_0_port, o(6) => ram_addr_out(6),
                           o(5) => ram_addr_out(5), o(4) => ram_addr_out(4), 
                           o(3) => ram_addr_out(3), o(2) => ram_addr_out(2), 
                           o(1) => ram_addr_out(1), o(0) => ram_addr_out(0), e 
                           => n9);
   state_reg_0_inst : dfr11 port map( D => state_next_0_port, R => rst, CK => 
                           clk, Q => state_0_port);
   state_reg_1_inst : dfr11 port map( D => n1, R => rst, CK => clk, Q => 
                           state_1_port);
   state_reg_2_inst : dfr11 port map( D => state_next_2_port, R => rst, CK => 
                           clk, Q => state_2_port);
   U35 : na310 port map( A => n30, B => n31, C => n32, Y => state_next_2_port);
   U36 : na310 port map( A => state_2_port, B => n33, C => n34, Y => n32);
   U37 : iv110 port map( A => n9, Y => n30);
   U38 : na210 port map( A => n35, B => n36, Y => state_next_0_port);
   U39 : na310 port map( A => n33, B => n37, C => start_in, Y => n36);
   U40 : no310 port map( A => n33, B => state_1_port, C => n37, Y => ready_out)
                           ;
   U41 : no310 port map( A => n38, B => n39, C => n31, Y => ram_data_out);
   U42 : no310 port map( A => n40, B => cnt_ram_addr_4_port, C => 
                           cnt_ram_addr_3_port, Y => n39);
   U43 : na210 port map( A => n41, B => n42, Y => n40);
   U44 : iv110 port map( A => cnt_ram_addr_5_port, Y => n41);
   U45 : iv110 port map( A => ram_data_in, Y => n38);
   U46 : no310 port map( A => n33, B => state_2_port, C => n43, Y => n9);
   U47 : iv110 port map( A => state_1_port, Y => n43);
   U48 : iv110 port map( A => n44, Y => n1);
   U49 : no310 port map( A => n29, B => n7, C => n45, Y => n44);
   U50 : no210 port map( A => n35, B => n34, Y => n45);
   U51 : no310 port map( A => n46, B => n42, C => n47, Y => n34);
   U52 : iv110 port map( A => n48, Y => n47);
   U53 : no210 port map( A => n49, B => n50, Y => n48);
   U54 : na210 port map( A => cnt_ram_addr_3_port, B => cnt_ram_addr_2_port, Y 
                           => n50);
   U55 : na210 port map( A => cnt_ram_addr_1_port, B => cnt_ram_addr_0_port, Y 
                           => n49);
   U56 : iv110 port map( A => cnt_ram_addr_6_port, Y => n42);
   U57 : na210 port map( A => cnt_ram_addr_4_port, B => cnt_ram_addr_5_port, Y 
                           => n46);
   U58 : na210 port map( A => n31, B => n51, Y => n7);
   U59 : iv110 port map( A => n52, Y => n51);
   U60 : no210 port map( A => n35, B => state_2_port, Y => n52);
   U61 : na210 port map( A => state_1_port, B => n33, Y => n35);
   U62 : iv110 port map( A => ram_we_port, Y => n31);
   U63 : no310 port map( A => state_0_port, B => state_1_port, C => n37, Y => 
                           ram_we_port);
   U64 : iv110 port map( A => state_2_port, Y => n37);
   U65 : no310 port map( A => state_1_port, B => state_2_port, C => n33, Y => 
                           n29);
   U66 : iv110 port map( A => state_0_port, Y => n33);

end synthesised;



