
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of score is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component ex210
      port( A, B : in std_logic;  Y : out std_logic);
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
   
   signal output_7_port, output_6_port, output_5_port, output_4_port, 
      output_3_port, output_2_port, output_1_port, output_0_port, 
      next_score_7_port, next_score_6_port, next_score_5_port, 
      next_score_4_port, next_score_3_port, next_score_2_port, 
      next_score_1_port, next_score_0_port, n7, n8, n9, n10, n11, n12, n13, 
      add_30_aco_n23, add_30_aco_n22, add_30_aco_n21, add_30_aco_n20, 
      add_30_aco_n19, add_30_aco_n18, add_30_aco_n17, add_30_aco_n16, 
      add_30_aco_n15, add_30_aco_n14, add_30_aco_n13, add_30_aco_n12, 
      add_30_aco_n11, add_30_aco_n10, add_30_aco_n9, add_30_aco_n8, 
      add_30_aco_n7, add_30_aco_n6, add_30_aco_n5, add_30_aco_n4, add_30_aco_n3
      : std_logic;

begin
   output <= ( output_7_port, output_6_port, output_5_port, output_4_port, 
      output_3_port, output_2_port, output_1_port, output_0_port );
   
   score_reg_0_inst : dfr11 port map( D => next_score_0_port, R => rst, CK => 
                           clk, Q => output_0_port);
   score_reg_1_inst : dfr11 port map( D => next_score_1_port, R => rst, CK => 
                           clk, Q => output_1_port);
   score_reg_2_inst : dfr11 port map( D => next_score_2_port, R => rst, CK => 
                           clk, Q => output_2_port);
   score_reg_3_inst : dfr11 port map( D => next_score_3_port, R => rst, CK => 
                           clk, Q => output_3_port);
   score_reg_4_inst : dfr11 port map( D => next_score_4_port, R => rst, CK => 
                           clk, Q => output_4_port);
   score_reg_5_inst : dfr11 port map( D => next_score_5_port, R => rst, CK => 
                           clk, Q => output_5_port);
   score_reg_6_inst : dfr11 port map( D => next_score_6_port, R => rst, CK => 
                           clk, Q => output_6_port);
   score_reg_7_inst : dfr11 port map( D => next_score_7_port, R => rst, CK => 
                           clk, Q => output_7_port);
   n7 <= '0';
   U10 : iv110 port map( A => n8, Y => n11);
   U11 : na210 port map( A => increase_value(2), B => increase, Y => n8);
   U12 : iv110 port map( A => n9, Y => n12);
   U13 : na210 port map( A => increase_value(1), B => increase, Y => n9);
   U14 : iv110 port map( A => n10, Y => n13);
   U15 : na210 port map( A => increase_value(0), B => increase, Y => n10);
   add_30_aco_U29 : ex210 port map( A => n13, B => output_0_port, Y => 
                           next_score_0_port);
   add_30_aco_U28 : na210 port map( A => n13, B => output_0_port, Y => 
                           add_30_aco_n22);
   add_30_aco_U27 : ex210 port map( A => n12, B => output_1_port, Y => 
                           add_30_aco_n23);
   add_30_aco_U26 : ex210 port map( A => add_30_aco_n4, B => add_30_aco_n23, Y 
                           => next_score_1_port);
   add_30_aco_U25 : na210 port map( A => output_1_port, B => add_30_aco_n4, Y 
                           => add_30_aco_n19);
   add_30_aco_U24 : na210 port map( A => add_30_aco_n5, B => add_30_aco_n22, Y 
                           => add_30_aco_n21);
   add_30_aco_U23 : na210 port map( A => n12, B => add_30_aco_n21, Y => 
                           add_30_aco_n20);
   add_30_aco_U22 : na210 port map( A => add_30_aco_n19, B => add_30_aco_n20, Y
                           => add_30_aco_n17);
   add_30_aco_U21 : ex210 port map( A => n11, B => output_2_port, Y => 
                           add_30_aco_n18);
   add_30_aco_U20 : ex210 port map( A => add_30_aco_n17, B => add_30_aco_n18, Y
                           => next_score_2_port);
   add_30_aco_U19 : na210 port map( A => output_2_port, B => add_30_aco_n17, Y 
                           => add_30_aco_n14);
   add_30_aco_U18 : no210 port map( A => add_30_aco_n17, B => output_2_port, Y 
                           => add_30_aco_n16);
   add_30_aco_U17 : na210 port map( A => n11, B => add_30_aco_n3, Y => 
                           add_30_aco_n15);
   add_30_aco_U16 : na210 port map( A => add_30_aco_n14, B => add_30_aco_n15, Y
                           => add_30_aco_n11);
   add_30_aco_U15 : ex210 port map( A => output_3_port, B => add_30_aco_n11, Y 
                           => next_score_3_port);
   add_30_aco_U14 : na210 port map( A => add_30_aco_n11, B => output_3_port, Y 
                           => add_30_aco_n13);
   add_30_aco_U13 : ex210 port map( A => output_4_port, B => add_30_aco_n13, Y 
                           => add_30_aco_n12);
   add_30_aco_U12 : na310 port map( A => output_3_port, B => add_30_aco_n11, C 
                           => output_4_port, Y => add_30_aco_n10);
   add_30_aco_U11 : ex210 port map( A => add_30_aco_n6, B => add_30_aco_n10, Y 
                           => next_score_5_port);
   add_30_aco_U10 : no210 port map( A => add_30_aco_n6, B => add_30_aco_n10, Y 
                           => add_30_aco_n9);
   add_30_aco_U9 : ex210 port map( A => output_6_port, B => add_30_aco_n9, Y =>
                           next_score_6_port);
   add_30_aco_U8 : na210 port map( A => add_30_aco_n9, B => output_6_port, Y =>
                           add_30_aco_n8);
   add_30_aco_U7 : ex210 port map( A => output_7_port, B => add_30_aco_n8, Y =>
                           add_30_aco_n7);
   add_30_aco_U6 : iv110 port map( A => output_5_port, Y => add_30_aco_n6);
   add_30_aco_U5 : iv110 port map( A => output_1_port, Y => add_30_aco_n5);
   add_30_aco_U4 : iv110 port map( A => add_30_aco_n22, Y => add_30_aco_n4);
   add_30_aco_U3 : iv110 port map( A => add_30_aco_n16, Y => add_30_aco_n3);
   add_30_aco_U2 : iv110 port map( A => add_30_aco_n7, Y => next_score_7_port);
   add_30_aco_U1 : iv110 port map( A => add_30_aco_n12, Y => next_score_4_port)
                           ;

end synthesised;



