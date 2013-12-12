
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of score is

   component ex210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component iv110
      port( A : in std_logic;  Y : out std_logic);
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
      next_score_1_port, next_score_0_port, n18, n19, n20, n21, n22, n23, n24, 
      n25, n26, n27, n28, n29, n30 : std_logic;

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
   U28 : ex210 port map( A => output_7_port, B => n18, Y => next_score_7_port);
   U29 : no210 port map( A => n19, B => n20, Y => n18);
   U30 : ex210 port map( A => n20, B => n19, Y => next_score_6_port);
   U31 : na210 port map( A => output_5_port, B => n21, Y => n19);
   U32 : iv110 port map( A => output_6_port, Y => n20);
   U33 : ex210 port map( A => output_5_port, B => n21, Y => next_score_5_port);
   U34 : iv110 port map( A => n22, Y => n21);
   U35 : na310 port map( A => output_4_port, B => output_3_port, C => n23, Y =>
                           n22);
   U36 : iv110 port map( A => n24, Y => next_score_4_port);
   U37 : ex210 port map( A => output_4_port, B => n25, Y => n24);
   U38 : na210 port map( A => n23, B => output_3_port, Y => n25);
   U39 : ex210 port map( A => output_3_port, B => n23, Y => next_score_3_port);
   U40 : no210 port map( A => n26, B => n27, Y => n23);
   U41 : na310 port map( A => output_1_port, B => output_0_port, C => 
                           output_2_port, Y => n27);
   U42 : iv110 port map( A => increase, Y => n26);
   U43 : ex210 port map( A => output_2_port, B => n28, Y => next_score_2_port);
   U44 : no210 port map( A => n29, B => n30, Y => n28);
   U45 : ex210 port map( A => n29, B => n30, Y => next_score_1_port);
   U46 : na210 port map( A => increase, B => output_0_port, Y => n30);
   U47 : iv110 port map( A => output_1_port, Y => n29);
   U48 : ex210 port map( A => output_0_port, B => increase, Y => 
                           next_score_0_port);

end synthesised;



