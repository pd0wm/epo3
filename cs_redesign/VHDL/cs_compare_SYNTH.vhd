
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
   
   component na310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
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
   
   component cs_shift
      port( clk, rst, start_in : in std_logic;  ready_out : out std_logic;  
            ram_addr_in : in std_logic_vector (6 downto 0);  ram_addr_out : out
            std_logic_vector (6 downto 0);  ram_we : out std_logic;  
            ram_data_in : in std_logic;  ram_data_out : out std_logic);
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
      cnt_ram_addr_0_port, tri_en, shift_ready, state_next_2_port, 
      state_next_1_port, state_next_0_port, state_2_port, state_1_port, 
      state_0_port, row_full_next, row_full, n5, score_out_port, n35, n36, n37,
      n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52
      , n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, 
      n67 : std_logic;

begin
   score_out <= score_out_port;
   
   counter_7_bit : cs_7bc port map( clk => clk, rst => rst, en => n5, value(6) 
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
   shift : cs_shift port map( clk => clk, rst => rst, start_in => n35, 
                           ready_out => shift_ready, ram_addr_in(6) => 
                           cnt_ram_addr_6_port, ram_addr_in(5) => 
                           cnt_ram_addr_5_port, ram_addr_in(4) => 
                           cnt_ram_addr_4_port, ram_addr_in(3) => 
                           cnt_ram_addr_3_port, ram_addr_in(2) => 
                           cnt_ram_addr_2_port, ram_addr_in(1) => 
                           cnt_ram_addr_1_port, ram_addr_in(0) => 
                           cnt_ram_addr_0_port, ram_addr_out(6) => 
                           ram_addr_out(6), ram_addr_out(5) => ram_addr_out(5),
                           ram_addr_out(4) => ram_addr_out(4), ram_addr_out(3) 
                           => ram_addr_out(3), ram_addr_out(2) => 
                           ram_addr_out(2), ram_addr_out(1) => ram_addr_out(1),
                           ram_addr_out(0) => ram_addr_out(0), ram_we => ram_we
                           , ram_data_in => ram_data_in, ram_data_out => 
                           ram_data_out);
   state_reg_0_inst : dfr11 port map( D => state_next_0_port, R => rst, CK => 
                           clk, Q => state_0_port);
   state_reg_2_inst : dfr11 port map( D => state_next_2_port, R => rst, CK => 
                           clk, Q => state_2_port);
   state_reg_1_inst : dfr11 port map( D => state_next_1_port, R => rst, CK => 
                           clk, Q => state_1_port);
   row_full_reg : dfr11 port map( D => row_full_next, R => rst, CK => clk, Q =>
                           row_full);
   U44 : na310 port map( A => n36, B => n37, C => n38, Y => state_next_2_port);
   U45 : no210 port map( A => score_out_port, B => n35, Y => n38);
   U46 : na210 port map( A => state_1_port, B => n39, Y => n37);
   U47 : na210 port map( A => n36, B => n40, Y => state_next_1_port);
   U48 : iv110 port map( A => tri_en, Y => n40);
   U49 : na210 port map( A => n41, B => n42, Y => tri_en);
   U50 : iv110 port map( A => n43, Y => n36);
   U51 : na210 port map( A => n44, B => n45, Y => n43);
   U52 : na310 port map( A => n46, B => n47, C => n48, Y => n45);
   U53 : no310 port map( A => n49, B => cnt_ram_addr_0_port, C => n50, Y => n48
                           );
   U54 : na210 port map( A => n51, B => n52, Y => n49);
   U55 : iv110 port map( A => cnt_ram_addr_1_port, Y => n52);
   U56 : no210 port map( A => cnt_ram_addr_3_port, B => cnt_ram_addr_2_port, Y 
                           => n51);
   U57 : no310 port map( A => cnt_ram_addr_6_port, B => state_1_port, C => 
                           state_0_port, Y => n47);
   U58 : no210 port map( A => cnt_ram_addr_5_port, B => cnt_ram_addr_4_port, Y 
                           => n46);
   U59 : na210 port map( A => shift_ready, B => n35, Y => n44);
   U60 : na310 port map( A => n53, B => n54, C => n55, Y => state_next_0_port);
   U61 : mu111 port map( A => n56, B => n57, S => n58, Y => n55);
   U62 : iv110 port map( A => n59, Y => n57);
   U63 : no210 port map( A => state_0_port, B => n60, Y => n59);
   U64 : no210 port map( A => start_in, B => state_2_port, Y => n60);
   U65 : na210 port map( A => row_full, B => n39, Y => n56);
   U66 : na310 port map( A => cnt_ram_addr_0_port, B => n5, C => n61, Y => n54)
                           ;
   U67 : iv110 port map( A => n62, Y => n61);
   U68 : na210 port map( A => cnt_ram_addr_1_port, B => cnt_ram_addr_2_port, Y 
                           => n62);
   U69 : na210 port map( A => n35, B => n63, Y => n53);
   U70 : iv110 port map( A => shift_ready, Y => n63);
   U71 : no310 port map( A => n58, B => state_0_port, C => n50, Y => 
                           score_out_port);
   U72 : na210 port map( A => n42, B => n64, Y => row_full_next);
   U73 : na210 port map( A => row_full, B => n65, Y => n64);
   U74 : na210 port map( A => n5, B => n66, Y => n65);
   U75 : iv110 port map( A => ram_data_in, Y => n66);
   U76 : na210 port map( A => n39, B => n58, Y => n42);
   U77 : no210 port map( A => n67, B => state_2_port, Y => n39);
   U78 : iv110 port map( A => n41, Y => n5);
   U79 : na310 port map( A => n67, B => n50, C => state_1_port, Y => n41);
   U80 : no310 port map( A => n67, B => state_1_port, C => n50, Y => n35);
   U81 : no310 port map( A => n50, B => n67, C => n58, Y => ready_out);
   U82 : iv110 port map( A => state_1_port, Y => n58);
   U83 : iv110 port map( A => state_0_port, Y => n67);
   U84 : iv110 port map( A => state_2_port, Y => n50);

end synthesised;



