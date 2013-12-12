
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of debounce is

   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component na310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component no310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component ex210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component dfr11
      port( D, R, CK : in std_logic;  Q : out std_logic);
   end component;
   
   component dfa11
      port( D, CK, R : in std_logic;  Q : out std_logic);
   end component;
   
   signal state_1_port, state_0_port, new_out_5_port, new_out_4_port, 
      new_out_3_port, new_out_2_port, new_out_1_port, new_out_0_port, 
      new_state_1_port, new_state_0_port, count_6_port, count_5_port, 
      count_4_port, count_3_port, count_2_port, count_1_port, count_0_port, N16
      , n35, n36, n37, n38, n39, n40, n41, n43, n44, n45, n46, n47, n48, n49, 
      n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64
      , n65, n66, n67, random_seed_port : std_logic;

begin
   random_seed <= random_seed_port;
   
   count_reg_0_inst : dfa11 port map( D => n41, CK => clk, R => N16, Q => 
                           count_0_port);
   state_reg_0_inst : dfr11 port map( D => new_state_0_port, R => rst, CK => 
                           clk, Q => state_0_port);
   state_reg_1_inst : dfr11 port map( D => new_state_1_port, R => rst, CK => 
                           clk, Q => state_1_port);
   count_reg_6_inst : dfa11 port map( D => n40, CK => clk, R => N16, Q => 
                           count_6_port);
   count_reg_5_inst : dfa11 port map( D => n39, CK => clk, R => N16, Q => 
                           count_5_port);
   count_reg_4_inst : dfa11 port map( D => n38, CK => clk, R => N16, Q => 
                           count_4_port);
   count_reg_3_inst : dfa11 port map( D => n37, CK => clk, R => N16, Q => 
                           count_3_port);
   count_reg_2_inst : dfa11 port map( D => n36, CK => clk, R => N16, Q => 
                           count_2_port);
   count_reg_1_inst : dfa11 port map( D => n35, CK => clk, R => N16, Q => 
                           count_1_port);
   output_reg_5_inst : dfr11 port map( D => new_out_5_port, R => rst, CK => clk
                           , Q => output(5));
   output_reg_4_inst : dfr11 port map( D => new_out_4_port, R => rst, CK => clk
                           , Q => output(4));
   output_reg_3_inst : dfr11 port map( D => new_out_3_port, R => rst, CK => clk
                           , Q => output(3));
   output_reg_2_inst : dfr11 port map( D => new_out_2_port, R => rst, CK => clk
                           , Q => output(2));
   output_reg_1_inst : dfr11 port map( D => new_out_1_port, R => rst, CK => clk
                           , Q => output(1));
   output_reg_0_inst : dfr11 port map( D => new_out_0_port, R => rst, CK => clk
                           , Q => output(0));
   U53 : na210 port map( A => n43, B => n44, Y => new_state_1_port);
   U54 : iv110 port map( A => n45, Y => n44);
   U55 : no310 port map( A => n46, B => rst, C => n47, Y => n45);
   U56 : na210 port map( A => n48, B => n49, Y => n43);
   U57 : na210 port map( A => n50, B => n51, Y => new_state_0_port);
   U58 : na210 port map( A => n49, B => n52, Y => n51);
   U59 : no310 port map( A => rst, B => state_1_port, C => n53, Y => n49);
   U60 : na210 port map( A => N16, B => random_seed_port, Y => n50);
   U61 : no210 port map( A => inv_inputs(5), B => n47, Y => new_out_5_port);
   U62 : no210 port map( A => inv_inputs(4), B => n47, Y => new_out_4_port);
   U63 : no210 port map( A => inv_inputs(3), B => n47, Y => new_out_3_port);
   U64 : no210 port map( A => inv_inputs(2), B => n47, Y => new_out_2_port);
   U65 : no210 port map( A => inv_inputs(1), B => n47, Y => new_out_1_port);
   U66 : no210 port map( A => inv_inputs(0), B => n47, Y => new_out_0_port);
   U67 : na210 port map( A => state_1_port, B => n53, Y => n47);
   U68 : iv110 port map( A => state_0_port, Y => n53);
   U69 : iv110 port map( A => n46, Y => random_seed_port);
   U70 : no210 port map( A => n54, B => n55, Y => n46);
   U71 : na310 port map( A => inv_inputs(2), B => inv_inputs(0), C => 
                           inv_inputs(1), Y => n55);
   U72 : na310 port map( A => inv_inputs(5), B => inv_inputs(3), C => 
                           inv_inputs(4), Y => n54);
   U73 : iv110 port map( A => n56, Y => n40);
   U74 : no210 port map( A => n57, B => count_6_port, Y => n56);
   U75 : no210 port map( A => n58, B => n59, Y => n57);
   U76 : ex210 port map( A => n59, B => n58, Y => n39);
   U77 : na210 port map( A => n60, B => n52, Y => n58);
   U78 : iv110 port map( A => count_5_port, Y => n59);
   U79 : ex210 port map( A => n61, B => n62, Y => n38);
   U80 : na210 port map( A => count_3_port, B => n63, Y => n62);
   U81 : ex210 port map( A => count_3_port, B => n63, Y => n37);
   U82 : no210 port map( A => n64, B => n48, Y => n63);
   U83 : iv110 port map( A => n52, Y => n48);
   U84 : ex210 port map( A => count_2_port, B => n65, Y => n36);
   U85 : no210 port map( A => n66, B => n41, Y => n65);
   U86 : ex210 port map( A => n66, B => n41, Y => n35);
   U87 : na210 port map( A => count_0_port, B => n52, Y => n41);
   U88 : na310 port map( A => count_5_port, B => n60, C => count_6_port, Y => 
                           n52);
   U89 : no310 port map( A => n67, B => n64, C => n61, Y => n60);
   U90 : iv110 port map( A => count_4_port, Y => n61);
   U91 : na310 port map( A => count_1_port, B => count_0_port, C => 
                           count_2_port, Y => n64);
   U92 : iv110 port map( A => count_3_port, Y => n67);
   U93 : iv110 port map( A => count_1_port, Y => n66);
   U94 : no210 port map( A => state_0_port, B => state_1_port, Y => N16);

end synthesised;



