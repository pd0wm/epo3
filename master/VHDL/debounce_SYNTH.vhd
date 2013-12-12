
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
      count_4_port, count_3_port, count_2_port, count_1_port, count_0_port, N15
      , n34, n35, n36, n37, n38, n39, n40, n42, n43, n44, n45, n46, n47, n48, 
      n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63
      , n64, n65 : std_logic;

begin
   
   count_reg_0_inst : dfa11 port map( D => n40, CK => clk, R => N15, Q => 
                           count_0_port);
   state_reg_0_inst : dfr11 port map( D => new_state_0_port, R => rst, CK => 
                           clk, Q => state_0_port);
   state_reg_1_inst : dfr11 port map( D => new_state_1_port, R => rst, CK => 
                           clk, Q => state_1_port);
   count_reg_6_inst : dfa11 port map( D => n39, CK => clk, R => N15, Q => 
                           count_6_port);
   count_reg_5_inst : dfa11 port map( D => n38, CK => clk, R => N15, Q => 
                           count_5_port);
   count_reg_4_inst : dfa11 port map( D => n37, CK => clk, R => N15, Q => 
                           count_4_port);
   count_reg_3_inst : dfa11 port map( D => n36, CK => clk, R => N15, Q => 
                           count_3_port);
   count_reg_2_inst : dfa11 port map( D => n35, CK => clk, R => N15, Q => 
                           count_2_port);
   count_reg_1_inst : dfa11 port map( D => n34, CK => clk, R => N15, Q => 
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
   U52 : no310 port map( A => n42, B => rst, C => n43, Y => new_state_1_port);
   U53 : no210 port map( A => n44, B => n45, Y => n42);
   U54 : iv110 port map( A => n46, Y => n45);
   U55 : no310 port map( A => n47, B => state_1_port, C => n48, Y => n44);
   U56 : no210 port map( A => n43, B => n49, Y => new_state_0_port);
   U57 : no210 port map( A => n50, B => N15, Y => n49);
   U58 : no310 port map( A => n51, B => state_1_port, C => rst, Y => n50);
   U59 : no210 port map( A => inv_inputs(5), B => n46, Y => new_out_5_port);
   U60 : no210 port map( A => inv_inputs(4), B => n46, Y => new_out_4_port);
   U61 : no210 port map( A => inv_inputs(3), B => n46, Y => new_out_3_port);
   U62 : no210 port map( A => inv_inputs(2), B => n46, Y => new_out_2_port);
   U63 : no210 port map( A => inv_inputs(1), B => n46, Y => new_out_1_port);
   U64 : no210 port map( A => inv_inputs(0), B => n46, Y => new_out_0_port);
   U65 : na210 port map( A => state_1_port, B => n47, Y => n46);
   U66 : iv110 port map( A => state_0_port, Y => n47);
   U67 : iv110 port map( A => n43, Y => random_seed);
   U68 : no210 port map( A => n52, B => n53, Y => n43);
   U69 : na310 port map( A => inv_inputs(2), B => inv_inputs(0), C => 
                           inv_inputs(1), Y => n53);
   U70 : na310 port map( A => inv_inputs(5), B => inv_inputs(3), C => 
                           inv_inputs(4), Y => n52);
   U71 : iv110 port map( A => n54, Y => n39);
   U72 : no210 port map( A => n55, B => count_6_port, Y => n54);
   U73 : no210 port map( A => n56, B => n57, Y => n55);
   U74 : ex210 port map( A => n57, B => n56, Y => n38);
   U75 : na210 port map( A => n58, B => n48, Y => n56);
   U76 : iv110 port map( A => count_5_port, Y => n57);
   U77 : ex210 port map( A => n59, B => n60, Y => n37);
   U78 : na210 port map( A => count_3_port, B => n61, Y => n60);
   U79 : ex210 port map( A => count_3_port, B => n61, Y => n36);
   U80 : no210 port map( A => n62, B => n51, Y => n61);
   U81 : iv110 port map( A => n48, Y => n51);
   U82 : ex210 port map( A => count_2_port, B => n63, Y => n35);
   U83 : no210 port map( A => n64, B => n40, Y => n63);
   U84 : ex210 port map( A => n64, B => n40, Y => n34);
   U85 : na210 port map( A => count_0_port, B => n48, Y => n40);
   U86 : na310 port map( A => count_5_port, B => n58, C => count_6_port, Y => 
                           n48);
   U87 : no310 port map( A => n65, B => n62, C => n59, Y => n58);
   U88 : iv110 port map( A => count_4_port, Y => n59);
   U89 : na310 port map( A => count_1_port, B => count_0_port, C => 
                           count_2_port, Y => n62);
   U90 : iv110 port map( A => count_3_port, Y => n65);
   U91 : iv110 port map( A => count_1_port, Y => n64);
   U92 : no210 port map( A => state_0_port, B => state_1_port, Y => N15);

end synthesised;



